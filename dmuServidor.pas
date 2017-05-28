unit dmuServidor;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, FMTBcd, Provider, DBClient,
  ZAbstractConnection, ZConnection, ZSqlUpdate, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ExtCtrls;

type
  TdmServidor = class(TDataModule)
    qryAvisoVencimentoEmail: TZQuery;
    qryAvisoVencimentoEmailCnpj: TStringField;
    qryAvisoVencimentoEmailcelular: TStringField;
    qryAvisoVencimentoEmailEnviado: TIntegerField;
    qryAvisoVencimentoEmailMensagem: TStringField;
    qryAvisoVencimentoEmailRemetente: TStringField;
    qryAvisoVencimentoEmailTipo: TStringField;
    qryAvisoVencimentoEmailCodigoTextoEmail: TStringField;
    qryAvisoVencimentoEmailid: TIntegerField;
    upAvisoVencimentoEmail: TZUpdateSQL;
    ZQuery1: TZQuery;
    StringField27: TStringField;
    qryNaoRepetirSms: TZQuery;
    StringField28: TStringField;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    StringField32: TStringField;
    qryConfirmacaoEntregaSms: TZQuery;
    qryConfirmacaoEntregaSmsCnpj: TWideStringField;
    qryConfirmacaoEntregaSmscelular: TWideStringField;
    qryConfirmacaoEntregaSmsEnviado: TIntegerField;
    qryConfirmacaoEntregaSmsMensagem: TWideStringField;
    qryConfirmacaoEntregaSmsTipo: TWideStringField;
    qryConfirmacaoEntregaSmsid: TIntegerField;
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
    qryTextoEmailAtualizaSatisfacaoCodigoTextoEmail: TWideStringField;
    qryTextoEmailAtualizaSatisfacaoTexto: TWideMemoField;
    qryTextoEmailAtualizaSatisfacaoCnpj: TWideStringField;
    upTextoEmailAtualizaSatisfacao: TZUpdateSQL;
    qryPesquisaSatisfacaoEmail: TZQuery;
    qryPesquisaSatisfacaoEmailCnpj: TStringField;
    qryPesquisaSatisfacaoEmailcelular: TStringField;
    qryPesquisaSatisfacaoEmailEnviado: TIntegerField;
    qryPesquisaSatisfacaoEmailMensagem: TStringField;
    qryPesquisaSatisfacaoEmailRemetente: TStringField;
    qryPesquisaSatisfacaoEmailTipo: TStringField;
    qryPesquisaSatisfacaoEmailCodigoTextoEmail: TStringField;
    qryPesquisaSatisfacaoEmailid: TIntegerField;
    upPesquisaSatisfacaoEmail: TZUpdateSQL;
 
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmServidor: TdmServidor;

implementation

{$R *.dfm}






end.
