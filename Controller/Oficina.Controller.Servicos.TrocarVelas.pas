unit Oficina.Controller.Servicos.TrocarVelas;

interface

uses
  System.Classes,
  Oficina.Controller.Servicos.Interfaces;

type
  TControllerServicosTrocarVelas = class (TInterfacedObject, iCommand)

    private
      FParent: iServicos;

    public
      function Execute: iCommand;
      constructor create(Parent: iServicos);
      destructor Destroy; override;

      class function New(Parent: iServicos): iCommand;

  end;

implementation

{ TControllerServicosTrocarVelas }

constructor TControllerServicosTrocarVelas.create(Parent: iServicos);
begin
  FParent := Parent;
end;

destructor TControllerServicosTrocarVelas.Destroy;
begin

  inherited;
end;

function TControllerServicosTrocarVelas.Execute: iCommand;
begin
  Result := Self;
  FParent.TrocarVelas
end;

class function TControllerServicosTrocarVelas.New(Parent: iServicos): iCommand;
begin
  Result := Self.create(Parent);
end;

end.
