unit LoginForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmLogin = class(TForm)
    edtUsername: TEdit;
    edtPassword: TEdit;
    btnLogin: TButton;
    lblUsername: TLabel;
    lblPassword: TLabel;
    procedure btnLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses DataModule, MainForm;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
  with DM.qryUsers do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Users WHERE UserName = :username AND Password = :password');
    Parameters.ParamByName('username').Value := edtUsername.Text;
    Parameters.ParamByName('password').Value := edtPassword.Text;
    Open;
    
    if not IsEmpty then
    begin
      ModalResult := mrOk;
      frmMain.Show;
      Hide;
    end
    else
      ShowMessage('Неверное имя пользователя или пароль!');
  end;
end;

end. 