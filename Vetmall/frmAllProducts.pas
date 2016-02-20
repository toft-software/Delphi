unit frmAllProducts;

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
  dxSkinXmas2008Blue, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, Vcl.Menus, cxMaskEdit,
  cxDropDownEdit, Vcl.StdCtrls, cxButtons, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxTextEdit, cxGroupBox, System.Actions, Vcl.ActnList, clsProduct, clsCategory;

type
  TFormAllProducts = class(TForm)
    cxGroupBox1: TcxGroupBox;
    edVarenr: TcxTextEdit;
    grVarer: TcxGrid;
    grVarerDBTableView1: TcxGridDBTableView;
    grVarerDBTableView1varenavn: TcxGridDBColumn;
    grVarerDBTableView1styrke: TcxGridDBColumn;
    grVarerDBTableView1form: TcxGridDBColumn;
    grVarerDBTableView1pakning: TcxGridDBColumn;
    grVarerLevel1: TcxGridLevel;
    btnNulstil: TcxButton;
    cbCategoryGroup: TcxComboBox;
    dsproducts: TDataSource;
    ActionList1: TActionList;
    actRediger: TAction;
    actOpret: TAction;
    actSlet: TAction;
    actLuk: TAction;
    actRens: TAction;
    btnLuk: TcxButton;
    cxButton3: TcxButton;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    grVarerDBTableView1varenr: TcxGridDBColumn;
    edVarenavn: TcxTextEdit;
    grVarerDBTableView1Column1: TcxGridDBColumn;
    procedure btnLukClick(Sender: TObject);
    procedure actRensExecute(Sender: TObject);
    procedure edVarenrPropertiesChange(Sender: TObject);
    procedure edVarenavnPropertiesChange(Sender: TObject);
    procedure cbCategoryGroupPropertiesChange(Sender: TObject);
    procedure actLukExecute(Sender: TObject);
    procedure actSletExecute(Sender: TObject);
    procedure actRedigerExecute(Sender: TObject);
    procedure actOpretExecute(Sender: TObject);
  private
    { Private declarations }
    pProductListe : TProductListe;
    pCategoryListe : TCategoryListe;
    procedure UpdateCtrl;
    procedure SetFilter;
  public
    { Public declarations }
    procedure SetupAndShow;
  end;

var
  FormAllProducts: TFormAllProducts;

implementation
uses clsGenHlp, clsObjModel, clsDBHlp, frmSystemBesked, frmRedigerProduct;

{$R *.dfm}
procedure TFormAllProducts.actLukExecute(Sender: TObject);
begin
  modalresult:=mrCancel;
end;

procedure TFormAllProducts.actOpretExecute(Sender: TObject);
var
  tmpProduct : TFormRedigerProduct;
begin
  tmpProduct := TFormRedigerProduct.Create(self);
  tmpProduct.SetupAndShow(0);
  tmpProduct.Free;
  UpdateCtrl
end;

procedure TFormAllProducts.actRedigerExecute(Sender: TObject);
var
  tmpProduct : TFormRedigerProduct;
begin
  tmpProduct := TFormRedigerProduct.Create(self);
  tmpProduct.SetupAndShow(self.pProductListe.ClientDataSet.FieldByName('product_Id').AsInteger);
  tmpProduct.Free;
 // UpdateCtrl;
end;

procedure TFormAllProducts.actRensExecute(Sender: TObject);
begin
  self.edVarenr.Text := '';
  self.edVarenavn.Text := '';
  self.SetFilter;
end;

procedure TFormAllProducts.actSletExecute(Sender: TObject);
var
  tmpProduct : TProduct;
begin
  if formSystemBesked.SystemSpoergsmaal('Skal product slettes? Du kan ikke senere fortryde denne handling.') then
  begin
    tmpProduct := TProduct.Create;
    tmpProduct.product_id := pProductListe.ClientDataSet.FieldByName('product_Id').AsInteger;
    tmpProduct.Remove;
    tmpProduct.Free;
    UpdateCtrl;
  end;
end;

procedure TFormAllProducts.btnLukClick(Sender: TObject);
begin
  modalresult:=mrCancel;
end;

procedure TFormAllProducts.cbCategoryGroupPropertiesChange(Sender: TObject);
begin
  self.UpdateCtrl;
end;

procedure TFormAllProducts.edVarenavnPropertiesChange(Sender: TObject);
begin
  self.SetFilter;
end;

procedure TFormAllProducts.edVarenrPropertiesChange(Sender: TObject);
begin
  self.SetFilter;
end;

procedure TFormAllProducts.SetupAndShow;
var
  TmpResult : TFunktionsResultat;
begin
  self.pCategoryListe := TCategoryListe.Create;
  TmpResult := self.pCategoryListe.Load;
  if TmpResult.Status = rsOk then
  begin
    TmpResult.Free;
    self.pCategoryListe.HentBeskrivelser(self.cbCategoryGroup.Properties.Items);
    self.cbCategoryGroup.ItemIndex := 0; //select Alle
  end;

 // UpdateCtrl;
  self.ShowModal;
  if self.pProductListe <> nil then
    self.pProductListe.Free;
end;

procedure TFormAllProducts.SetFilter;
Var
  tmpFilter: String;
begin
  tmpFilter:='';
  if (edVarenr.Text<>'') then
  Begin
     TDBHlp.AddToFilterAnd(tmpFilter,'model Like ''%'+edVarenr.Text+'%''');
  End;
  if (edVarenavn.Text<>'') then
  Begin
     TDBHlp.AddToFilterAnd(tmpFilter,'varenavn Like ''%'+edVarenavn.Text+'%''');
  End;
  if tmpFilter<>'' then
  Begin
    self.pProductListe.ClientDataSet.Filter:=tmpFilter;
    self.pProductListe.ClientDataSet.Filtered:=true;
  End
  Else
  Begin
    self.pProductListe.ClientDataSet.Filtered:=false;
  End;
end;


procedure TFormAllProducts.UpdateCtrl;
begin
  if self.pProductListe <> nil then
    FreeAndNil(self.pProductListe);

  if cbCategoryGroup.ItemIndex > 0 then //default
  begin
    self.pProductListe := TProductListe.Create;
    self.pProductListe.Load(FSModel.Manufacturer.Manufacturer_id, Integer(cbCategoryGroup.ItemObject) )
  end
  else
  begin
    self.pProductListe := TProductListe.Create;
    self.pProductListe.Load(FSModel.Manufacturer.Manufacturer_id);
  end;
  self.dsproducts.DataSet := self.pProductListe.ClientDataSet;
  if pProductListe.ClientDataSet.Active then
  begin
    if pProductListe.ClientDataSet.RecordCount > 0 then
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
