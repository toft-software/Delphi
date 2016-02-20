object FormRedigerKunde: TFormRedigerKunde
  Left = 0
  Top = 0
  Caption = 'VetMall klient - kundekort'
  ClientHeight = 555
  ClientWidth = 901
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    901
    555)
  PixelsPerInch = 96
  TextHeight = 13
  object edPraksisnr: TcxTextEdit
    Left = 139
    Top = 31
    Enabled = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    StyleDisabled.Color = clWhite
    StyleDisabled.TextColor = clBlack
    TabOrder = 0
    Width = 119
  end
  object edPraksisnavn: TcxTextEdit
    Left = 139
    Top = 63
    Enabled = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    StyleDisabled.Color = clWhite
    StyleDisabled.TextColor = clBlack
    TabOrder = 1
    Width = 285
  end
  object edAdr: TcxTextEdit
    Left = 139
    Top = 93
    Enabled = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    StyleDisabled.Color = clWhite
    StyleDisabled.TextColor = clBlack
    TabOrder = 2
    Width = 285
  end
  object cxLabel1: TcxLabel
    Left = 50
    Top = 34
    Caption = 'Praksisnr.'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxLabel2: TcxLabel
    Left = 51
    Top = 65
    Caption = 'Praksisnavn'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxLabel3: TcxLabel
    Left = 455
    Top = 39
    Caption = 'Telefon'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxLabel4: TcxLabel
    Left = 456
    Top = 68
    Caption = 'Fax'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxLabel5: TcxLabel
    Left = 52
    Top = 94
    Caption = 'Adresse'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxLabel6: TcxLabel
    Left = 456
    Top = 96
    Caption = 'E-mail'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object edTlf: TcxTextEdit
    Left = 522
    Top = 36
    Enabled = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    StyleDisabled.Color = clWhite
    StyleDisabled.TextColor = clBlack
    TabOrder = 9
    Width = 119
  end
  object edFax: TcxTextEdit
    Left = 522
    Top = 66
    Enabled = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    StyleDisabled.Color = clWhite
    StyleDisabled.TextColor = clBlack
    TabOrder = 10
    Width = 119
  end
  object edEmail: TcxTextEdit
    Left = 522
    Top = 96
    Enabled = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    StyleDisabled.Color = clWhite
    StyleDisabled.TextColor = clBlack
    TabOrder = 11
    Width = 228
  end
  object cxButAktiver: TcxButton
    Left = 275
    Top = 32
    Width = 75
    Height = 25
    Action = ActAktiver
    TabOrder = 12
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object cxButDeaktiv: TcxButton
    Left = 349
    Top = 32
    Width = 75
    Height = 25
    Action = ActDeaktiver
    TabOrder = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object cxButton1: TcxButton
    Left = 23
    Top = 513
    Width = 109
    Height = 34
    Action = ActGemLuk
    Anchors = [akLeft, akBottom]
    TabOrder = 14
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object cxButton2: TcxButton
    Left = 802
    Top = 505
    Width = 83
    Height = 34
    Action = ActLuk
    Anchors = [akRight, akBottom]
    TabOrder = 15
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object cxLabel7: TcxLabel
    Left = 52
    Top = 129
    Caption = 'Kundegruppe'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object grKunder: TcxGrid
    Left = 23
    Top = 168
    Width = 857
    Height = 331
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Ariel'
    Font.Style = []
    ParentFont = False
    TabOrder = 17
    object grKunderDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dscustomer
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object grKunderDBTableView1firstname: TcxGridDBColumn
        Caption = 'Fornavn'
        DataBinding.FieldName = 'firstname'
        Options.Editing = False
        Width = 119
      end
      object grKunderDBTableView1lastname: TcxGridDBColumn
        Caption = 'Efternavn'
        DataBinding.FieldName = 'lastname'
        Options.Editing = False
        Width = 143
      end
      object grKunderDBTableView1company: TcxGridDBColumn
        Caption = 'Virksomhed'
        DataBinding.FieldName = 'company'
        BestFitMaxWidth = 75
        Width = 142
      end
      object grKunderDBTableView1company_id: TcxGridDBColumn
        Caption = 'CVR'
        DataBinding.FieldName = 'company_id'
        BestFitMaxWidth = 75
      end
      object grKunderDBTableView1address_1: TcxGridDBColumn
        Caption = 'Adresse 1'
        DataBinding.FieldName = 'address_1'
        BestFitMaxWidth = 75
      end
      object grKunderDBTableView1address_2: TcxGridDBColumn
        Caption = 'Adresse 2'
        DataBinding.FieldName = 'address_2'
        BestFitMaxWidth = 75
      end
      object grKunderDBTableView1city: TcxGridDBColumn
        Caption = 'By'
        DataBinding.FieldName = 'city'
      end
      object grKunderDBTableView1postcode: TcxGridDBColumn
        Caption = 'Postnr'
        DataBinding.FieldName = 'postcode'
      end
      object grKunderDBTableView1country: TcxGridDBColumn
        Caption = 'Land'
        DataBinding.FieldName = 'country'
      end
      object grKunderDBTableView1standardadresse: TcxGridDBColumn
        Caption = 'Standard adresse'
        DataBinding.FieldName = 'standardadr'
        Width = 107
      end
    end
    object grKunderLevel1: TcxGridLevel
      GridView = grKunderDBTableView1
    end
  end
  object cxCheckCb: TcxCheckComboBox
    Left = 138
    Top = 130
    ParentFont = False
    Properties.Items = <>
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    StyleDisabled.Color = clWhite
    StyleDisabled.TextColor = clBlack
    TabOrder = 18
    Width = 286
  end
  object btnNulstil: TcxButton
    Left = 437
    Top = 130
    Width = 25
    Height = 24
    Action = actOpretCustomerGroup
    LookAndFeel.NativeStyle = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 19
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Ariel'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ActionList1: TActionList
    Left = 840
    Top = 32
    object ActAktiver: TAction
      Caption = 'Aktiver'
      OnExecute = ActAktiverExecute
    end
    object ActDeaktiver: TAction
      Caption = 'Deaktiver'
      OnExecute = ActDeaktiverExecute
    end
    object ActGemLuk: TAction
      Caption = 'Gem && Luk (F10)'
      OnExecute = ActGemLukExecute
    end
    object ActLuk: TAction
      Caption = 'Luk (F10)'
      ShortCut = 121
      OnExecute = ActLukExecute
    end
    object actOpretCustomerGroup: TAction
      Caption = '+'
      OnExecute = actOpretCustomerGroupExecute
    end
  end
  object dscustomer: TDataSource
    Left = 840
    Top = 80
  end
end
