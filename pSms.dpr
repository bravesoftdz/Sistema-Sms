program pSms;

uses
  Forms,
  uSms in 'uSms.pas' {Sms},
  UdmuPrincipal in 'UdmuPrincipal.pas' {dmuPrincipal: TDataModule},
  qruCelularesInvalidos in 'qruCelularesInvalidos.pas' {qrCelularesInvalidos: TQuickRep},
  UDDD in 'UDDD.pas',
  dmuServidor in 'dmuServidor.pas' {dmServidor: TDataModule},
  UProcedures in 'UProcedures.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Simples Sms';
  Application.CreateForm(TSms, Sms);
  Application.CreateForm(TdmuPrincipal, dmuPrincipal);
  Application.CreateForm(TqrCelularesInvalidos, qrCelularesInvalidos);
  Application.CreateForm(TdmServidor, dmServidor);
  Application.Run;
end.
