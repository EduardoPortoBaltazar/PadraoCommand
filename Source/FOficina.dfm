object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Servi'#231'os de Oficina'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 105
    Height = 94
    Caption = 'Revis'#227'o'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 0
    Top = 108
    Width = 635
    Height = 191
    Align = alBottom
    TabOrder = 1
  end
  object btnVelas: TButton
    Left = 184
    Top = 8
    Width = 105
    Height = 25
    Caption = 'Velas'
    TabOrder = 2
    OnClick = btnVelasClick
  end
  object btnOleo: TButton
    Left = 184
    Top = 41
    Width = 105
    Height = 25
    Caption = 'Oleo'
    TabOrder = 3
    OnClick = btnOleoClick
  end
  object btnPneu: TButton
    Left = 184
    Top = 77
    Width = 105
    Height = 25
    Caption = 'Pneu Furado'
    TabOrder = 4
    OnClick = btnPneuClick
  end
end
