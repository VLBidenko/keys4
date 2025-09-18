object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Вход в систему'
  ClientHeight = 179
  ClientWidth = 298
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object lblUsername: TLabel
    Left = 24
    Top = 24
    Width = 101
    Height = 13
    Caption = 'Имя пользователя:'
  end
  object lblPassword: TLabel
    Left = 24
    Top = 72
    Width = 41
    Height = 13
    Caption = 'Пароль:'
  end
  object edtUsername: TEdit
    Left = 24
    Top = 43
    Width = 249
    Height = 21
    TabOrder = 0
  end
  object edtPassword: TEdit
    Left = 24
    Top = 91
    Width = 249
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object btnLogin: TButton
    Left = 104
    Top = 128
    Width = 89
    Height = 33
    Caption = 'Войти'
    Default = True
    TabOrder = 2
    OnClick = btnLoginClick
  end
end 