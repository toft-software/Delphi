unit frmSystemBesked;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, cxLookAndFeelPainters, cxButtons,
  ActnList, cxGraphics, cxLookAndFeels, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinXmas2008Blue, System.Actions;

type
  //Returbesked fra funktionrt
  TBeskedStatus = (bsOK,bsFejl);

  TReturbesked = record
    BeskedStatus: TBeskedStatus;
    Besked: String;
  End;

  TSystemBeskedType = (sbBesked,sbSpoergsmaal);

  TformSystemBesked = class(TForm)
    meBesked: TMemo;
    imgQuestion: TImage;
    imgError: TImage;
    imgOk: TImage;
    alSystemBesked: TActionList;
    acOk: TAction;
    acAnnuller: TAction;
    btnAnnuller: TcxButton;
    btnOk: TcxButton;
    procedure acAnnullerExecute(Sender: TObject);
    procedure acOkExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Function SystemBesked(sbType: TsystemBeskedType; Besked: TReturBesked): Boolean;overload;
    Function SystemSpoergsmaal(sp: String): boolean;
    Function SystemFejl(be: String): boolean;
    Function SystemBesked(be: String): boolean;overload;
  end;

var
  formSystemBesked: TformSystemBesked;

implementation

{$R *.dfm}

{ TformSystemBesked }

function TformSystemBesked.SystemBesked(sbType: TsystemBeskedType;
  Besked: TReturBesked): Boolean;
begin
   self.Height:=200;
   self.Width:=500;
   meBesked.Lines.Text:=Besked.Besked;

   if sbType=sbBesked then
   Begin
      if besked.BeskedStatus=bsOK then
      Begin
        imgError.Visible:=false;
        imgOk.Visible:=true;
      End
      Else
      Begin
        imgError.Visible:=true;
        imgOk.Visible:=false;
      End;
      imgQuestion.Visible:=false;
      acOk.Caption:='Ok (F10)';
      btnAnnuller.Visible:=false;
      self.Caption:='Besked fra systemet:';
      self.ShowModal;
      result:=true;
   End
   Else if sbType=sbSpoergsmaal then
   Begin
      imgOk.Visible:=false;
      imgError.Visible:=false;
      imgQuestion.Visible:=true;
      acOk.Caption:='Ja (F10)';
      acAnnuller.Caption:='Nej (F12)';
      btnAnnuller.Visible:=true;
      self.Caption:='Sp�rgsm�l fra systemet:';
      result:=(self.ShowModal=mrOk);
   End;
end;

procedure TformSystemBesked.FormShow(Sender: TObject);
begin
  btnOk.SetFocus;
end;

function TformSystemBesked.SystemSpoergsmaal(sp: String): boolean;
begin
   self.Height:=200;
   self.Width:=500;
   meBesked.Lines.Text:=sp;

   imgOk.Visible:=false;
   imgError.Visible:=false;
   imgQuestion.Visible:=true;
   acOk.Caption:='Ja (F10)';
   acAnnuller.Caption:='Nej (F12)';
   btnAnnuller.Visible:=true;
   self.Caption:='Sp�rgsm�l fra systemet:';
   result:=(self.ShowModal=mrOk);
end;

function TformSystemBesked.SystemFejl(be: String): boolean;
begin
   self.Height:=200;
   self.Width:=500;
   meBesked.Lines.Text:=be;

   imgOk.Visible:=false;
   imgError.Visible:=true;
   imgQuestion.Visible:=false;
   acOk.Caption:='Ok (F10)';
   btnAnnuller.Visible:=false;
   self.Caption:='Besked fra systemet:';
   self.ShowModal;
   result:=true;
end;

function TformSystemBesked.SystemBesked(be: String): boolean;
begin
   self.Height:=200;
   self.Width:=500;
   meBesked.Lines.Text:=be;

   imgOk.Visible:=true;
   imgError.Visible:=false;
   imgQuestion.Visible:=false;
   btnOk.Caption:='Ok (F10)';
   btnAnnuller.Visible:=false;
   self.Caption:='Besked fra systemet:';
   self.ShowModal;
   result:=true;
end;

procedure TformSystemBesked.acOkExecute(Sender: TObject);
begin
   modalresult:=mrOk;
end;

procedure TformSystemBesked.acAnnullerExecute(Sender: TObject);
begin
  modalresult:=mrCAncel;
end;

end.
