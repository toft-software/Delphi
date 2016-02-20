object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MemoErrorMessage: TMemo
    Left = 0
    Top = 0
    Width = 447
    Height = 89
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 254
    ExplicitTop = 8
    ExplicitWidth = 185
  end
  object EditBaseURL: TEdit
    Left = 96
    Top = 114
    Width = 249
    Height = 21
    TabOrder = 1
    Text = 'http://localhost:55628/Vetmall.svc'
  end
  object Button1: TButton
    Left = 336
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'http://localhost:55628/Vetmall.svc'
    Params = <>
    HandleRedirects = True
    Left = 24
    Top = 56
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 16
    Top = 104
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <
      item
        name = 'pattern'
        Value = 'Madonna'
      end>
    Resource = 'GetManufacturerFromID/6'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 96
    Top = 16
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    FieldDefs = <>
    Left = 96
    Top = 72
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkControlToFieldErrorMessage: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = RESTResponse1
      FieldName = 'ErrorMessage'
      Control = MemoErrorMessage
      Track = False
    end
    object LinkControlToFieldBaseURL: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = RESTClient1
      FieldName = 'BaseURL'
      Control = EditBaseURL
      Track = True
    end
  end
end
