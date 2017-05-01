unit UdmuPrincipal;

interface

uses
  SysUtils, Classes, DB, ADODB,Graphics,USms, DBClient, Provider;

type
  TdmuPrincipal = class(TDataModule)
    dbPrincipal: TADOConnection;
    qryRelClientes: TADOQuery;
    qryCelulares: TADOQuery;
    qryRelClientesoid: TIntegerField;
    qryRelClientesNOME: TStringField;
    qryRelClientesRAZSOC: TStringField;
    qryInadimplentes: TADOQuery;
    qryInadimplentesRCLIENTE: TIntegerField;
    qryInadimplentesVENCIMENTO: TDateTimeField;
    qryInadimplentesVALORNAMOEDA1: TBCDField;
    qryInadimplentesNSITUACAO: TStringField;
    qryInadimplentesRSITUACAO: TIntegerField;
    qryInadimplentesNCLIENTE: TStringField;
    qryInadimplentesNTIPO: TStringField;
    qryInadimplentesDias: TIntegerField;
    qryEntregas: TADOQuery;
    qryEntregasnumnota: TStringField;
    qryEntregasserie: TStringField;
    qryEntregasdtemis: TDateTimeField;
    qryEntregascodclie: TIntegerField;
    qryEntregasCOLUMN1: TWideStringField;
    qryEntregasNOME: TStringField;
    qryListaNEnviar: TADOQuery;
    qryRelTipo: TADOQuery;
    qryRelTipoRTIPO: TIntegerField;
    qryRelTipoNTIPO: TStringField;
    qryAniversariantes: TADOQuery;
    qryAniversariantesNOME: TStringField;
    qryAniversariantesDTVALOR: TDateTimeField;
    qryAniversariantesOID: TIntegerField;
    qryCategoriasCel: TADOQuery;
    qryCargas: TADOQuery;
    qryUltimaCarga: TADOQuery;
    qryCargaspedido: TIntegerField;
    qryCargasNUMEROLISTA: TIntegerField;
    qryCargascodclie: TIntegerField;
    qryCargasrazaocli: TStringField;
    qryCargasDataOrdemSeparacao: TDateTimeField;
    qryUltimaCargaUltimaCarga: TIntegerField;
    qryUltimaNota: TADOQuery;
    qryUltimaNotaUltimaNota: TStringField;
    qryInadimplentescodigo: TStringField;
    qryCelularesInvalidos: TADOQuery;
    qryCelularesInvalidosCelular: TStringField;
    qryCelularesInvalidosCliente: TStringField;
    qryCelularesInvalidosMotivo: TStringField;
    qryCategoriaProdutos: TADOQuery;
    qryCategoriaProdutosCategoria: TStringField;
    qryMediaVendasDia: TADOQuery;
    qryMediaNotas: TADOQuery;
    qryVendas: TADOQuery;
    qryOrcamento: TADOQuery;
    qryOrcamentoOID: TIntegerField;
    qryOrcamentoNOME: TStringField;
    qryOrcamentonumped: TIntegerField;
    qryVendasOID: TIntegerField;
    qryVendasNOME: TStringField;
    qryVendasnumped: TIntegerField;
    qryProdutosEmOferta: TADOQuery;
    qryProdutosEmOfertanumped: TIntegerField;
    qryProdutosEmOfertadtpedido: TDateTimeField;
    qryProdutosEmOfertadescr: TStringField;
    qryProdutosEmOfertacodpro: TStringField;
    qryCategoriaOferta: TADOQuery;
    qryCategoriaOfertadescr: TStringField;
    qryEntregasFilial: TStringField;
    qryEmail: TADOQuery;
    qryEmailValor: TStringField;
    qryCelularesCelular: TStringField;
    qryCelularesDDD: TStringField;
    qryCelularesIdCliente: TIntegerField;
    qryParcelasVencer: TADOQuery;
    IntegerField1: TIntegerField;
    DateTimeField1: TDateTimeField;
    BCDField1: TBCDField;
    StringField1: TStringField;
    IntegerField2: TIntegerField;
    StringField2: TStringField;
    StringField3: TStringField;
    IntegerField3: TIntegerField;
    StringField4: TStringField;
    qryRelClientesListaNegra: TADOQuery;
    qryRelClientesListaNegraRAZSOC: TStringField;
    qryRelClientesListaNegraOID: TIntegerField;
    dspClientesListaNegra: TDataSetProvider;
    cdsClientesListaNegra: TClientDataSet;
    cdsClientesListaNegraRAZSOC: TStringField;
    cdsClientesListaNegraOID: TIntegerField;
    cdsClientesListaNegraCh2: TStringField;
    qryConfirmacaoEntrega: TADOQuery;
    qryConfirmacaoEntreganumnota: TStringField;
    qryConfirmacaoEntregaSerie: TStringField;
    qryConfirmacaoEntregadtemis: TDateTimeField;
    qryConfirmacaoEntregaCodClie: TIntegerField;
    qryConfirmacaoEntregaNome: TStringField;
    qryVendasSatisfacao: TADOQuery;
    IntegerField4: TIntegerField;
    StringField5: TStringField;
    IntegerField5: TIntegerField;
    qryConfirmacaoEntregaSatisfacao: TADOQuery;
    StringField6: TStringField;
    StringField7: TStringField;
    DateTimeField2: TDateTimeField;
    IntegerField6: TIntegerField;
    StringField8: TStringField;
    qryCategoriaProdutosNaoComprou: TADOQuery;
    StringField9: TStringField;
    qryCelularVenda: TADOQuery;
    qryCelularVendaCelular: TStringField;
    qryCelularVendaddd: TStringField;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmuPrincipal: TdmuPrincipal;

implementation

uses dmuServidor;





{$R *.dfm}


end.