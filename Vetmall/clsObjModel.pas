unit clsObjModel;

interface
uses REST.JSON, IPPeerClient, REST.Client, REST.Response.Adapter, clsManufacturer;


type

  TFSModel = class
  Private

  Public
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RestResponse1DataSetAdapter : TRESTResponseDataSetAdapter;
    Manufacturer : clsManufacturer.TManufacturer;
 //   CustomerGroups : clsCustomerGroup.TCustomerGroupListe;
//     DBHandle: TFSDBHandle;
//     SamkoerselGrupper : TSamkoerselGruppeListe;
//     Vogne: TVognListe;
//     Chauffoerer: TChauffoerListe;
//     Institutioner: TInstitutionsListe;
//     Omraader: TOmraadeListe;
//     PostNumre: TPostNummerListe;
//     Bruger: TBruger;
//     FSVersion: TFleetSchedVersion;
//     PersonRegister: TPersonRegister;
//     Indstillinger: TIndstillinger;
//     Rapporter: TRapportListe;
//     Brugere: TBrugerListe;
//     Helligdage: THelligdagsListe;
//     Opgaver: TOpgaveListe;
//     KonkretAdresser: TKonkretAdresseListe;
//     MobilitetsListe: TMobilitetsListe;
//     Ydelser: TYdelsesListe;
//     KontoKategorier: TKontoKategoerier;

     Constructor Create;
     Procedure Opdater;
     Destructor Destroy;override;
  End;

var
  FSModel: TFSModel;

implementation
uses clsGenHlp;

{ TFSModel }

constructor TFSModel.Create;
begin
  inherited;
  RESTClient1 := TRESTClient.Create('http://localhost:55628/Vetmall.svc');
  RESTRequest1 := TRESTRequest.Create(RESTClient1);
  RESTResponse1 := TRESTResponse.Create(RESTClient1);
  RestResponse1DataSetAdapter := TRESTResponseDataSetAdapter.Create(RESTClient1);
  RestResponse1DataSetAdapter.Response := RESTResponse1;

  RESTRequest1.Response := RESTResponse1;


  Manufacturer := TManufacturer.Create;
  Manufacturer.Manufacturer_id := 8;

//  DBHandle:=TFSDBHandle.Create;
//  Vogne:=TVognListe.Create(DBHandle);
//  Chauffoerer:=TChauffoerListe.Create(DBHandle);
//  Institutioner:=TInstitutionsListe.Create(DBHandle);
//  Omraader:=TOmraadeListe.Create(DBHandle);
//  PostNumre:=TPostNummerListe.Create(DBHandle);
//  Bruger:=TBruger.Create(DBHandle);
//  Brugere:=TBrugerListe.Create(DBHandle);
//  Helligdage:=THelligdagsListe.Create(DBHandle);
//  Opgaver:=TOpgaveListe.Create(DBHandle);
//  FSVersion:=TFleetSchedVersion.Create(DBHandle);
//  PersonRegister:=TPersonRegister.Create(DBHandle);
//  KonkretAdresser:=TKonkretAdresseListe.Create(DBHandle);
//  MobilitetsListe := TMobilitetsListe.Create(DBHandle);
//  Ydelser:=TYdelsesListe.Create(DBHandle);
//  KontoKategorier:=TKontoKategoerier.Create(DBHandle);
//  Indstillinger:=TIndstillinger.Create(DBHandle);
//  Indstillinger.id:=1;
//  Rapporter:=TRapportListe.Create(DBHandle);
//  SamkoerselGrupper:=TSamkoerselGruppeListe.Create(DBHandle);
end;

destructor TFSModel.Destroy;
begin
  RESTClient1.Free;
  RESTRequest1.Free;

//  DBHandle.Free;
//  Vogne.free;
//  Chauffoerer.Free;
//  Institutioner.Free;
//  Omraader.Free;
//  PostNumre.Free;
//  Bruger.Free;
//  Brugere.free;
//  Helligdage.Free;
//  Opgaver.Free;
//  FSVersion.Free;
//  PersonRegister.Free;
//  KonkretAdresser.Free;
//  MobilitetsListe.Free;
//  Ydelser.Free;
//  KontoKategorier.Free;
//  Indstillinger.Free;
//  Rapporter.Free;
//  SamkoerselGrupper.Free;
  inherited;
end;

procedure TFSModel.Opdater;
Var
  tmpRes: TFunktionsResultat;
begin
//  tmpRes:=Vogne.Load;
//  tmpRes.Free;
//  tmpRes:=Chauffoerer.Load;
//  tmpRes.Free;
//  tmpRes:=Institutioner.Load;
//  tmpRes.Free;
//  tmpRes:=Omraader.Load;
//  tmpRes.Free;
//  tmpRes:=Indstillinger.Load;
//  tmpRes.Free;
//  tmpRes:=Rapporter.Load;
//  tmpRes.Free;
//  tmpRes:=Helligdage.Load;
//  tmpRes.Free;
//  tmpRes:=Brugere.Load;
//  tmpRes.Free;
//  tmpRes:=Opgaver.Load;
//  tmpRes.Free;
//  tmpRes:=KonkretAdresser.Load;
//  tmpRes.Free;
//  tmpRes:=MobilitetsListe.Load;
//  tmpRes.Free;
//  tmpRes:=PersonRegister.Load;
//  tmpRes.Free;
//  tmpRes:=Ydelser.Load;
//  tmpRes.Free;
//  tmpRes:=KontoKategorier.Load;
//  tmpRes.Free;
//  tmpRes:=SamkoerselGrupper.Load;
//  tmpRes.Free;
end;

end.
