object formOpretCustomerGroup: TformOpretCustomerGroup
  Left = 0
  Top = 0
  Caption = 'Vetmall klient - Kundegruppe'
  ClientHeight = 517
  ClientWidth = 477
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    477
    517)
  PixelsPerInch = 96
  TextHeight = 13
  object edKundegruppenavn: TcxTextEdit
    Left = 31
    Top = 24
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 0
    Width = 250
  end
  object cxButDeaktiv: TcxButton
    Left = 301
    Top = 23
    Width = 140
    Height = 25
    Action = actOpret
    TabOrder = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object grKunder: TcxGrid
    Left = 31
    Top = 54
    Width = 408
    Height = 411
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Ariel'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object grKunderDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = Dssource
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object grKunderDBTableView1groupname: TcxGridDBColumn
        Caption = 'Navn'
        DataBinding.FieldName = 'name'
        Options.Editing = False
        VisibleForCustomization = False
        Width = 394
      end
    end
    object grKunderLevel1: TcxGridLevel
      GridView = grKunderDBTableView1
    end
  end
  object cxButton3: TcxButton
    Left = 159
    Top = 479
    Width = 153
    Height = 25
    Action = actSlet
    Anchors = [akBottom]
    TabOrder = 3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object ActionList1: TActionList
    Top = 120
    object actOpret: TAction
      Caption = 'Tilf'#248'j kundegruppen'
      OnExecute = actOpretExecute
    end
    object actSlet: TAction
      Caption = 'Slet kundegruppe (F4)'
      ShortCut = 115
      OnExecute = actSletExecute
    end
  end
  object Dssource: TDataSource
    Top = 192
  end
end
