object FormRedigervmDiscounts: TFormRedigervmDiscounts
  Left = 0
  Top = 0
  Caption = 'Vetmall - rabatoversigt'
  ClientHeight = 389
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    442
    389)
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel
    Left = 89
    Top = 18
    Caption = 'Kundegruppe'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxLabel3: TcxLabel
    Left = 89
    Top = 228
    Caption = 'Rabat'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object edRabat: TcxCurrencyEdit
    Left = 89
    Top = 248
    EditValue = 0.000000000000000000
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 2
    Width = 121
  end
  object cbInkSub: TcxCheckBox
    Left = 86
    Top = 111
    Caption = 'Inkluder underkatagorier'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 3
  end
  object cbCategoryGroup: TcxComboBox
    Left = 89
    Top = 93
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 4
    Width = 281
  end
  object cxLabel8: TcxLabel
    Left = 89
    Top = 74
    Caption = 'Producent kategori'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cbKundeGroup: TcxComboBox
    Left = 89
    Top = 37
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 6
    Width = 281
  end
  object cbRabatkampagne: TcxCheckBox
    Left = 86
    Top = 269
    Caption = 'Rabat p'#229' kampagnepriser'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 7
  end
  object cbStaus: TcxCheckBox
    Left = 87
    Top = 311
    Caption = 'Aktiv'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 8
  end
  object cxButton1: TcxButton
    Left = 8
    Top = 349
    Width = 109
    Height = 34
    Action = ActGemLuk
    Anchors = [akLeft, akBottom]
    TabOrder = 9
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object cxButton2: TcxButton
    Left = 351
    Top = 349
    Width = 83
    Height = 34
    Action = ActLuk
    Anchors = [akRight, akBottom]
    TabOrder = 10
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object cbPermanent: TcxCheckBox
    Left = 89
    Top = 186
    Caption = 'Permanent (se bort fra periode)'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 11
  end
  object cxDatestart: TcxDateEdit
    Left = 89
    Top = 164
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 12
    Width = 121
  end
  object cxDateslut: TcxDateEdit
    Left = 249
    Top = 164
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 13
    Width = 121
  end
  object cxLabel2: TcxLabel
    Left = 87
    Top = 146
    Caption = 'Start'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxLabel4: TcxLabel
    Left = 249
    Top = 146
    Caption = 'Slut'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object ActionList1: TActionList
    Left = 358
    Top = 272
    object ActGemLuk: TAction
      Caption = 'Gem && Luk (F10)'
      OnExecute = ActGemLukExecute
    end
    object ActLuk: TAction
      Caption = 'Luk (F10)'
      ShortCut = 121
      OnExecute = ActLukExecute
    end
  end
end
