unit frmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.JSON, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Vcl.StdCtrls, clsCustomer, clsManufacturer,
  System.Actions, Vcl.ActnList, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinXmas2008Blue, cxButtons, Vcl.StdActns, Vcl.ExtActns;

type
  TForm1 = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    ActionList1: TActionList;
    ActVarer: TAction;
    ActKunder: TAction;
    ActRabat: TAction;
    cxButton1: TcxButton;
    RESTResponse1: TRESTResponse;
    cxButton2: TcxButton;
    RichEditBold1: TRichEditBold;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    actLogof: TAction;
    procedure FormCreate(Sender: TObject);
    procedure ActKunderExecute(Sender: TObject);
    procedure ActVarerExecute(Sender: TObject);
    procedure ActRabatExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  test = Class (TObject)
    private
      Fa : TDateTime;
    public

  End;

var
  Form1: TForm1;

implementation
uses clsObjModel, frmAllCustomers, frmAllProducts, frmAllVMRabatter;

{$R *.dfm}

procedure TForm1.ActKunderExecute(Sender: TObject);
var
  tmpAllCustomer : TFormAllCustomers;
begin
  tmpAllCustomer := TFormAllCustomers.Create(self);
  tmpAllCustomer. SetupAndShow;
  tmpAllCustomer.Free;

end;

procedure TForm1.ActRabatExecute(Sender: TObject);
var
  tmpAllRabatter : TFormAllVMRabatter;
begin
  tmpAllRabatter := TFormAllVMRabatter.Create(self);
  tmpAllRabatter. SetupAndShow;
  tmpAllRabatter.Free;

end;

procedure TForm1.ActVarerExecute(Sender: TObject);
var
  tmpAllProduct : TFormAllProducts;
begin
  tmpAllProduct := TFormAllProducts.Create(self);
  tmpAllProduct. SetupAndShow;
  tmpAllProduct.Free;

end;

procedure TForm1.FormCreate(Sender: TObject);
var
  a : string;
begin

  FSModel:=TFSModel.Create;
  RESTClient1.BaseURL := 'http://localhost:55628/Vetmall.svc';

end;

end.
