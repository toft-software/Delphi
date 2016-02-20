program VetMallJson;

uses
  Vcl.Forms,
  frmMain in 'frmMain.pas' {Form1},
  clsCustomerGroup in 'clsCustomerGroup.pas',
  clsManufacturer in 'clsManufacturer.pas',
  clsCustomer in 'clsCustomer.pas',
  frmRedigerCustomer in 'frmRedigerCustomer.pas' {FormRedigerKunde},
  clsGenHlp in 'clsGenHlp.pas',
  clsObjModel in 'clsObjModel.pas',
  clsCustomersCustomergroups in 'clsCustomersCustomergroups.pas',
  frmAllCustomers in 'frmAllCustomers.pas' {FormAllCustomers},
  clsAddress in 'clsAddress.pas',
  frmSystemBesked in 'frmSystemBesked.pas' {formSystemBesked},
  frmOpretCustomerGroup in 'frmOpretCustomerGroup.pas' {formOpretCustomerGroup},
  frmOpretCustomer in 'frmOpretCustomer.pas' {formOpretCustomer},
  frmAllProducts in 'frmAllProducts.pas' {FormAllProducts},
  clsProduct in 'clsProduct.pas',
  clsCategory in 'clsCategory.pas',
  frmRedigerProduct in 'frmRedigerProduct.pas' {FormRedigerProduct},
  frmAllVMRabatter in 'frmAllVMRabatter.pas' {FormAllVMRabatter},
  clsvmDiscount in 'clsvmDiscount.pas',
  frmRedigervmDiscounts in 'frmRedigervmDiscounts.pas' {FormRedigervmDiscounts};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormAllCustomers, FormAllCustomers);
  Application.CreateForm(TformSystemBesked, formSystemBesked);
  Application.CreateForm(TformOpretCustomerGroup, formOpretCustomerGroup);
  Application.CreateForm(TformOpretCustomer, formOpretCustomer);
  Application.CreateForm(TFormAllProducts, FormAllProducts);
  Application.CreateForm(TFormRedigerProduct, FormRedigerProduct);
  Application.CreateForm(TFormAllVMRabatter, FormAllVMRabatter);
  Application.CreateForm(TFormRedigervmDiscounts, FormRedigervmDiscounts);
  Application.Run;
end.
