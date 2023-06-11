# Delphi - Exemplo de padrão Command

Command é um dos 11 padrões comportamentais dentre os 23 padrões de projeto de software do GOF. Na programação orientada a objeto, o command é um padrão no qual um objeto é usado para encapsular toda informação necessária para executar uma ação ou acionar um evento em um momento posterior.

# Sobre o projeto

Exemplo de utilização do padrão Command com invoker.

 ![TelaAplicacao](https://github.com/EduardoPortoBaltazar/PadraoCommand/blob/main/assets/TelaAplicacao.PNG))
 
## Entendendo Arquitetura

# Interfaces
Criado a classe de interface, onde teremos todos os serviços possiveis da oficina.

```delphi
  iServicos = interface
    ['{D7B31FE9-069E-4236-B8C4-78681C80AED5}']
    function TrocarOleo: iServicos;
    function TrocarVelas: iServicos;
    function PneuFurado: iServicos;
    function Revisao: iServicos;
    function FinalizarServico: iServicos;
  end;
```

# Classe de Serviços
Classe responsável por implementar a Interface de serviços

```delphi

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
```

# Interface Command
Na classe de Interfaces, Deve ser criado uma interface para Command, com a função Execute.

```delphi
  iCommand = interface
    ['{0CF36E3F-9555-463A-A392-079B1CDB5B03}']
    function Execute: iCommand;
  end;
````

# Uma Classe para cada Responsabilidade 
Seguindo o principio da responsabilidade única, deve ser criado uma classe para cada função, implementando o Command e recebendo 
a interface principal como Parent.
Dessa forma a função PneuFurado é executada na classe de serviços.

```delphi
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
  
function TControllerServicosPneuFurado.Execute: iCommand;
begin
  Result := Self;
  FParent.PneuFurado;
end;
```

# Interface Invoker
Deve ser implementado a interface invoker para receber comandos e executar
```delphi
  iInvoker = interface
    ['{F2F87709-95E7-4ED6-8FB6-DD7F457434D6}']
    function Add(Value: iCommand): iInvoker;
    function Execute: iInvoker;
  end;
  ```
  
  # Classe Invoker
  Implementação para receber Command e executar uma lista de Command
  
  ```Delphi
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
```

# Classe de Serviço Utilizando Vários Comandos
```Delphi
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
```

# Classe Serviço executando cada Command
```Delphi
function TControllerOfficina.PneuFurado: iServicos;
begin
  Result := Self;

  FEscreveLog('Trocando os pneus gastos...');
  Sleep(3000);
end;
```


# Autor

Eduardo Porto Baltazar

https://curriculo-eduardo-porto.web.app/

https://www.linkedin.com/in/eduardo-porto-baltazar/

