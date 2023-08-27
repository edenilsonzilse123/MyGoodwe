program Goodwe;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  uNovaPlanta in '..\Units\uNovaPlanta.pas' {frmNovaPlanta},
  uFormularios in '..\Units\uFormularios.pas',
  uDados in '..\Units\Dados\uDados.pas' {Dados: TDataModule},
  uFramePlanta in '..\Units\Frames\uFramePlanta.pas' {frmPlantas: TFrame},
  uNovoInversor in '..\Units\uNovoInversor.pas' {frmInversor},
  uDadosInversor in '..\Units\uDadosInversor.pas' {frmDadosInversor},
  uFrameInversor in '..\Units\Frames\uFrameInversor.pas' {frmInversorFrame: TFrame};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDados, Dados);
  Application.Run;
end.
