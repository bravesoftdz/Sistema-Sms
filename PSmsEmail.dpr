program PSmsEmail;

uses
  Forms,
  USmsEmail in 'USmsEmail.pas' {SmsEmail};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TSmsEmail, SmsEmail);
  Application.Run;
end.
