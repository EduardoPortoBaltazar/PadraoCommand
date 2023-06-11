unit Oficina.Controller.Servicos.PneuFurado;

interface

uses
  System.Classes,
  Oficina.Controller.Servicos.Interfaces;

type
  TControllerServicosPneuFurado = class (TInterfacedObject, iCommand)

  private
    FParent: iServicos;
  public
    function Execute: iCommand;

    constructor create(Parent: iServicos);
    destructor Destroy; override;
    class function New(Parent: iServicos): iCommand;
  end;

implementation

{ TControllerServicosPneuFurado }

constructor TControllerServicosPneuFurado.create(Parent: iServicos);
begin
  FParent := Parent;
end;

destructor TControllerServicosPneuFurado.Destroy;
begin

  inherited;
end;

function TControllerServicosPneuFurado.Execute: iCommand;
begin
  Result := Self;
  FParent.PneuFurado;
end;

class function TControllerServicosPneuFurado.New(Parent: iServicos): iCommand;
begin
  Result := Self.create(Parent);
end;

end.
