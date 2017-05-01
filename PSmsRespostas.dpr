program PSmsRespostas;

uses
  Forms, Windows,
  SmsRespostas in 'SmsRespostas.pas' {SmsResposta};

{$R *.res}

var ExtendedStyle : Integer;

begin
  Application.Initialize;

  ExtendedStyle := GetWindowLong(Application.Handle, gwl_ExStyle);
 
  SetWindowLong(Application.Handle, gwl_ExStyle, ExtendedStyle or

  ws_Ex_ToolWindow and not ws_Ex_AppWindow);

  Application.CreateForm(TSmsResposta, SmsResposta);

  Application.Run;

end.
