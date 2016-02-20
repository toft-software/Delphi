object FormAllVMRabatter: TFormAllVMRabatter
  Left = 0
  Top = 0
  Caption = 'Vetmall - rabatter'
  ClientHeight = 600
  ClientWidth = 1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    1074
    600)
  PixelsPerInch = 96
  TextHeight = 13
  object grDelruteResultat: TcxGrid
    Left = 46
    Top = 29
    Width = 987
    Height = 492
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object grDRResultatDBTableView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dssource
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHiding = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object cxGridDBDRKundeGrpId: TcxGridDBColumn
        Caption = 'Kundegruppe'
        DataBinding.FieldName = 'customergroupname'
        Width = 166
      end
      object cxGridDBDRKategoriId: TcxGridDBColumn
        Caption = 'Kategori'
        DataBinding.FieldName = 'categoryname'
        VisibleForCustomization = False
        Width = 196
      end
      object grDRResultatDBTableViewUseSub: TcxGridDBColumn
        Caption = 'Subkatagorier'
        DataBinding.FieldName = 'subcategories'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Width = 89
      end
      object grDRResultatDBTableViewStarttid: TcxGridDBColumn
        Caption = 'Start Dato'
        DataBinding.FieldName = 'discount_start'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 103
      end
      object grDRResultatDBTableViewSluttid: TcxGridDBColumn
        Caption = 'Slut Dato'
        DataBinding.FieldName = 'discount_stop'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 116
      end
      object grDRResultatDBTableViewPermanent: TcxGridDBColumn
        Caption = 'Permanent'
        DataBinding.FieldName = 'fulltime'
        PropertiesClassName = 'TcxCheckBoxProperties'
      end
      object grDRResultatDBTableViewDiscount: TcxGridDBColumn
        Caption = 'Rabat'
        DataBinding.FieldName = 'discount_pct'
      end
      object grDRResultatDBTableViewDiscountOnCampain: TcxGridDBColumn
        Caption = 'Rabat p'#229' kampagnepriser'
        DataBinding.FieldName = 'config_special'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Width = 125
      end
      object grDRResultatDBTableViewid: TcxGridDBColumn
        DataBinding.FieldName = 'id'
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = grDRResultatDBTableView
    end
  end
  object cxButton1: TcxButton
    Left = 46
    Top = 558
    Width = 153
    Height = 25
    Action = actRediger
    Anchors = [akLeft, akBottom]
    TabOrder = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object cxButton2: TcxButton
    Left = 185
    Top = 558
    Width = 153
    Height = 25
    Action = actOpret
    Anchors = [akBottom]
    TabOrder = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object cxButton3: TcxButton
    Left = 330
    Top = 558
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
    OnClick = cxButton3Click
  end
  object btnLuk: TcxButton
    Left = 928
    Top = 567
    Width = 105
    Height = 25
    Action = actLuk
    Anchors = [akRight, akBottom]
    LookAndFeel.NativeStyle = True
    OptionsImage.Glyph.Data = {
      36050000424D3605000000000000360400002800000010000000100000000100
      08000000000000010000000000000000000000010000000000004A004A006200
      6200780178009F019F00BC01BC00D301D300E200E200EF00EF00F700F700FB00
      FB00FD00FD00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
      FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
      FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
      FE00FE00FE00FE00FE00FD00FD00FC00FC00FA00FA00F701F700F202F200EC03
      EC00E305E300D708D700C60BC600AF11AF008F188F007E1D7E006C226C006125
      6100572857004C2C4C0040304000353535003636360037373700383838003939
      39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
      4100424242004343430044444400454545004646460047474700484848004949
      49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
      5100525252005353530054545400555555005656560057575700585858005959
      59005A5A5A005B5B5B005C5C5C005D5D5D005E5E5E005F5F5F00606060006161
      6100626262006363630064646400656565006666660067676700686868006969
      69006A6A6A006B6B6B006C6C6C006D6D6D006E6E6E006F6F6F00707070007171
      7100727272007373730074747400757575007676760077777700787878007979
      79007A7A7A007B7B7B007C7C7C007D7D7D007E7E7E007F7F7F00808080008181
      8100828282008383830084848400858585008686860087878700888888008989
      89008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F8F00909090009191
      9100929292009393930094949400959595009696960097979700989898009999
      99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
      A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
      A900AAAAAA00ABABAB00ACACAC00ADADAD00AEAEAE00AFAFAF00B0B0B000B1B1
      B100B2B2B200B3B3B300B4B4B400B5B5B500B6B6B600B7B7B700BABEBC00BEC5
      C100C1CCC500C8D6CD00CDDED400D2E4D900D7EADF00DCEEE300E0F2E700E7F6
      EC00EEF9F100F2FBF500F5FBF700F7FCF800F9FDFA00FAFDFB00FBFDFB00FBFD
      FC00F9FDFA00F6FCF800F3FBF600ECFAF100E7F8ED00E4F7EB00DFF6E800DAF5
      E400D6F4E100D2F2DD00CEF1DA00CBF0D700C7EFD500C3EED100BEECCC00B9EA
      C900B1E8C400A9E6BE009FE3B70095E0B0008CDDA7007FD99F0073D596006BD3
      8F0063D089005DCE820058CD7F0051CB7B004AC9770044C872003DC66D0037C4
      68002FBF61002DBD5D002CBA59002AB9560028B7510026B74C0024B6480022B4
      410020B23B001DB2360017B22E0011B127000DB120000BB11C000AB01B0009AB
      190009A518000A8F1700097C1300086F100007680E00076A0E001515151515FE
      FEFFFFFEFE1515151515151515FEFEFBF8F8F8F8FBFEFE1515151515FFFCF7F8
      F8F8F8F8F8F8FCFE151515FFFBF4F5F7F8F8F8F8F8F8F8FCFE1515FFF0F1F4F7
      E3C2D1F3F8F8F8F8FE15FDF2EBF0F5E4C5C9DDF6F8F8F8F8FBFEFDEDEAEFE4CB
      C9DEF8F8F8F8F8F8F9FEFCE9E9DECCC9CAD6D8D8D8D8D8F8F8FEFBE4E6D5C9C9
      C9C9C9C9C9C9C9F8F8FFFBE1E2E6D9C9C9DCE4E3E4E4E4F5F8FEFBE3DCE8E9DB
      C9CEE1EFF0F0F1F5FAFE15F2D8DFEAE9DBC9C5E7F0F1F3F4FB1515F2E1D2DFE9
      E9DBD8E9EDEFF0F4FB151515F2DFD0DAE1E5E6E6E6E9F0FC1515151515F2F2DA
      D3D8DBDDE1EDED1515151515151515EEF2F2F2F2F11515151515}
    TabOrder = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object dssource: TDataSource
    Left = 880
    Top = 528
  end
  object ActionList1: TActionList
    Left = 737
    Top = 546
    object actRediger: TAction
      Caption = 'Rediger rabat  (F3)'
      ShortCut = 114
      OnExecute = actRedigerExecute
    end
    object actOpret: TAction
      Caption = 'Opret rabat (F2)'
      ShortCut = 113
      OnExecute = actOpretExecute
    end
    object actSlet: TAction
      Caption = 'Slet rabat (F4)'
      ShortCut = 115
    end
    object actLuk: TAction
      Caption = 'Luk (F10)'
      ShortCut = 121
    end
    object actRens: TAction
      Caption = 'actRens'
    end
  end
end
