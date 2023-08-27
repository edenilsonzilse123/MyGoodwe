object frmInversorFrame: TfrmInversorFrame
  Left = 0
  Top = 0
  Width = 378
  Height = 112
  TabOrder = 0
  inline frmPlantasInv: TfrmPlantas
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
  object grpInversor: TGroupBox
    Left = 3
    Top = 56
    Width = 373
    Height = 54
    Caption = ' Inversor '
    TabOrder = 1
    object edtNomePlanta: TEdit
      Left = 71
      Top = 28
      Width = 300
      Height = 22
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object lbledtCodPlanta: TLabeledEdit
      Left = 3
      Top = 28
      Width = 65
      Height = 22
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 1
    end
  end
end
