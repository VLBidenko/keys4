unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TfrmMain = class(TForm)
    pnlTop: TPanel;
    pnlLeft: TPanel;
    pnlMain: TPanel;
    btnBooks: TSpeedButton;
    btnUsers: TSpeedButton;
    btnOrders: TSpeedButton;
    dbgMain: TDBGrid;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnBooksClick(Sender: TObject);
    procedure btnUsersClick(Sender: TObject);
    procedure btnOrdersClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses DataModule;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  if not DM.ConnectToDatabase then
    Application.Terminate;
    
  DataSource1 := TDataSource.Create(Self);
  DataSource1.DataSet := DM.qryBooks;
  dbgMain.DataSource := DataSource1;
end;

procedure TfrmMain.btnBooksClick(Sender: TObject);
begin
  with DM.qryBooks do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Books');
    Open;
  end;
  dbgMain.DataSource := DataSource1;
end;

procedure TfrmMain.btnUsersClick(Sender: TObject);
begin
  with DM.qryUsers do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT UserID, UserName, Email, RegistrationDate FROM Users');
    Open;
  end;
  dbgMain.DataSource := DataSource1;
  DataSource1.DataSet := DM.qryUsers;
end;

procedure TfrmMain.btnOrdersClick(Sender: TObject);
begin
  with DM.qryOrders do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT o.OrderID, u.UserName, o.OrderDate, o.Status ' +
            'FROM Orders o ' +
            'JOIN Users u ON o.UserID = u.UserID');
    Open;
  end;
  dbgMain.DataSource := DataSource1;
  DataSource1.DataSet := DM.qryOrders;
end;

// Аналогичные обработчики для других кнопок
end. 