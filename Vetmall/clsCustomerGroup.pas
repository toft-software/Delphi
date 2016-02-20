unit clsCustomerGroup;
interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, clsManufacturer,
     clsGenHlp,  Datasnap.DBClient, clsobjModel,  REST.JSON;

type

  TCustomerGroupDescription = class
  Private
    fcustomer_group_id :integer;
    flanguage_id : integer;
    fname : string;
    fdescription : string;
  Public
    Property Customer_group_id: Integer read fcustomer_group_id write fcustomer_group_id;
    Property Language_id: Integer read flanguage_id write flanguage_id;
    Property Name: string read fname write fname;
    Property Description: string read fdescription write fdescription;
  end;


  TCustomerGroup = class
  Private
    fcustomer_group_id: Integer;
    fapproval: Integer;
    fcompany_id_display: Integer;
    fcompany_id_required: Integer;
    ftax_id_display: Integer;
    ftax_id_required : Integer;
    fsort_order: Integer;
    fmanufacturer : TManufacturer;
    fcustomergroupdescription : TCustomerGroupDescription;
    fClientDataSet : TClientDataSet;
  Public
    Property Customer_group_id: Integer read fcustomer_group_id write fcustomer_group_id;
    Property Approval: Integer read fapproval write fapproval;
    Property Company_id_display: Integer read fcompany_id_display write fcompany_id_display;
    Property Company_id_required: Integer read fcompany_id_required write fcompany_id_required;
    Property Tax_id_display: Integer read ftax_id_display write ftax_id_display;
    Property Tax_id_required: Integer read ftax_id_required write ftax_id_required;
    Property Sort_order: Integer read fsort_order write fsort_order;
    Property Manufacturer: TManufacturer read fmanufacturer write fmanufacturer;
    Property CustomerGroupDescription: TCustomerGroupDescription read fcustomergroupdescription write fcustomergroupdescription;
    destructor Destroy; override;
    constructor Create;
    function Insert: TFunktionsresultat;
    function Delete: TFunktionsresultat;
  end;



  TCustomerGroupArray = Array of TCustomerGroup;

  TCustomerGroupListe = class
  Private
    fcustomergroupliste : TCustomerGroupArray;
    pClientDataSet : TClientDataSet;
    pClientDataSetCustomerGroupNameID : TClientDataSet;
    procedure BuildInternalClientDataSetNameId;
  Public

    constructor Create;
    destructor Destroy; override;
    function Load(manufacturerid: integer): TFunktionsResultat;
    property Customergroupliste : TCustomerGroupArray read fcustomergroupliste write fcustomergroupliste;
    Property ClientDataSet: TClientDataSet read pClientDataSet write pClientDataSet;
    Property ClientDataSetCustomerGroupNameID: TClientDataSet read pClientDataSetCustomerGroupNameID write pClientDataSetCustomerGroupNameID;
    procedure FillObj(myCustomerGroupListe : TCustomerGroupListe);
    function GruppeNavnExists(myGrpName : string): boolean;
    procedure HentBeskrivelser(destStr: TStrings; VisAlle : boolean = true);
  end;

implementation
uses REST.Client, REST.Response.Adapter,db, REST.Types;

destructor TCustomerGroup.Destroy;
begin
  self.fClientDataSet.Free;
  self.fmanufacturer.Free;
  self.fcustomergroupdescription.Free;
  inherited;
end;

constructor TCustomerGroup.Create;
begin
  inherited;
  self.fmanufacturer := TManufacturer.Create;
  self.fcustomergroupdescription:= TCustomerGroupDescription.Create;
end;

function TCustomerGroup.Insert: TFunktionsresultat;
var
  svc : string;
  RESTRequest1 : TRESTRequest;
  RESTResponse1 : TRESTResponse;
  put : string;
begin
  RESTRequest1 := TRESTRequest.Create(FSModel.RESTClient1);
  RESTResponse1 := TRESTResponse.Create(FSModel.RESTClient1);
  RESTRequest1.Response := RESTResponse1;

  result:=TFunktionsResultat.Create;
  try
    svc := 'InsertCustomerGroupNamePrManufacturer';
    put :=svc+'/'+IntToStr(self.fmanufacturer.Manufacturer_id) + '/'  +self.fcustomergroupdescription.Name;
    RESTRequest1.Method :=   TRESTRequestMethod.rmPUT;
    RESTRequest1.Resource := put ;
    RESTRequest1.Execute;
  except
     on e:exception do
     Begin
      result.Status:=rsFejl;
      result.Besked:=e.Message;
     End;
   End;
   RESTRequest1.Free;
   RESTResponse1.Free;
end;

//ToDO indtil videre ikke nødvendigt.
//function TCustomerGroup.Load(customergroup_id :integer): TFunktionsResultat;
//var
//  tmpCustomer : TCustomer;
//  svc : string;
//  RESTRequest1 : TRESTRequest;
//  RESTResponse1 : TRESTResponse;
//begin
//  RESTRequest1 := TRESTRequest.Create(FSModel.RESTClient1);
//  RESTResponse1 := TRESTResponse.Create(FSModel.RESTClient1);
//  RESTRequest1.Response := RESTResponse1;
//
//  result:=TFunktionsResultat.Create;
//  try
//    tmpCustomer := TCustomer.Create;
//    svc := 'GetCustomerGroupFromID';
//    if useManufacturer then
//      RESTRequest1.Resource := svc+'/'+IntToStr(FSModel.Manufacturer.Manufacturer_id)+'/'+IntToStr(customer_id)
//    else
//      RESTRequest1.Resource := svc+'/'+IntToStr(0)+'/'+IntToStr(customer_id);
//
//    RESTRequest1.Execute;
//    tmpCustomer := TCustomer(TJson.JsonToObject<TCustomer>(TJsonHelp.TrimJsonResult(RESTResponse1.JSONValue.ToString, svc)));
//    self.FillObj(tmpCustomer);
//    tmpCustomer.Free;
//  except
//     on e:exception do
//     Begin
//      result.Status:=rsFejl;
//      result.Besked:=e.Message;
//     End;
//   End;
//   RESTRequest1.Free;
//   RESTResponse1.Free;
//end;

function TCustomerGroup.Delete: TFunktionsResultat;
var
  svc : string;
  RESTRequest1 : TRESTRequest;
  RESTResponse1 : TRESTResponse;
begin
  RESTRequest1 := TRESTRequest.Create(FSModel.RESTClient1);
  RESTResponse1 := TRESTResponse.Create(FSModel.RESTClient1);
  RESTRequest1.Response := RESTResponse1;

  result:=TFunktionsResultat.Create;
  try
    svc := 'RemoveCustomerGroup';
    RESTRequest1.Method := TRESTRequestMethod.rmDELETE;
    RESTRequest1.Resource := svc+'/'+IntToStr(self.fcustomer_group_id);
    RESTRequest1.Execute;
  except
     on e:exception do
     Begin
      result := nil;
      raise;
     End;
   End;
   RESTRequest1.Free;
   RESTResponse1.Free;
end;





destructor TCustomerGroupListe.Destroy;
begin
  self.pClientDataSet.Free;
  self.pClientDataSetCustomerGroupNameID.Free;
  inherited;
end;

constructor TCustomerGroupListe.Create;
begin
  inherited;
    self.pClientDataSet := TClientDataSet.Create(nil);
    self.pClientDataSetCustomerGroupNameID := TClientDataSet.Create(nil);
    self.pClientDataSetCustomerGroupNameID.FieldDefs.Add('Name', ftString, 30, false);
    self.pClientDataSetCustomerGroupNameID.FieldDefs.Add('Id', ftInteger, 0, true);
    self.pClientDataSetCustomerGroupNameID.CreateDataSet;
    self.pClientDataSetCustomerGroupNameID.Active:=true;
end;


procedure TCustomerGroupListe.BuildInternalClientDataSetNameId;
var
  tmpCustomerGroup : TCustomerGroup;
  i : integer;
begin
  if self.ClientDataSet.Active then
  begin
    if self.ClientDataSet.RecordCount>0 then
    begin
      for I := 0 to ClientDataSet.RecordCount - 1 do
      begin
        tmpCustomerGroup := TCustomerGroup(self.Customergroupliste[i]);
        self.pClientDataSetCustomerGroupNameID.AppendRecord([tmpCustomerGroup.fcustomergroupdescription.fname,tmpCustomerGroup.fcustomer_group_id]);
      end;
    end;
  end;

end;


procedure TCustomerGroupListe.HentBeskrivelser(destStr: TStrings; VisAlle : boolean);
var
  i : integer;
  tmpCustomerGroup : TCustomerGroup;
begin
  if VisAlle then
    destStr.AddObject('<Alle>',TObject(0));
  for i:=0 to Length(self.fcustomergroupliste) -1 do
  Begin
    tmpCustomerGroup := self.fcustomergroupliste[i];
    destStr.AddObject(tmpCustomerGroup.fcustomergroupdescription.fname,Tobject(tmpCustomerGroup.fcustomer_group_id));
  End;
end;





function TCustomerGroupListe.GruppeNavnExists(myGrpName : string): boolean;
var
  i : integer;
begin
  result := false;
  self.pClientDataSetCustomerGroupNameID.First;
  while not self.pClientDataSetCustomerGroupNameID.Eof do
  begin
    if  UpperCase(pClientDataSetCustomerGroupNameID.Fields[0].AsString) = UpperCase(myGrpName) then
    begin
       result := true;
       break;
    end;
    self.pClientDataSetCustomerGroupNameID.Next;
  end;
end;



function TCustomerGroupListe.Load(manufacturerid: integer): TFunktionsresultat;
var
  svc : string;
  RESTRequest1 : TRESTRequest;
  RESTResponse1 : TRESTResponse;
  RestResponse1DataSetAdapter : TRESTResponseDataSetAdapter;
  tmpCustomergroupliste : TCustomerGroupListe;
begin
  RESTRequest1 := TRESTRequest.Create(FSModel.RESTClient1);
  RESTResponse1 := TRESTResponse.Create(FSModel.RESTClient1);

  RestResponse1DataSetAdapter := TRESTResponseDataSetAdapter.Create(FSModel.RESTClient1);
  RestResponse1DataSetAdapter.Response := RESTResponse1;
  RESTRequest1.Response := RESTResponse1;

  result:=TFunktionsResultat.Create;
  try
    tmpCustomergroupliste := TCustomerGroupListe.Create;
    svc := 'GetCustomerGroupsFromManufacturerId';
    RESTRequest1.Method :=   TRESTRequestMethod.rmGET;
    RestResponse1DataSetAdapter.Dataset :=  self.pClientDataSet;
    RestResponse1DataSetAdapter.RootElement := svc+'Result.customergroupliste';
    RESTRequest1.Resource := svc+'/'+IntToStr(manufacturerid);;
    RESTRequest1.Execute;

    tmpCustomergroupliste := TJson.JsonToObject<TCustomerGroupListe>(TJsonHelp.TrimJsonResult(RESTResponse1.JSONValue.ToString, svc));
    Self.FillObj(tmpCustomergroupliste);
    tmpCustomergroupliste.Free;
    self.BuildInternalClientDataSetNameId;
  except
     on e:exception do
     Begin
      result.Status:=rsFejl;
      result.Besked:=e.Message;
     End;
   End;
   RESTRequest1.Free;
   RESTResponse1.Free;
   RestResponse1DataSetAdapter.Free;
end;

procedure TCustomerGroupListe.FillObj(myCustomerGroupListe : TCustomerGroupListe);
begin
  self.fcustomergroupliste := myCustomerGroupListe.fcustomergroupliste;
end;



end.
