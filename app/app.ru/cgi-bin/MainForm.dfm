object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Библиотека - Главная'
  ClientHeight = 600
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 41
    Align = alTop
    TabOrder = 0
  end
  object pnlLeft: TPanel
    Left = 0
    Top = 41
    Width = 185
    Height = 559
    Align = alLeft
    TabOrder = 1
    object btnBooks: TSpeedButton
      Left = 8
      Top = 16
      Width = 169
      Height = 41
      Caption = 'Книги'
      OnClick = btnBooksClick
    end
    object btnUsers: TSpeedButton
      Left = 8
      Top = 63
      Width = 169
      Height = 41
      Caption = 'Пользователи'
      OnClick = btnUsersClick
    end
    object btnOrders: TSpeedButton
      Left = 8
      Top = 110
      Width = 169
      Height = 41
      Caption = 'Заказы'
      OnClick = btnOrdersClick
    end
  end
  object pnlMain: TPanel
    Left = 185
    Top = 41
    Width = 615
    Height = 559
    Align = alClient
    TabOrder = 2
    object dbgMain: TDBGrid
      Left = 1
      Top = 1
      Width = 613
      Height = 557
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
end 