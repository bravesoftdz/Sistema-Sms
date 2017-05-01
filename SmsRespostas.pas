unit SmsRespostas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdFTP, AppEvnts;

type
  TSmsResposta = class(TForm)
    IdFTP2: TIdFTP;
    Eventos: TApplicationEvents;
    procedure FormShow(Sender: TObject);
    procedure EventosException(Sender: TObject; E: Exception);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SmsResposta: TSmsResposta;

implementation

{$R *.dfm}

procedure TSmsResposta.FormShow(Sender: TObject);

  Function PegandoCnpj : String;
  var Arq  : TextFile;
  Linha : String;
  begin
    AssignFile(Arq,'ConfiguracaoConexao.ini');
    Reset(Arq) ;
    Readln(Arq,Linha);
    Readln(Arq,Linha);
    Readln(Arq,Linha);
    Readln(Arq,Linha);
    Readln(Arq,Linha);
    Readln(Arq,Linha);
    Result := Linha;
    CloseFile(Arq);
  end;

  Function ConectaFtp2(Senha : String) : Boolean;
  begin
    Try
      SmsResposta.idFtp2.Disconnect();
    except on E: Exception do
    end;
    SmsResposta.idFtp2.Host := 'ftp.bibia.com.br';
    SmsResposta.idFtp2.Port := 21;
    SmsResposta.idFtp2.Username := Trim(PegandoCnpj)+'@bibia.com.br';
    SmsResposta.idFtp2.Password := Senha;
    try
      SmsResposta.idFtp2.Connect(true, 10000);
      Result := True;
    except on E: Exception do
      Result := False;
    end;
  end;

  Function VerificaExisteArquivoRecebidosFtp : Boolean;
  begin
    if IdFTP2.Size('Recebidos.txt') > 0 then begin
      Result := True;
      if FileExists('Recebidos.txt') then
        DeleteFile('Recebidos.txt');
    end else
      Result := False;
  end;

  procedure BuscarArquivoRecebidosFtp;
  begin
    Try
      IdFTP2.Get('Recebidos.txt','Recebidos.txt',true, false);
    except
    end;
     Try
       IdFTP2.Delete('Recebidos.txt');
     Except
     end;
  end;

  
begin
  if ConectaFtp2('cadmus182') then
    if VerificaExisteArquivoRecebidosFtp then begin
      BuscarArquivoRecebidosFtp;
      //CarregaArquivoRecebidos;
    end;
  Application.Terminate;
end;
procedure TSmsResposta.EventosException(Sender: TObject; E: Exception);
begin
  Application.Terminate;
end;

end.
