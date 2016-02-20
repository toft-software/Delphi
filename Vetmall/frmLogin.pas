unit frmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxLabel, jpeg, cxControls, cxContainer, cxEdit, cxImage,
  Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxMaskEdit, ExtCtrls,
  cxGraphics, cxLookAndFeels, frxpngimage;

type
  TformLogin = class(TForm)
    edBrugerNavn: TEdit;
    lbFejl: TcxLabel;
    btnLogin: TcxButton;
    btnAnnuller: TcxButton;
    lbVersion: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edAdgangskode: TEdit;
    Image2: TImage;
    procedure FormShow(Sender: TObject);
    procedure btnAnnullerClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure edAdgangskodeKeyPress(Sender: TObject; var Key: Char);
    procedure edBrugerNavnKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Procedure ValiderBruger;
  public
    { Public declarations }
    Function SetupAndShow: Boolean;
  end;

var
  formLogin: TformLogin;

implementation
uses clsBruger,clsObjModel,clsVersion,clsGenhLp;

{$R *.dfm}

procedure TformLogin.edBrugerNavnKeyPress(Sender: TObject; var Key: Char);
begin
  if key=chr(13) then
  Begin
     edAdgangskode.SetFocus;
     abort;
  End;
end;

procedure TformLogin.edAdgangskodeKeyPress(Sender: TObject; var Key: Char);
begin
  if key=chr(13) then
  Begin
     ValiderBruger;
     abort;
  End;
end;

procedure TformLogin.btnLoginClick(Sender: TObject);
begin
  ValiderBruger;
end;

procedure TformLogin.btnAnnullerClick(Sender: TObject);
begin
  modalresult:=mrCancel;
end;

procedure TformLogin.ValiderBruger;
Var
  tmpRes: TValideringsResultat;
  tmpFR: TFunktionsresultat;
begin
   FSModel.Bruger.BrugerNavn:=edBrugerNavn.Text;
   FSModel.Bruger.Adgangskode:=edAdgangskode.Text;
   tmpRes:=FsModel.Bruger.ValiderBruger;
   if tmpRes=vrOk then
   Begin
      tmpFR:=FSModel.Bruger.Load;
      tmpFR.Free;
      lbFejl.Visible:=false;
      modalresult:=mrOK;
   End
   Else if tmpRes=vrUkendtBruger then
   Begin
      lbFejl.Visible:=true;
      lbFejl.Caption:='Det angivne brugernavn findes ikke i systemet!';
   End
   Else
   Begin
      lbFejl.Visible:=true;
      lbFejl.Caption:='Adgangskoden er ikke korrekt!';
   End;
end;

function TformLogin.SetupAndShow: Boolean;
begin
  lbVersion.caption:='Version '+FSModel.FSVersion.VersionStr(vdMinor);
  result:=(self.showmodal=mrOK);
end;

procedure TformLogin.FormShow(Sender: TObject);
begin
  edBrugerNavn.SetFocus;
end;

end.
