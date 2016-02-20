unit frmRedigerCustomer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC, cxLabel, cxTextEdit,
  Vcl.Menus, System.Actions, Vcl.ActnList, Vcl.StdCtrls, cxButtons, clsCustomer, clsCustomerGroup, clsAddress,
  cxCheckBox, cxMaskEdit, cxDropDownEdit, cxCheckComboBox;

type
  TFormRedigerKunde = class(TForm)
    edPraksisnr: TcxTextEdit;
    edPraksisnavn: TcxTextEdit;
    edAdr: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    edTlf: TcxTextEdit;
    edFax: TcxTextEdit;
    edEmail: TcxTextEdit;
    cxButAktiver: TcxButton;
    cxButDeaktiv: TcxButton;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ActionList1: TActionList;
    ActAktiver: TAction;
    ActDeaktiver: TAction;
    ActGemLuk: TAction;
    ActLuk: TAction;
    dscustomer: TDataSource;
    cxLabel7: TcxLabel;
    grKunder: TcxGrid;
    grKunderDBTableView1: TcxGridDBTableView;
    grKunderDBTableView1firstname: TcxGridDBColumn;
    grKunderDBTableView1lastname: TcxGridDBColumn;
    grKunderLevel1: TcxGridLevel;
    grKunderDBTableView1company: TcxGridDBColumn;
    grKunderDBTableView1company_id: TcxGridDBColumn;
    grKunderDBTableView1address_1: TcxGridDBColumn;
    grKunderDBTableView1address_2: TcxGridDBColumn;
    grKunderDBTableView1city: TcxGridDBColumn;
    grKunderDBTableView1postcode: TcxGridDBColumn;
    grKunderDBTableView1country: TcxGridDBColumn;
    grKunderDBTableView1standardadresse: TcxGridDBColumn;
    cxCheckCb: TcxCheckComboBox;
    btnNulstil: TcxButton;
    actOpretCustomerGroup: TAction;
    procedure ActLukExecute(Sender: TObject);
    procedure ActGemLukExecute(Sender: TObject);
    procedure actOpretCustomerGroupExecute(Sender: TObject);
    procedure cxButAktiverClick(Sender: TObject);
    procedure ActDeaktiverExecute(Sender: TObject);
    procedure ActAktiverExecute(Sender: TObject);
  private
    { Private declarations }
    pAddressList : TAddressListe;
    pCustomer : TCustomer;
    pCustomerGroupAll : TCustomerGroupListe;
    pCustomerGroupSelected : TCustomerGroupListe;
    procedure GemKunde;
    procedure UpdateCtrls;
    procedure OpdaterStatus;
  public
    { Public declarations }

    procedure SetupAndShow(etKundeId: Integer);

  end;

var
  FormRedigerKunde: TFormRedigerKunde;

implementation
uses clsGenHlp, clsObjModel, frmOpretCustomerGroup;

{$R *.dfm}
procedure TFormRedigerKunde.ActAktiverExecute(Sender: TObject);
begin
  self.pCustomer.Activestatus := true;
  self.OpdaterStatus;
end;

procedure TFormRedigerKunde.ActDeaktiverExecute(Sender: TObject);
begin
  self.pCustomer.Activestatus := false;
  self.OpdaterStatus;
end;

procedure TFormRedigerKunde.ActGemLukExecute(Sender: TObject);
begin
    modalresult :=mrOk;
end;

procedure TFormRedigerKunde.ActLukExecute(Sender: TObject);
begin
  modalresult:=mrCancel;
end;

procedure TFormRedigerKunde.actOpretCustomerGroupExecute(Sender: TObject);
var
  tmpCustomerGroupOpret : TformOpretCustomerGroup;
begin
  tmpCustomerGroupOpret := TformOpretCustomerGroup.Create(self);
  tmpCustomerGroupOpret.SetupAndShow;
  tmpCustomerGroupOpret.Free;
  self.UpdateCtrls;
end;

procedure TFormRedigerKunde.cxButAktiverClick(Sender: TObject);
begin
  self.pCustomer.Activestatus := false;
  self.OpdaterStatus;
end;

procedure TformRedigerKunde.SetupAndShow(etKundeId: Integer);
Var
  tmpFunkResult : TFunktionsResultat;
begin
  self.pCustomer := TCustomer.Create();
  tmpFunkResult :=self.pCustomer.Load(etKundeId);
  if (tmpFunkResult.Status = rsOk) then
  begin
    tmpFunkResult.Free;
    tmpFunkResult:=self.pCustomer.GetActiveStatus;
    if tmpFunkResult.Status = rsOk then
    begin
      tmpFunkResult.Free;
      self.pAddressList := TAddressListe.Create;
      tmpFunkResult:=self.pAddressList.Load(etKundeId);
      if tmpFunkResult.Status = rsOk then
      begin
        tmpFunkResult.Free;
        self.dsCustomer.DataSet := pAddressList.ClientDataSet;
        UpdateCtrls;
      end;
      if self.ShowModal = mrOk then
      begin
        GemKunde;
      end;
      pCustomer.Free;
      pAddressList.Free;
      pCustomerGroupAll.Free;
      pCustomerGroupSelected.Free;
    end;
  end;
end;

procedure TformRedigerKunde.GemKunde;
var
  tmpFunkResult : TFunktionsResultat;
begin
  tmpFunkResult:=self.pCustomer.Update(cxCheckCb);
  tmpFunkResult.Free;
end;


procedure TformRedigerKunde.UpdateCtrls;
var
  i : integer;
  tmpCustomerGroup : TCustomerGroup;
  tmpFunkResult : TFunktionsResultat;
begin

  if self.pCustomerGroupAll <>nil then
     freeandnil(self.pCustomerGroupAll);
  self.pCustomerGroupAll:= TCustomerGroupListe.Create;
  tmpFunkResult := self.pCustomerGroupAll.Load(FSModel.Manufacturer.Manufacturer_id);
  if tmpFunkResult.Status = rsOk then
  begin

    self.cxCheckCb.Properties.Items.Clear;

    if (pCustomerGroupAll.ClientDataSet.Active) then
    begin
      if self.pCustomerGroupAll.ClientDataSet.RecordCount>0 then
      begin
        for I := 0 to pCustomerGroupAll.ClientDataSet.RecordCount - 1 do
        begin
          tmpCustomerGroup := TCustomerGroup(self.pCustomerGroupAll.Customergroupliste[i]);

          with self.cxCheckCb.Properties.Items.Add do
          begin
            Description := tmpCustomerGroup.CustomerGroupDescription.Name;
            tag := Integer(tmpCustomerGroup.Customer_group_id);

            //Set value;
            if (self.pCustomer.MemberOfCustomerGroup(tmpCustomerGroup)) then
              self.cxCheckCb.States[i] :=   TcxCheckBoxState.cbsChecked
            else
              self.cxCheckCb.States[i] :=   TcxCheckBoxState.cbsUnchecked;
          end;
        end;
      end;
    end;
  end;
  edPraksisnr.Text := InttoStr(self.pCustomer.Praksisnr);
  edPraksisnavn.Text := self.pCustomer.PraksisNavn;
  edTlf.Text := self.pCustomer.Telephone;
  edFax.Text := self.pCustomer.Fax;
  edEmail.Text := self.pCustomer.Email;
  edAdr.Text := self.pCustomer.Address + ' ' + IntToStr(self.pCustomer.Zip) + ' ' + self.pCustomer.City;

  self.OpdaterStatus;
end;

procedure TformRedigerKunde.OpdaterStatus;
begin
  if (pCustomer.Activestatus) then
  begin
     self.ActAktiver.Enabled  := false;
     self.ActDeaktiver.Enabled := true;
  end
  else
  begin
    self.ActDeaktiver.Enabled := false;
    self.ActAktiver.Enabled := true;
  end;
end;



end.
