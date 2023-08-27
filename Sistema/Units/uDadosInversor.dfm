object frmDadosInversor: TfrmDadosInversor
  Left = 0
  Top = 0
  Caption = 'frmDadosInversor'
  ClientHeight = 437
  ClientWidth = 748
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnlInversor: TPanel
    Left = 0
    Top = 0
    Width = 748
    Height = 137
    Align = alTop
    TabOrder = 0
    object btnCarregarArquivo: TButton
      Left = 96
      Top = 72
      Width = 145
      Height = 25
      Caption = 'Carregar arquivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnCarregarArquivoClick
    end
  end
  object dbgrdListaDadosInversor: TDBGrid
    Left = 0
    Top = 137
    Width = 748
    Height = 104
    Align = alTop
    DataSource = dsListaDadosInversor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Courier New'
    TitleFont.Style = []
  end
  object strngrd1: TStringGrid
    Left = 0
    Top = 241
    Width = 748
    Height = 196
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 288
    ExplicitTop = 352
    ExplicitWidth = 320
    ExplicitHeight = 120
  end
  object cdsListaDadosInversor: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 56
    object cdsListaDadosInversorDataHoraLeitura: TDateTimeField
      DisplayLabel = 'Data e hora da leitura'
      FieldName = 'DataHoraLeitura'
    end
    object cdsListaDadosInversorModoOperacao: TStringField
      DisplayLabel = 'Modo de opera'#231#227'o'
      FieldName = 'ModoOperacao'
      Size = 1
    end
    object cdsListaDadosInversorvmppt1v: TFloatField
      DisplayLabel = 'V_MPPT_1(V)'
      FieldName = 'vmppt1v'
    end
    object cdsListaDadosInversorimppt1a: TFloatField
      DisplayLabel = 'I_MPPT_1(A)'
      FieldName = 'imppt1a'
    end
    object cdsListaDadosInversorUAV: TFloatField
      FieldName = 'UAV'
    end
    object cdsListaDadosInversoriac1a: TFloatField
      DisplayLabel = 'I_AC_1(A)'
      FieldName = 'iac1a'
    end
    object cdsListaDadosInversorfac1hz: TFloatField
      DisplayLabel = 'F_AC_1(HZ)'
      FieldName = 'fac1hz'
    end
    object cdsListaDadosInversorpotencia: TFloatField
      DisplayLabel = 'Pot'#234'ncia'
      FieldName = 'potencia'
    end
    object cdsListaDadosInversortemperatura: TFloatField
      DisplayLabel = 'Temperatura'
      FieldName = 'temperatura'
    end
    object cdsListaDadosInversorproducao_dia: TFloatField
      DisplayLabel = 'Produ'#231#227'o do dia'
      FieldName = 'producao_dia'
    end
    object cdsListaDadosInversorgeracao_total: TFloatField
      DisplayLabel = 'Gera'#231#227'o total'
      FieldName = 'geracao_total'
    end
    object cdsListaDadosInversorh_total: TIntegerField
      DisplayLabel = 'Total de horas'
      FieldName = 'h_total'
    end
    object cdsListaDadosInversorrssi: TIntegerField
      DisplayLabel = 'RSSI'
      FieldName = 'rssi'
    end
    object cdsListaDadosInversorpf: TFloatField
      DisplayLabel = 'PF'
      FieldName = 'pf'
    end
    object cdsListaDadosInversorreactive_power: TFloatField
      DisplayLabel = 'Pot'#234'ncia reativa'
      FieldName = 'reactive_power'
    end
    object cdsListaDadosInversorleakageCurrentMA: TIntegerField
      DisplayLabel = 'Corrente de fuga'
      FieldName = 'leakageCurrentMA'
    end
    object cdsListaDadosInversorisolimit: TIntegerField
      DisplayLabel = 'Limite ISO'
      FieldName = 'isolimit'
    end
  end
  object dsListaDadosInversor: TDataSource
    DataSet = cdsListaDadosInversor
    Left = 576
    Top = 80
  end
  object dlgOpenXls: TOpenDialog
    Filter = 'Arquivo xls|*.xls'
    Left = 424
    Top = 136
  end
end
