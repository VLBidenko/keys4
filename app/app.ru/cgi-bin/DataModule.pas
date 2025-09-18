unit DataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Vcl.Dialogs;

type
  TDM = class(TDataModule)
    ADOConnection: TADOConnection;
    qryUsers: TADOQuery;
    qryBooks: TADOQuery;
    qryOrders: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function ConnectToDatabase: Boolean;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDM.ConnectToDatabase: Boolean;
begin
  try
    ADOConnection.ConnectionString := 
      'Provider=MSDASQL.1;' +
      'Driver={MySQL ODBC 8.0 ANSI Driver};' +
      'Server=localhost;' +
      'Database=LibraryManagement;' +
      'User=root;' +
      'Password=;' +
      'Option=3;';
    
    ADOConnection.Connected := True;
    Result := True;
  except
    on E: Exception do
    begin
      Result := False;
      ShowMessage('Ошибка подключения к БД: ' + E.Message);
    end;
  end;
end;

end. 