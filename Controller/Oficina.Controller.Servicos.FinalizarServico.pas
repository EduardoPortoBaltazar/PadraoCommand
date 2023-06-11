unit Oficina.Controller.Servicos.FinalizarServico;

interface

uses
  System.classes,
  Oficina.Controller.Servicos.Interfaces;

type
  TControllerServicosFinaliar = class (TInterfacedObject, iCommand)

    private
      FParent: iServicos;
    public
      function Execute: iCommand;

      constructor create(Parent: iServicos);
      destructor Destroy; override;
      class function New(Parent: iServicos): iCommand;
  end;

implementation

{ TControllerServicosFinaliar }

constructor TControllerServicosFinaliar.create(Parent: iServicos);
begin
  FParent := Parent;
end;

destructor TControllerServicosFinaliar.Destroy;
begin

  inherited;
end;

function TControllerServicosFinaliar.Execute: iCommand;
begin
  Result := Self;
  FParent.FinalizarServico;
end;

class function TControllerServicosFinaliar.New(Parent: iServicos): iCommand;
begin
  Result := Self.create(Parent);
end;

end.
