unit frmRedigervmDiscounts;

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
  dxSkinXmas2008Blue, Vcl.Menus, Vcl.StdCtrls, cxButtons, System.Actions,
  Vcl.ActnList, cxMaskEdit, cxDropDownEdit, cxCheckBox, cxTextEdit,
  cxCurrencyEdit, cxLabel, clsvmDiscount, clsCategory, clsCustomerGroup,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar;

type
  TFormRedigervmDiscounts = class(TForm)
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    edRabat: TcxCurrencyEdit;
    cbInkSub: TcxCheckBox;
    cbCategoryGroup: TcxComboBox;
    cxLabel8: TcxLabel;
    cbKundeGroup: TcxComboBox;
    cbRabatkampagne: TcxCheckBox;
    cbStaus: TcxCheckBox;
    ActionList1: TActionList;
    ActGemLuk: TAction;
    ActLuk: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cbPermanent: TcxCheckBox;
    cxDatestart: TcxDateEdit;
    cxDateslut: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    procedure ActLukExecute(Sender: TObject);
    procedure ActGemLukExecute(Sender: TObject);
  private
    { Private declarations }
    pvmDiscounts : TvmDiscounts;
    pCategoryListe : TCategoryListe;
    pCustomerGroupListe : TCustomerGroupListe;
    procedure UpdateCtrls;
    function CheckData: Boolean;
    procedure GemvmDiscount;

  public
    { Public declarations }
    procedure SetupAndShow(etvmDiscountId: Integer);
  end;

var
  FormRedigervmDiscounts: TFormRedigervmDiscounts;

implementation
uses clsGenHlp, clsObjModel, frmSystemBesked;

{$R *.dfm}
procedure TFormRedigervmDiscounts.ActGemLukExecute(Sender: TObject);
begin
  if self.CheckData then
  Begin
    Begin
        ModalResult:=mrOK;
    End;
  end;

end;


function TFormRedigervmDiscounts.CheckData: Boolean;
Var
  tmpRes: String;

  tmpFR: TFunktionsResultat;
begin
  result:=true;
  tmpRes:='';
  if (self.cbCategoryGroup.SelectedItem<0 ) then
  Begin
    tmpRes:=tmpRes+'Der er ikke valgt en kategory  !'+chr(13)+chr(10);
    result:=false;
  End;
  if (self.cbKundeGroup.SelectedItem<0 ) then
  Begin
    tmpRes:=tmpRes+'Der er ikke valgt en kundegruppe  !'+chr(13)+chr(10);
    result:=false;
  End;
  if not result then
  Begin
    formSystemBesked.SystemFejl(tmpRes);
  End;
end;


procedure TFormRedigervmDiscounts.ActLukExecute(Sender: TObject);
begin
  modalresult :=mrCancel;
end;

procedure TFormRedigervmDiscounts.SetupAndShow(etvmDiscountId: Integer);
Var
  tmpFunkResult : TFunktionsResultat;
begin
  pCategoryListe := TCategoryListe.Create;
  pCategoryListe.Load;
  self.pCategoryListe.HentBeskrivelser(self.cbCategoryGroup.Properties.Items, false);

  pCustomerGroupListe := TCustomerGroupListe.Create;
  pCustomerGroupListe.Load(FSModel.Manufacturer.Manufacturer_id);
  self.pCustomerGroupListe.HentBeskrivelser(self.cbKundeGroup.Properties.Items, false);

  self.pvmDiscounts := TvmDiscounts.Create();

  if (etvmDiscountId>0) then
  begin
    self.pvmDiscounts.id := etvmDiscountId;
    tmpFunkResult :=self.pvmDiscounts.Load;
    if (tmpFunkResult.Status = rsOk) then
    begin

      tmpFunkResult.Free;


      self.cbCategoryGroup.ItemIndex := 0; //select Alle

        // pCustomerListe : TCustomerGroupListe;

    end;
  end;
    //  else
//    self.pProduct.manufacturer.Manufacturer_id := FSModel.Manufacturer.Manufacturer_id;

//      self.pAddressList := TAddressListe.Create;
//      tmpFunkResult:=self.pAddressList.Load(etKundeId);
//      if tmpFunkResult.Status = rsOk then
//      begin
//        tmpFunkResult.Free;
//        self.dsCustomer.DataSet := pAddressList.ClientDataSet;
  UpdateCtrls;
    //  end;


  if self.ShowModal = mrOk then
  begin
    GemvmDiscount;
  end;
 //   self.pProduct.Free;
  //  self.pCategoryAllList.Free;
     // pAddressList.Free;
     // pCustomerGroupAll.Free;
     // pCustomerGroupSelected.Free;
   // end;
 // end;
end;


procedure TFormRedigervmDiscounts.GemvmDiscount;
var
  tmpFunkResult : TFunktionsResultat;
begin

  self.pvmDiscounts.discount_start := cxDatestart.Date;
  self.pvmDiscounts.discount_stop := cxDateslut.Date;

  self.pvmDiscounts.fulltime := cbPermanent.Enabled;
  self.pvmDiscounts.subcategories := cbInkSub.Enabled;
  self.pvmDiscounts.state := cbStaus.Enabled;
  self.pvmDiscounts.config_special := cbRabatkampagne.Enabled;
  self.pvmDiscounts.discount_pct := edRabat.Value;

  tmpFunkResult:=self.pvmDiscounts.Update;
  tmpFunkResult.Free;

end;






procedure TFormRedigervmDiscounts.UpdateCtrls;
var
  tmpFunkResult : TFunktionsResultat;
begin

  cxDatestart.Date := 0;//self.pvmDiscounts.discount_start;
  cxDateslut.Date := self.pvmDiscounts.discount_stop;

  cbPermanent.Enabled := self.pvmDiscounts.fulltime;
  cbInkSub.Enabled := self.pvmDiscounts.subcategories;
  cbStaus.Enabled := self.pvmDiscounts.state;
  cbRabatkampagne.Enabled := self.pvmDiscounts.config_special;
  edRabat.Value := self.pvmDiscounts.discount_pct;

end;




end.
