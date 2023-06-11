unit Oficina.Controller.Servicos;

interface

uses
  System.Classes,
  Officina.EscreveLog,
  Oficina.Controller.Servicos.Interfaces,
  Oficina.Controller.Servicos.Invoker,
  Oficina.Controller.Servicos.TrocarOleo,
  Oficina.Controller.Servicos.TrocarVelas,
  Oficina.Controller.Servicos.PneuFurado,
  Oficina.Controller.Servicos.FinalizarServico;

type
  TControllerOfficina = class(TInterfacedObject, iServicos)
  private
    FEscreveLog: TEscreveLog;

  public
    function TrocarOleo: iServicos;
    function TrocarVelas: iServicos;
    function PneuFurado: iServicos;

    function Revisao: iServicos;
    function FinalizarServico: iServicos;

    constructor create(AEscreveLog: TEscreveLog);
    destructor Destroy; override;

    class function New (AEscreveLog: TEscreveLog) : iServicos;
  end;

implementation

uses
  System.SysUtils;

{ TControllerOfficina }

constructor TControllerOfficina.create(AEscreveLog: TEscreveLog);
begin
  FEscreveLog := AEscreveLog;
end;

destructor TControllerOfficina.destroy;
begin

  inherited;
end;

function TControllerOfficina.FinalizarServico: iServicos;
begin
  Result := Self;

  FEscreveLog('Serviço Finalizado! Volte sempre...');
  Sleep(3000);
end;

class function TControllerOfficina.New(AEscreveLog: TEscreveLog) : iServicos;
begin
  Result := Self.create(AEscreveLog);
end;

function TControllerOfficina.PneuFurado: iServicos;
begin
  Result := Self;

  FEscreveLog('Trocando os pneus gastos...');
  Sleep(3000);
end;

function TControllerOfficina.Revisao: iServicos;
begin
  FEscreveLog('Iniciar Revisão...');

  TControllerServicosInvoker
    .New
      .Add(TControllerServicosTrocarOleo
            .New(Self))
      .Add(TControllerServicosTrocarVelas
            .New(Self))
      .Add(TControllerServicosPneuFurado
            .New(Self))
      .Add(TControllerServicosFinaliar
            .New(Self))
      .Execute;
end;

function TControllerOfficina.TrocarOleo: iServicos;
begin
  Result := Self;

  FEscreveLog('Trocando Oleo...');
  Sleep(3000);
end;

function TControllerOfficina.TrocarVelas: iServicos;
begin
  Result := Self;

  FEscreveLog('Trocando as Velas...');
  Sleep(3000);
end;

end.
