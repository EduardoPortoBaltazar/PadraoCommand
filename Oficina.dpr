program Oficina;

uses
  Vcl.Forms,
  FOficina in 'Source\FOficina.pas' {Form1},
  Oficina.Controller.Servicos.Interfaces in 'Controller\Oficina.Controller.Servicos.Interfaces.pas',
  Oficina.Controller.Servicos in 'Controller\Oficina.Controller.Servicos.pas',
  Officina.EscreveLog in 'Utils\Officina.EscreveLog.pas',
  Oficina.Controller.Servicos.TrocarOleo in 'Controller\Oficina.Controller.Servicos.TrocarOleo.pas',
  Oficina.Controller.Servicos.Invoker in 'Controller\Oficina.Controller.Servicos.Invoker.pas',
  Oficina.Controller.Servicos.TrocarVelas in 'Controller\Oficina.Controller.Servicos.TrocarVelas.pas',
  Oficina.Controller.Servicos.PneuFurado in 'Controller\Oficina.Controller.Servicos.PneuFurado.pas',
  Oficina.Controller.Servicos.FinalizarServico in 'Controller\Oficina.Controller.Servicos.FinalizarServico.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
