program Script;

uses
  Forms,
  PScript in 'PScript.pas' {Sms};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TSms, Sms);
  Application.Run;
end.
