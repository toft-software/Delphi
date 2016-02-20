unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Vcl.StdCtrls, Data.Bind.Components, REST.Response.Adapter,
  REST.Client, Data.Bind.ObjectScope, system.JSON, clsCustomer, REST.JSON, clsManufacturer;

type
  TForm1 = class(TForm)
    RESTClient1: TRESTClient;
    RESTResponse1: TRESTResponse;
    RESTRequest1: TRESTRequest;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    MemoErrorMessage: TMemo;
    LinkControlToFieldErrorMessage: TLinkControlToField;
    BindingsList1: TBindingsList;
    EditBaseURL: TEdit;
    LinkControlToFieldBaseURL: TLinkControlToField;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  jvalue : TJSONValue;
  tmpCustomer : TCustomer;
  tmpManufacturer : TManufacturer;
begin
   tmpCustomer := TCustomer.Create;

   tmpManufacturer := TManufacturer.Create;


  RESTRequest1.Execute;
  jvalue := RESTResponse1.JSONValue;

  tmpManufacturer := TJSon.JsonToObject<TManufacturer>(jvalue.ToString);

 // tmpCustomer := TJSon.JsonToObject<TCustomer>(jvalue.ToString);

  MemoErrorMessage.Text := TJson.ObjectToJsonString(tmpCustomer);

  MemoErrorMessage.Text := jvalue.ToString;

end;

end.
