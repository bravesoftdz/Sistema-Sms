unit dmuServidor;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, FMTBcd, Provider, DBClient,
  ZAbstractConnection, ZConnection, ZSqlUpdate, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ExtCtrls;

type
  TdmServidor = class(TDataModule)
    dbPrincipal: TZConnection;
    qrySmsRecebidos: TZQuery;
    upSmsRecebidos: TZUpdateSQL;
    qryListaSmsEmail: TZQuery;
    upListaSmsEmail: TZUpdateSQL;
    qryAgendamentoSms: TZQuery;
    upAgendamentoSms: TZUpdateSQL;
    qryOrcamentoSms: TZQuery;
    upOrcamentoSms: TZUpdateSQL;
    qryVendaSms: TZQuery;
    upVendaSms: TZUpdateSQL;
    qryAvisoOrcamentoEmail: TZQuery;
    upAvisoOrcamentoEmail: TZUpdateSQL;
    qryAvisoVendaEmail: TZQuery;
    upAvisoVendaEmail: TZUpdateSQL;
    qryTextoEmail: TZQuery;
    upTextoEmail: TZUpdateSQL;
    qryAgendamentoEmail: TZQuery;
    upAgendamentoEmail: TZUpdateSQL;
    qryTextoAgendamentoEmail: TZQuery;
    upTextoAgendamentoEmail: TZUpdateSQL;
    qryAtividade: TZQuery;
    qryAgendados: TZQuery;
    upAgendados: TZUpdateSQL;
    qryEntregaSms: TZQuery;
    upEntregaSms: TZUpdateSQL;
    qryCargaSms: TZQuery;
    upCargaSms: TZUpdateSQL;
    qryCobrancaSms: TZQuery;
    upCobrancaSms: TZUpdateSQL;
    qryAniversarioSms: TZQuery;
    upAniversarioSms: TZUpdateSQL;
    qryCobrancaEmail: TZQuery;
    upCobrancaEmail: TZUpdateSQL;
    qryAvisoVencimentoEmail: TZQuery;
    upAvisoVencimentoEmail: TZUpdateSQL;
    qryAvisoVencimentoSms: TZQuery;
    upAvisoVencimentoSms: TZUpdateSQL;
    qryVerificaResete: TZQuery;
    tPingServer: TTimer;
    qrySenha: TZQuery;
    ZQuery1: TZQuery;
    StringField27: TStringField;
    qryNaoRepetirSms: TZQuery;
    StringField28: TStringField;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    StringField32: TStringField;
    qryConfirmacaoEntregaSms: TZQuery;
    upConfirmacaoEntregaSms: TZUpdateSQL;
    qryPesquisaSatisfacao: TZQuery;
    StringField37: TStringField;
    StringField38: TStringField;
    IntegerField15: TIntegerField;
    StringField39: TStringField;
    StringField40: TStringField;
    IntegerField16: TIntegerField;
    upPesquisaSatisfacao: TZUpdateSQL;
    qryRespostaSatisfacao: TZQuery;
    qryRespostaSatisfacaoId: TIntegerField;
    qryRespostaSatisfacaoResposta: TIntegerField;
    qryRespostaSatisfacaoCNPJ: TWideStringField;
    qryRespostaSatisfacaoDATA: TWideStringField;
    qryRespostaSatisfacaoNumero: TWideStringField;
    qryTotalRespostaSatisfacao: TZQuery;
    qryTotalRespostaSatisfacaoTotal: TLargeintField;
    qryTextoEmailAtualizaSatisfacao: TZQuery;
    upTextoEmailAtualizaSatisfacao: TZUpdateSQL;
    qryPesquisaSatisfacaoEmail: TZQuery;
    upPesquisaSatisfacaoEmail: TZUpdateSQL;
    qryPesquisaSatisfacaoEmailCnpj: TStringField;
    qryPesquisaSatisfacaoEmailcelular: TStringField;
    qryPesquisaSatisfacaoEmailEnviado: TIntegerField;
    qryPesquisaSatisfacaoEmailMensagem: TStringField;
    qryPesquisaSatisfacaoEmailRemetente: TStringField;
    qryPesquisaSatisfacaoEmailTipo: TStringField;
    qryPesquisaSatisfacaoEmailCodigoTextoEmail: TStringField;
    qryPesquisaSatisfacaoEmailid: TIntegerField;
    qryAgendamentoSmsCnpj: TWideStringField;
    qryAgendamentoSmscelular: TWideStringField;
    qryAgendamentoSmsEnviado: TIntegerField;
    qryAgendamentoSmsMensagem: TWideStringField;
    qryAgendamentoSmsTipo: TWideStringField;
    qryAgendamentoSmsid: TIntegerField;
    qryTextoEmailCodigoTextoEmail: TWideStringField;
    qryTextoEmailTexto: TWideMemoField;
    qryTextoEmailCnpj: TWideStringField;
    qryAgendamentoEmailCnpj: TWideStringField;
    qryAgendamentoEmailcelular: TWideStringField;
    qryAgendamentoEmailEnviado: TIntegerField;
    qryAgendamentoEmailMensagem: TWideStringField;
    qryAgendamentoEmailRemetente: TWideStringField;
    qryAgendamentoEmailTipo: TWideStringField;
    qryAgendamentoEmailCodigoTextoEmail: TWideStringField;
    qryAgendamentoEmailid: TIntegerField;
    qryTextoAgendamentoEmailCodigoTextoEmail: TWideStringField;
    qryTextoAgendamentoEmailCnpj: TWideStringField;
    qryCobrancaEmailCnpj: TStringField;
    qryCobrancaEmailcelular: TStringField;
    qryCobrancaEmailEnviado: TIntegerField;
    qryCobrancaEmailMensagem: TStringField;
    qryCobrancaEmailRemetente: TStringField;
    qryCobrancaEmailTipo: TStringField;
    qryCobrancaEmailCodigoTextoEmail: TStringField;
    qryCobrancaEmailid: TIntegerField;
    qryTextoEmailAtualizaSatisfacaoCodigoTextoEmail: TWideStringField;
    qryTextoEmailAtualizaSatisfacaoTexto: TWideMemoField;
    qryTextoEmailAtualizaSatisfacaoCnpj: TWideStringField;
    qryAgendadosid: TIntegerField;
    qryAgendadosData: TStringField;
    qryAgendadosHora: TStringField;
    qryAgendadosTitulo: TStringField;
    qryAgendadosUltimaExecucao: TStringField;
    qryAgendadosTipo: TStringField;
    qryAgendadosCNPJ: TStringField;
    qryCargaSmsCnpj: TStringField;
    qryCargaSmscelular: TStringField;
    qryCargaSmsEnviado: TIntegerField;
    qryCargaSmsMensagem: TStringField;
    qryCargaSmsTipo: TStringField;
    qryCargaSmsid: TIntegerField;
    qryVerificaReseteReseta: TWideStringField;
    qrySenhaSenhaAlteracao: TWideStringField;
    qryAvisoVencimentoEmailCnpj: TStringField;
    qryAvisoVencimentoEmailcelular: TStringField;
    qryAvisoVencimentoEmailEnviado: TIntegerField;
    qryAvisoVencimentoEmailMensagem: TStringField;
    qryAvisoVencimentoEmailRemetente: TStringField;
    qryAvisoVencimentoEmailTipo: TStringField;
    qryAvisoVencimentoEmailCodigoTextoEmail: TStringField;
    qryAvisoVencimentoEmailid: TIntegerField;
    qryConfirmacaoEntregaSmsCnpj: TWideStringField;
    qryConfirmacaoEntregaSmscelular: TWideStringField;
    qryConfirmacaoEntregaSmsEnviado: TIntegerField;
    qryConfirmacaoEntregaSmsMensagem: TWideStringField;
    qryConfirmacaoEntregaSmsTipo: TWideStringField;
    qryConfirmacaoEntregaSmsid: TIntegerField;
    qryVendaSmsCnpj: TWideStringField;
    qryVendaSmscelular: TWideStringField;
    qryVendaSmsEnviado: TIntegerField;
    qryVendaSmsMensagem: TWideStringField;
    qryVendaSmsTipo: TWideStringField;
    qryVendaSmsid: TIntegerField;
    qryTextoAgendamentoEmailTexto: TWideMemoField;
    qryAniversarioSmsCnpj: TWideStringField;
    qryAniversarioSmscelular: TWideStringField;
    qryAniversarioSmsEnviado: TIntegerField;
    qryAniversarioSmsMensagem: TWideStringField;
    qryAniversarioSmsTipo: TWideStringField;
    qryAniversarioSmsid: TIntegerField;
    qryAvisoVencimentoSmsCnpj: TWideStringField;
    qryAvisoVencimentoSmscelular: TWideStringField;
    qryAvisoVencimentoSmsEnviado: TIntegerField;
    qryAvisoVencimentoSmsMensagem: TWideStringField;
    qryAvisoVencimentoSmsTipo: TWideStringField;
    qryAvisoVencimentoSmsid: TIntegerField;
    qryAvisoVendaEmailCnpj: TWideStringField;
    qryAvisoVendaEmailcelular: TWideStringField;
    qryAvisoVendaEmailEnviado: TIntegerField;
    qryAvisoVendaEmailMensagem: TWideStringField;
    qryAvisoVendaEmailRemetente: TWideStringField;
    qryAvisoVendaEmailTipo: TWideStringField;
    qryAvisoVendaEmailCodigoTextoEmail: TWideStringField;
    qryAvisoVendaEmailid: TIntegerField;
    qrySmsRecebidosid: TIntegerField;
    qrySmsRecebidosNumero: TWideStringField;
    qrySmsRecebidosMensagem: TWideStringField;
    qrySmsRecebidosData: TWideStringField;
    qrySmsRecebidosHora: TWideStringField;
    qrySmsRecebidosOriginal: TWideStringField;
    qryListaSmsEmailCnpj: TWideStringField;
    qryListaSmsEmailcelular: TWideStringField;
    qryListaSmsEmailEnviado: TIntegerField;
    qryListaSmsEmailMensagem: TWideStringField;
    qryListaSmsEmailRemetente: TWideStringField;
    qryListaSmsEmailTipo: TWideStringField;
    qryListaSmsEmailCodigoTextoEmail: TWideStringField;
    qryListaSmsEmaildata: TDateField;
    qryListaSmsEmailhora: TTimeField;
    qryListaSmsEmailid: TIntegerField;
    qryOrcamentoSmsCnpj: TWideStringField;
    qryOrcamentoSmscelular: TWideStringField;
    qryOrcamentoSmsEnviado: TIntegerField;
    qryOrcamentoSmsMensagem: TWideStringField;
    qryOrcamentoSmsTipo: TWideStringField;
    qryOrcamentoSmsid: TIntegerField;
    qryAvisoOrcamentoEmailCnpj: TWideStringField;
    qryAvisoOrcamentoEmailcelular: TWideStringField;
    qryAvisoOrcamentoEmailEnviado: TIntegerField;
    qryAvisoOrcamentoEmailMensagem: TWideStringField;
    qryAvisoOrcamentoEmailRemetente: TWideStringField;
    qryAvisoOrcamentoEmailTipo: TWideStringField;
    qryAvisoOrcamentoEmailCodigoTextoEmail: TWideStringField;
    qryAvisoOrcamentoEmailid: TIntegerField;
    qryCobrancaSmsCnpj: TWideStringField;
    qryCobrancaSmscelular: TWideStringField;
    qryCobrancaSmsEnviado: TIntegerField;
    qryCobrancaSmsMensagem: TWideStringField;
    qryCobrancaSmsTipo: TWideStringField;
    qryCobrancaSmsid: TIntegerField;
    qryEntregaSmsCnpj: TWideStringField;
    qryEntregaSmscelular: TWideStringField;
    qryEntregaSmsEnviado: TIntegerField;
    qryEntregaSmsMensagem: TWideStringField;
    qryEntregaSmsTipo: TWideStringField;
    qryEntregaSmsid: TIntegerField;
    qryResultadoPesquisaSatisfacao: TZQuery;
    qryResultadoPesquisaSatisfacaoResposta: TWideStringField;
    qryResultadoPesquisaSatisfacaoTotalResposta: TLargeintField;
    qryResultadoPesquisaSatisfacaoTotalRespostas: TLargeintField;
    qryResultadoPesquisaSatisfacaoPercentual: TFloatField;
    procedure tPingServerTimer(Sender: TObject);
    procedure DesativaConexoes;
    procedure AtivarConexoes;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmServidor: TdmServidor;

implementation

{$R *.dfm}

procedure PingServerEmTodosOsComponentes;
var i : Integer;
begin
  For i:=0 to dmServidor.ComponentCount -1 do
  begin
    if (dmServidor.Components[I] is TZConnection) then
      TZConnection(dmServidor.Components[i]).PingServer;
  end;
end;


procedure TdmServidor.DesativaConexoes;
var
  Contador : Integer;
begin
  Contador := 0;
  dmServidor.dbPrincipal.Disconnect;
  while self.ComponentCount-1 >= Contador do
  begin
    if (Self.Components[Contador] is TZQuery) then
    begin
      TZQuery(Self.Components[Contador]).Active := False;
    end;
    Contador := Contador + 1;
  end;
  dmServidor.tPingServer.Enabled  := False;
  dmServidor.dbPrincipal.Disconnect;
end;


procedure TdmServidor.AtivarConexoes;
var
  Contador : Integer;
begin
  dmServidor.dbPrincipal.Disconnect;
  dmServidor.dbPrincipal.Connect;
  dmServidor.dbPrincipal.Connected;
  {Contador := 0;
  while self.ComponentCount -1 >= Contador do
  begin
    if (Self.Components[Contador] is TZQuery) then
    begin
      TZQuery(Self.Components[Contador]).Active := True;
    end;
    Contador := Contador + 1;
  end;
  dmServidor.tPingServer.Enabled  := True; }
end;

procedure TdmServidor.tPingServerTimer(Sender: TObject);
begin
  PingServerEmTodosOsComponentes;
end;

end.
