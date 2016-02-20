unit frmAllCustomers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.Menus, cxContainer, cxTextEdit, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, cxButtons, clsCustomer, REST.Response.Adapter, cxLabel, clsAddress,
  cxGroupBox, cxMaskEdit, cxDropDownEdit, clsCustomerGroup;


type
  TFormAllCustomers = class(TForm)
    ActionList1: TActionList;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    actRediger: TAction;
    actOpret: TAction;
    actSlet: TAction;
    actLuk: TAction;
    dscustomer: TDataSource;
    cxGroupBox1: TcxGroupBox;
    edPraksisnr: TcxTextEdit;
    grKunder: TcxGrid;
    grKunderDBTableView1: TcxGridDBTableView;
    grKunderDBTableView1praksisnr: TcxGridDBColumn;
    grKunderDBTableView1praksisnavn: TcxGridDBColumn;
    grKunderDBTableView1adresse: TcxGridDBColumn;
    grKunderDBTableView1postnr: TcxGridDBColumn;
    grKunderDBTableView1by: TcxGridDBColumn;
    grKunderDBTableView1telefon: TcxGridDBColumn;
    grKunderLevel1: TcxGridLevel;
    btnNulstil: TcxButton;
    btnLuk: TcxButton;
    actRens: TAction;
    cbCustomerGroup: TcxComboBox;
    procedure actRedigerExecute(Sender: TObject);
    procedure actRensExecute(Sender: TObject);
    procedure edPraksisnrPropertiesChange(Sender: TObject);
    procedure edKundnavnPropertiesChange(Sender: TObject);
    procedure actSletExecute(Sender: TObject);
    procedure actOpretExecute(Sender: TObject);
    procedure actLukExecute(Sender: TObject);
    procedure cbCustomerGroupPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    pKundeListe : TCustomerListe;
    pCustomerGroup : TCustomerGroupListe;
  public
    { Public declarations }
    procedure SetupAndShow;
    procedure SetFilter;
    procedure UpdateCtrl;
  end;

var
  FormAllCustomers: TFormAllCustomers;

implementation
uses clsGenHlp, clsObjModel, frmRedigerCustomer, clsDBHlp, frmSystemBesked, frmOpretCustomer;

{$R *.dfm}


procedure TFormAllCustomers.actLukExecute(Sender: TObject);
begin
  modalresult:=mrCancel;
end;

procedure TFormAllCustomers.actOpretExecute(Sender: TObject);
var
    tmpCustomer : TformOpretCustomer;
begin
  tmpCustomer := TformOpretCustomer.Create(self);
  tmpCustomer.SetupAndShow;
  tmpCustomer.Free;
  UpdateCtrl;
end;

procedure TFormAllCustomers.actRedigerExecute(Sender: TObject);
var
  tmpCustomer : TformRedigerKunde;
begin
  tmpCustomer := TformRedigerKunde.Create(self);
  tmpCustomer. SetupAndShow(self.pKundeListe.ClientDataSet.FieldByName('Customer_id').AsInteger);
  tmpCustomer.Free;


end;


procedure TFormAllCustomers.SetFilter;
Var
  tmpFilter: String;
begin
  tmpFilter:='';
  if edPraksisnr.Text<>'' then
  Begin
     TDBHlp.AddToFilterAnd(tmpFilter,'praksisnr Like ''%'+edPraksisnr.Text+'%''');
     TDBHlp.AddToFilterOr(tmpFilter,'praksisnavn Like ''%'+edPraksisnr.Text+'%''');
  End;
  if tmpFilter<>'' then
  Begin
    self.pKundeListe.ClientDataSet.Filter:=tmpFilter;
    self.pKundeListe.ClientDataSet.Filtered:=true;
  End
  Else
  Begin
    self.pKundeListe.ClientDataSet.Filtered:=false;
  End;
end;


procedure TFormAllCustomers.actRensExecute(Sender: TObject);
begin
  self.edPraksisnr.Text := '';
  self.SetFilter;
end;

procedure TFormAllCustomers.actSletExecute(Sender: TObject);
var
  tmpCustomer : TCustomer;
begin
  if formSystemBesked.SystemSpoergsmaal('Skal kunde slettes? Du kan ikke senere fortryde denne handling.') then
  begin
    tmpCustomer := TCustomer.Create;
    tmpCustomer.Load(self.pKundeListe.ClientDataSet.FieldByName('Customer_id').AsInteger);
    tmpCustomer.RemoveFromManufacturer(FSModel.Manufacturer.Manufacturer_id);
    tmpCustomer.Free;
    UpdateCtrl;
  end;
end;

procedure TFormAllCustomers.cbCustomerGroupPropertiesChange(Sender: TObject);
//var
begin

  self.UpdateCtrl;

end;

procedure TFormAllCustomers.edKundnavnPropertiesChange(Sender: TObject);
begin
  self.SetFilter;
end;

procedure TFormAllCustomers.edPraksisnrPropertiesChange(Sender: TObject);
begin
  self.SetFilter;
end;

procedure TFormAllCustomers.SetupAndShow;
var
  TmpResult : TFunktionsResultat;
begin
  self.pCustomerGroup := TCustomerGroupListe.Create;

  TmpResult := self.pCustomerGroup.Load(FSModel.Manufacturer.Manufacturer_id);
  if TmpResult.Status = rsOk then
  begin
    TmpResult.Free;
    self.pCustomerGroup.HentBeskrivelser(self.cbCustomerGroup.Properties.Items);
    self.cbCustomerGroup.ItemIndex := 0; //select Alle
  end;

  UpdateCtrl;
  self.ShowModal;
  if self.pKundeListe <> nil then
    self.pKundeListe.Free;
  self.pCustomerGroup.Free;
end;


procedure TFormAllCustomers.UpdateCtrl;
begin
  if self.pKundeListe <> nil then
    FreeAndNil(self.pKundeListe);

  if cbCustomerGroup.ItemIndex > 0 then //default
  begin
    self.pKundeListe := TCustomerListe.Create;
    self.pKundeListe.Load(FSModel.Manufacturer.Manufacturer_id, Integer(cbCustomerGroup.ItemObject) )
  end
  else
  begin
    self.pKundeListe := TCustomerListe.Create;
    self.pKundeListe.Load(FSModel.Manufacturer.Manufacturer_id);
  end;
  self.dscustomer.DataSet := self.pKundeListe.ClientDataSet;
  if pKundeListe.ClientDataSet.Active then
  begin
    if pKundeListe.ClientDataSet.RecordCount > 0 then
    begin
      actSlet.Enabled := true;
      actRediger.Enabled := true
    end
    else
    begin
      actSlet.Enabled := false;
      actRediger.Enabled := false;
    end;
  end
  else
  begin
  actSlet.Enabled := false;
  actRediger.Enabled := false;
  end;
end;







end.
