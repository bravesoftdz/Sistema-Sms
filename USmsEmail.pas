unit USmsEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP,
  IdComponent, IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL,
  IdBaseComponent, IdMessage, StdCtrls, AppEvnts, IdIOHandlerStack, IdSSL,
  IdExplicitTLSClientServerBase, IdSMTPBase;

type
  TSmsEmail = class(TForm)
    IdMessageAgendamento: TIdMessage;
    IdSMTPAgendamento: TIdSMTP;
    Memo1: TMemo;
    IdSSLIOHandlerSocketAgendamento: TIdSSLIOHandlerSocketOpenSSL;
    procedure FormShow(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
 //   procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SmsEmail: TSmsEmail;

implementation

uses Math;

{$R *.dfm}

Function ConverterHtml(Texto : String) : String;
begin
  Result :=  StringReplace(Texto,'�',';&Aacute',[rfReplaceAll]) ;
  Result :=  StringReplace(Result,'�',';&Egrave',[rfReplaceAll]) ;
  Result :=  StringReplace(Result,'�',';&ocirc',[rfReplaceAll]) ;
  Result :=  StringReplace(Result,'�',';&Ccedil',[rfReplaceAll]) ;
  Result :=  StringReplace(Result,'�',';&agrave',[rfReplaceAll]) ;
  Result :=  StringReplace(Result,'�',';&Atilde',[rfReplaceAll]) ;
  Result :=  StringReplace(Result,'�',';&Iacute',[rfReplaceAll]) ;
  Result :=  StringReplace(Result,'�',';&Ograve',[rfReplaceAll]) ;
  Result :=  StringReplace(Result,'�','&ccedil',[rfReplaceAll]) ;
  Result :=  StringReplace(Result,'�',';&Oacute',[rfReplaceAll]) ;
  Result :=  StringReplace(Result,'�',';&atilde',[rfReplaceAll]) ;
  Result :=  StringReplace(Result,'�',';&Auml',[rfReplaceAll]) ;
  Result :=  StringReplace(Result,'�',';&Otilde',[rfReplaceAll]) ;
  Result :=  StringReplace(Result,'�',';&otilde',[rfReplaceAll]) ;
end;

procedure ConectaEmailAgendamento;
begin
  with SmsEmail do begin
    IdSMTPAgendamento.IOHandler := IdSSLIOHandlerSocketAgendamento  ;
    //IdSMTPAgendamento.AuthType := satSASL;
    IdSMTPAgendamento.Port := 587;
    IdSMTPAgendamento.Host := 'email-smtp.us-east-1.amazonaws.com';
    IdSMTPAgendamento.Username := 'AKIAICWBUVIYDEFCCMPA';
    IdSMTPAgendamento.Password := 'AiUNHkUi7PJ7G4V9FVT7FJscnoFfV8Sv8pY60GnNL76e';

    try
      IdSSLIOHandlerSocketAgendamento.SSLOptions.Method := sslvSSLv2;
      IdSSLIOHandlerSocketAgendamento.SSLOptions.Mode := sslmClient;
      IdSSLIOHandlerSocketAgendamento.StartSSL;

      IdSMTPAgendamento.Connect;
      //IdSMTP.Authenticate;
    except on E:Exception do begin
      MessageDlg('Erro na conex�o e/ou autentica��o do Email: ' + E.Message, mtWarning, [mbOK], 0);
      //btConectaBancoDeDados.Click;
      Exit;
    end;
    end;
  end;

end;

procedure TSmsEmail.FormShow(Sender: TObject);

  Function CarregaTextoEmail(Texto : String) : String;
  Var Memo : TMemo;
  begin
    Memo := TMemo.Create(nil);
    Memo.Parent := SmsEmail;
    Memo.Hide;
    Memo.Lines.LoadFromFile(Texto+'.txt');
    Result := Memo.Lines.Text;
    Memo.Destroy;
  end;

begin
  //Sleep(60000);
  ConectaEmailAgendamento;
  with SmsEmail do begin

    IdMessageAgendamento.ContentType:='text/html';
    IdMessageAgendamento.From.Address := 'simplessms@gmail.com';//Trim(ParamStr(1));
    IdMessageAgendamento.From.Name := 'hjjhjhjj';
    IdMessageAgendamento.Recipients.EMailAddresses := 'simplessms@gmail.com';
    IdMessageAgendamento.Subject := AnsiToUtf8('Condi��es');
    IdMessageAgendamento.Body.Text := (Memo1.Lines.Text);
    IdSMTPAgendamento.Send(IdMessageAgendamento);

  end;
  Application.Terminate;
end;
procedure TSmsEmail.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
  ShowMessage(e.Message);
end;

end.
