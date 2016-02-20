unit clsvmDiscount;
interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
     clsCustomerGroup, clsGenHlp, clsObjModel, REST.JSON, clsCustomersCustomergroups, Datasnap.DBClient,
      clsAddress, cxCheckComboBox, cxLookandFeelPainters, clsManufacturer, clsCategory;

type


  TvmDiscounts = class(TObject)
  Private
    fid : integer;
    ffkManufacturer_id : integer;
    fcustomergroup : TCustomerGroup;
    fcategory : TCategory;
    fsubcategories : boolean;
    fdiscount_pct : double ;
    fconfig_special : boolean;
    fdiscount_start : TDateTime;
    fdiscount_stop : TDateTime;
    ffulltime : boolean;
    fstate : boolean;
    fcreated_by : integer;
    fcreated_time : TDateTime;

  public
    Property id: integer read fid write fid;
    Property manufacturer_id: integer read ffkManufacturer_id write ffkManufacturer_id;
    Property customergroup: TCustomerGroup read fcustomergroup write fcustomergroup;
    Property category: TCategory read fcategory write fcategory;
    Property subcategories: boolean read fsubcategories write fsubcategories;
    Property discount_pct: double read fdiscount_pct write fdiscount_pct;
    Property config_special: boolean read fconfig_special write fconfig_special;
    Property discount_start: TDateTime read fdiscount_start write fdiscount_start;
    Property discount_stop: TDateTime read fdiscount_stop write fdiscount_stop;
    Property fulltime: boolean read ffulltime write ffulltime;
    Property state: boolean read fstate write fstate;
    Property created_by: integer read fcreated_by write fcreated_by;
    Property created_time: TDateTime read fcreated_time write fcreated_time;
    destructor Destroy; override;
    constructor Create;
    function Remove: TFunktionsResultat;
    function Load: TFunktionsResultat;
    procedure FillObj(myvmDiscount : TvmDiscounts);
    function Update: TFunktionsResultat;
  end;

  TvmDiscountsArray = Array of TvmDiscounts;

  TvmDiscountsListe = class
  Private
    fvmdiscountsliste : TvmDiscountsArray;
    pClientDataSet : TClientDataSet;
  Public

    constructor Create;
    destructor Destroy; override;
    function Load(manufacturerid : integer): TFunktionsResultat;
    property vmDiscountsliste : TvmDiscountsArray read fvmdiscountsliste write fvmdiscountsliste;
    Property ClientDataSet: TClientDataSet read pClientDataSet write pClientDataSet;
  end;




implementation
uses REST.Client, REST.Response.Adapter, REST.Types, db, Data.DBXJSON;


constructor TvmDiscounts.Create;
begin
  inherited;
  self.fcustomergroup := TCustomerGroup.Create;
  self.fcategory := TCategory.Create;
end;

destructor TvmDiscounts.Destroy;
begin
  if self.fcustomergroup <> nil then
    self.fcustomergroup.Free;
  if self.fcategory <> nil then
    self.fcategory.Free;
  inherited;
end;




function TvmDiscounts.Load: TFunktionsResultat;
var
  tmpvmdiscount : TvmDiscounts;
  svc : string;
  RESTRequest1 : TRESTRequest;
  RESTResponse1 : TRESTResponse;
begin
  RESTRequest1 := TRESTRequest.Create(FSModel.RESTClient1);
  RESTResponse1 := TRESTResponse.Create(FSModel.RESTClient1);
  RESTRequest1.Response := RESTResponse1;

  result:=TFunktionsResultat.Create;
  try
    tmpvmdiscount := TvmDiscounts.Create;
    svc := 'GetvmDiscountFromID';
    RESTRequest1.Resource := svc+'/'+IntToStr(self.id);
    RESTRequest1.Execute;
    tmpvmdiscount := TvmDiscounts(TJson.JsonToObject<TvmDiscounts>(TJsonHelp.TrimJsonResult(RESTResponse1.JSONValue.ToString, svc)));
    self.FillObj(tmpvmdiscount);
    tmpvmdiscount.Free;


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

function TvmDiscounts.Update: TFunktionsResultat;
var
  svc : string;
  RESTRequest1 : TRESTRequest;
  RESTResponse1 : TRESTResponse;
  I: Integer;
  tmpFunkResult : TFunktionsResultat;
  var aParam: TRESTRequestParameter;
//  t, ttt : test;
//  tt : TJSONObject;
//  mar : TJSONMarshal;
begin
//kode fjernes
//   mar := TJSONMarshal.Create;
//  tt := TJSONObject.Create;
//  t := test.Create;
//  t.fdate := now;
//   tt := mar.Marshal(t) as TJSONObject;
//  ttt := TJson.JsonToObject<test>('{"id":0,"date":42242.5829147106}');
  //bruges til test

  RESTRequest1 := TRESTRequest.Create(FSModel.RESTClient1);
  RESTResponse1 := TRESTResponse.Create(FSModel.RESTClient1);
  RESTRequest1.Response := RESTResponse1;
  RESTRequest1.Method :=   TRESTRequestMethod.rmPOST;

  result:=TFunktionsResultat.Create;
  try

  aParam := RESTRequest1.Params.AddItem();
  aParam.Value := TJson.ObjectToJsonString(self);
  aParam.Value:=TJsonHelp.RemoveJsonCarriageReturn(aParam.Value);
  aParam.ContentType := ctAPPLICATION_JSON;
  if (self.fid=0) then
      svc := 'InsertvmDiscount'
  else
      svc := 'UpdatevmDiscount';
  RESTRequest1.Resource := svc;
  RESTRequest1.Execute;

  if svc = 'InsertProduct' then
    self.fid := StrToInt(RESTResponse1.Content);

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









procedure TvmDiscounts.FillObj(myvmDiscount : TvmDiscounts);
begin
  self.id := myvmDiscount.id;
  self.ffkManufacturer_id := myvmDiscount.ffkManufacturer_id;
  self.fcustomergroup := myvmDiscount.fcustomergroup;
  self.fcategory := myvmDiscount.fcategory;
  self.fsubcategories := myvmDiscount.fsubcategories;
  self.fdiscount_pct := myvmDiscount.fdiscount_pct;
  self.fconfig_special := myvmDiscount.fconfig_special;
  self.fdiscount_start := myvmDiscount.fdiscount_start;
  self.fdiscount_stop := myvmDiscount.fdiscount_stop;
  self.ffulltime := myvmDiscount.ffulltime;
  self.fstate := myvmDiscount.fstate;
  self.fcreated_by := myvmDiscount.fcreated_by;
  self.fcreated_time := myvmDiscount.fcreated_time;
end;



function TvmDiscounts.Remove: TFunktionsResultat;
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
    svc := 'RemoveDiscount';
    RESTRequest1.Method := TRESTRequestMethod.rmDELETE;
    RESTRequest1.Resource := svc+'/'+IntToStr(self.fid);
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






constructor TvmDiscountsListe.Create;
begin
  inherited;
    self.pClientDataSet := TClientDataSet.Create(nil);
end;


destructor TvmDiscountsListe.Destroy;
begin
  self.pClientDataSet.Free;
  inherited;
end;







function TvmDiscountsListe.Load(manufacturerid : integer): TFunktionsresultat;
var
  svc : string;
  RESTRequest1 : TRESTRequest;
  RESTResponse1 : TRESTResponse;
  RestResponse1DataSetAdapter : TRESTResponseDataSetAdapter;
  tmpvmDisountsliste : TvmDiscountsListe;
  i : integer;
  a : string;
begin
  RESTRequest1 := TRESTRequest.Create(FSModel.RESTClient1);
  RESTResponse1 := TRESTResponse.Create(FSModel.RESTClient1);

  RestResponse1DataSetAdapter := TRESTResponseDataSetAdapter.Create(FSModel.RESTClient1);
  RestResponse1DataSetAdapter.Response := RESTResponse1;
  RESTRequest1.Response := RESTResponse1;

  result:=TFunktionsResultat.Create;
  try
    tmpvmDisountsliste := TvmDiscountsListe.Create;
    svc := 'GetvmdiscountListFromManufacturerID';
    RESTRequest1.Method :=   TRESTRequestMethod.rmGET;
    RestResponse1DataSetAdapter.Dataset :=  self.pClientDataSet;
    RestResponse1DataSetAdapter.RootElement := svc+'Result.vmdiscountsListe';
    RESTRequest1.Resource := svc +'/'+IntToStr(manufacturerid);
    RESTRequest1.Execute;

//    for I := 0 to pClientDataSet.FieldDefs.Count-1 do
//    begin
//      a := self.pClientDataSet.FieldDefs.Items[i].Name;
//    end;

    tmpvmDisountsliste.Free;
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






end.




