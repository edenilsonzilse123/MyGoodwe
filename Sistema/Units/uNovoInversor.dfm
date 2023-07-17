object frmInversor: TfrmInversor
  Left = 0
  Top = 0
  Caption = 'frmInversor'
  ClientHeight = 431
  ClientWidth = 735
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
  object pnlCadInversor: TPanel
    Left = 0
    Top = 0
    Width = 735
    Height = 97
    Align = alTop
    TabOrder = 0
    ExplicitTop = -6
    inline frmPlanta: TfrmPlantas
      Left = 0
      Top = 0
      Width = 376
      Height = 54
      TabOrder = 0
      inherited grpPlantas: TGroupBox
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 376
        ExplicitHeight = 54
      end
    end
    object lbledtNomeInversor: TLabeledEdit
      Left = 3
      Top = 71
      Width = 368
      Height = 22
      EditLabel.Width = 112
      EditLabel.Height = 14
      EditLabel.Caption = 'Nome do inversor'
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
      TabOrder = 1
    end
    object btnAdicionar: TButton
      Left = 382
      Top = 3
      Width = 116
      Height = 25
      Caption = 'Adicionar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnAdicionarClick
    end
    object btnNovo: TButton
      Left = 382
      Top = 29
      Width = 116
      Height = 25
      Caption = 'Novo registro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object btnEditar: TButton
      Left = 382
      Top = 55
      Width = 116
      Height = 25
      Caption = 'Editar registro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
  end
  object dbgrdListaInversor: TDBGrid
    Left = 0
    Top = 97
    Width = 735
    Height = 334
    Align = alClient
    DataSource = dsListaInversores
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
    OnDblClick = dbgrdListaInversorDblClick
  end
  object cdsListaInversores: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 192
    object cdsListaInversoresId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 1
      FieldName = 'Id'
    end
    object cdsListaInversoresNomePlanta: TStringField
      DisplayLabel = 'Nome da planta'
      FieldName = 'NomePlanta'
      Size = 50
    end
    object cdsListaInversoresNomeInversor: TStringField
      DisplayLabel = 'Nome do Inversor'
      FieldName = 'NomeInversor'
      Size = 50
    end
    object cdsListaInversoresIdPlanta: TIntegerField
      FieldName = 'IdPlanta'
      Visible = False
    end
  end
  object dsListaInversores: TDataSource
    AutoEdit = False
    DataSet = cdsListaInversores
    Left = 376
    Top = 208
  end
end
