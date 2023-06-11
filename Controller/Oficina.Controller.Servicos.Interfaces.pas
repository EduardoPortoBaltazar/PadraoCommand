unit Oficina.Controller.Servicos.Interfaces;

interface

uses
  System.Classes;

type

  iCommand = interface
    ['{0CF36E3F-9555-463A-A392-079B1CDB5B03}']
    function Execute: iCommand;
  end;

  iInvoker = interface
    ['{F2F87709-95E7-4ED6-8FB6-DD7F457434D6}']
    function Add(Value: iCommand): iInvoker;
    function Execute: iInvoker;
  end;

  iServicos = interface
    ['{D7B31FE9-069E-4236-B8C4-78681C80AED5}']
    function TrocarOleo: iServicos;
    function TrocarVelas: iServicos;
    function PneuFurado: iServicos;
    function Revisao: iServicos;
    function FinalizarServico: iServicos;

  end;

implementation

end.
