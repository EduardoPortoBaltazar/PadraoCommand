unit Oficina.Controller.Servicos.TrocarOleo;

interface

uses
  System.Classes,
  Oficina.Controller.Servicos.Interfaces;

type
  TControllerServicosTrocarOleo = class(TInterfacedObject, iCommand)
    private
      FParent: iServicos;

    public
      function Execute: iCommand;
      constructor create(Parent: iServicos);
      destructor Destroy; override;

      class function New(Parent: iServicos): iCommand;
  end;

implementation

{ TControllerServicosTrocarOleo }

constructor TControllerServicosTrocarOleo.Create(Parent: iServicos);
begin
  FParent := Parent;
end;

destructor TControllerServicosTrocarOleo.destroy;
begin

  inherited;
end;

function TControllerServicosTrocarOleo.Execute: iCommand;
begin
  Result := Self;
  FParent.TrocarOleo;
end;

class function TControllerServicosTrocarOleo.New(Parent: iServicos): iCommand;
begin
  Result := Self.Create(Parent);
end;

end.
