unit WebModuleUnit;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, Data.DB, Data.Win.ADODB;

type
  TWebModule1 = class(TWebModule)
    ADOConnection: TADOConnection;
    qryBooks: TADOQuery;
    qryUsers: TADOQuery;
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModuleCreate(Sender: TObject);
  private
    function GenerateHTML(const Content: string): string;
    function GetBooksList: string;
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TWebModule1.WebModuleCreate(Sender: TObject);
begin
  ADOConnection.ConnectionString := 
    'Provider=MSDASQL.1;' +
    'Driver={MySQL ODBC 8.0 ANSI Driver};' +
    'Server=localhost;' +
    'Database=LibraryManagement;' +
    'User=root;' +
    'Password=;' +
    'Option=3;';
  ADOConnection.Connected := True;
end;

function TWebModule1.GenerateHTML(const Content: string): string;
begin
  Result := 
    '<!DOCTYPE html>' +
    '<html>' +
    '<head>' +
    '<meta charset="utf-8">' +
    '<title>Библиотека</title>' +
    '<style>' +
    'body { font-family: Arial; margin: 40px; }' +
    'table { border-collapse: collapse; width: 100%; }' +
    'th, td { border: 1px solid #ddd; padding: 8px; }' +
    'th { background-color: #f4f4f4; }' +
    '</style>' +
    '</head>' +
    '<body>' +
    '<h1>Библиотека</h1>' +
    '<nav>' +
    '<a href="/">Книги</a> | ' +
    '<a href="/users">Пользователи</a> | ' +
    '<a href="/orders">Заказы</a>' +
    '</nav><hr>' +
    Content +
    '</body></html>';
end;

function TWebModule1.GetBooksList: string;
var
  HTML: TStringBuilder;
begin
  HTML := TStringBuilder.Create;
  try
    HTML.Append('<table>');
    HTML.Append('<tr><th>ID</th><th>Название</th><th>Автор</th><th>Год</th></tr>');
    
    qryBooks.Close;
    qryBooks.SQL.Text := 'SELECT * FROM Books';
    qryBooks.Open;
    
    while not qryBooks.Eof do
    begin
      HTML.AppendFormat(
        '<tr><td>%d</td><td>%s</td><td>%s</td><td>%d</td></tr>',
        [qryBooks.FieldByName('BookID').AsInteger,
         qryBooks.FieldByName('Title').AsString,
         qryBooks.FieldByName('Author').AsString,
         qryBooks.FieldByName('PublishedYear').AsInteger]
      );
      qryBooks.Next;
    end;
    
    HTML.Append('</table>');
    Result := HTML.ToString;
  finally
    HTML.Free;
  end;
end;

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.ContentType := 'text/html';
  Response.ContentEncoding := 'utf-8';
  
  if Request.PathInfo = '/' then
    Response.Content := GenerateHTML(GetBooksList)
  else if Request.PathInfo = '/users' then
    Response.Content := GenerateHTML('Список пользователей')
  else if Request.PathInfo = '/orders' then
    Response.Content := GenerateHTML('Список заказов')
  else
    Response.Content := GenerateHTML('Страница не найдена');
    
  Handled := True;
end;

end. 