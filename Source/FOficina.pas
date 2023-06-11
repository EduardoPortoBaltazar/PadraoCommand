unit FOficina;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Oficina.Controller.Servicos;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    btnVelas: TButton;
    btnOleo: TButton;
    btnPneu: TButton;
    procedure Button1Click(Sender: TObject);
    procedure btnVelasClick(Sender: TObject);
    procedure btnOleoClick(Sender: TObject);
    procedure btnPneuClick(Sender: TObject);
  private
    procedure LimparLog;
    procedure EscreveLog(Value: string);
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnOleoClick(Sender: TObject);
begin
  LimparLog;
   TControllerOfficina
                .New(EscreveLog)
                 .TrocarOleo
                 .FinalizarServico;
end;

procedure TForm1.btnPneuClick(Sender: TObject);
begin
  LimparLog;
   TControllerOfficina
                .New(EscreveLog)
                 .PneuFurado
                 .FinalizarServico;
end;

procedure TForm1.btnVelasClick(Sender: TObject);
begin
  LimparLog;
   TControllerOfficina
                .New(EscreveLog)
                 .TrocarVelas
                 .FinalizarServico;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  LimparLog;
   TControllerOfficina
                .New(EscreveLog)
                 .Revisao;
end;

procedure TForm1.EscreveLog(Value: string);
begin
  Memo1.Lines.Add(Value);
end;

procedure TForm1.LimparLog;
begin
  Memo1.Lines.Clear;
end;

end.
