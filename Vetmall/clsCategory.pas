unit clsCategory;
interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
     clsCustomerGroup, clsGenHlp, clsObjModel, REST.JSON, clsCustomersCustomergroups, Datasnap.DBClient,
      clsAddress, cxCheckComboBox, cxLookandFeelPainters, clsManufacturer;

type


  TCategorydescription = class(TObject)
  Private
    fcategory_id : integer;
    flanguage_id : integer;
    fname : string;
    fdescription : string;
    fmeta_description : string;
    fmeta_keyword : string;
  public
    Property category_id: integer read fcategory_id write fcategory_id;
    Property language_id: integer read flanguage_id write flanguage_id;
    Property name: string read fname write fname;
    Property description: string read fdescription write fdescription;
    Property meta_description: string read fmeta_description write fmeta_description;
    Property meta_keyword: string read fmeta_keyword write fmeta_keyword;
  end;

  TCategory = class(TObject)
  Private
    fcategory_id : integer;
    fimage : string;
    fparent_id : integer;
    ftop : boolean;
    fcolumn : integer;
    fsort_order : integer;
    fstatus : boolean;
    fdate_added : TDateTime;
    fdate_modified : TDateTime;
    fcategorydescription : TCategoryDescription ;
  public
    Property category_id: integer read fcategory_id write fcategory_id;
    Property image: string read fimage write fimage;
    Property parent_id: integer read fparent_id write fparent_id;
    Property top: boolean read ftop write ftop;
    Property column: integer read fcolumn write fcolumn;
    Property sort_order: integer read fsort_order write fsort_order;
    Property status: boolean read fstatus write fstatus;
    Property date_added: TDateTime read fdate_added write fdate_added;
    Property date_modified: TDateTime read fdate_modified write fdate_modified;
    Property categorydescription: TCategoryDescription read fcategorydescription write fcategorydescription;
    destructor Destroy; override;
    constructor Create;
  end;

  TCategoryArray = Array of TCategory;

  TCategoryListe = class
  Private
    fcategoryliste : TCategoryArray;
    pClientDataSet : TClientDataSet;
  Public

    constructor Create;
    destructor Destroy; override;
    function Load(): TFunktionsResultat;
    property Categoryliste : TCategoryArray read fcategoryliste write fcategoryliste;
    Property ClientDataSet: TClientDataSet read pClientDataSet write pClientDataSet;
    procedure FillObj(myCategoryListe : TCategoryListe);
    procedure HentBeskrivelser(destStr: TStrings; VisAlle : boolean = true);
  end;



implementation
uses REST.Client, REST.Response.Adapter,db, REST.Types;

destructor TCategory.Destroy;
begin
  self.fcategorydescription.Free;
  inherited;
end;

constructor TCategory.Create;
begin
  inherited;
  self.fcategorydescription:= TCategorydescription.Create;
end;

destructor TCategoryListe.Destroy;
begin
  self.pClientDataSet.Free;
  inherited;
end;

constructor TCategoryListe.Create;
begin
  inherited;
    self.pClientDataSet := TClientDataSet.Create(nil);
end;


function TCategoryListe.Load: TFunktionsresultat;
var
  svc : string;
  RESTRequest1 : TRESTRequest;
  RESTResponse1 : TRESTResponse;
  RestResponse1DataSetAdapter : TRESTResponseDataSetAdapter;
  tmpCategoryliste : TCategoryListe;
begin
  RESTRequest1 := TRESTRequest.Create(FSModel.RESTClient1);
  RESTResponse1 := TRESTResponse.Create(FSModel.RESTClient1);

  RestResponse1DataSetAdapter := TRESTResponseDataSetAdapter.Create(FSModel.RESTClient1);
  RestResponse1DataSetAdapter.Response := RESTResponse1;
  RESTRequest1.Response := RESTResponse1;

  result:=TFunktionsResultat.Create;
  try
    tmpCategoryliste := TCategoryListe.Create;
    svc := 'GetCategoryListFromManufacturer';
    RESTRequest1.Method :=   TRESTRequestMethod.rmGET;
    RestResponse1DataSetAdapter.Dataset :=  self.pClientDataSet;
    RestResponse1DataSetAdapter.RootElement := svc+'Result.categoryliste';
    RESTRequest1.Resource := svc;
    RESTRequest1.Execute;

    tmpCategoryliste := TJson.JsonToObject<TCategoryListe>(TJsonHelp.TrimJsonResult(RESTResponse1.JSONValue.ToString, svc));
    Self.FillObj(tmpCategoryliste);
    tmpCategoryliste.Free;
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

procedure TCategoryListe.FillObj(myCategoryListe : TCategoryListe);
begin
  self.fcategoryliste := myCategoryListe.fcategoryliste;
end;

procedure TCategoryListe.HentBeskrivelser(destStr: TStrings; VisAlle : boolean);
var
  i : integer;
  tmpCategory : TCategory;
begin
  if VisAlle then
    destStr.AddObject('<Alle>',TObject(0));
  for i:=0 to Length(self.fcategoryliste) -1 do
  Begin
    tmpCategory := self.fcategoryliste[i];
    destStr.AddObject(tmpCategory.fcategorydescription.fname,Tobject(tmpCategory.fcategory_id));
  End;
end;



end.
