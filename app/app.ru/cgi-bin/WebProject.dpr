program WebProject;

{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  Web.WebBroker,
  Web.CGIApp,
  WebModuleUnit in 'WebModuleUnit.pas' {WebModule1: TWebModule};

{$R *.res}

begin
  Application.Initialize;
  Application.WebModuleClass := WebModuleClass;
  Application.Run;
end. 