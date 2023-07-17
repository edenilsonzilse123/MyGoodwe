object frmNovaPlanta: TfrmNovaPlanta
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Nova planta de gera'#231#227'o'
  ClientHeight = 440
  ClientWidth = 728
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
  object pnlNovaPlanta: TPanel
    Left = 0
    Top = 0
    Width = 728
    Height = 75
    Align = alTop
    TabOrder = 0
    object lbledtNovaPlanta: TLabeledEdit
      Left = 5
      Top = 20
      Width = 356
      Height = 22
      EditLabel.Width = 77
      EditLabel.Height = 14
      EditLabel.Caption = 'Nova planta'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Courier New'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object btnAdicionar: TButton
      Left = 367
      Top = 19
      Width = 75
      Height = 25
      Caption = 'Adicionar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnAdicionarClick
    end
    object btnNovo: TButton
      Left = 5
      Top = 43
      Width = 116
      Height = 25
      Caption = 'Novo registro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnNovoClick
    end
    object btnEditar: TButton
      Left = 127
      Top = 43
      Width = 116
      Height = 25
      Caption = 'Editar registro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnEditarClick
    end
  end
  object dbgrdListaNovaPlanta: TDBGrid
    Left = 0
    Top = 75
    Width = 728
    Height = 365
    Align = alClient
    DataSource = dsListaPlantas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Courier New'
    TitleFont.Style = []
    OnDblClick = dbgrdListaNovaPlantaDblClick
  end
  object cdsListaPlantas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 192
    object cdsListaPlantasId: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 1
      FieldName = 'Id'
    end
    object cdsListaPlantasNovaPlanta: TStringField
      DisplayLabel = 'Nome da planta'
      FieldName = 'NovaPlanta'
      Size = 50
    end
  end
  object dsListaPlantas: TDataSource
    AutoEdit = False
    DataSet = cdsListaPlantas
    Left = 432
    Top = 216
  end
end
