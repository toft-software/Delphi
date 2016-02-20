object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Vetmall klient v 1.0'
  ClientHeight = 130
  ClientWidth = 649
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    649
    130)
  PixelsPerInch = 96
  TextHeight = 13
  object cxButton1: TcxButton
    Left = 217
    Top = 15
    Width = 195
    Height = 66
    Action = ActKunder
    TabOrder = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object cxButton2: TcxButton
    Left = 24
    Top = 15
    Width = 195
    Height = 66
    Action = ActVarer
    TabOrder = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object cxButton3: TcxButton
    Left = 409
    Top = 15
    Width = 195
    Height = 66
    Action = ActRabat
    TabOrder = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object cxButton4: TcxButton
    Left = 488
    Top = 97
    Width = 153
    Height = 25
    Action = actLogof
    Anchors = [akBottom]
    TabOrder = 3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object RESTClient1: TRESTClient
    Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    BaseURL = 'http://localhost:55628/Vetmall.svc'
    Params = <>
    HandleRedirects = True
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    Left = 32
    Top = 65528
  end
  object ActionList1: TActionList
    Left = 72
    object ActVarer: TAction
      Caption = 'Varer'
      OnExecute = ActVarerExecute
    end
    object ActKunder: TAction
      Caption = 'Kunder'
      OnExecute = ActKunderExecute
    end
    object ActRabat: TAction
      Caption = 'VMrabat'
      OnExecute = ActRabatExecute
    end
    object actLogof: TAction
      Caption = 'Log af'
    end
  end
  object RESTResponse1: TRESTResponse
    Left = 112
  end
  object RichEditBold1: TRichEditBold
    Category = 'Format'
    AutoCheck = True
    Caption = '&Bold'
    Hint = 'Bold'
    ImageIndex = 31
    ShortCut = 16450
  end
end
