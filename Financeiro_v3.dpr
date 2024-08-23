program Financeiro_v3;

uses
  Vcl.Forms,
  uLogin in 'uLogin.pas' {fml_login},
  uMain in 'uMain.pas' {fml_main},
  uDados in 'uDados.pas',
  uDataModule in 'uDataModule.pas' {DataModule1: TDataModule},
  uEntradas in 'uEntradas.pas' {fml_entradas},
  uSaidas in 'uSaidas.pas' {fml_saidas},
  uComparativo in 'uComparativo.pas' {fml_comparativo},
  uRelatorio in 'uRelatorio.pas' {fml_relatorio},
  uCfg in 'uCfg.pas' {fml_cfg},
  uInvestimentos in 'uInvestimentos.pas' {fml_investimentos},
  uRegistros in 'uRegistros.pas' {FmlRegistros},
  uRelatorioAnual in 'uRelatorioAnual.pas' {fmlRelatorioAnual},
  uBuscarIDEntrada in 'uBuscarIDEntrada.pas' {FmlRegistros1},
  uBuscarIDSaida in 'uBuscarIDSaida.pas' {FmlRegistros2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfml_main, fml_main);
  Application.CreateForm(Tfml_login, fml_login);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFmlRegistros, FmlRegistros);
  Application.CreateForm(TfmlRelatorioAnual, fmlRelatorioAnual);
  Application.CreateForm(TFmlRegistros1, FmlRegistros1);
  Application.CreateForm(TFmlRegistros2, FmlRegistros2);
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  Application.Run;
end.
