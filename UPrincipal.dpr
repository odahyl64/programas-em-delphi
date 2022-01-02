program UPrincipal;

uses
  Vcl.Forms,
  UVendas in '..\UVendas.pas' {FrnPrincipal},
  UVendasControl in '..\Controlle\UVendasControl.pas',
  USistemaControl in '..\Controlle\USistemaControl.pas',
  UConexao in '..\Dao\UConexao.pas',
  UVendasDao in '..\Dao\UVendasDao.pas',
  UVendasModel in '..\Model\UVendasModel.pas',
  uEnumerado in '..\Model\uEnumerado.pas',
  UDM in 'UDM.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrnPrincipal, FrnPrincipal);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
