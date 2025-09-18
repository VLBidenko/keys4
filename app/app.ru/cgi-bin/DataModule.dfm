object DM: TDM
  Height = 480
  Width = 640
  object ADOConnection: TADOConnection
    LoginPrompt = False
    Left = 48
    Top = 40
  end
  object qryUsers: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 48
    Top = 96
  end
  object qryBooks: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 48
    Top = 152
  end
  object qryOrders: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 48
    Top = 208
  end
end 