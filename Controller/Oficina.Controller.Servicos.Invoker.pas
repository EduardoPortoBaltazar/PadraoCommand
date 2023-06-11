unit Oficina.Controller.Servicos.Invoker;

interface

uses
  System.classes,
  System.Generics.Collections,
  Oficina.Controller.Servicos.Interfaces;

type
  TControllerServicosInvoker = class (TInterfacedObject, iInvoker)

    private
      FList: TList<iCommand>;

    public
      function Add(Value: iCommand): iInvoker;
      function Execute: iInvoker;

      constructor create;
      destructor Destroy; override;
      class function New: iInvoker;


  end;


implementation

{ TControllerServicosInvoker }

function TControllerServicosInvoker.Add(Value: iCommand): iInvoker;
begin
  Result := Self;
  FList.Add(Value);
end;

constructor TControllerServicosInvoker.create;
begin
  FList := TList<iCommand>.Create;
end;

destructor TControllerServicosInvoker.Destroy;
begin
  FList.Free;
  inherited;
end;

function TControllerServicosInvoker.Execute: iInvoker;
var
  I: Integer;
begin
  Result := Self;

  for I := 0 to Pred(FList.Count) do
    FList[i].Execute;
end;

class function TControllerServicosInvoker.New: iInvoker;
begin
  Result := Self.create;
end;

end.
