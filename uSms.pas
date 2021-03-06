unit uSms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Mask, DBCtrls, DB, Shellapi,
  IdBaseComponent, IdComponent,
  IdFTP, Grids, DBGrids, ExtCtrls, WinInet, DateUtils, IdTCPConnection,
  IdTCPClient, WinSkinStore, WinSkinData, ADODB, RpCon, RpConDS, RpDefine,
  RpRave, AppEvnts, Menus, StrUtils, IdMessageClient, IdSMTP,
  IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL, IdMessage,
  IdAntiFreezeBase, IdAntiFreeze, Registry, OleCtrls, SHDocVw, ActiveX,
  DBXpress, SqlExpr, Provider, ExcelXP, OleServer, ComObj,
  ZAbstractConnection, ZConnection, ZSqlUpdate, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Excel2000, jpeg, RXClock,
  IdExplicitTLSClientServerBase,
  pngimage, IdIOHandlerStack, IdSSL, IdServerIOHandler, IdUDPBase, IdUDPClient,
  IdTrivialFTP;

type
  TAuxGrid = class(TStringGrid);
    TSms = class(TForm)sbSms: TStatusBar;
    gbStatus: TGroupBox;
    tVerifica: TTimer;
    tVerificaEntrega: TTimer;
    gbTesteCelular: TGroupBox;
    edCelularTeste: TLabeledEdit;
    dsRelClientes: TDataSource;
    tAguardaReconexao: TTimer;
    dsRelTipos: TDataSource;
    dsCategoriaCel: TDataSource;
    rgOpcaoDeEnvio: TRadioGroup;
    lbEnviados: TLabel;
    mnExemplosMarketing: TPopupMenu;
    mmExemplosCobranca: TPopupMenu;
    mmExemplosEntrega: TPopupMenu;
    mmExemplosAniversariante: TPopupMenu;
    Image1: TImage;
    dsCategoriasProdutos: TDataSource;
    tVerificaAgendamentos: TTimer;
    mnAgendamentoMarketing: TPopupMenu;
    Ativar1: TMenuItem;
    Desativar1: TMenuItem;
    dsMediaVendasDia: TDataSource;
    dsMediaNotasDia: TDataSource;
    tVerificaVendaOrcamento: TTimer;
    tIcon: TTrayIcon;
    pmTIcon: TPopupMenu;
    Mostar1: TMenuItem;
    Sair1: TMenuItem;
    VerificarImpactados1: TMenuItem;
    rgOpcaoDeEnvioEmail: TRadioGroup;
    gbTesteEmail: TGroupBox;
    edEmailEnvio: TLabeledEdit;
    AlterarHorario1: TMenuItem;
    ituloEmail1: TMenuItem;
    ipo1: TMenuItem;
    tVerificaRespostasSms: TTimer;
    AlterarEmail1: TMenuItem;
    mnEditorEmail: TPopupMenu;
    Visualizar1: TMenuItem;
    mnMensagemPromocaoEmail: TPopupMenu;
    MenuItem3: TMenuItem;
    tAvisaQueEstaAtivo: TTimer;
    RemoverUltimaData1: TMenuItem;
    InserirEmail1: TMenuItem;
    InserirEmail2: TMenuItem;
    mmOrcamentoEmail: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    mmVendaEmail: TPopupMenu;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    InserirDataAtual1: TMenuItem;
    InserirDataAtual2: TMenuItem;
    InserirDataAtual3: TMenuItem;
    InserirDataAtual4: TMenuItem;
    z: TPageControl;
    tsListaEnvios: TTabSheet;
    pcListas: TPageControl;
    tsListaLog: TTabSheet;
    gbListaEnviados: TGroupBox;
    mmListaEnviados: TMemo;
    tsBuscaEnvios: TTabSheet;
    gbListaDatas: TGroupBox;
    lbTotalMsg: TLabel;
    clDatas: TMonthCalendar;
    gbListaBusca: TGroupBox;
    btBuscaTodasDoMes: TBitBtn;
    tsConfiguraPromocao: TTabSheet;
    PageControl1: TPageControl;
    tsMarketing: TTabSheet;
    gbAgendamentoPromocao: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    lbUltimoEnvioPromocao: TLabel;
    lbEnviadosPromocao: TLabel;
    Label18: TLabel;
    lbEnviadosMarketingEmail: TLabel;
    gbMensagemPromocao: TGroupBox;
    gbDadasHorariosPromocao: TGroupBox;
    lbHoraInicioPromocao: TLabel;
    tpSelecionaDataPromocao: TDateTimePicker;
    mmDatasPromocao: TMemo;
    mkhoraInicioPromocao: TMaskEdit;
    btSalvarPromocao: TBitBtn;
    btIniciaPromocao: TButton;
    btInserirClientePromocao: TBitBtn;
    edMaxSmsPromocao: TLabeledEdit;
    btAtivaDesativaPromocao: TBitBtn;
    ckNEnviarNEnviados: TCheckBox;
    rgMaxSmsMarketing: TRadioGroup;
    ckFiltrarClientesMarketing: TCheckBox;
    gbFiltrosMarketing: TGroupBox;
    cbListaFiltrosMarketing: TComboBox;
    pgFiltrosMarketing: TPageControl;
    tsFiltro1: TTabSheet;
    Label15: TLabel;
    edDiasOrcamento: TEdit;
    tsFiltro2: TTabSheet;
    Label16: TLabel;
    edDiasDeCompra: TEdit;
    tsFiltro3: TTabSheet;
    Label4: TLabel;
    cbListaCategoriasMarketing: TDBLookupComboBox;
    tsFiltro4: TTabSheet;
    lbComprouACategoria: TLabel;
    lbNaoComprouACategoria: TLabel;
    Label17: TLabel;
    cbListaCategoriaComprou: TDBLookupComboBox;
    cbListaCategoriaNComprou: TDBLookupComboBox;
    edDiasIndicaCategoria: TEdit;
    btAgendarMarketing: TBitBtn;
    btInserirProduto: TBitBtn;
    btInserePedido: TBitBtn;
    gbMensagemPromocaoEmail: TGroupBox;
    Label19: TLabel;
    mmMensagemPromocaoEmail: TMemo;
    EdTitulo: TLabeledEdit;
    ckEnviaEmail: TCheckBox;
    btIniciarPromocaoEmail: TButton;
    mmMsgMarketing: TMemo;
    tsAgendamentosMarketing: TTabSheet;
    btInserirAgendamento: TSpeedButton;
    btRemoverAgendamento: TSpeedButton;
    btApagarTodosAgendamentos: TSpeedButton;
    gbListaAgendamentosMarketing: TGroupBox;
    sgListaAgendamentosMarketing: TStringGrid;
    tsConfiguraInadimplentes: TTabSheet;
    gbAgendamentoInadimplentes: TGroupBox;
    lbMinDiasVencidos: TLabel;
    lbMinValorVencido: TLabel;
    lbMaxDiasVencidos: TLabel;
    mmFaltaCaracteresIndimplentes: TLabel;
    lbInicioInadimplentes: TLabel;
    lbUltimoEnvioInadimplentesSms: TLabel;
    Label3: TLabel;
    gbMenssageInadimplente: TGroupBox;
    mmMensagemInadimplente: TMemo;
    edMinDiasVencidos: TEdit;
    edMinValorVencido: TEdit;
    edMaxDiasVencidos: TEdit;
    gbListaParaNEnviarSms: TGroupBox;
    Label2: TLabel;
    sbRemoverLIistaNEnviarCobranca: TSpeedButton;
    sbAddClienteListaNEnviarCobranca: TSpeedButton;
    cbLIstaClientes: TDBLookupComboBox;
    mmListaNEnviarCobranca: TMemo;
    btSalvarInadimplencia: TBitBtn;
    btIniciaInadimplentes: TBitBtn;
    mkHoraInicioInadimplentes: TMaskEdit;
    btAtivaDesativaInadimplentes: TBitBtn;
    btInserirClienteInadimplentes: TBitBtn;
    edMaxSmsInadimpentes: TLabeledEdit;
    btInsereVencimentoInadimplentes: TBitBtn;
    btInsereValorInadimplentes: TBitBtn;
    btInsereTipoCobrancaInadimplentes: TBitBtn;
    btDiasVencidosInadimplentes: TBitBtn;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    cbTiposDocumentos: TDBLookupComboBox;
    mmListaTiposDocumentos: TMemo;
    btInsereNumero: TBitBtn;
    rgMaxSmsCobranca: TRadioGroup;
    btInsereValorJuros: TBitBtn;
    mmMsgCobranca: TMemo;
    tsConfiguraAvisoEntregaeVenda: TTabSheet;
    gbAgendamentoAvisoEntrega: TGroupBox;
    pgOpcoesDeAviso: TPageControl;
    tsAvisoDeEntrega: TTabSheet;
    mmFaltaCaracteresAvisoEntregaFilial: TLabel;
    mmFaltaCaracteresAvisoEntregaCentro: TLabel;
    btInsereClienteEntregaFilial: TBitBtn;
    gbMenssagemAvisoEntregaFilial: TGroupBox;
    mmMensagemAvisoEntregaFiliais: TMemo;
    gbMenssagemAvisoEntregaCentro: TGroupBox;
    mmMensagemAvisoEntregaCentro: TMemo;
    btInsereClienteEntregaCentro: TBitBtn;
    tsAvisoDeVenda: TTabSheet;
    mmFaltaCaracteresAvisoVenda: TLabel;
    lbEnviadosVendaSms: TLabel;
    lbEnvidosVendaSms: TLabel;
    lbEnviadosVendaEmail: TLabel;
    lbEnvidosVendaEmail: TLabel;
    gbMenssagemAvisoVenda: TGroupBox;
    mmMensagemAvisoVendaSms: TMemo;
    ckAtivarOEnviodeSmsVendaSms: TCheckBox;
    GroupBox1: TGroupBox;
    Label20: TLabel;
    mmMensagemAvisoVendaEmail: TMemo;
    edTituloEmailAvisoVenda: TLabeledEdit;
    ckAtivarOEnviodeSmsVendaEmail: TCheckBox;
    btInsereClienteVendaSms: TBitBtn;
    TabSheet2: TTabSheet;
    mmFaltaCaracteresAvisoOrcamento: TLabel;
    lbAvisoOrcamento: TLabel;
    lbEnviadosOrcamento: TLabel;
    lbEnviadosOrcamentoEmail: TLabel;
    lbAvisoOrcamentoEmail: TLabel;
    btInsereClienteOrcamentoSms: TBitBtn;
    gbAvisoOrcamentoSms: TGroupBox;
    mmMensagemAvisoOrcamentoSms: TMemo;
    ckAtivaAvisoOrcamentoSms: TCheckBox;
    ckAtivaAvisoOrcamentoEmail: TCheckBox;
    gbAvisoOrcamentoEmail: TGroupBox;
    Label21: TLabel;
    edTituloEmailAvisoOrcamento: TLabeledEdit;
    mmMensagemAvisoOrcamentoEmail: TMemo;
    pnEscondeControleEntrega: TPanel;
    lbHoraInicioAvisoEntrega: TLabel;
    Label5: TLabel;
    lbUltimaEntrega: TLabel;
    Label7: TLabel;
    lbEnviadosEntrega: TLabel;
    lbUltimaCarga: TLabel;
    lbHoraFimAvisoEntrega: TLabel;
    lbBuscaTipo: TLabel;
    Label13: TLabel;
    mkHoraInicioAvisoEntrega: TMaskEdit;
    mkHoraFinalAvisoEntrega: TMaskEdit;
    cbListaCategorias: TDBLookupComboBox;
    btIniciarEntrega: TBitBtn;
    btInciaCarga: TBitBtn;
    btIniciarVenda: TButton;
    btIniciaOrcamento: TButton;
    ckUsaSerie: TCheckBox;
    edNomeSerie: TLabeledEdit;
    rgMaxSmsEntrega: TRadioGroup;
    edEsperaEnvio: TLabeledEdit;
    edMaxSmsEntrega: TLabeledEdit;
    rgAguardarpor: TRadioGroup;
    btAtivaDesativaEntrega: TBitBtn;
    btSalvarAvisoEntrega: TBitBtn;
    edFiliais: TLabeledEdit;
    edCentroDeDistribicao: TLabeledEdit;
    mmMsgEntrega: TMemo;
    TabSheet1: TTabSheet;
    gbAgendamentomsgAniversario: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    lbUltimoEnvioAniversario: TLabel;
    Label9: TLabel;
    lbEnviadosAniversario: TLabel;
    mmFaltaCaracteresAniversariante: TLabel;
    mmCaracteresFaltantesAniversariantes: TLabel;
    edMaxSmsAniversario: TLabeledEdit;
    gbMensagemAniversariante: TGroupBox;
    mmMensagemAniversariante: TMemo;
    btInserirClienteAniversario: TBitBtn;
    btAtivarDesativarAniversario: TBitBtn;
    btSalvarAniversario: TBitBtn;
    mkHoraIncioAniversario: TMaskEdit;
    btIniciarAniversario: TBitBtn;
    rgMaxSmsAniversaio: TRadioGroup;
    mmMsgAniversariante: TMemo;
    tsConfiguracao: TTabSheet;
    gbDadosConexao: TGroupBox;
    lbStatusConexao: TLabel;
    edInstancia: TLabeledEdit;
    edBancoDeDados: TLabeledEdit;
    edUsuario: TLabeledEdit;
    edSenha: TLabeledEdit;
    ckManterConectado: TCheckBox;
    btConectaBancoDeDados: TBitBtn;
    edCnpj: TLabeledEdit;
    ckReativaAtivados: TCheckBox;
    ckIniciarComWindows: TCheckBox;
    btCelularesInvalidos: TBitBtn;
    gbControledeEnvioSms: TGroupBox;
    gbTipoControleSms: TGroupBox;
    ckControleSmsMarketing: TCheckBox;
    ckControleSmsCobranca: TCheckBox;
    ckControleSmsEntrega: TCheckBox;
    ckControleSmsAniversariante: TCheckBox;
    ck: TCheckBox;
    edqtdControleEntrega: TLabeledEdit;
    edqtdControleMarketing: TLabeledEdit;
    edqtdControleCobranca: TLabeledEdit;
    edqtdControleAniversariante: TLabeledEdit;
    ckControlePorEmail: TCheckBox;
    ckControlePorSms: TCheckBox;
    edEmailControleSms: TLabeledEdit;
    edCelularControleSms: TLabeledEdit;
    ckControleEnvioSms: TCheckBox;
    gbPosicoes: TGroupBox;
    lbMediaVendasDia: TLabel;
    dbtMediaVendasDia: TDBText;
    lbPosicaoMedia: TLabel;
    lbNotasDia: TLabel;
    dbtNotasDia: TDBText;
    gbDiasDeEnvioAutomatico: TGroupBox;
    ckSeg: TCheckBox;
    ckQua: TCheckBox;
    ckSab: TCheckBox;
    ckTer: TCheckBox;
    ckSex: TCheckBox;
    ckDom: TCheckBox;
    ckQui: TCheckBox;
    gbConfiguraEmail: TGroupBox;
    edEmail: TLabeledEdit;
    gbListaNegra: TGroupBox;
    btAdicionaListaNegra: TSpeedButton;
    btRemoveListaNegra: TSpeedButton;
    btListaNegra: TSpeedButton;
    mmListaNegra: TMemo;
    rgAvisoInatividadeFerramenta: TGroupBox;
    edEmailAviso: TLabeledEdit;
    edCelularAviso: TLabeledEdit;
    ckAvisoFerramentaDesconectada: TCheckBox;
    pcCaixaDeSaida: TTabSheet;
    gbCaixaDeSaida: TGroupBox;
    mmCaixaDeSaida: TMemo;
    pnReenviarMsg: TPanel;
    tsSmsRespondido: TTabSheet;
    gbSmsRespondidos: TGroupBox;
    pnSinalizaVerificaRespondidos: TPanel;
    gdSmsRespondidos: TDBGrid;
    dsSmsRespondidos: TDataSource;
    dsListaEmails: TDataSource;
    gdListaEnvios: TDBGrid;
    rgTipoListaEmailSms: TRadioGroup;
    ckPausarAvisoDeEnvio: TCheckBox;
    pmOpcoesSmsRecebidos: TPopupMenu;
    DesativarAtualizaoAutomatica1: TMenuItem;
    AtivarAtualizaoAutomatica1: TMenuItem;
    lbDesativaAtivaAtualizacaoAutomatica: TLabel;
    btExportarListaSmsEmail: TBitBtn;
    btExportarArquivoTexto: TBitBtn;
    sgSalvaTxt: TSaveDialog;
    rgEmailDeCobranca: TGroupBox;
    mmMensagemInadimplenteEmail: TMemo;
    ckEnviaEmailCobranca: TCheckBox;
    btIniciaInadimplentesEmail: TBitBtn;
    Label6: TLabel;
    lbEnviadosCobranca: TLabel;
    lbSmsCobrancaEnviados: TLabel;
    lbNumeroSmsEnviadosCobranca: TLabel;
    lbNumerolEmailCobranca: TLabel;
    lbTotalEmailCobranca: TLabel;
    edTItuloEmailCobranca: TLabeledEdit;
    Label25: TLabel;
    Label26: TLabel;
    lbUltimoEnvioCobrancaEmail: TLabel;
    mnMensagemCobrancaEmail: TPopupMenu;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    tsAvisoVencimento: TTabSheet;
    rgConfiguraEnvioAvisoVencimento: TGroupBox;
    Label14: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    mmFaltaCaracteresSmsAvisoVencimento: TLabel;
    Label30: TLabel;
    lbUltimoEnvioSmsAvisoVencimento: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    lbNumeroEnviosSmsAvisoVencimento: TLabel;
    lbNumeroEnviosEmailAvisoVencimento: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    lbUltimoEnvioEmailAvisoVencimento: TLabel;
    rgSmsAvisoVencimento: TGroupBox;
    mmMensagemSmsAvisoVencimento: TMemo;
    edMinDiasAvisoVencimento: TEdit;
    edValorAvisoVencimento: TEdit;
    edMaxDiasAvisoVencimento: TEdit;
    rgListaNegraAvisoVencimento: TGroupBox;
    Label39: TLabel;
    btRetiraListaNegraAvisoVencimento: TSpeedButton;
    btInsereListaNegraAvisoVencimento: TSpeedButton;
    cbListaNegraAvisoVencimento: TDBLookupComboBox;
    mmListaNegraAvisoVencimento: TMemo;
    btSalvarAvisoVencimento: TBitBtn;
    btIniciaAvisoVencimentoSms: TBitBtn;
    edHoraAvisoVencimento: TMaskEdit;
    btAtivarAvisoVencimento: TBitBtn;
    btInsereClienteAvisoVencimento: TBitBtn;
    edMaxSmsAvisoVencimento: TLabeledEdit;
    btInsereVencimentoAvisoVencimento: TBitBtn;
    btInsereValorAvisoVencimento: TBitBtn;
    btInsereDocumentoAvisoVencimento: TBitBtn;
    rgTipoDocumentos: TGroupBox;
    btInsereTipoDocumentoAvisoVencimento: TSpeedButton;
    Label40: TLabel;
    btIRetiraTipoDocumentoAvisoVencimento: TSpeedButton;
    cbTiposDocumentoAvisoVencimento: TDBLookupComboBox;
    mmListaTipoDocumentoAvisoVencimento: TMemo;
    btInsereNumeroAvisoVencimento: TBitBtn;
    rgOpcaodeEnvioAvisoVencimento: TRadioGroup;
    rgEmailAvisoVencimento: TGroupBox;
    Label41: TLabel;
    mmMensagemEmailAvisoVencimento: TMemo;
    edTituloEmailAvisoVencimento: TLabeledEdit;
    ckEnviaEmailAvisoVencimento: TCheckBox;
    btIniciaAvisoVencimentoEmail: TBitBtn;
    mmMsgAvisoVencimento: TMemo;
    mnMensagemAvisoVencimento: TPopupMenu;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    tVerificaResete: TTimer;
    gbSelecioneClientesListaNegra: TGroupBox;
    gbOpcaoDeBuscaListaNegra: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    btListaClientesPListaNegra: TSpeedButton;
    btConcluirListaNegra: TSpeedButton;
    dbListaClientesPListaNegra: TDBGrid;
    edBuscaClientesListaNegra: TLabeledEdit;
    dsBuscaClientesListaNegra: TDataSource;
    spBuscarCLientesPListaNegra: TSpeedButton;
    ckTravaAlteracao: TCheckBox;
    pmTravaLiberaFerramenta: TPopupMenu;
    LiberarAlteracoes: TMenuItem;
    TravarAlteracoes: TMenuItem;
    pmVazio: TPopupMenu;
    btReativa: TButton;
    ckUsarListaNegraCobranca: TCheckBox;
    ckUsarMesmaListaNegraAvisoVencimento: TCheckBox;
    ckReceberControleAmostraEmail: TCheckBox;
    pnZerarDataCobranca: TPopupMenu;
    pmZerarDataVencimento: TPopupMenu;
    pmZerarDataAniversariante: TPopupMenu;
    ZerarData1: TMenuItem;
    ZerarData2: TMenuItem;
    ZerarData3: TMenuItem;
    ckLimitaFiliaisCobranca: TCheckBox;
    edFiliaisCobranca: TEdit;
    lbSeparaVirgulaFilialCobranca: TLabel;
    btAtualizarFerramenta: TBitBtn;
    ckApenasUmaCobrancaPorDia: TCheckBox;
    rgPorDataPorDiaMarketing: TRadioGroup;
    cbEscolhaDiaMarketing: TComboBox;
    Bevel1: TBevel;
    sbRemoverDataPromocao: TSpeedButton;
    sbAdicionaDataPromocao: TSpeedButton;
    Bevel2: TBevel;
    sbAddTipo: TSpeedButton;
    sbRemoveTipo: TSpeedButton;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    RxClock1: TRxClock;
    TabSheet3: TTabSheet;
    btInsereClienteConfirmcacaoEntrega: TBitBtn;
    Label29: TLabel;
    lbSmsEnviadosConfirmacaoEntrega: TLabel;
    GroupBox2: TGroupBox;
    mmSmsAvisoConfirmacaoEntrega: TMemo;
    ckAtivaDesativaSmsConfirmacaoEntrega: TCheckBox;
    mmFaltaCaracteresSmsAvisoConfirmacaoEntrega: TLabel;
    btIniciaSmsConfirmacaoEntrega: TButton;
    tVerificaConfirmacaoEntrega: TTimer;
    lbUltimaNotaConfirmada: TLabel;
    tsPesquisaSatisfacao: TTabSheet;
    imSatisfacaoOtimo: TImage;
    imSatisfacaoBom: TImage;
    imSatisfacaoRuim: TImage;
    GroupBox6: TGroupBox;
    mmMensagemSatisfacao: TMemo;
    mmFaltaCaracteresSatisfacao: TLabel;
    ckSoliciatarMotivoSatisfacao: TCheckBox;
    GroupBox7: TGroupBox;
    Label34: TLabel;
    Label35: TLabel;
    Label38: TLabel;
    lbTotalOtimoSatisfacao: TLabel;
    lbTotalBomSatisfacao: TLabel;
    lbTotalRuimSatisfacao: TLabel;
    ckAtivaDesativaSatisfacao: TCheckBox;
    ckAtualizarCelularEmailSatisfacao: TCheckBox;
    gbCelularEmailSatisfacao: TGroupBox;
    edEmailSatisfacao: TLabeledEdit;
    edCelularSatisfacao: TLabeledEdit;
    gbMensagemSatisfacaoNotaRuim: TGroupBox;
    mmMensagemSatisfacaoNotaRuim: TMemo;
    btSalvarSatisfacao: TBitBtn;
    mmMsgSatisfacao: TMemo;
    tVerificaPesquisaDeSatisfacao: TTimer;
    lbUltimaVendaSatisfacao: TLabel;
    lbUltimaConfirmacaoEntregaSatisfacao: TLabel;
    lbSmsEnviadosPesquisaSatisfacao: TLabel;
    tVerificaRepostaPesquisa: TTimer;
    mmFaltaCaracteresSatisfacaoNotaRuim: TLabel;
    Label31: TLabel;
    lbUltimoCelular: TLabel;
    IdFTP: TIdFTP;
    lbtotalsatisfacao: TLabel;
    GroupBox8: TGroupBox;
    edCelularCopiaResposta: TLabeledEdit;
    ckCopiaSmsResposta: TCheckBox;
    btTesteFtp: TButton;
    Skin: TSkinData;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    mmFaltaCaracteresPromocao: TLabel;
    mmFaltaCaracteresPromocao2: TLabel;
    mmFaltaCaracteresPromocao3: TLabel;
    mmMensagemPromocao: TMemo;
    mmMensagemPromocao2: TMemo;
    mmMensagemPromocao3: TMemo;
    tsFiltro5: TTabSheet;
    dtInicioPeriodoFiltro5: TDateTimePicker;
    dtFimPeriodoFiltro5: TDateTimePicker;
    Label42: TLabel;
    Label43: TLabel;
    dsCategoriasProdutosNaoComprou: TDataSource;
    tsExterno: TTabSheet;
    gbOpcoesListaExterna: TGroupBox;
    pnLista: TPanel;
    sgListaExterna: TStringGrid;
    btImportarListaExterna: TButton;
    CheckBox1: TCheckBox;
    cbCategoriasListaExterna: TComboBox;
    ckEnviarMarketingListaExterna: TCheckBox;
    gbFiltroListaExternaMarketing: TGroupBox;
    cbFiltroEnvioListaExterna: TComboBox;
    BitBtn1: TBitBtn;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    gbResultadoPesquisaSatisfacao: TGroupBox;
    dtpDataInicialPesquisaSatisfacao: TDateTimePicker;
    dtpDataFinalPesquisaSatisfacao: TDateTimePicker;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    btBuscarPesquisaSatisfacao: TBitBtn;
    gbListaPesquisaSatisfa��o: TGroupBox;
    DBGrid1: TDBGrid;
    dsResultadoPesquisaSatisfacao: TDataSource;
    btExportarPesquisaSatisfacao: TBitBtn;
    apEvents: TApplicationEvents;
    procedure mmMensagemPromocaoChange(Sender: TObject);
    procedure mmMensagemAvisoEntregaFiliaisChange(Sender: TObject);
    procedure btSalvarPromocaoClick(Sender: TObject);
    procedure btSalvarInadimplenciaClick(Sender: TObject);
    procedure btSalvarAvisoEntregaClick(Sender: TObject);
    procedure sbAdicionaDataPromocaoClick(Sender: TObject);
    procedure sbRemoverDataPromocaoClick(Sender: TObject);
    procedure sbRemoverLIistaNEnviarCobrancaClick(Sender: TObject);
    procedure btIniciaPromocaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IdFTPWork(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdFTPWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdFTPWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure tVerificaTimer(Sender: TObject);
    procedure btInserirClientePromocaoClick(Sender: TObject);
    procedure btIniciaInadimplentesClick(Sender: TObject);
    procedure btInserirClienteInadimplentesClick(Sender: TObject);
    procedure btAtivaDesativaInadimplentesClick(Sender: TObject);
    procedure btAtivaDesativaEntregaClick(Sender: TObject);
    procedure btIniciarEntregaClick(Sender: TObject);
    procedure btInsereClienteEntregaFilialClick(Sender: TObject);
    procedure btAtivaDesativaPromocaoClick(Sender: TObject);
    procedure tVerificaEntregaTimer(Sender: TObject);
    procedure btInsereVencimentoInadimplentesClick(Sender: TObject);
    procedure btInsereValorInadimplentesClick(Sender: TObject);
    procedure btInsereTipoCobrancaInadimplentesClick(Sender: TObject);
    procedure btDiasVencidosInadimplentesClick(Sender: TObject);
    procedure sbChamaListaClientesClick(Sender: TObject);
    procedure btConectaBancoDeDadosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ckManterConectadoClick(Sender: TObject);
    procedure btZerarNEnviadosClick(Sender: TObject);
    procedure ckNEnviarNEnviadosClick(Sender: TObject);
    procedure tAguardaReconexaoTimer(Sender: TObject);
    procedure sbAddTipoClick(Sender: TObject);
    procedure sbRemoveTipoClick(Sender: TObject);
    procedure sbAddClienteListaNEnviarCobrancaClick(Sender: TObject);
    procedure btInserirClienteAniversarioClick(Sender: TObject);
    procedure mmMensagemAniversarianteChange(Sender: TObject);
    procedure rgOpcaoDeEnvioClick(Sender: TObject);
    procedure btIniciarAniversarioClick(Sender: TObject);
    procedure btAtivarDesativarAniversarioClick(Sender: TObject);
    procedure btInciaCargaClick(Sender: TObject);
    procedure btInsereNumeroClick(Sender: TObject);
    procedure btCelularesInvalidosClick(Sender: TObject);
    procedure rgMaxSmsMarketingClick(Sender: TObject);
    procedure rgMaxSmsCobrancaClick(Sender: TObject);
    procedure rgMaxSmsEntregaClick(Sender: TObject);
    procedure rgMaxSmsAniversaioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSalvarAniversarioClick(Sender: TObject);
    procedure mnExemplosMarketingPopup(Sender: TObject);
    Procedure ItemClickMarketing(Sender: TObject);
    Procedure ItemClickCobranca(Sender: TObject);
    Procedure ItemClickEntrega(Sender: TObject);
    Procedure ItemClickAniversariante(Sender: TObject);
    procedure mmExemplosCobrancaPopup(Sender: TObject);
    procedure mmExemplosEntregaPopup(Sender: TObject);
    procedure mmExemplosAniversariantePopup(Sender: TObject);
    procedure mmMensagemPromocaoEnter(Sender: TObject);
    procedure mmMensagemInadimplenteEnter(Sender: TObject);
    procedure mmMensagemAvisoEntregaFiliaisEnter(Sender: TObject);
    procedure mmMensagemAniversarianteEnter(Sender: TObject);
    procedure gbMensagemAniversarianteExit(Sender: TObject);
    procedure mmMensagemAvisoEntregaFiliaisExit(Sender: TObject);
    procedure mmMensagemInadimplenteExit(Sender: TObject);
    procedure mmMensagemPromocaoExit(Sender: TObject);
    procedure tpSelecionaDataPromocaoEnter(Sender: TObject);
    procedure mkhoraInicioPromocaoEnter(Sender: TObject);
    procedure edMaxSmsPromocaoEnter(Sender: TObject);
    procedure tpSelecionaDataPromocaoExit(Sender: TObject);
    procedure mkhoraInicioPromocaoExit(Sender: TObject);
    procedure edMaxSmsPromocaoExit(Sender: TObject);
    procedure ckNEnviarNEnviadosExit(Sender: TObject);
    procedure ckNEnviarNEnviadosEnter(Sender: TObject);
    procedure edMinDiasVencidosEnter(Sender: TObject);
    procedure edMinValorVencidoEnter(Sender: TObject);
    procedure mkHoraInicioInadimplentesEnter(Sender: TObject);
    procedure edMaxDiasVencidosEnter(Sender: TObject);
    procedure rgMaxSmsCobrancaEnter(Sender: TObject);
    procedure rgMaxSmsMarketingEnter(Sender: TObject);
    procedure edMaxSmsInadimpentesEnter(Sender: TObject);
    procedure cbTiposDocumentosEnter(Sender: TObject);
    procedure cbLIstaClientesEnter(Sender: TObject);
    procedure edMinDiasVencidosExit(Sender: TObject);
    procedure edMinValorVencidoExit(Sender: TObject);
    procedure mkHoraInicioInadimplentesExit(Sender: TObject);
    procedure edMaxDiasVencidosExit(Sender: TObject);
    procedure rgMaxSmsCobrancaExit(Sender: TObject);
    procedure edMaxSmsInadimpentesExit(Sender: TObject);
    procedure cbTiposDocumentosExit(Sender: TObject);
    procedure cesExit(Sender: TObject);
    procedure mkHoraInicioAvisoEntregaEnter(Sender: TObject);
    procedure mkHoraFinalAvisoEntregaEnter(Sender: TObject);
    procedure ccc(Sender: TObject);
    procedure edNomeSerieEnter(Sender: TObject);
    procedure edEsperaEnvioEnter(Sender: TObject);
    procedure rgMaxSmsEntregaEnter(Sender: TObject);
    procedure edMaxSmsEntregaEnter(Sender: TObject);
    procedure rgAguardarporEnter(Sender: TObject);
    procedure rgAguardarporClick(Sender: TObject);
    procedure mkHoraInicioAvisoEntregaExit(Sender: TObject);
    procedure mkHoraFinalAvisoEntregaExit(Sender: TObject);
    procedure cbListaCategoriasExit(Sender: TObject);
    procedure edNomeSerieExit(Sender: TObject);
    procedure edEsperaEnvioExit(Sender: TObject);
    procedure edMaxSmsEntregaExit(Sender: TObject);
    procedure rgMaxSmsEntregaExit(Sender: TObject);
    procedure rgAguardarporExit(Sender: TObject);
    procedure mkHoraIncioAniversarioEnter(Sender: TObject);
    procedure edMaxSmsAniversarioEnter(Sender: TObject);
    procedure rgMaxSmsAniversaioEnter(Sender: TObject);
    procedure rgMaxSmsAniversaioExit(Sender: TObject);
    procedure mkHoraIncioAniversarioExit(Sender: TObject);
    procedure edMaxSmsAniversarioExit(Sender: TObject);
    procedure mmMensagemAniversarianteExit(Sender: TObject);
    procedure ckControleEnvioSmsClick(Sender: TObject);
    procedure ckControlePorEmailClick(Sender: TObject);
    procedure ckControlePorSmsClick(Sender: TObject);
    procedure ckControleSmsMarketingClick(Sender: TObject);
    procedure ckControleSmsCobrancaClick(Sender: TObject);
    procedure ckControleSmsEntregaClick(Sender: TObject);
    procedure ckControleSmsAniversarianteClick(Sender: TObject);
    procedure edCelularTesteEnter(Sender: TObject);
    procedure edCelularTesteExit(Sender: TObject);
    procedure ckUsaSerieClick(Sender: TObject);
    procedure btInsereValorJurosClick(Sender: TObject);
    procedure ckFiltrarClientesMarketingClick(Sender: TObject);
    procedure cbListaFiltrosMarketingSelect(Sender: TObject);
    procedure ckFiltrarClientesMarketingEnter(Sender: TObject);
    procedure cbListaFiltrosMarketingEnter(Sender: TObject);
    procedure edDiasOrcamentoEnter(Sender: TObject);
    procedure edDiasDeCompraEnter(Sender: TObject);
    procedure pgFiltrosMarketingEnter(Sender: TObject);
    procedure btAgendarMarketingClick(Sender: TObject);
    procedure tVerificaAgendamentosTimer(Sender: TObject);
    procedure Ativar1Click(Sender: TObject);
    procedure Desativar1Click(Sender: TObject);
    procedure sgListaAgendamentosMarketingSelectCell(Sender: TObject;
      ACol, ARow: Integer; var CanSelect: Boolean);
    procedure btInserirAgendamentoClick(Sender: TObject);
    procedure btRemoverAgendamentoClick(Sender: TObject);
    procedure mmMensagemAvisoVendaSmsEnter(Sender: TObject);
    procedure mmMensagemAvisoVendaSmsExit(Sender: TObject);
    procedure ckAtivarOEnviodeSmsVendaSmsClick(Sender: TObject);
    procedure btIniciarVendaClick(Sender: TObject);
    procedure ckAtivaAvisoOrcamentoSmsClick(Sender: TObject);
    procedure mmMensagemAvisoOrcamentoSmsChange(Sender: TObject);
    procedure mmMensagemAvisoOrcamentoSmsEnter(Sender: TObject);
    procedure mmMensagemAvisoOrcamentoSmsExit(Sender: TObject);
    procedure btInsereClienteOrcamentoSmsClick(Sender: TObject);
    procedure btInsereClienteVendaSmsClick(Sender: TObject);
    procedure tVerificaVendaOrcamentoTimer(Sender: TObject);
    procedure btIniciaOrcamentoClick(Sender: TObject);
    procedure tsAvisoDeEntregaShow(Sender: TObject);
    procedure tsAvisoDeVendaShow(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure btInserirProdutoClick(Sender: TObject);
    procedure btInserePedidoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Mostar1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure btApagarTodosAgendamentosClick(Sender: TObject);
    procedure ckSegClick(Sender: TObject);
    procedure ckTerClick(Sender: TObject);
    procedure ckQuaClick(Sender: TObject);
    procedure ckQuiClick(Sender: TObject);
    procedure ckSexClick(Sender: TObject);
    procedure ckSabClick(Sender: TObject);
    procedure ckDomClick(Sender: TObject);
    procedure VerificarImpactados1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure mmMensagemAvisoEntregaCentroChange(Sender: TObject);
    procedure mmMensagemAvisoEntregaCentroEnter(Sender: TObject);
    procedure mmMensagemAvisoEntregaCentroExit(Sender: TObject);
    procedure edFiliaisEnter(Sender: TObject);
    procedure edFiliaisExit(Sender: TObject);
    procedure edCentroDeDistribicaoEnter(Sender: TObject);
    procedure edCentroDeDistribicaoExit(Sender: TObject);
    procedure btInsereClienteEntregaCentroClick(Sender: TObject);
    procedure mmMensagemPromocaoEmailEnter(Sender: TObject);
    procedure mmMensagemPromocaoEmailExit(Sender: TObject);
    procedure ckEnviaEmailClick(Sender: TObject);
    procedure rgOpcaoDeEnvioEmailClick(Sender: TObject);
    procedure btIniciarPromocaoEmailClick(Sender: TObject);
    procedure ckAtivarOEnviodeSmsVendaEmailClick(Sender: TObject);
    procedure btInsereClienteVendaEmailClick(Sender: TObject);
    procedure btInsereClienteOrcamentoEmailClick(Sender: TObject);
    procedure ckAtivaAvisoOrcamentoEmailClick(Sender: TObject);
    procedure mmMensagemAvisoVendaSmsChange(Sender: TObject);
    procedure edTituloEmailAvisoOrcamentoEnter(Sender: TObject);
    procedure edTituloEmailAvisoOrcamentoExit(Sender: TObject);
    procedure edTituloEmailAvisoVendaExit(Sender: TObject);
    procedure mmMensagemAvisoVendaEmailExit(Sender: TObject);
    procedure mmMensagemAvisoOrcamentoEmailExit(Sender: TObject);
    procedure mmMensagemAvisoOrcamentoEmailEnter(Sender: TObject);
    procedure mmMensagemAvisoVendaEmailEnter(Sender: TObject);
    procedure ExitmmAvisoVendaGrande(Sender: TObject);
    procedure ExitmmAvisoOrcamentoGrande(Sender: TObject);
    procedure ExitmmMensagemPromocaoEmailGrande(Sender: TObject);
    procedure ExitmmMensagemCobrancaEmailGrande(Sender: TObject);
    procedure ExitmmMensagemEmailAvisoVencimentoGrande(Sender: TObject);
    procedure EdTituloEnter(Sender: TObject);
    procedure EdTituloExit(Sender: TObject);
    procedure edEmailEnvioEnter(Sender: TObject);
    // procedure Button2Click(Sender: TObject);
    procedure AlterarHorario1Click(Sender: TObject);
    procedure ituloEmail1Click(Sender: TObject);
    procedure btAdicionaListaNegraClick(Sender: TObject);
    procedure btListaNegraClick(Sender: TObject);
    procedure btRemoveListaNegraClick(Sender: TObject);
    procedure mmMensagemPromocao2Enter(Sender: TObject);
    procedure mmMensagemPromocao3Enter(Sender: TObject);
    procedure mmMensagemPromocao2Exit(Sender: TObject);
    procedure mmMensagemPromocao3Exit(Sender: TObject);
    procedure mmMensagemPromocao2Change(Sender: TObject);
    procedure mmMensagemPromocao3Change(Sender: TObject);
    procedure ipo1Click(Sender: TObject);
    procedure tVerificaRespostasSmsTimer(Sender: TObject);
    procedure ckReativaAtivadosClick(Sender: TObject);
    procedure ckIniciarComWindowsClick(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure AlterarEmail1Click(Sender: TObject);
    procedure ExitEditEmail(Sender: TObject);
    procedure InserirVariavelCliente1Click(Sender: TObject);
    procedure InserirVariavelEmail1Click(Sender: TObject);
    procedure Visualizar1Click(Sender: TObject);
    procedure ExitVisualizaEmail(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure btInsereClienteMensagemSmsVendaClick(Sender: TObject);
    procedure ckAvisoFerramentaDesconectadaClick(Sender: TObject);
    procedure tAvisaQueEstaAtivoTimer(Sender: TObject);
    procedure RemoverUltimaData1Click(Sender: TObject);
    procedure InserirEmail1Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure InserirEmail2Click(Sender: TObject);
    procedure InserirDataAtual1Click(Sender: TObject);
    procedure InserirDataAtual2Click(Sender: TObject);
    procedure InserirDataAtual3Click(Sender: TObject);
    procedure InserirDataAtual4Click(Sender: TObject);
    procedure clDatasClick(Sender: TObject);
    procedure btBuscaTodasDoMesClick(Sender: TObject);
    procedure DesativarAtualizaoAutomatica1Click(Sender: TObject);
    procedure AtivarAtualizaoAutomatica1Click(Sender: TObject);
    procedure btExportarListaSmsEmailClick(Sender: TObject);
    procedure btExportarArquivoTextoClick(Sender: TObject);
    procedure btIniciaInadimplentesEmailClick(Sender: TObject);
    procedure ckEnviaEmailCobrancaClick(Sender: TObject);
    procedure edTItuloEmailCobrancaExit(Sender: TObject);
    procedure edTItuloEmailCobrancaEnter(Sender: TObject);
    procedure mmMensagemInadimplenteEmailEnter(Sender: TObject);
    procedure mmMensagemInadimplenteChange(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure btInsereClienteAvisoVencimentoClick(Sender: TObject);
    procedure btInsereVencimentoAvisoVencimentoClick(Sender: TObject);
    procedure btInsereValorAvisoVencimentoClick(Sender: TObject);
    procedure btInsereDocumentoAvisoVencimentoClick(Sender: TObject);
    procedure btInsereNumeroAvisoVencimentoClick(Sender: TObject);
    procedure mmMensagemSmsAvisoVencimentoChange(Sender: TObject);
    procedure mmMensagemSmsAvisoVencimentoEnter(Sender: TObject);
    procedure mmMensagemSmsAvisoVencimentoExit(Sender: TObject);
    procedure ckEnviaEmailAvisoVencimentoClick(Sender: TObject);
    procedure edTituloEmailAvisoVencimentoEnter(Sender: TObject);
    procedure edTituloEmailAvisoVencimentoExit(Sender: TObject);
    procedure mmMensagemEmailAvisoVencimentoEnter(Sender: TObject);
    procedure mmMensagemEmailAvisoVencimentoExit(Sender: TObject);
    procedure btInsereTipoDocumentoAvisoVencimentoClick(Sender: TObject);
    procedure btIRetiraTipoDocumentoAvisoVencimentoClick(Sender: TObject);
    procedure btInsereListaNegraAvisoVencimentoClick(Sender: TObject);
    procedure btRetiraListaNegraAvisoVencimentoClick(Sender: TObject);
    procedure btSalvarAvisoVencimentoClick(Sender: TObject);
    procedure btAtivarAvisoVencimentoClick(Sender: TObject);
    procedure rgOpcaodeEnvioAvisoVencimentoEnter(Sender: TObject);
    procedure rgOpcaodeEnvioAvisoVencimentoExit(Sender: TObject);
    procedure rgOpcaodeEnvioAvisoVencimentoClick(Sender: TObject);
    procedure btIniciaAvisoVencimentoSmsClick(Sender: TObject);
    procedure btIniciaAvisoVencimentoEmailClick(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure edHoraAvisoVencimentoEnter(Sender: TObject);
    procedure edMaxSmsAvisoVencimentoEnter(Sender: TObject);
    procedure edMaxSmsAvisoVencimentoExit(Sender: TObject);
    procedure edMinDiasAvisoVencimentoEnter(Sender: TObject);
    procedure edValorAvisoVencimentoEnter(Sender: TObject);
    procedure edMaxDiasAvisoVencimentoEnter(Sender: TObject);
    procedure edMinDiasAvisoVencimentoExit(Sender: TObject);
    procedure edValorAvisoVencimentoExit(Sender: TObject);
    procedure edHoraAvisoVencimentoExit(Sender: TObject);
    procedure tsListaEnviosShow(Sender: TObject);
    procedure tVerificaReseteTimer(Sender: TObject);
    procedure btListaClientesPListaNegraClick(Sender: TObject);
    procedure btConcluirListaNegraClick(Sender: TObject);
    procedure dbListaClientesPListaNegraDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbListaClientesPListaNegraCellClick(Column: TColumn);
    procedure dbListaClientesPListaNegraDblClick(Sender: TObject);
    procedure edBuscaClientesListaNegraChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure spBuscarCLientesPListaNegraClick(Sender: TObject);
    procedure ckTravaAlteracaoClick(Sender: TObject);
    procedure TravarAlteracoesClick(Sender: TObject);
    procedure LiberarAlteracoesClick(Sender: TObject);
    procedure cbTiposDocumentosClick(Sender: TObject);
    procedure cbTiposDocumentoAvisoVencimentoClick(Sender: TObject);
    procedure cbTiposDocumentoAvisoVencimentoEnter(Sender: TObject);
    procedure cbTiposDocumentoAvisoVencimentoExit(Sender: TObject);
    procedure cbListaNegraAvisoVencimentoClick(Sender: TObject);
    procedure cbLIstaClientesClick(Sender: TObject);
    procedure mmMensagemInadimplenteEmailExit(Sender: TObject);
    procedure ckUsarListaNegraCobrancaClick(Sender: TObject);
    procedure ckUsarMesmaListaNegraAvisoVencimentoClick(Sender: TObject);
    procedure mmListaNEnviarCobrancaChange(Sender: TObject);
    procedure mmListaNegraAvisoVencimentoChange(Sender: TObject);
    procedure ckReceberControleAmostraEmailClick(Sender: TObject);
    procedure ZerarData1Click(Sender: TObject);
    procedure ZerarData2Click(Sender: TObject);
    procedure ZerarData3Click(Sender: TObject);
    procedure ckLimitaFiliaisCobrancaClick(Sender: TObject);
    procedure edFiliaisCobrancaEnter(Sender: TObject);
    procedure edFiliaisCobrancaExit(Sender: TObject);
    procedure btAtualizarFerramentaClick(Sender: TObject);
    procedure rgPorDataPorDiaMarketingClick(Sender: TObject);
    procedure cbEscolhaDiaMarketingEnter(Sender: TObject);
    procedure cbEscolhaDiaMarketingExit(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure btInsereClienteConfirmcacaoEntregaClick(Sender: TObject);
    procedure mmSmsAvisoConfirmacaoEntregaEnter(Sender: TObject);
    procedure mmSmsAvisoConfirmacaoEntregaExit(Sender: TObject);
    procedure mmSmsAvisoConfirmacaoEntregaChange(Sender: TObject);
    procedure btIniciaSmsConfirmacaoEntregaClick(Sender: TObject);
    procedure ckAtivaDesativaSmsConfirmacaoEntregaClick(Sender: TObject);
    procedure tVerificaConfirmacaoEntregaTimer(Sender: TObject);
    procedure ckSoliciatarMotivoSatisfacaoClick(Sender: TObject);
    procedure ckAtualizarCelularEmailSatisfacaoClick(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure btSalvarSatisfacaoClick(Sender: TObject);
    procedure mmMensagemSatisfacaoChange(Sender: TObject);
    procedure mmMensagemSatisfacaoNotaRuimChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ckAtivaDesativaSatisfacaoClick(Sender: TObject);
    procedure mmMensagemSatisfacaoEnter(Sender: TObject);
    procedure mmMensagemSatisfacaoExit(Sender: TObject);
    procedure mmMensagemSatisfacaoNotaRuimExit(Sender: TObject);
    procedure edEmailSatisfacaoExit(Sender: TObject);
    procedure edCelularSatisfacaoExit(Sender: TObject);
    procedure mmMensagemSatisfacaoNotaRuimEnter(Sender: TObject);
    procedure edEmailSatisfacaoEnter(Sender: TObject);
    procedure edCelularSatisfacaoEnter(Sender: TObject);
    procedure tVerificaPesquisaDeSatisfacaoTimer(Sender: TObject);
    procedure tVerificaRepostaPesquisaTimer(Sender: TObject);
    procedure ckCopiaSmsRespostaClick(Sender: TObject);
    procedure btTesteFtpClick(Sender: TObject);
    procedure ckPausarAvisoDeEnvioClick(Sender: TObject);
    procedure CriaArquivoTxt(Arquivo, Texto: String);
    procedure Log(Texto: String);
    procedure PreenchaTitulosListaExterna;
    procedure SalvandoStringGridListaExterna;
    procedure sgListaExternaSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgListaExternaKeyPress(Sender: TObject; var Key: Char);
    procedure sgListaExternaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboNaListaExterna;
    procedure cbCategoriasListaExternaChange(Sender: TObject);
    procedure cbCategoriasListaExternaExit(Sender: TObject);
    procedure cbCategoriasListaExternaCloseUp(Sender: TObject);
    procedure ChamaCadastroNovaCategoriaListaExterna;
    procedure tsExternoShow(Sender: TObject);
    procedure EscreveNoArquivoTxt(Arquivo, Texto: String);
    procedure CarregaListaCategoriaExternaComboAgendamentos;
    procedure ckEnviarMarketingListaExternaClick(Sender: TObject);
    procedure EnviaEmailListaExterna;
    procedure btBuscarPesquisaSatisfacaoClick(Sender: TObject);
    procedure btExportarPesquisaSatisfacaoClick(Sender: TObject);
    function SqlResultadoPesquisaSatisfacao(DataInicial, DataFinal: String)
      : String;

    // procedure EnviaSmsListaExterna;
    Function CelularValido(Celular: String): Boolean;
    procedure apEventsException(Sender: TObject; E: Exception);
  private
    { Private declarations }
    // DDD : TDDD;
  public
    { Public declarations }
    procedure InsereSms(Celular, Mensagem: String);
    procedure InsereEmail(EmailEnvio, EmailDestinatario, Titulo,
      CodigoTexto: String);
    procedure CarregaTextoEmail(CodigoTexto: String);
    function TextoNaMemo(Arquivo: String): String;

  end;

var
  PeriodoPesquisaEnvios: String;
  Sms: TSms;
  FWebBrowser: TWebBrowser;
  EdicaoEmail: TMemo;
  mmMensagemPromocaoEmailGrande: TMemo;
  mmMensagemCobrancaEmailGrande: TMemo;
  mmMensagemEmailAvisoVencimentoGrande: TMemo;
  mmAvisoVendaGrande: TMemo;
  mmAvisoOrcamentoGrande: TMemo;
  Minimizado, FerramentaAtiva: Boolean;
  Linha1, Linha2, Linha3, Linha4, Linha5, Linha6, Linha7: String;
  Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8,
    Campo9: TStringList;
  NovidadesVersao, ClienteSelecionadoNaListaNegra: TStringList;
  ListaEnviados: TextFile;
  TotalSmsEnviados: Integer = 0;
  TotalRespostaSatisfacao, AtualizaSatisfacao: Integer;
  LinhaSelecionada, ColunaSelecionada, LinhaSelecionadaListaExterna,
    ColunaSelecionadaListaExterna, UltimaVenda, UltimoOrcamento: Integer;
  ListaNonoDigito: String =
    '11,12,13,14,15,16,17,18,19,21,22,24,27,28,32,31,32,33,34,35,37,38,41,81,82,83,84,85,86,'
    + '87,88,89,91,92,93,94,95,96,97,98,99,31,32,33,34,35,37,38,71,73,' +
    '74,75,77,79,61,62,63,64,65,66,67,68,69';
  UltimoControleOpcaoTextoMarketing: TMemo;

implementation

uses UdmuPrincipal, qruCelularesInvalidos, Math, dmuServidor,
  UProcedures, StdConvs;
{$R *.dfm}

procedure TSms.InsereEmail(EmailEnvio, EmailDestinatario, Titulo,
  CodigoTexto: String);
Var
  dbPrincipal: TZConnection;
  qryInsereEmail: TZQuery;
  Arq: TextFile;
begin
  CarregaTextoEmail(CodigoTexto);
  with dmServidor do
  begin
    Application.ProcessMessages;
    dbPrincipal := TZConnection.create(nil);
    dbPrincipal.HostName :=
      'Cadmustech.cet2loe0ehxw.us-west-2.rds.amazonaws.com';
    dbPrincipal.LibraryLocation := 'libmySQL.dll';
    dbPrincipal.user := 'cadmus182';
    dbPrincipal.Port := 3306;
    dbPrincipal.Password := 'cadmus182';
    dbPrincipal.Database := 'mercurio';
    dbPrincipal.Protocol := 'mysql-5';
    dbPrincipal.Connect;
    qryInsereEmail := TZQuery.create(nil);
    qryInsereEmail.connection := dbPrincipal;
    qryInsereEmail.Close;
    qryInsereEmail.SQL.Text :=
      'Insert Into Enviados(Cnpj,Celular,Enviado,Mensagem,Tipo,CodigoTextoEmail,Remetente)' +
      #13 + 'Values(' + '''' + edCnpj.Text + '''' + ',' +
      '''' + EmailDestinatario + '''' + ',' + '''' + '0' +
      '''' + ',' + '''' + Titulo + '''' + ',' + '''' + 'E' + '''' + ',' +
      '''' + CodigoTexto + '''' + ',' + '''' + EmailEnvio + '''' + ')';
    Try
      qryInsereEmail.ExecSQL;
      dbPrincipal.Disconnect;
      dbPrincipal.Destroy;
      qryInsereEmail.Destroy;
    Except
      dbPrincipal.Disconnect;
      dbPrincipal.Destroy;
      qryInsereEmail.Destroy;
    End;
  end;
end;

procedure TSms.InsereSms(Celular, Mensagem: String);
Var
  dbPrincipal: TZConnection;
  qryInsereSms: TZQuery;
begin
  Application.ProcessMessages;
  dbPrincipal := TZConnection.create(nil);
  dbPrincipal.HostName := 'Cadmustech.cet2loe0ehxw.us-west-2.rds.amazonaws.com';
  dbPrincipal.LibraryLocation := 'libmySQL.dll';
  dbPrincipal.user := 'cadmus182';
  dbPrincipal.Port := 3306;
  dbPrincipal.Password := 'cadmus182';
  dbPrincipal.Database := 'mercurio';
  dbPrincipal.Protocol := 'mysql-5';
  dbPrincipal.Connect;
  qryInsereSms := TZQuery.create(nil);
  qryInsereSms.connection := dbPrincipal;
  qryInsereSms.SQL.Text :=
    'Insert Into Enviados(Cnpj,Celular,Enviado,Mensagem,Tipo)' + #13 +
    'Values(' + '''' + edCnpj.Text + '''' + ',' + '''' + Celular +
    '''' + ',' + '''' + '0' + '''' + ',' + '''' + Mensagem + '''' + ',' +
    '''' + 'S' + '''' + ' )';
  Try
    qryInsereSms.ExecSQL;
    dbPrincipal.Disconnect;
    dbPrincipal.Destroy;
    qryInsereSms.Destroy;
  Except
    dbPrincipal.Disconnect;
    dbPrincipal.Destroy;
    qryInsereSms.Destroy;
  End;
end;

procedure CarregaListaCategoriaExternaComboListaCategoriasExterno;
begin
  if FileExists('ListaCategoriasListaExterna.txt') then
    Sms.cbCategoriasListaExterna.Items.LoadFromFile
      ('ListaCategoriasListaExterna.txt');
  Sms.cbCategoriasListaExterna.Items.Add('Nova Categoria');
end;

procedure TSms.CarregaListaCategoriaExternaComboAgendamentos;
begin
  if FileExists('ListaCategoriasListaExterna.txt') then
    Sms.cbFiltroEnvioListaExterna.Items.LoadFromFile
      ('ListaCategoriasListaExterna.txt');
  Sms.cbFiltroEnvioListaExterna.Items.Add('Todos');
end;

procedure TSms.CarregaTextoEmail(CodigoTexto: String);
var
  dbPrincipal: TZConnection;
  qryTextoEmail: TZQuery;
begin

  Application.ProcessMessages;
  dbPrincipal := TZConnection.create(nil);
  dbPrincipal.HostName := 'Cadmustech.cet2loe0ehxw.us-west-2.rds.amazonaws.com';
  dbPrincipal.LibraryLocation := 'libmySQL.dll';
  dbPrincipal.user := 'cadmus182';
  dbPrincipal.Port := 3306;
  dbPrincipal.Password := 'cadmus182';
  dbPrincipal.Database := 'mercurio';
  dbPrincipal.Protocol := 'mysql-5';
  dbPrincipal.Connect;
  qryTextoEmail := TZQuery.create(nil);
  qryTextoEmail.connection := dbPrincipal;
  qryTextoEmail.SQL.Text := 'Insert Into ' + #13 + '  TextoEmail' + #13 +
    '    (CodigoTextoEmail,Texto,Cnpj FROM TextoEmail)' + #13 + 'Values(' +
    '''' + CodigoTexto + '''' + '''' + TextoNaMemo(CodigoTexto + '.txt')
    + '''' + '''' + Sms.edCnpj.Text + '''' + ')';
  Try
    qryTextoEmail.ExecSQL;
    dbPrincipal.Disconnect;
    dbPrincipal.Destroy;
    qryTextoEmail.Destroy;
  Except
    dbPrincipal.Disconnect;
    dbPrincipal.Destroy;
    qryTextoEmail.Destroy;
  End;
  DeleteFile(CodigoTexto + '.txt');
end;

procedure TSms.ComboNaListaExterna;
Var
  R: TRect;
begin
  if (ColunaSelecionadaListaExterna = 3) and
    (LinhaSelecionadaListaExterna <> 0) then
  begin
    R := Sms.sgListaExterna.CellRect(ColunaSelecionadaListaExterna,
      LinhaSelecionadaListaExterna);
    R.Left := R.Left + Sms.sgListaExterna.Left;
    R.Right := R.Right + Sms.sgListaExterna.Left;
    R.Top := R.Top + Sms.sgListaExterna.Top;
    R.Bottom := R.Bottom + Sms.sgListaExterna.Top;
    Sms.cbCategoriasListaExterna.SetBounds(R.Left + 1, R.Top + 1,
      (R.Right + 1) - R.Left, (R.Bottom + 1) - R.Top);
    Sms.cbCategoriasListaExterna.ItemIndex :=
      Sms.cbCategoriasListaExterna.Items.IndexOf
      (Sms.sgListaExterna.Cells[ColunaSelecionadaListaExterna,
      LinhaSelecionadaListaExterna]);
    Sms.cbCategoriasListaExterna.Visible := true;
    Sms.cbCategoriasListaExterna.SetFocus;
  end
  else
    Sms.cbCategoriasListaExterna.Visible := False;
end;

procedure TSms.SalvandoStringGridListaExterna;
var
  f: TextFile;
  X, Y: Integer;
begin
  with Sms do
  begin
    AssignFile(f, 'ListaExterna.txt');
    Rewrite(f);
    Writeln(f, sgListaExterna.ColCount);
    Writeln(f, sgListaExterna.RowCount);
    For X := 0 to sgListaExterna.ColCount - 1 do
      For Y := 0 to sgListaExterna.RowCount - 1 do
      begin
        Writeln(f, sgListaExterna.Cells[X, Y]);
      end;
    CloseFile(f);
  end;
end;

Procedure RecarregandoStringGridListaExterna;
var
  f: TextFile;
  Temp, X, Y: Integer;
  TempStr: string;
begin
  with Sms do
  begin
    if FileExists('ListaExterna.txt') then
    begin
      AssignFile(f, 'ListaExterna.txt');
      Reset(f);
      Readln(f, Temp);
      sgListaExterna.ColCount := Temp;
      Readln(f, Temp);
      sgListaExterna.RowCount := Temp;
      For X := 0 to sgListaExterna.ColCount - 1 do
        For Y := 0 to sgListaExterna.RowCount - 1 do
        begin
          Readln(f, TempStr);
          sgListaExterna.Cells[X, Y] := TempStr;
        end;
      CloseFile(f);
    end;
    PreenchaTitulosListaExterna
  end;
end;

procedure TSms.PreenchaTitulosListaExterna;
begin
  Sms.sgListaExterna.Cells[0, 0] := 'Nome Cliente';
  Sms.sgListaExterna.Cells[1, 0] := 'Email';
  Sms.sgListaExterna.Cells[2, 0] := 'Celular';
  Sms.sgListaExterna.Cells[3, 0] := 'Categoria';
end;

function TSms.TextoNaMemo(Arquivo: String): String;
Var
  Memo: TMemo;
begin
  Memo := TMemo.create(Nil);
  Memo.Parent := Sms;
  Memo.Hide;
  Memo.Lines.LoadFromFile(Arquivo);
  try
    Result := Memo.Text;
  finally
    Memo.Destroy;
  end;
end;

procedure TravarBotoesDeInsercao;
begin
  with Sms do
  begin
    btInserirClientePromocao.Enabled := False;
    btInserirProduto.Enabled := False;
    btInserePedido.Enabled := False;
    btInserirClienteInadimplentes.Enabled := False;
    btInsereVencimentoInadimplentes.Enabled := False;
    btInsereValorInadimplentes.Enabled := False;
    btInsereValorJuros.Enabled := False;
    btInsereTipoCobrancaInadimplentes.Enabled := False;
    btInsereNumero.Enabled := False;
    btInsereClienteEntregaFilial.Enabled := False;
    btInsereClienteEntregaCentro.Enabled := False;
    btInsereClienteVendaSms.Enabled := False;
    btInsereClienteOrcamentoSms.Enabled := False;
    btInserirClienteAniversario.Enabled := False;
    btInsereClienteAvisoVencimento.Enabled := False;
    btInsereVencimentoAvisoVencimento.Enabled := False;
    btInsereValorAvisoVencimento.Enabled := False;
    btInsereNumeroAvisoVencimento.Enabled := False;
    btDiasVencidosInadimplentes.Enabled := False;
    btInsereDocumentoAvisoVencimento.Enabled := False;
  end;
end;

procedure DestravarBotoesDeInsercao;
begin
  with Sms do
  begin
    btInserirClientePromocao.Enabled := true;
    btInserirProduto.Enabled := true;
    btInserePedido.Enabled := true;
    btInserirClienteInadimplentes.Enabled := true;
    btInsereVencimentoInadimplentes.Enabled := true;
    btInsereValorInadimplentes.Enabled := true;
    btInsereValorJuros.Enabled := true;
    btInsereTipoCobrancaInadimplentes.Enabled := true;
    btInsereNumero.Enabled := true;
    btInsereClienteEntregaFilial.Enabled := true;
    btInsereClienteEntregaCentro.Enabled := true;
    btInsereClienteVendaSms.Enabled := true;
    btInsereClienteOrcamentoSms.Enabled := true;
    btInserirClienteAniversario.Enabled := true;
    btInsereClienteAvisoVencimento.Enabled := true;
    btInsereVencimentoAvisoVencimento.Enabled := true;
    btInsereValorAvisoVencimento.Enabled := true;
    btInsereNumeroAvisoVencimento.Enabled := true;
    btDiasVencidosInadimplentes.Enabled := true;
    btInsereDocumentoAvisoVencimento.Enabled := true;
  end;
end;

procedure TravarBotoesDeEdicao;
begin
  Sms.z.PopupMenu := Sms.pmTravaLiberaFerramenta;
  Sms.mnAgendamentoMarketing.Items.Find('Alterar Horario').Enabled := False;
  Sms.mnAgendamentoMarketing.Items.Find('Alterar Email').Enabled := False;
  Sms.btApagarTodosAgendamentos.Enabled := False;
  Sms.btRemoverAgendamento.Enabled := False;
  Sms.btInserirAgendamento.Enabled := False;
  Sms.btAgendarMarketing.Enabled := False;
end;

procedure DestravarBotoesDeEdicao;
begin
  Sms.mnAgendamentoMarketing.Items.Find('Alterar Horario').Enabled := true;
  Sms.mnAgendamentoMarketing.Items.Find('Alterar Email').Enabled := true;
  Sms.btApagarTodosAgendamentos.Enabled := true;
  Sms.btRemoverAgendamento.Enabled := true;
  Sms.btInserirAgendamento.Enabled := true;
  Sms.btAgendarMarketing.Enabled := true;
end;

procedure TravandoEdicaoEmMenuEditMaskBotoesEdicao;
var
  i: Integer;
begin
  For i := 1 to Sms.ComponentCount - 1 do
  begin
    if (Sms.Components[i] is TEdit) then
      TEdit(Sms.Components[i]).ReadOnly := true;
    if (Sms.Components[i] is TMemo) then
      TMemo(Sms.Components[i]).ReadOnly := true;
    if (Sms.Components[i] is TMaskEdit) then
      TMaskEdit(Sms.Components[i]).ReadOnly := true;
    if (Sms.Components[i] is TLabeledEdit) then
      TLabeledEdit(Sms.Components[i]).ReadOnly := true;
  end;
  TravarBotoesDeEdicao;
  TravarBotoesDeInsercao;
end;

procedure LiberarEdicaoEmMenuEditMaskBotoesEdicao;
var
  i: Integer;
begin
  For i := 1 to Sms.ComponentCount - 1 do
  begin
    if (Sms.Components[i] is TEdit) then
      TEdit(Sms.Components[i]).ReadOnly := False;
    if (Sms.Components[i] is TMemo) then
      TMemo(Sms.Components[i]).ReadOnly := False;
    if (Sms.Components[i] is TMaskEdit) then
      TMaskEdit(Sms.Components[i]).ReadOnly := False;
    if (Sms.Components[i] is TLabeledEdit) then
      TLabeledEdit(Sms.Components[i]).ReadOnly := False;
  end;
  DestravarBotoesDeEdicao;
  DestravarBotoesDeInsercao;
end;

function VerificaNovasRespostaSatisfacao: Integer;
begin
  dmServidor.qryTotalRespostaSatisfacao.Active := False;
  dmServidor.qryTotalRespostaSatisfacao.Active := true;
  dmServidor.qryTotalRespostaSatisfacao.Close;
  dmServidor.qryTotalRespostaSatisfacao.ParamByName('Cnpj')
    .Value := Sms.edCnpj.Text;
  try
    dmServidor.qryTotalRespostaSatisfacao.Open;
  Except
  end;
  Result := dmServidor.qryTotalRespostaSatisfacao['Total'];
end;

function InputQuerySenha(const ACaption, APrompt: string;
  var Value: string): Boolean;

  function GetAveCharSize(Canvas: TCanvas): TPoint;
  var
    i: Integer;
    Buffer: array [0 .. 51] of Char;
  begin
    for i := 0 to 25 do
      Buffer[i] := Chr(i + Ord('A'));
    for i := 0 to 25 do
      Buffer[i + 26] := Chr(i + Ord('a'));
    GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
    Result.X := Result.X div 52;
  end;

  procedure Saida(Sender: TObject);
  begin
    if TEdit(Sender).Text = '' then
    begin
      ShowMessage('Vazio');
      TEdit(Sender).SetFocus;
    end;
  end;

var
  Form: TForm;
  Prompt: TLabel;
  Edit: TEdit;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
begin
  Result := False;
  Form := TForm.create(Application);
  with Form do
    try
      Canvas.Font := Font;
      DialogUnits := GetAveCharSize(Canvas);
      BorderStyle := bsDialog;
      Caption := ACaption;
      ClientWidth := MulDiv(180, DialogUnits.X, 4);
      Position := poScreenCenter;
      Prompt := TLabel.create(Form);
      with Prompt do
      begin
        Parent := Form;
        Caption := APrompt;
        Left := MulDiv(8, DialogUnits.X, 4);
        Top := MulDiv(8, DialogUnits.Y, 8);
        Constraints.MaxWidth := MulDiv(164, DialogUnits.X, 4);
        WordWrap := true;
      end;
      Edit := TEdit.create(Form);
      with Edit do
      begin
        { Usando a fonte Wingdings e a letra "ele" em min�sculo, simula-se as "bolinhas" no lugar
          de aster�sco da senha }
        Font.Name := 'Wingdings';
        PasswordChar := 'l';
        Parent := Form;
        Left := Prompt.Left;
        Top := Prompt.Top + Prompt.Height + 5;
        Width := MulDiv(164, DialogUnits.X, 4);
        MaxLength := 255;
        Text := Value;
        SelectAll;
      end;
      ButtonTop := Edit.Top + Edit.Height + 15;
      ButtonWidth := MulDiv(50, DialogUnits.X, 4);
      ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
      with TButton.create(Form) do
      begin
        Parent := Form;
        Caption := 'Confirmar';
        ModalResult := mrOk;
        Default := true;
        SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth,
          ButtonHeight);
      end;
      with TButton.create(Form) do
      begin
        Parent := Form;
        Caption := 'Cancelar';
        ModalResult := mrCancel;
        Cancel := true;
        SetBounds(MulDiv(92, DialogUnits.X, 4), Edit.Top + Edit.Height + 15,
          ButtonWidth, ButtonHeight);
        Form.ClientHeight := Top + Height + 13;
      end;
      if ShowModal = mrOk then
      begin
        Value := Edit.Text;
        Result := true;
      end;
    finally
      Form.Free;
    end;
end;

procedure SalvarStatusBotao(Botao: TObject);
Var
  Arq: TextFile;
begin
  AssignFile(Arq, TBitBtn(Botao).Name + '.txt');
  Rewrite(Arq);
  Writeln(Arq, TBitBtn(Botao).Caption);
  CloseFile(Arq);
end;

procedure ReativarBotoes;
Var
  i: Integer;
  Arq: TextFile;
  Linha: String;
begin
  For i := 0 to Sms.ComponentCount - 1 do
  begin
    if (Sms.Components[i] is TBitBtn) then
      if FileExists(TBitBtn(Sms.Components[i]).Name + '.txt') then
      begin
        AssignFile(Arq, TBitBtn(Sms.Components[i]).Name + '.txt');
        Reset(Arq);
        Readln(Arq, Linha);
        CloseFile(Arq);
        if Linha = 'Desativar' then
          TBitBtn(Sms.Components[i]).Click;
      end;
  end;

end;

Procedure SalvarAquivoTextoEmail(Texto, NomeArquivo: String);
Var
  Memo: TMemo;
begin
  Memo := TMemo.create(Nil);
  Memo.Text := Texto;
  Memo.Text := Texto;
  Memo.Lines.SaveToFile(NomeArquivo + '.txt');
  Memo.Destroy;
end;

function Criptografia(mStr, mChave: string): string;
var
  i, TamanhoString, pos, PosLetra, TamanhoChave: Integer;
begin
  Result := mStr;
  TamanhoString := Length(mStr);
  TamanhoChave := Length(mChave);
  for i := 1 to TamanhoString do
  begin
    pos := (i mod TamanhoChave);
    if pos = 0 then
      pos := TamanhoChave;
    PosLetra := Ord(Result[i]) xor Ord(mChave[pos]);
    if PosLetra = 0 then
      PosLetra := Ord(Result[i]);
    Result[i] := Chr(PosLetra);
  end;
end;

procedure SalvaSenha(Tipo, Senha: String);
Var
  SQL: String;
  dbPrincipal: TZConnection;
  qrySenha: TZQuery;
begin
  Application.ProcessMessages;
  dbPrincipal := TZConnection.create(nil);
  dbPrincipal.HostName := 'Cadmustech.cet2loe0ehxw.us-west-2.rds.amazonaws.com';
  dbPrincipal.LibraryLocation := 'libmySQL.dll';
  dbPrincipal.user := 'cadmus182';
  dbPrincipal.Port := 3306;
  dbPrincipal.Password := 'cadmus182';
  dbPrincipal.Database := 'mercurio';
  dbPrincipal.Protocol := 'mysql-5';
  dbPrincipal.Connect;
  qrySenha := TZQuery.create(nil);
  qrySenha.connection := dbPrincipal;
  qrySenha.SQL.Text := 'update ' + #13 + 'Clientes set SenhaAlteracao=' +
    '''' + Senha + '''' + #13 + 'where Cnpj=' + '''' + Sms.edCnpj.Text + '''';
  // Sql := qrySenha.SQL.Text;
  // inputquery('','',Sql);
  Try
    qrySenha.ExecSQL;
    dbPrincipal.Disconnect;
    dbPrincipal.Destroy;
    qrySenha.Destroy;
  Except
    dbPrincipal.Disconnect;
    dbPrincipal.Destroy;
    qrySenha.Destroy;
  End;
end;

function RecuperarSenha(Tipo: String): String;
Var
  SQL: String;
  dbPrincipal: TZConnection;
  qrySenha: TZQuery;
begin
  Application.ProcessMessages;
  dbPrincipal := TZConnection.create(nil);
  dbPrincipal.HostName := 'Cadmustech.cet2loe0ehxw.us-west-2.rds.amazonaws.com';
  dbPrincipal.LibraryLocation := 'libmySQL.dll';
  dbPrincipal.user := 'cadmus182';
  dbPrincipal.Port := 3306;
  dbPrincipal.Password := 'cadmus182';
  dbPrincipal.Database := 'mercurio';
  dbPrincipal.Protocol := 'mysql-5';
  dbPrincipal.Connect;
  qrySenha := TZQuery.create(nil);
  qrySenha.connection := dbPrincipal;

  qrySenha.SQL.Text := 'select  ' + #13 + '  SenhaAlteracao' + #13 + 'from ' +
    #13 + '  Clientes ' + #13 + 'where Cnpj=' + '''' + Sms.edCnpj.Text + '''';
  qrySenha.Active := true;
  qrySenha.Open;
  if qrySenha['SenhaAlteracao'] = null then
    Result := ''
  else
    Result := Criptografia((qrySenha['SenhaAlteracao']), '236');
  dbPrincipal.Disconnect;
  dbPrincipal.Destroy;
  qrySenha.Destroy;
end;

function VerificaTravamentoAlteracao: Boolean;
var
  Senha: String;
begin
  if Sms.ckTravaAlteracao.Checked then
  begin
    InputQuerySenha('Digite a Senha de libera��o de altera��o', '', Senha);
    if Senha = RecuperarSenha('') then
    begin
      Result := False;
      LiberarEdicaoEmMenuEditMaskBotoesEdicao;
    end
    else
    begin
      Result := true;
      ShowMessage('Senha Incorreta');
    end;
  end
  else
    Result := False;
end;

procedure GerarExcel(Consulta: TZQuery);
var
  coluna, Linha: Integer;
  excel: variant;
  valor: string;
begin
  try
    excel := CreateOleObject('Excel.Application');
    excel.Workbooks.Add(1);
  except
    Application.MessageBox('Vers�o do Ms-Excel' + 'Incompat�vel', 'Erro',
      MB_OK + MB_ICONEXCLAMATION);
  end;
  Consulta.First;
  try
    for Linha := 0 to Consulta.RecordCount - 1 do
    begin
      for coluna := 1 to Consulta.FieldCount do
      begin
        valor := Consulta.Fields[coluna - 1].AsString;
        excel.Cells[Linha + 2, coluna] := valor;
      end;
      Consulta.Next;
    end;
    for coluna := 1 to Consulta.FieldCount do
    begin
      valor := Consulta.Fields[coluna - 1].DisplayLabel;
      excel.Cells[1, coluna] := valor;
    end;
    excel.columns.AutoFit;
    excel.Visible := true;
  except
    Application.MessageBox
      ('Aconteceu um erro desconhecido durante a convers�o' + 'da tabela para o  Ms-Excel', 'Erro', MB_OK + MB_ICONEXCLAMATION);
  end;
end;

function LiberarAlteracao(Senha: String): Boolean;
var
  SenhaSalva: String;
begin
  // SenhaSalva :=  Criptografia();
  Result := False;
  if Senha = SenhaSalva then
    Result := true
  else
    ShowMessage('Senha Incorreta');
end;

{ Procedure GravaAgendamentoServidor(Titulo,Data,Hora,Cnpj,Tipo : String);
  begin
  with dmServidor do begin
  dbAgendados.Connected := False;
  dbAgendados.Connected := True;
  qryAgendados.Active := False;
  qryAgendados.Active := True;
  qryAgendados.Insert;
  qryAgendados['Data']:= Data;
  qryAgendados['Hora'] := Hora;
  qryAgendados['Titulo'] := Titulo;
  qryAgendados['Tipo'] := Tipo ;
  qryAgendados['CNPJ'] := Cnpj;
  qryAgendados.Post;
  //qryAgendados.ApplyUpdates;
  qryAgendados.Active := False;
  end;
  end; }

{ Procedure BuscaAgendamentoServidor(Titulo,Data,Hora,Tipo,Cnpj : String);
  var T : String;
  begin
  with dmServidor do begin
  dbAgendados.Connected := False;
  dbAgendados.Connected := True;
  qryAgendados.Active := False;
  qryAgendados.Active := True;
  qryAgendados.Close;
  qryAgendados.ParamByName('Titulo').Value := Trim(Titulo);
  qryAgendados.ParamByName('Data').Value := Trim(Data);
  qryAgendados.ParamByName('Hora').Value := Trim(Hora);
  qryAgendados.ParamByName('Tipo').Value := Trim(Tipo);
  qryAgendados.ParamByName('Cnpj').Value := Trim(Cnpj);
  qryAgendados.Open;
  end;
  end; }

{ Procedure EditarAgendamentoServidor(Titulo,Data,Hora,Cnpj,Tipo,UltimaExecucao : String);
  begin
  with dmServidor do begin
  if qryAgendados.RecordCount > 0 then
  begin
  qryAgendados.Edit;
  qryAgendados['Data']:= Data;
  qryAgendados['Hora'] := Hora;
  qryAgendados['Titulo'] := Titulo;
  qryAgendados['Tipo'] := Tipo ;
  qryAgendados['CNPJ'] := Cnpj;
  qryAgendados['UltimaExecucao'] := UltimaExecucao;
  qryAgendados.Post;
  end;
  qryAgendados.Active := False;
  end;
  end; }

{ procedure ApagarAgendamentoServidor(Linha : Integer);
  begin
  BuscaAgendamentoServidor(Sms.sgListaAgendamentosMarketing.Cells[0,Linha],
  Sms.sgListaAgendamentosMarketing.Cells[1,Linha],
  Sms.sgListaAgendamentosMarketing.Cells[2,Linha],
  Sms.sgListaAgendamentosMarketing.Cells[14,Linha],
  Sms.edCnpj.Text);
  if dmServidor.qryAgendados.RecordCount > 0 then
  dmServidor.qryAgendados.Delete;
  end; }

procedure GravaAtividade(Sentido: String);
Var
  SQL: String;
  dbPrincipal: TZConnection;
  qryAtividade: TZQuery;
begin
  Application.ProcessMessages;
  dbPrincipal := TZConnection.create(nil);
  dbPrincipal.HostName := 'Cadmustech.cet2loe0ehxw.us-west-2.rds.amazonaws.com';
  dbPrincipal.LibraryLocation := 'libmySQL.dll';
  dbPrincipal.user := 'cadmus182';
  dbPrincipal.Port := 3306;
  dbPrincipal.Password := 'cadmus182';
  dbPrincipal.Database := 'mercurio';
  dbPrincipal.Protocol := 'mysql-5';
  dbPrincipal.Connect;
  qryAtividade := TZQuery.create(nil);
  qryAtividade.connection := dbPrincipal;
  if Sentido = 'Ligar' then
    qryAtividade.SQL.Text :=
      'update Clientes set UltimaDataAtivo=' + '''' + FormatDateTime
      ('yyyy-mm-dd', Date) + '''' + #13 + ',UltimaHoraAtivo= ' + '''' +
      FormatDateTime('hh:mm:ss', Now) + '''' + #13 + ',EmailAviso=' + '''' +
      Sms.edEmailAviso.Text + '''' + #13 + ',CelularAviso=' + '''' +
      Sms.edCelularAviso.Text + '''' + #13 + ',AvisaInatividade=' +
      '''Sim''' + #13 + 'where Cnpj=' + '''' + Sms.edCnpj.Text + ''''
  else
    qryAtividade.SQL.Text :=
      'update Clientes set UltimaDataAtivo=' + '''' + FormatDateTime
      ('yyyy-mm-dd', Date) + '''' + #13 + ',UltimaHoraAtivo=' + '''' +
      FormatDateTime('hh:mm:ss', Now) + '''' + #13 + ',EmailAviso=+''Sem''' +
      #13 + ',CelularAviso=+''Sem''' + #13 + ',AvisaInatividade=' + '''N�o''' +
      #13 + 'where Cnpj=' + '''' + Sms.edCnpj.Text + '''';

  // Sql := qryAtividade.SQL.Text;
  // Inputquery('','',Sql);
  try
    qryAtividade.ExecSQL;
    Sms.tAvisaQueEstaAtivo.Enabled := true;
    dbPrincipal.Disconnect;
    dbPrincipal.Destroy;
    qryAtividade.Destroy;
  Except
    dbPrincipal.Disconnect;
    dbPrincipal.Destroy;
    qryAtividade.Destroy;
    Sms.tAvisaQueEstaAtivo.Enabled := true;
  end;
end;

function ValidarEMail(aStr: string): Boolean;
var
  Email, Mostra: String;
begin
  aStr := Trim(UpperCase(aStr));
  Email := Trim(UpperCase(aStr));
  Result := False;
  if pos('@', aStr) > 1 then
  begin
    Delete(aStr, 1, pos('@', aStr));
    Mostra := (copy(Email, 1, pos('@', Email) - 1));
    if (LowerCase(copy(Email, 1, pos('@', Email) - 1)) <> 'naotem') and
      (LowerCase(copy(Email, 1, pos('@', Email) - 1)) <> 'n�otem') and
      (LowerCase(copy(Email, 1, pos('@', Email) - 1)) <> 'nao') and
      (LowerCase(copy(Email, 1, pos('@', Email) - 1)) <> 'naopossui') and
      (LowerCase(copy(Email, 1, pos('@', Email) - 1)) <> 'naopossuiemail') and
      (LowerCase(copy(Email, 1, pos('@', Email) - 1)) <> 'naotememail') and
      (LowerCase(copy(Email, 1, pos('@', Email) - 1)) <> 'n�otememail') and
      (LowerCase(copy(Email, 1, pos('@', Email) - 1)) <> 'n�opossui') and
      (LowerCase(copy(Email, 1, pos('@', Email) - 1)) <> 'naot') then
      Result := (Length(aStr) > 0) and (pos('.', aStr) > 2);
  end
  else
    Result := False;
end;

procedure SalvaMemo(Memo: TObject);
begin
  if Sms.ckReativaAtivados.Checked then
    TMemo(Memo).Lines.SaveToFile(TMemo(Memo).Name + '.txt');
end;

procedure SalvaEdit(Edit: TObject);
Var
  Arq: TextFile;
begin
  if Sms.ckReativaAtivados.Checked then
  begin
    AssignFile(Arq, TEdit(Edit).Name + '.txt');
    Rewrite(Arq);
    Writeln(Arq, TEdit(Edit).Text);
    CloseFile(Arq);
  end;
end;

procedure AjustaMemo(Sender: TObject);
var
  i: Integer;
begin
  for i := TMemo(Sender).Lines.Count - 1 downto 0 do
    if Trim(TMemo(Sender).Lines[i]) = '' then
      TMemo(Sender).Lines.Delete(i);
end;

Function SubstituirTexto(Texto, Original, Nova: String): String;
begin
  Result := StringReplace(Texto, Original, Nova, [rfReplaceAll])
end;

function RemoveCaracteresEspeciais(Palavra: String): String;
begin
  Result := SubstituirTexto(SubstituirTexto(Palavra, ',', ''), '/', '');
end;

procedure CarregaTxtMemoApagaTexto(Arquivo: String; Texto: String);
Var
  Memo: TMemo;
begin
  if FileExists(Arquivo) then
  begin
    Memo := TMemo.create(nil);
    Memo.Parent := Sms;
    Memo.Hide;
    Memo.Lines.LoadFromFile(Arquivo);
    Memo.Lines.Text := SubstituirTexto(Memo.Lines.Text, ',' + Texto, '');
    Memo.Lines.Text := SubstituirTexto(Memo.Lines.Text, Texto, '');
    AjustaMemo(Memo);
    DeleteFile(Arquivo);
    Memo.Lines.SaveToFile(Arquivo);
    Memo.Destroy;
  end;
end;

procedure AbasteceListaAtivados(Check: TObject);
Var
  Arq: TextFile;
  Contador: Integer;
begin
  if Sms.ckReativaAtivados.Checked then
  begin
    CarregaTxtMemoApagaTexto('ListaAtivos.txt', TCheckBox(Check).Name);
    AssignFile(Arq, 'ListaAtivos.txt');
    if TCheckBox(Check).Checked then
    begin
      if not FileExists('ListaAtivos.txt') then
        Rewrite(Arq)
      else
        Append(Arq);
      Writeln(Arq, TCheckBox(Check).Name);
      CloseFile(Arq);
    end;
  end;
end;

Function EstaNaListaNegra(EmailouCelular: String): Boolean;
var
  ListaNegra: TMemo;
begin
  Result := False;
  ListaNegra := TMemo.create(nil);
  ListaNegra.Parent := Sms;
  ListaNegra.Hide;
  if AnsiContainsText(EmailouCelular, '@') and FileExists
    ('ListaNegraEmail.txt') then
    ListaNegra.Lines.LoadFromFile('ListaNegraEmail.txt')
  else if FileExists('ListaNegraCelular.txt') then
    ListaNegra.Lines.LoadFromFile('ListaNegraCelular.txt');
  if AnsiContainsText(LowerCase(ListaNegra.Text), LowerCase(EmailouCelular))
    then
    Result := true;
  ListaNegra.Destroy;
end;

Function EscolheOpcaoMsg(Mensagem: String): String;
  Function SplitString(Texto, Separador: String): TStrings;
  var
    strItem: String;
    ListaAuxUTILS: TStrings;
    NumCaracteres, TamanhoSeparador, i: Integer;
  Begin
    ListaAuxUTILS := TStringList.create;
    strItem := '';
    NumCaracteres := Length(Texto);
    TamanhoSeparador := Length(Separador);
    i := 1;
    While i <= NumCaracteres Do
    Begin
      If (copy(Texto, i, TamanhoSeparador) = Separador) or (i = NumCaracteres)
        Then
      Begin
        if (i = NumCaracteres) then
          strItem := strItem + Texto[i];
        ListaAuxUTILS.Add(Trim(strItem));
        strItem := '';
        i := i + (TamanhoSeparador - 1);
      end
      Else
        strItem := strItem + Texto[i];

      i := i + 1;
    End;
    SplitString := ListaAuxUTILS;
  end;

begin
  Random;
  case RandomRange(0, 3) of
    0:
      Result := SplitString(Mensagem, ';')[0];
    1:
      Result := SplitString(Mensagem, ';')[1];
    2:
      Result := SplitString(Mensagem, ';')[2];
  end;
end;

Procedure OpcaoDeEnvioEmail;
begin
  with Sms do
  begin
    if ckEnviaEmail.Checked then
    begin
      gbMensagemPromocaoEmail.Show;
      rgOpcaoDeEnvioEmail.Show;
      if rgOpcaoDeEnvioEmail.ItemIndex = 0 then
        gbTesteEmail.Show;
    end
    else
    begin
      rgOpcaoDeEnvioEmail.Hide;
      if rgOpcaoDeEnvioEmail.ItemIndex = 1 then
        gbTesteEmail.Hide;
      gbMensagemPromocaoEmail.Hide;
    end;
  end;
end;

function TraduzirNomesck(valor: Boolean): String;
begin
  if valor then
    Result := 'Sim'
  else
    Result := 'N�o';
end;

Function TraduzirNomesRg(valor: Integer): String;
begin
  if valor = 1 then
    Result := 'Sim'
  else
    Result := 'N�o';
end;

Function PermitidaVerificacaoNodia: Boolean;
Var
  DiaDaSemana: String;

begin
  DiaDaSemana := VarToStr(DayOfWeek(StrToDate(FormatDateTime('dd/mm/yyyy',
          Date))));
  Result := False;
  with Sms do
  begin
    if (ckSeg.Checked) and (DiaDaSemana = '2') then
      Result := true;
    if (ckTer.Checked) and (DiaDaSemana = '3') then
      Result := true;
    if (ckQua.Checked) and (DiaDaSemana = '4') then
      Result := true;
    if (ckQui.Checked) and (DiaDaSemana = '5') then
      Result := true;
    if (ckSex.Checked) and (DiaDaSemana = '6') then
      Result := true;
    if (ckSab.Checked) and (DiaDaSemana = '7') then
      Result := true;
    if (ckDom.Checked) and (DiaDaSemana = '1') then
      Result := true;
    if (ckSeg.Checked) and (DiaDaSemana = '2') then
      Result := true;
  end;
end;

procedure BuscaProdutoPedido(Cliente, ParametroFiltro: string);
var
  SQL: String;
begin
  { with dmuPrincipal do begin
    Sql := ' and convert(date,dtpedido,13) = convert(date,DateAdd(Day,'+ '-'+ ParametroFiltro +',getdate()),13) '+#13+
    ' and codclie='+Cliente;
    qryProdutosEmOferta.Close;
    qryProdutosEmOferta.SQL[11]:= Sql ;
    Sql :=  qryProdutosEmOferta.SQL.text;
    InputQuery('','', Sql);
    qryProdutosEmOferta.Open; }

  // end;
end;

procedure BuscaProdutoOferta(ParametroFiltro: string);
var
  SQL: String;
begin
  with dmuPrincipal do
  begin
    SQL := ' and CLASSIFCAD.descr=' + '''' + ParametroFiltro + '''';
    qryCategoriaOferta.Close;
    qryCategoriaOferta.SQL[7] := SQL;
    qryCategoriaOferta.Open;
  end;
end;

procedure PreencherTitulosAgendamentos;
begin
  with Sms do
  begin
    sgListaAgendamentosMarketing.Cells[0, 0] := 'Mensagem';
    sgListaAgendamentosMarketing.Cells[1, 0] := 'Data';
    sgListaAgendamentosMarketing.Cells[2, 0] := 'Hora';
    sgListaAgendamentosMarketing.Cells[3, 0] := 'Enviar Enviados';
    sgListaAgendamentosMarketing.Cells[4, 0] := 'Limitar';
    sgListaAgendamentosMarketing.Cells[5, 0] := 'Max Sms';
    sgListaAgendamentosMarketing.Cells[6, 0] := 'Filtrar';
    sgListaAgendamentosMarketing.Cells[7, 0] := 'Filtro';
    sgListaAgendamentosMarketing.Cells[8, 0] := 'Parametro Filtro';
    sgListaAgendamentosMarketing.Cells[9, 0] := 'Parametro Filtro2';
    sgListaAgendamentosMarketing.Cells[10, 0] := 'Parametro Filtro3';
    sgListaAgendamentosMarketing.Cells[11, 0] := 'Status';
    sgListaAgendamentosMarketing.Cells[12, 0] := 'Ultimo Envio';
    sgListaAgendamentosMarketing.Cells[13, 0] := 'Email';
    sgListaAgendamentosMarketing.Cells[14, 0] := 'Tipo';
    sgListaAgendamentosMarketing.Cells[15, 0] := 'Envio Externo';
    sgListaAgendamentosMarketing.Cells[16, 0] := 'Filtro Externo';
  end;
end;

procedure SalvandoStringGridAgendamentoMarketing;
var
  f: TextFile;
  X, Y: Integer;
begin
  with Sms do
  begin
    AssignFile(f, 'AgendamentoMarketing.txt');
    Rewrite(f);
    Writeln(f, sgListaAgendamentosMarketing.ColCount);
    Writeln(f, sgListaAgendamentosMarketing.RowCount);
    For X := 0 to sgListaAgendamentosMarketing.ColCount - 1 do
      For Y := 0 to sgListaAgendamentosMarketing.RowCount - 1 do
      begin
        Writeln(f, sgListaAgendamentosMarketing.Cells[X, Y]);
      end;
    CloseFile(f);
  end;
end;

Procedure RecarregandoStringGridAgendamentoMarketing;
var
  f: TextFile;
  Temp, X, Y: Integer;
  TempStr: string;
begin
  with Sms do
  begin
    if FileExists('AgendamentoMarketing.txt') then
    begin
      AssignFile(f, 'AgendamentoMarketing.txt');
      Reset(f);
      Readln(f, Temp);
      sgListaAgendamentosMarketing.ColCount := Temp;
      Readln(f, Temp);
      sgListaAgendamentosMarketing.RowCount := Temp;
      For X := 0 to sgListaAgendamentosMarketing.ColCount - 1 do
        For Y := 0 to sgListaAgendamentosMarketing.RowCount - 1 do
        begin
          Readln(f, TempStr);
          sgListaAgendamentosMarketing.Cells[X, Y] := TempStr;
        end;
      CloseFile(f);
    end;
    PreencherTitulosAgendamentos;
  end;
end;

Function FiltroClienteMarketing(Filtro, ParametroFiltro, ParametroFiltro2,
  ParametroFiltro3: String): String;

  Function ConverteFiltroMarketing(Filtro, ParametroFiltro, ParametroFiltro2,
    ParametroFiltro3: String): String;
  begin
    if Filtro = 'Or�amento n�o aprovado em' then
      Result := 'OrcamentoNAprovado';
    if Filtro = 'Comprou a' then
      Result := 'Comproua';
    if Filtro = 'Comprou Produtos da Categoria' then
      Result := 'ComprouProdutos';
    if Filtro = 'Possui Produtos em Oferta' then
      Result := 'ProdutosEmOferta';
    if Filtro = 'Nota Emitida em' then
      Result := 'NotaEmitida';
    if Filtro = 'Indica Categoria  Para' then
      Result := 'IndicaCategoria';
    if Filtro = 'Pedido com itens sem nota' then
      Result := 'PedidoComItensSemNota';
    if Filtro = 'Comprou No Periodo' then
      Result := 'ComprouNoPeriodo';

  end;

begin
  if ConverteFiltroMarketing(Filtro, ParametroFiltro, ParametroFiltro2,
    ParametroFiltro3) = 'OrcamentoNAprovado' then
  begin
    Result := '  CLIENTECAD.OID in ' + #13 +
      '(select PEDICLICAD.codclie from PEDICLICAD ' + #13 +
      'where PEDICLICAD.sitven=''A'' and convert(date,dtpedido,13) = convert(date,DateAdd(Day,'
      + '-' + ParametroFiltro + ',getdate()),13)) ';
  end;
  if ConverteFiltroMarketing(Filtro, ParametroFiltro, ParametroFiltro2,
    ParametroFiltro3) = 'Comproua' then
  begin
    Result := '  CLIENTECAD.OID in ' + #13 +
      '(select PEDICLICAD.codclie from PEDICLICAD ' + #13 +
      'where PEDICLICAD.sitven=''2'' and convert(date,dtpedido,13) = convert(date,DateAdd(Day,'
      + '-' + ParametroFiltro + ',getdate()),13)) ';
  end;
  if ConverteFiltroMarketing(Filtro, ParametroFiltro, ParametroFiltro2,
    ParametroFiltro3) = 'ComprouProdutos' then
  begin
    Result := '  CLIENTECAD.OID in ' + #13 +
      '(select PEDICLICAD.codclie from PEDICLICAD ' + #13 +
      'join ITEMCLICAD on ITEMCLICAD.numped=PEDICLICAD.numped ' + #13 +
      'join PRODUTOCAD on produtocad.codpro=ITEMCLICAD.codpro ' + #13 +
      'join CLASSIFCAD on CLASSIFCAD.clasprod=produtocad.codpro ' + #13 +
      'where CLASSIFCAD.descr = ' + '''' + ParametroFiltro + '''' + ')  '
  end;
  if ConverteFiltroMarketing(Filtro, ParametroFiltro, ParametroFiltro2,
    ParametroFiltro3) = 'ProdutosEmOferta' then
  begin
    if (Sms.edCnpj.Text = '38542718000182') or
      (Sms.edCnpj.Text = '26859336000106') then
      Result := '  CLIENTECAD.OID in ' + #13 + '(select           ' + #13 +
        '  DISTINCT PEDICLICAD.CODCLIE ' + #13 +
        'from                                ' + #13 +
        '  PEDICLICAD                              ' + #13 +
        'join                                         ' + #13 +
        '  ITEMCLICAD on ITEMCLICAD.numped=PEDICLICAD.numped    ' + #13 +
        'join                                                         ' + #13 +
        '  ProdutoPromocao PP on PP.CodigoExterno1 =ItemCliCad.CodPro       ' +
        #13 +
        'join                                                              ' +
        #13 +
        '  Promocao_R  on  PP.rPromoCao=Promocao_R.Oid                     ' +
        #13 +
        'join                                                              ' +
        #13 +
        '  PRODUTOCAD on PRODUTOCAD.codpro=ITEMCLICAD.codpro               ' +
        #13 +
        'JOIN                                                             ' +
        #13 +
        '  ITEMAUTORIZADO on ITEMAUTORIZADO.RITEM=PROMOCAO_R.OID          ' +
        #13 +
        'JOIN                                                               ' +
        #13 +
        '  FILIALCAD ON FILIALCAD.OID= ITEMAUTORIZADO.RPESSOA                    ' + #13
        + 'where                                                                         ' + #13
        + '  PEDICLICAD.sitven=''A''                                                             ' +
        #13 + '  and convert(date,dtpedido,13) = convert(date,DateAdd(Day,' +
        '-' + ParametroFiltro + ',getdate()),13) ' + #13 +
        '  and  Promocao_R.inicio <= GETDATE()                                                           ' +
        #13
        + '  and  Promocao_R.termino  >= GETDATE()                                                       ' + #13 +
        '  and ITEMCLICAD.FILIAL = FILIALCAD.FILIAL )'

    else
      Result := '  CLIENTECAD.OID in ' + #13 +
        '(select PEDICLICAD.codclie from PEDICLICAD ' + #13 +
        'join ITEMCLICAD on ITEMCLICAD.numped=PEDICLICAD.numped ' + #13 +
        'join OFERTASEST on OFERTASEST.codpro = ITEMCLICAD.codpro   ' + #13 +
        'and OFERTASEST.dtvalidini <= GETDATE()  and OFERTASEST.dtvalidfin >= GETDATE()  ' +
        #13 + 'join PRODUTOCAD on PRODUTOCAD.codpro=ITEMCLICAD.codpro  ' +
        #13 + 'where PEDICLICAD.sitven=''A'' and    ' + #13 +
        'convert(date,dtpedido,13) = convert(date,DateAdd(Day,' + '-' +
        ParametroFiltro + ',getdate()),13)) ';

  end;
  if ConverteFiltroMarketing(Filtro, ParametroFiltro, ParametroFiltro2,
    ParametroFiltro3) = 'NotaEmitida' then
  begin
    Result := '  CLIENTECAD.OID in ' + #13 +
      ' (select NFSAIDACAD.codclie from NFSAIDACAD ' + #13 +
      'where NFSAIDACAD.dtcancel is null  and  ' + #13 +
      'convert(date,NFSAIDACAD.dtemis,13) = convert(date,DateAdd(Day,' + '-' +
      ParametroFiltro + ',getdate()),13))';
  end;
  if ConverteFiltroMarketing(Filtro, ParametroFiltro, ParametroFiltro2,
    ParametroFiltro3) = 'IndicaCategoria' then
  begin
    Result := '  CLIENTECAD.OID in   ' + #13 +
      '(select PEDICLICAD.codclie from VendassCad ' + #13 +
      'join PEDICLICAD on PEDICLICAD.numped=VENDASSCAD.numped ' + #13 +
      'join ITEMCLICAD on ITEMCLICAD.numped=VendassCad.numped   ' + #13 +
      'join PRODUTOCAD on PRODUTOCAD.codpro=ITEMCLICAD.codpro   ' + #13 +
      'join CLASSIFCAD on substring(CLASSIFCAD.clasprod,1,2)=substring(produtocad.clasprod,1,2)' + #13 + 'where    ' +
      #13 + 'convert(date,dtpedido,13) = convert(date,DateAdd(Day,' + '-' +
      ParametroFiltro3 + ',getdate()),13) ' + #13 + 'and ' + #13 +
      'CLASSIFCAD.descr = ' + '''' + ParametroFiltro + '''' + ') ' + #13 +
      'and  ' + #13 + 'CLIENTECAD.OID not in   ' + #13 +
      '(select PEDICLICAD.codclie from VendassCad ' + #13 +
      'join PEDICLICAD on PEDICLICAD.numped=VENDASSCAD.numped  ' + #13 +
      'join ITEMCLICAD on ITEMCLICAD.numped=VendassCad.numped  ' + #13 +
      'join PRODUTOCAD on PRODUTOCAD.codpro=ITEMCLICAD.codpro  ' + #13 +
      'join CLASSIFCAD on substring(CLASSIFCAD.clasprod,1,2)=substring(produtocad.clasprod,1,2)' + #13 + 'where   ' +
      #13 + 'convert(date,dtpedido,13) = convert(date,DateAdd(Day,' + '-' +
      ParametroFiltro3 + ',getdate()),13) ' + #13 + 'and ' + #13 +
      'CLASSIFCAD.descr = ' + '''' + ParametroFiltro2 + '''' + ')  ';
  end;
  if ConverteFiltroMarketing(Filtro, ParametroFiltro, ParametroFiltro2,
    ParametroFiltro3) = 'PedidoComItensSemNota' then
  begin
    Result := '   CLIENTECAD.OID in  ' + #13 + '(select               ' + #13 +
      '   PEDICLICAD.codclie ' + #13 + ' from                 ' + #13 +
      '   PEDICLICAD         ' + #13 + ' where                ' + #13 +
      '   (select            ' + #13 + '      Count(ITEMCLICAD.numped) ' +
      #13 + '   from                        ' + #13 +
      '     ITEMCLICAD                ' + #13 +
      '   where                       ' + #13 +
      '     ITEMCLICAD.numped=PEDICLICAD.numped and ITEMCLICAD.numordfat <> ''0'') > 0 ' +
      #13 + '   and                                                     ' +
      #13 + '   (select                                                 ' +
      #13 + '     Count(ITEMCLICAD.numped)                              ' +
      #13 + '    from                                                   ' +
      #13 + '      ITEMCLICAD                                           ' +
      #13 + '   where                                                   ' +
      #13 +
      '     ITEMCLICAD.numped=PEDICLICAD.numped and ITEMCLICAD.numordfat = ''0'') > 0 ' +
      #13
      + '    and PEDICLICAD.sitven=''2'' and convert(date,dtpedido,13) = convert(date,DateAdd(Day,' + '-' + ParametroFiltro + ',getdate()),13)) ';
  end;

  if ConverteFiltroMarketing(Filtro, ParametroFiltro, ParametroFiltro2,
    ParametroFiltro3) = 'ComprouNoPeriodo' then
  begin
    Result := ' CLIENTECAD.OID in ' + #13 +
      '(select PEDICLICAD.codclie from PEDICLICAD ' + #13 +
      'where PEDICLICAD.sitven=''2'' and convert(varchar,dtpedido,103) between '
      + '''' + ParametroFiltro + '''' + ' and ' + '''' + ParametroFiltro2 +
      '''' + ')';
  end;
end;

Function Isnull(Parametro: String): String;
begin
  if Parametro = '' then
    Result := '0'
  else
    Result := Parametro;
end;

Function VerificaInternet: Boolean;
begin
  Result := true;
end;

function GetFileSize(const FileName: string): Int64;
var
  Handle: THandle;
  FindData: TWin32FindData;
begin
  Handle := FindFirstFile(PChar(FileName), FindData);
  if Handle <> INVALID_HANDLE_VALUE then
  begin
    Windows.FindClose(Handle);
    if (FindData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 0 then
    begin
      Int64Rec(Result).Lo := FindData.nFileSizeLow;
      Int64Rec(Result).Hi := FindData.nFileSizeHigh;
      Exit;
    end;
  end;
  Result := -1;
end;

Procedure ConectaFtp(Usuario, Senha: String);
begin
  Sms.IdFTP.Disconnect();
  Sms.IdFTP.Host := 'ftp.bibia.com.br';
  Sms.IdFTP.Port := 21;
  Sms.IdFTP.Username := Usuario + '@bibia.com.br';
  Sms.IdFTP.Password := Senha;
  Try
    Sms.IdFTP.Connect;
  except
    on E: Exception do
      // Showmessage(E.Message);
    end;
  end;

  Procedure DesconectaFtp;
  begin
    Sms.IdFTP.Disconnect();
  end;

  Procedure EnviaAcrescentaArquivo(Arquivo: String; Apagar: Boolean;
    Substituir: Boolean = true);
  begin
    ConectaFtp(Sms.edCnpj.Text, 'cadmus182');

    Try
      if FileExists(Arquivo) then
      begin
        Sms.IdFTP.Put(Arquivo, Arquivo, Substituir);
      end;
    except
      on E: Exception do
      end;
      DesconectaFtp;
      if Apagar then
        if FileExists(Arquivo) then
        begin
          DeleteFile(Arquivo);
        end;
    end;

    procedure CarregaTextoPFtp(CodigoTexto: String);
    begin
      EnviaAcrescentaArquivo(CodigoTexto + '.txt', False, False);
    end;

    Procedure EnviarEmailControle(Usuario, Email, Msg: String);
      Procedure ConfiguraEmail;
      begin
      end;

    begin
    end;

    Procedure EnviarSmsControle(Celular, Msg: String);
    begin
    end;

    Procedure VerificandoBaixandoExemplosSms(Arquivo: String);
      Function VerificandoExistenciaLocalExemploSms(Arquivo: String): Boolean;
      begin
        Result := False;
        if FileExists(Arquivo) then
          Result := true;
      end;
      Function VerificaExistenciaFtpExemploSms(Arquivo: String): Boolean;
      begin
        Result := False;
        if VerificaInternet then
        Begin
          ConectaFtp('simplessms', 'simplessms29$');
          if Sms.IdFTP.Size(Arquivo) > 0 then
            Result := true;
        end;
      end;
      Procedure BaixarArquivoExemplosFtp(Arquivo: String);
      begin
        if VerificaInternet then
        begin
          Sms.IdFTP.Get(Arquivo, Arquivo, true, False);
        end
        else
          ShowMessage('Sem Conex�o de Internet para baixar o arquivo');
      end;
      Function VerificaSeArquivoFtpMaisAtualExemplosSms(Arquivo: String)
        : Boolean;
      begin
        Result := False;
        if VerificaInternet then
        Begin
          ConectaFtp('simplessms', 'simplessms29$');
          if Sms.IdFTP.Size(Arquivo) > GetFileSize(Arquivo) then
            Result := true;
        end;
      end;

    begin
      if not VerificandoExistenciaLocalExemploSms(Arquivo) then
      begin
        if VerificaExistenciaFtpExemploSms(Arquivo) then
        begin
          ShowMessage('N�o existe uma Lista a lista ser� baixada');
          BaixarArquivoExemplosFtp(Arquivo);
        end
        else
          ShowMessage('N�o existe uma lista de Exemplos Disponivel');
      end
      else
      begin
        if VerificaSeArquivoFtpMaisAtualExemplosSms(Arquivo) then
        begin
          ShowMessage(
            'Existe uma lista nova de exemplos ela ser� baixada aguarde...');
          BaixarArquivoExemplosFtp(Arquivo);
        end;
      end;

    end;

    { Function BuscaDDD(Cliente: String): String;
      begin
      dmuPrincipal.qryDDD.Close;
      dmuPrincipal.qryDDD.SQL.Clear;
      dmuPrincipal.qryDDD.SQL.Add('select TOP 1 SUBSTRING(DDD,2,2) as ddd from ENDERECO_V') ;
      dmuPrincipal.qryDDD.SQL.Add('JOIN CIDADE_V ON CIDADE_V.OID = ENDERECO_V.RCIDADE') ;
      dmuPrincipal.qryDDD.SQL.Add('where RITEM ='+Cliente);
      dmuPrincipal.qryDDD.Open;
      if dmuPrincipal.qryDDD.RecordCount > 0 then
      Result :=  dmuPrincipal.qryDDD['DDD']
      else
      Result := '';
      end; }

    Procedure RecuperarTelas;
      Procedure IniciaCampos;
      begin
        Campo1 := TStringList.create;
        Campo2 := TStringList.create;
        Campo3 := TStringList.create;
        Campo4 := TStringList.create;
        Campo5 := TStringList.create;
        Campo6 := TStringList.create;
        Campo7 := TStringList.create;
        Campo8 := TStringList.create;
        Campo9 := TStringList.create;
      end;
      Procedure LendoArquivos(Arquivo: String);
      Var
        Arq: TextFile;
        Linha: String;
      begin
        IniciaCampos;
        AssignFile(Arq, Arquivo);
        Reset(Arq);
        While Linha <> 'Fim' do
        begin
          Readln(Arq, Linha);
          if (Linha <> 'Fim') and (Linha <> 'Inicio') then
            Campo1.Add(Linha);
        end;
        Linha := '';
        While Linha <> 'Fim' do
        begin
          Readln(Arq, Linha);
          if (Linha <> 'Fim') and (Linha <> 'Inicio') then
            Campo2.Add(Linha);
        end;
        Linha := '';
        While Linha <> 'Fim' do
        begin
          Readln(Arq, Linha);
          if (Linha <> 'Fim') and (Linha <> 'Inicio') then
            Campo3.Add(Linha);
        end;
        Linha := '';
        While Linha <> 'Fim' do
        begin
          Readln(Arq, Linha);
          if (Linha <> 'Fim') and (Linha <> 'Inicio') then
            Campo4.Add(Linha);
        end;
        Linha := '';
        While Linha <> 'Fim' do
        begin
          Readln(Arq, Linha);
          if (Linha <> 'Fim') and (Linha <> 'Inicio') then
            Campo5.Add(Linha);
        end;
        Linha := '';
        While Linha <> 'Fim' do
        begin
          Readln(Arq, Linha);
          if (Linha <> 'Fim') and (Linha <> 'Inicio') then
            Campo6.Add(Linha);
        end;
        Linha := '';
        While Linha <> 'Fim' do
        begin
          Readln(Arq, Linha);
          if (Linha <> 'Fim') and (Linha <> 'Inicio') then
            Campo7.Add(Linha);
        end;
        Linha := '';
        While Linha <> 'Fim' do
        begin
          Readln(Arq, Linha);
          if (Linha <> 'Fim') and (Linha <> 'Inicio') then
            Campo8.Add(Linha);
        end;
        Linha := '';
        While Linha <> 'Fim' do
        begin
          Readln(Arq, Linha);
          if (Linha <> 'Fim') and (Linha <> 'Inicio') then
            Campo9.Add(Linha);
        end;
        CloseFile(Arq);
      end;
      Procedure PreenchendoTelaPromocao;
      begin
        Sms.mmMensagemPromocao.Text := Trim(Campo1.Text);
        Sms.mmDatasPromocao.Text := Trim(Campo2.Text);
        Sms.mkhoraInicioPromocao.Text := Trim(Campo3.Text);
        Sms.rgMaxSmsMarketing.ItemIndex := StrToInt(Trim(Campo4.Text));
        Sms.edMaxSmsPromocao.Text := Trim(Campo5.Text);
        if (Campo6.Text) = '-1' then
          Sms.ckNEnviarNEnviados.Checked := False
        else
          Sms.ckNEnviarNEnviados.Checked := true;
        if Sms.rgMaxSmsMarketing.ItemIndex = 1 then
          Sms.edMaxSmsPromocao.Show;
      end;

      Procedure PreenchendoTelaCobranca;
      begin
        Sms.mmMensagemInadimplente.Text := Trim(Campo1.Text);
        Sms.edMinDiasVencidos.Text := Trim(Campo2.Text);
        Sms.edMaxDiasVencidos.Text := Trim(Campo3.Text);
        Sms.edMinValorVencido.Text := Trim(Campo4.Text);
        Sms.mmListaNEnviarCobranca.Text := Trim(Campo5.Text);
        Sms.rgMaxSmsCobranca.ItemIndex := StrToInt(Trim(Campo6.Text));
        Sms.edMaxSmsInadimpentes.Text := Trim(Campo7.Text);
        Sms.mmListaTiposDocumentos.Text := Trim(Campo8.Text);
        Sms.mkHoraInicioInadimplentes.Text := Trim(Campo9.Text);
        if Sms.rgMaxSmsCobranca.ItemIndex = 1 then
          Sms.rgMaxSmsCobranca.Show;
      end;

      Procedure PreenchendoTelaAvisoVencimento;
      begin
        Sms.mmMensagemSmsAvisoVencimento.Text := Trim(Campo1.Text);
        Sms.edMinDiasAvisoVencimento.Text := Trim(Campo2.Text);
        Sms.edMaxDiasAvisoVencimento.Text := Trim(Campo3.Text);
        Sms.edValorAvisoVencimento.Text := Trim(Campo4.Text);
        Sms.mmListaNegraAvisoVencimento.Text := Trim(Campo5.Text);
        Sms.rgOpcaodeEnvioAvisoVencimento.ItemIndex := StrToInt
          (Trim(Campo6.Text));
        Sms.edMaxSmsAvisoVencimento.Text := Trim(Campo7.Text);
        Sms.mmListaTipoDocumentoAvisoVencimento.Text := Trim(Campo8.Text);
        Sms.edHoraAvisoVencimento.Text := Trim(Campo9.Text);
        if Sms.rgOpcaodeEnvioAvisoVencimento.ItemIndex = 1 then
          Sms.edMaxSmsAvisoVencimento.Show;
      end;

      Procedure PreenchendoTelaSatisfacao;
      begin
        Sms.mmMensagemSatisfacao.Text := Trim(Campo1.Text);
        Sms.mmMensagemSatisfacaoNotaRuim.Text := Trim(Campo2.Text);
        Sms.edEmailSatisfacao.Text := Trim(Campo3.Text);
        Sms.edCelularSatisfacao.Text := Trim(Campo4.Text);
      end;

      Procedure PreenchendoTelaEntrega;
      begin
        Sms.mmMensagemAvisoEntregaFiliais.Text := Trim(Campo1.Text);
        Sms.mkHoraInicioAvisoEntrega.Text := Trim(Campo2.Text);
        Sms.mkHoraFinalAvisoEntrega.Text := Trim(Campo3.Text);
        if Trim(Campo4.Text) <> '' then
          Sms.rgMaxSmsEntrega.ItemIndex := StrToInt(Trim(Campo4.Text));
        Sms.edMaxSmsEntrega.Text := Trim(Campo5.Text);
        if Trim(Campo6.Text) <> '' then
          Sms.cbListaCategorias.KeyValue := StrToInt(Trim(Campo6.Text));
        if Trim(Campo7.Text) <> '' then
          Sms.rgAguardarpor.ItemIndex := StrToInt(Trim(Campo7.Text));
        Sms.edNomeSerie.Text := Trim(Campo8.Text);
        if Sms.rgMaxSmsEntrega.ItemIndex = 1 then
          Sms.edMaxSmsEntrega.Show;
        Sms.edEsperaEnvio.Text := Trim(Campo9.Text);
      end;

      Procedure PreenchendoTelaAniversario;
      begin
        Sms.mmMensagemAniversariante.Text := Trim(Campo1.Text);
        Sms.mkHoraIncioAniversario.Text := Trim(Campo2.Text);
        Sms.rgMaxSmsAniversaio.ItemIndex := StrToInt(Trim(Campo3.Text));
        Sms.edMaxSmsAniversario.Text := Trim(Campo4.Text);
        if Sms.rgMaxSmsAniversaio.ItemIndex = 1 then
          Sms.edMaxSmsAniversario.Show;
      end;

    begin
      if FileExists('Promo��o.txt') then
      begin
        LendoArquivos('Promo��o.txt');
        PreenchendoTelaPromocao;
      end;
      if FileExists('Inadimplentes.txt') then
      begin
        LendoArquivos('Inadimplentes.txt');
        PreenchendoTelaCobranca;
      end;
      if FileExists('AvisoEntrega.txt') then
      begin
        LendoArquivos('AvisoEntrega.txt');
        PreenchendoTelaEntrega;
      end;
      if FileExists('Aniversario.txt') then
      begin
        LendoArquivos('Aniversario.txt');
        PreenchendoTelaAniversario;
      end;
      if FileExists('AvisoVencimento.txt') then
      begin
        LendoArquivos('AvisoVencimento.txt');
        PreenchendoTelaAvisoVencimento;
      end;
      if FileExists('Satisfacao.txt') then
      begin
        LendoArquivos('Satisfacao.txt');
        PreenchendoTelaSatisfacao;
      end;
    end;

    Procedure LerConfiguracao(NomeArquivo: string);
    var
      Arq: TextFile;
      Caminho: String;
    begin
      Caminho := ExtractFilePath(Application.ExeName);
      Linha1 := '';
      Linha2 := '';
      Linha3 := '';
      Linha4 := '';
      Linha5 := '';
      Linha6 := '';
      Linha7 := '';
      if FileExists(Caminho + NomeArquivo) then
      begin
        AssignFile(Arq, Caminho + NomeArquivo);
        Reset(Arq);
        Readln(Arq, Linha1);
        Readln(Arq, Linha2);
        Readln(Arq, Linha3);
        Readln(Arq, Linha4);
        Readln(Arq, Linha5);
        Readln(Arq, Linha6);
        Readln(Arq, Linha7);
        CloseFile(Arq);
      end
      else
      Begin
        Linha1 := '';
        Linha2 := '';
        Linha3 := '';
        Linha4 := '';
        Linha5 := '';
        Linha6 := '';
        Linha7 := '';
      end;

    end;

    Function VersaoFtp: String;
    begin
      if VerificaInternet then
      Begin
        ConectaFtp('simplessms', 'simplessms29$');
        Sms.IdFTP.Get('Versao.txt', 'Versao.txt', true, False);
        LerConfiguracao('Versao.txt');
        Result := Linha1;
        DeleteFile('Versao.txt');
      end;
    end;

    Function VersaoExe: String;
    type
      PFFI = ^vs_FixedFileInfo;
    var
      f: PFFI;
      Handle: Dword;
      Len: Longint;
      Data: PChar;
      Buffer: Pointer;
      Tamanho: Dword;
      Parquivo: PChar;
      Arquivo: String;
    begin
      Arquivo := Application.ExeName;
      Parquivo := StrAlloc(Length(Arquivo) + 1);
      StrPcopy(Parquivo, Arquivo);
      Len := GetFileVersionInfoSize(Parquivo, Handle);
      Result := '';
      if Len > 0 then
      begin
        Data := StrAlloc(Len + 1);
        if GetFileVersionInfo(Parquivo, Handle, Len, Data) then
        begin
          VerQueryValue(Data, '\', Buffer, Tamanho);
          f := PFFI(Buffer);
          Result := Format('%d.%d.%d.%d', [HiWord(f^.dwFileVersionMs),
            LoWord(f^.dwFileVersionMs), HiWord(f^.dwFileVersionLs),
            LoWord(f^.dwFileVersionLs)]);
        end;
        StrDispose(Data);
      end;
      StrDispose(Parquivo);
    end;

    Procedure BaixaArquivoFtp(Arquivo: String);
    begin
      if VerificaInternet then
      Begin
        ConectaFtp('simplessms', 'simplessms29$');
        Sms.IdFTP.Get('pSms.exe', 'pSmsAtualizacao.exe', true, False);
      end
      else
        ShowMessage(
          'N�o foi possivel baixar a atualiza��o sem conex�o com a internet');
    end;

    Procedure BaixaFtp(Arquivo: String);
    begin
      if VerificaInternet then
      Begin
        ConectaFtp('simplessms', 'simplessms29$');
        if Sms.IdFTP.Size(Arquivo) > 0 then
          Sms.IdFTP.Get(Arquivo, Arquivo, true, False);
      end;
    end;

    Procedure AtualizaArquivo;
    begin
      ShowMessage('Este processo demorar� alguns segundos aguarde');
      BaixaArquivoFtp('PSms.exe');
      RenameFile('PSms.exe', 'Psmsold.exe');
      RenameFile('PSmsAtualizacao.exe', 'Psms.exe');
      WinExec('PSms.exe', SW_NORMAL);
      Application.Terminate;
    end;

    Function VerificaAtualizacao: Boolean;
    begin
      Result := False;
      if VersaoExe <> VersaoFtp then
      begin
        Result := true;
        NovidadesVersao := TStringList.create;
        try
          BaixaFtp('NovidadesVersao.txt');
        except
        end;
        if FileExists('NovidadesVersao.txt') then
          NovidadesVersao.LoadFromFile(('NovidadesVersao.txt'));
        if MessageBoxTimer(
          'Existe uma nova vers�o do simples sms deseja atualizar ?' + #13 +
            '' + #13 + 'Novidades e ajustes da nova Vers�o' + #13 + '' +
            #13 + (NovidadesVersao.Text), 'Teste', mtConfirmation,
          [mbYes, mbNo], 50000) = mrYes then
        begin
          try
            AtualizaArquivo;
          except
          end;
          try
            NovidadesVersao.Destroy;
          except
          end;
        end;
      end;
    end;

    Function VerificaProgramacao(UltimoEnvio, Data, Hora: String): Boolean;
    var
      DataAtual, HoraAtual: string;
    begin
      Result := False;
      DataAtual := FormatDateTime('dd/mm/yyyy', Date);
      HoraAtual := FormatDateTime('HH:MM', Time);
      if UltimoEnvio <> FormatDateTime('dd/mm/yyyy', Date) then
      begin
        if Data <> 'N�o' then
        begin
          if (Data = DataAtual) and (Hora = HoraAtual) then
          begin
            Result := true;
          end;
        end
        else if (Hora = HoraAtual) then
          Result := true;
      end;
    end;

    Function ContaStringFalta(Total, Local: String): Integer;
    begin
      Result := StrToInt(Total) - Length(Local);
    end;

    Procedure SalvarConfiguracao(NomeArquivo, Linha1, Linha2, Linha3, Linha4,
      Linha5, Linha6, Linha7: string);
    var
      Arq: TextFile;
    begin
      AssignFile(Arq, NomeArquivo);
      Rewrite(Arq);
      Writeln(Arq, Linha1);
      Writeln(Arq, Linha2);
      Writeln(Arq, Linha3);
      Writeln(Arq, Linha4);
      Writeln(Arq, Linha5);
      Writeln(Arq, Linha6);
      Writeln(Arq, Linha7);
      CloseFile(Arq);
    end;

    Procedure SalvarTela(NomeArquivo, Linha1, Linha2, Linha3, Linha4, Linha5,
      Linha6, Linha7, Linha8, Linha9: string);
    var
      Arq: TextFile;
    begin
      AssignFile(Arq, NomeArquivo);
      Rewrite(Arq);
      Writeln(Arq, 'Inicio');
      if Linha1 <> '' then
        Writeln(Arq, Linha1);
      Writeln(Arq, 'Fim');
      Writeln(Arq, 'Inicio');
      if Linha2 <> '' then
        Writeln(Arq, Linha2);
      Writeln(Arq, 'Fim');
      Writeln(Arq, 'Inicio');
      if Linha3 <> '' then
        Writeln(Arq, Linha3);
      Writeln(Arq, 'Fim');
      Writeln(Arq, 'Inicio');
      if Linha4 <> '' then
        Writeln(Arq, Linha4);
      Writeln(Arq, 'Fim');
      Writeln(Arq, 'Inicio');
      if Linha5 <> '' then
        Writeln(Arq, Linha5);
      Writeln(Arq, 'Fim');
      Writeln(Arq, 'Inicio');
      if Linha6 <> '' then
        Writeln(Arq, Linha6);
      Writeln(Arq, 'Fim');
      Writeln(Arq, 'Inicio');
      if Linha7 <> '' then
        Writeln(Arq, Linha7);
      Writeln(Arq, 'Fim');
      Writeln(Arq, 'Inicio');
      if Linha8 <> '' then
        Writeln(Arq, Linha8);
      Writeln(Arq, 'Fim');
      Writeln(Arq, 'Inicio');
      if Linha9 <> '' then
        Writeln(Arq, Linha9);
      Writeln(Arq, 'Fim');
      CloseFile(Arq);
    end;

    function SegundaChanceCelularVenda: String;
    var
      Pre, Celular, DDD: String;
      Tamanho: Integer;
    begin
      dmuPrincipal.qryCelularVenda.First;
      if dmuPrincipal.qryCelularVenda.RecordCount > 0 then
      begin
        Pre := dmuPrincipal.qryCelularVendaCelular.AsString;
        Tamanho := Length(dmuPrincipal.qryCelularVenda['Celular']);
      end;
      if (Sms.CelularValido(Pre)) and
        (dmuPrincipal.qryCelularVenda.RecordCount > 0) and
        (Tamanho <= 12) and (Tamanho >= 8) then
      begin
        Celular := VarToStr(dmuPrincipal.qryCelularVenda['Celular']);
        DDD := VarToStr(dmuPrincipal.qryCelularVenda['DDD']);
        if Celular[1] = '0' then
          Celular := copy(Celular, 2, Length(Celular) - 1);
        if (Length(Celular) = 8) or (Length(Celular) = 9) then
          Celular := DDD + Celular;
        if AnsiContainsStr(ListaNonoDigito, DDD) and ((Length(Celular) = 10))
          then
          Celular := DDD + '9' + copy(Celular, 3, Length(Celular) - 2);
        Result := Celular;
      end
      else
        Result := '';
      if (Result = '') and (dmuPrincipal.qryCelularVenda.RecordCount > 1) then
      begin
        dmuPrincipal.qryCelularVenda.Next;
        Pre := dmuPrincipal.qryCelularVendaCelular.AsString;
        Tamanho := Length(dmuPrincipal.qryCelularVenda['Celular']);
        if (Sms.CelularValido(Pre)) and
          (dmuPrincipal.qryCelularVenda.RecordCount > 0) and (Tamanho <= 12)
          and (Tamanho >= 8) then
        begin
          Celular := VarToStr(dmuPrincipal.qryCelularVenda['Celular']);
          DDD := VarToStr(dmuPrincipal.qryCelularVenda['DDD']);
          if Celular[1] = '0' then
            Celular := copy(Celular, 2, Length(Celular) - 1);
          if (Length(Celular) = 8) or (Length(Celular) = 9) then
            Celular := DDD + Celular;
          if AnsiContainsStr(ListaNonoDigito, DDD) and ((Length(Celular) = 10))
            then
            Celular := DDD + '9' + copy(Celular, 3, Length(Celular) - 2);
          Result := Celular;
        end
        else
          Result := '';
      end;
      if (Result = '') and (dmuPrincipal.qryCelularVenda.RecordCount > 2) then
      begin
        dmuPrincipal.qryCelularVenda.Next;
        Pre := dmuPrincipal.qryCelularVenda['Celular'];
        Tamanho := Length(dmuPrincipal.qryCelularVenda['Celular']);
        if (Sms.CelularValido(Pre)) and
          (dmuPrincipal.qryCelularVenda.RecordCount > 0) and (Tamanho <= 12)
          and (Tamanho >= 8) then
        begin
          Celular := VarToStr(dmuPrincipal.qryCelularVenda['Celular']);
          DDD := VarToStr(dmuPrincipal.qryCelularVenda['DDD']);
          if Celular[1] = '0' then
            Celular := copy(Celular, 2, Length(Celular) - 1);
          if (Length(Celular) = 8) or (Length(Celular) = 9) then
            Celular := DDD + Celular;
          if AnsiContainsStr(ListaNonoDigito, DDD) and ((Length(Celular) = 10))
            then
            DDD := VarToStr(Celular[1]) + VarToStr(Celular[2]);
          Celular := DDD + '9' + copy(Celular, 3, Length(Celular) - 2);
          Result := Celular;
        end
        else
          Result := '';
      end;
      if (Length(Result) = 10) and (AnsiContainsStr(ListaNonoDigito,
          VarToStr(Result[1]) + VarToStr(Result[2]))) then
        Result := VarToStr(Result[1]) + VarToStr(Result[2]) + '9' + copy
          (Celular, 3, Length(Celular) - 2);
    end;

    function BuscaCelularVenda(Cliente, Venda: String): String;
    begin
      Result := '';
      dmuPrincipal.qryCelularVenda.Close;
      dmuPrincipal.qryCelularVenda.Parameters.ParamByName('Cliente')
        .Value := Cliente;
      dmuPrincipal.qryCelularVenda.Open;
      dmuPrincipal.qryCelularVenda.First;
      while not dmuPrincipal.qryCelularVenda.Eof do
      begin
        if Sms.CelularValido(dmuPrincipal.qryCelularVenda['Celular']) then
        begin
          Result := dmuPrincipal.qryCelularVenda['Celular'];
          dmuPrincipal.qryCelularVenda.Last;
        end
        else
          dmuPrincipal.qryCelularVenda.Next;
      end;
      if Result = '' then
      begin
        Result := SegundaChanceCelularVenda;
      end;
    end;

    Function BuscaCelular(Cliente, Tipo: String): String;

      Function TratamentoAbc(Celular: String): String;
      begin
        if Celular = '' then
          Result := ''
        else if (copy(Celular, 1, 2) = '29') or (copy(Celular, 1, 2) = '19') or
          (copy(Celular, 1, 2) = '79') or (copy(Celular, 1, 2) = '59') or
          (copy(Celular, 1, 2) = '54') or (copy(Celular, 1, 2) = '11') or
          (copy(Celular, 1, 2) = '21') or (copy(Celular, 1, 2) = '22') then
        begin
          Result := '3' + Celular;
        end
        else
          Result := Celular;
      end;

    Var
      Celular, DDD, Pre: String;
      Tamanho: Integer;
    begin
      Result := '';
      with dmuPrincipal do
      begin
        qryCelulares.Close;
        qryCelulares.Parameters.ParamByName('Cliente').Value := Cliente;
        qryCelulares.Parameters.ParamByName('Tipo').Value := Tipo;
        qryCelulares.Open;

        if qryCelulares.RecordCount > 0 then
        begin
          Pre := qryCelularesCelular.AsString;
          Tamanho := Length(qryCelulares['Celular']);
        end;
        if (Sms.CelularValido(Pre)) and (qryCelulares.RecordCount > 0) and
          (Tamanho <= 12) and (Tamanho >= 8) then
        begin
          Celular := VarToStr(qryCelulares['Celular']);
          DDD := VarToStr(qryCelulares['DDD']);
          if Celular[1] = '0' then
            Celular := copy(Celular, 2, Length(Celular) - 1);
          if (Length(Celular) = 8) or (Length(Celular) = 9) then
            Celular := DDD + Celular;
          if AnsiContainsStr(ListaNonoDigito, DDD) and ((Length(Celular) = 10))
            then
            Celular := DDD + '9' + copy(Celular, 3, Length(Celular) - 2);
          Result := Celular;
        end
        else
          Result := '';
        if (Result = '') and (qryCelulares.RecordCount > 1) then
        begin
          qryCelulares.Next;
          Pre := qryCelularesCelular.AsString;
          Tamanho := Length(qryCelulares['Celular']);
          if (Sms.CelularValido(Pre)) and (qryCelulares.RecordCount > 0) and
            (Tamanho <= 12) and (Tamanho >= 8) then
          begin
            Celular := VarToStr(qryCelulares['Celular']);
            DDD := VarToStr(qryCelulares['DDD']);
            if Celular[1] = '0' then
              Celular := copy(Celular, 2, Length(Celular) - 1);
            if (Length(Celular) = 8) or (Length(Celular) = 9) then
              Celular := DDD + Celular;
            if AnsiContainsStr(ListaNonoDigito, DDD) and
              ((Length(Celular) = 10)) then
              Celular := DDD + '9' + copy(Celular, 3, Length(Celular) - 2);
            Result := Celular;
          end
          else
            Result := '';
        end;
        if (Result = '') and (qryCelulares.RecordCount > 2) then
        begin
          qryCelulares.Next;
          Pre := qryCelularesCelular.AsString;
          Tamanho := Length(qryCelulares['Celular']);
          if (Sms.CelularValido(Pre)) and (qryCelulares.RecordCount > 0) and
            (Tamanho <= 12) and (Tamanho >= 8) then
          begin
            Celular := VarToStr(qryCelulares['Celular']);
            DDD := VarToStr(qryCelulares['DDD']);
            if Celular[1] = '0' then
              Celular := copy(Celular, 2, Length(Celular) - 1);
            if (Length(Celular) = 8) or (Length(Celular) = 9) then
              Celular := DDD + Celular;
            if AnsiContainsStr(ListaNonoDigito, DDD) and
              ((Length(Celular) = 10)) then
              DDD := VarToStr(Celular[1]) + VarToStr(Celular[2]);
            Celular := DDD + '9' + copy(Celular, 3, Length(Celular) - 2);
            Result := Celular;
          end
          else
            Result := '';
        end;
        Result := TratamentoAbc(Result);
        if (Length(Result) = 10) and (AnsiContainsStr(ListaNonoDigito,
            VarToStr(Result[1]) + VarToStr(Result[2]))) then
          Result := VarToStr(Result[1]) + VarToStr(Result[2]) + '9' + copy
            (Celular, 3, Length(Celular) - 2);
        if Result = '' then
        begin
          Result := BuscaCelularVenda(Cliente, '');
        end;
      end;

    end;

    Function BuscaEmail(Cliente, Tipo: String): String;
    begin
      Result := '';
      with dmuPrincipal do
      begin
        qryEmail.Close;
        qryEmail.Parameters.ParamByName('Cliente').Value := Cliente;
        qryEmail.Parameters.ParamByName('Tipo').Value := Tipo;
        qryEmail.Open;
        if qryEmail.RecordCount > 0 then
          Result := qryEmail['Valor'];
      end;
    end;

    { Procedure BuscaInadimplentes(DiasInicial : Integer;DiasFinal : Integer;ValorMinimo : Real;Tipos : string;ListaNenviar : String);
      var
      Sql : String;
      Arq : TextFile;
      begin
      with dmuPrincipal do
      begin
      qryInadimplentes.close;
      qryInadimplentes.SQL[8]:=  'And DateDiff(Day,Vencimento,Getdate())  > ' + IntToStr(DiasInicial) +' and ' + ' DATEDIFF(Day,Vencimento,Getdate())  < ' + IntToStr(DiasFinal);
      qryInadimplentes.SQL[7]:=  'and VALORNAMOEDA1  > ' + FloatToStr(ValorMinimo);
      qryInadimplentes.SQL[9]:=  'And Rtipo in ('+ Tipos+')';
      qryInadimplentes.SQL[10]:= 'And Rcliente not in ('+ListaNenviar+')' ;
      if Sms.ckLimitaFiliaisCobranca.Checked then
      qryInadimplentes.SQL[11]:= 'And FILIALCAD.Filial in ('+Sms.edFiliaisCobranca.Text+')'
      else
      qryInadimplentes.SQL[11]:= '';
      showmessage('Entrou');
      Sql := qryInadimplentes.SQL.Text;
      AssignFile(Arq,'SqlInadimplentes.txt');
      Rewrite(Arq);
      Writeln(Arq,Sql);
      CloseFile(Arq);
      Inputquery('Copie este codigo e envie ao suporte por email','SimplesSms@gmail.com.br',Sql);
      try
      qryInadimplentes.Open;
      Except
      Sql := qryInadimplentes.SQL.Text;
      Inputquery('Copie este codigo e envie ao suporte por email','SimplesSms@gmail.com.br',Sql);
      end;

      end;
      end; }

    procedure TSms.mmMensagemPromocaoChange(Sender: TObject);
    begin
      if mmMensagemPromocao.Text <> '' then
        mmFaltaCaracteresPromocao.Caption := IntToStr(ContaStringFalta('160',
            mmMensagemPromocao.Text));
    end;

    procedure TSms.mmMensagemAvisoEntregaFiliaisChange(Sender: TObject);
    begin
      if mmMensagemAvisoEntregaFiliais.Text <> '' then
        mmFaltaCaracteresAvisoEntregaFilial.Caption :=
          'Caracteres Faltantes : ' + IntToStr
          (ContaStringFalta('160', mmMensagemAvisoEntregaFiliais.Text));
    end;

    procedure TSms.btSalvarPromocaoClick(Sender: TObject);
    begin
      SalvarTela('Promo��o.txt', Trim(mmMensagemPromocao.Text),
        Trim(mmDatasPromocao.Text), mkhoraInicioPromocao.Text,
        IntToStr(rgMaxSmsMarketing.ItemIndex), edMaxSmsPromocao.Text,
        BoolToStr(ckNEnviarNEnviados.Checked), '', '', '');
      mmMsgMarketing.Lines.Text :=
        'Configura��o de Marketing Salvas com Sucesso';
    end;

    procedure TSms.btSalvarSatisfacaoClick(Sender: TObject);
    begin
      SalvarTela('Satisfacao.txt', mmMensagemSatisfacao.Text,
        mmMensagemSatisfacaoNotaRuim.Text, edEmailSatisfacao.Text,
        edCelularSatisfacao.Text, '', '', '', '', '');
      mmMsgSatisfacao.Lines.Text :=
        'Configura��o de Satisfa��o Salvas com Sucesso';
    end;

    procedure TSms.btTesteFtpClick(Sender: TObject);
    begin
      Application.ProcessMessages;
      EnviaAcrescentaArquivo('PSmsEmail.exe', true, False);
    end;

    procedure TSms.btSalvarInadimplenciaClick(Sender: TObject);
    begin
      SalvarTela('Inadimplentes.txt', Trim(mmMensagemInadimplente.Text),
        edMinDiasVencidos.Text, edMaxDiasVencidos.Text, edMinValorVencido.Text,
        Trim(mmListaNEnviarCobranca.Text),
        IntToStr(rgMaxSmsCobranca.ItemIndex), edMaxSmsInadimpentes.Text,
        Trim(mmListaTiposDocumentos.Text), mkHoraInicioInadimplentes.Text);
      mmMsgCobranca.Lines.Text := 'Configura��o de Cobran�a Salvas com Sucesso';
    end;

    procedure TSms.btSalvarAvisoEntregaClick(Sender: TObject);
    begin
      SalvarTela('AvisoEntrega.txt', Trim(mmMensagemAvisoEntregaFiliais.Text),
        mkHoraInicioAvisoEntrega.Text, mkHoraFinalAvisoEntrega.Text,
        IntToStr(rgMaxSmsEntrega.ItemIndex), edMaxSmsEntrega.Text,
        (cbListaCategorias.KeyValue), IntToStr(rgAguardarpor.ItemIndex),
        edNomeSerie.Text, edEsperaEnvio.Text);
      mmMsgEntrega.Lines.Text :=
        'Configura��o de Aviso de Entrega Salvas com Sucesso';
    end;

    procedure TSms.sbAdicionaDataPromocaoClick(Sender: TObject);
    begin
      mmDatasPromocao.Text := Trim(mmDatasPromocao.Text);
      if rgPorDataPorDiaMarketing.ItemIndex = 0 then
        mmDatasPromocao.Lines.Add(DateToStr(tpSelecionaDataPromocao.Date))
      else
        mmDatasPromocao.Lines.Add(cbEscolhaDiaMarketing.Text);
    end;

    procedure TSms.sbRemoverDataPromocaoClick(Sender: TObject);
    begin
      mmDatasPromocao.SelText := '';
    end;

    procedure TSms.sbRemoverLIistaNEnviarCobrancaClick(Sender: TObject);
    begin
      mmListaNEnviarCobranca.SelText := '';
    end;

    { procedure CriaListaJaEnviados(Cliente : String);
      Begin
      AssignFile(ListaEnviados,'JaEnviados.txt');
      Append(ListaEnviados);
      if GetFileSize('JaEnviados.txt') <= 0 then
      writeln(ListaEnviados,Cliente)
      else
      writeln(ListaEnviados,','+Cliente);
      CloseFile(ListaEnviados);
      //Sms.btZerarNEnviados.Enabled := True;
      end; }

    procedure BuscaAniversariantes(Mes, Dia: Integer);
    begin
      with dmuPrincipal do
      begin
        qryAniversariantes.Close;
        qryAniversariantes.Parameters.ParamByName('Mes').Value := Mes;
        qryAniversariantes.Parameters.ParamByName('Dia').Value := Dia;
        qryAniversariantes.Open;
      end;
    end;

    procedure BuscarClientes(NEnviarEnviados, Filtrar, Filtro, ParametroFiltro,
      ParametroFiltro2, ParametroFiltro3: String);
    var
      Clientes: TMemo;
      SQL: String;
    begin
      if NEnviarEnviados = 'Sim' then
      begin
        Clientes := TMemo.create(nil);
        Clientes.Parent := Sms;
        Clientes.Hide;
        dmuPrincipal.qryRelClientes.SQL.Clear;
        if FileExists('JaEnviados.txt') then
          Clientes.Lines.LoadFromFile('JaEnviados.txt');
      end;
      dmuPrincipal.qryRelClientes.Close;
      if (Filtrar = 'Sim') and (NEnviarEnviados = 'Sim') then
        dmuPrincipal.qryRelClientes.SQL.Text :=
          'select oid,NOME,RAZSOC from CLIENTECAD where  ' +
          FiltroClienteMarketing(Filtro, ParametroFiltro, ParametroFiltro2,
          ParametroFiltro3);
      if (Filtrar = 'Sim') and (NEnviarEnviados = 'N�o') then
        dmuPrincipal.qryRelClientes.SQL.Text :=
          'select oid,NOME,RAZSOC from CLIENTECAD where ' +
          FiltroClienteMarketing(Filtro, ParametroFiltro, ParametroFiltro2,
          ParametroFiltro3);
      if (Filtrar = 'N�o') and (NEnviarEnviados = 'Sim') then
        dmuPrincipal.qryRelClientes.SQL.Text :=
          'select oid,NOME,RAZSOC from CLIENTECAD ';
      if (Filtrar = 'N�o') and (NEnviarEnviados = 'N�o') then
        dmuPrincipal.qryRelClientes.SQL.Text :=
          'select oid,NOME,RAZSOC from CLIENTECAD ';
      if Filtro = 'Comprou No Periodo' then
      begin
        SQL := dmuPrincipal.qryRelClientes.SQL.Text;
        // inputquery('Copie e envie este codigo por Email ao suporte','SimplesSms@gmail.com',Sql);
        Sms.CriaArquivoTxt('sqlprodutosempromocaoperiodo.txt', SQL);
      end;
      Try
        dmuPrincipal.qryRelClientes.Open;
      Except
        Sms.tVerificaAgendamentos.Enabled := False;
        SQL := dmuPrincipal.qryRelClientes.SQL.Text;
        inputquery('Copie e envie este codigo por Email ao suporte',
          'SimplesSms@gmail.com', SQL);
        Sms.tVerificaAgendamentos.Enabled := true;
      end;
    end;

    procedure GravandoNumeroMsgNaoEnviadas(Promocao, Cobranca, Entrega,
      Aniversario: String);
    var
      Arq: TextFile;
      LPromocao, LCobranca, LEntrega, LAniversario: String;
    begin
      if FileExists('NumeroMsgNaoEnviadas.txt') then
      begin
        AssignFile(Arq, 'NumeroMsgNaoEnviadas.txt');
        Reset(Arq);
        Readln(Arq, LPromocao);
        Readln(Arq, LCobranca);
        Readln(Arq, LEntrega);
        Readln(Arq, LAniversario);
        CloseFile(Arq);
      end
      else
      begin
        LPromocao := '0';
        LCobranca := '0';
        LEntrega := '0';
        LAniversario := '0';
      end;
      AssignFile(Arq, 'NumeroMsgNaoEnviadas.txt');
      Rewrite(Arq);
      if Promocao = '0' then
        Writeln(Arq, LPromocao)
      else
        Writeln(Arq, Promocao);
      if Cobranca = '0' then
        Writeln(Arq, LCobranca)
      else
        Writeln(Arq, Cobranca);
      if Entrega = '0' then
        Writeln(Arq, LEntrega)
      else
        Writeln(Arq, Entrega);
      if Aniversario = '0' then
        Writeln(Arq, LAniversario)
      else
        Writeln(Arq, Aniversario);
      CloseFile(Arq);
    end;

    procedure TSms.btIniciaPromocaoClick(Sender: TObject);
    var
      Contador: Integer;
      Mensagem, Celular, Comando, SQL, ParametroFiltro, ParametroFiltro2,
        ParametroFiltro3: String;
      Texto: PansiChar;
      Arq, ArqEmail: TextFile;
      TotalSms: Integer;
      TotalClientes: Integer;
      ContadorClientes: Integer;
      NumeroSmsEnviadosAgora: Integer;
      ListaNegra: TMemo;
    begin
      NumeroSmsEnviadosAgora := 0;
      TotalClientes := dmuPrincipal.qryRelClientes.RecordCount;
      if rgMaxSmsMarketing.ItemIndex = 0 then
      begin
        TotalSms := TotalClientes;
      end
      else
      begin
        TotalSms := StrToInt(edMaxSmsPromocao.Text);
      end;
      lbEnviadosPromocao.Caption := '0';

      if cbListaFiltrosMarketing.Text = 'Or�amento n�o aprovado em' then
      begin
        ParametroFiltro := edDiasOrcamento.Text;
      end;
      if cbListaFiltrosMarketing.Text = 'Comprou a' then
      begin
        ParametroFiltro := edDiasDeCompra.Text;
      end;
      if cbListaFiltrosMarketing.Text = 'Comprou Produtos da Categoria' then
      begin
        ParametroFiltro := cbListaCategoriasMarketing.Text;
      end;
      if cbListaFiltrosMarketing.Text = 'Possui Produtos em Oferta' then
      begin
        ParametroFiltro := edDiasOrcamento.Text;
      end;
      if cbListaFiltrosMarketing.Text = 'Nota Emitida em' then
      begin
        ParametroFiltro := edDiasOrcamento.Text;
      end;
      if cbListaFiltrosMarketing.Text = 'Indica Categoria  Para' then
      begin
        ParametroFiltro := cbListaCategoriaComprou.Text;
        ParametroFiltro2 := cbListaCategoriaNComprou.Text;
        ParametroFiltro3 := edDiasIndicaCategoria.Text;
      end;
      BuscarClientes(TraduzirNomesck(ckNEnviarNEnviados.Checked),
        TraduzirNomesck(ckFiltrarClientesMarketing.Checked),
        cbListaFiltrosMarketing.Text, ParametroFiltro, ParametroFiltro2,
        ParametroFiltro3);
      ContadorClientes := 0;
      Contador := 0;
      AssignFile(Arq, 'EnviaPromocao.txt');
      Try
        Rewrite(Arq);
      Except
      end;
      TotalClientes := dmuPrincipal.qryRelClientes.RecordCount;
      if TotalClientes = 0 then
      begin
        TotalSms := 0;
        mmListaEnviados.Lines.Add('Sem Clientes para enviar sms');
      end;
      while Contador <= TotalSms - 1 do
      begin
        Application.ProcessMessages;
        if (not(BuscaCelular(dmuPrincipal.qryRelClientes['Oid'],
              '1075,1071') = '')) or (rgOpcaoDeEnvio.ItemIndex = 0) then
        begin
          case rgOpcaoDeEnvio.ItemIndex of
            1:
              Celular := BuscaCelular(dmuPrincipal.qryRelClientes['Oid'],
                '1075,1071');
            0:
              Celular := edCelularTeste.Text;
          end;
          Mensagem := EscolheOpcaoMsg(mmMensagemPromocao.Text);
          Mensagem := SubstituirTexto(mmMensagemPromocao.Text,
            '[cliente______________________________]',
            copy(dmuPrincipal.qryRelClientes['NOME'], 1, 40));
          if (cbListaFiltrosMarketing.Text = 'Possui Produtos em Oferta') and
            (ckFiltrarClientesMarketing.Checked) then
          begin
            BuscaProdutoPedido(dmuPrincipal.qryRelClientes['Oid'],
              edDiasOrcamento.Text);
            Mensagem := SubstituirTexto(Mensagem,
              '[Produto___________________]',
              copy(dmuPrincipal.qryProdutosEmOferta['Descr'], 1, 28));
            Mensagem := SubstituirTexto(Mensagem, '[Pedido]',
              copy(dmuPrincipal.qryProdutosEmOferta['Numped'], 1, 10));
          end;
          if (cbListaFiltrosMarketing.Text = 'Indica Categoria  Para') and
            (ckFiltrarClientesMarketing.Checked) then
          begin
            BuscaProdutoOferta(cbListaCategoriaNComprou.Text);
            if dmuPrincipal.qryCategoriaOferta.RecordCount = 0 then
              Mensagem := SubstituirTexto(Mensagem,
                '[Produto___________________]', '')
            else
              Mensagem := SubstituirTexto(Mensagem,
                '[Produto___________________]',
                copy(dmuPrincipal.qryCategoriaOferta['Descr'], 1, 28));
          end;
          if not EstaNaListaNegra(Celular) then
          begin
            Writeln(Arq, Mensagem);
            Writeln(Arq, Celular);
          end;
          if not VerificaInternet then
          begin
            mmListaEnviados.Lines.Add(
              'Computador Sem internet Verifique sua conex�o');
            mmCaixaDeSaida.Lines.Add('Promo��o ' + FormatDateTime('dd/mm/yyyy',
                Date) + '-' + FormatDateTime('hh:mm:ss',
                Time) + '-' + Celular + ' ' + Mensagem);
          end
          else
          begin
            if EstaNaListaNegra(Celular) then
              mmListaEnviados.Lines.Add
                ('Sms Maketing n�o Enviado Lista Negra' + FormatDateTime
                  ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                  Time) + '-' + Celular + ' ' + Mensagem)
            else
            begin
              mmListaEnviados.Lines.Add('Sms Maketing ' + FormatDateTime
                  ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                  Time) + '-' + Celular + ' ' + Mensagem);
            end;

          end;
          Contador := Contador + 1;
          { if ckNEnviarNEnviados.Checked then
            begin
            if dmuPrincipal.qryCelulares['IdCliente'] <>  null then
            CriaListaJaEnviados(dmuPrincipal.qryCelulares['IdCliente'] );
            end; }

          lbEnviadosPromocao.Caption := IntToStr
            (1 + StrToInt(lbEnviadosPromocao.Caption));
          NumeroSmsEnviadosAgora := NumeroSmsEnviadosAgora + 1;
          if not VerificaInternet then
            mmListaEnviados.Lines.Add(
              'Computador Sem internet Verifique sua conex�o');
        end
        else
          mmListaEnviados.Lines.Add(
            'Sms n�o enviado o cliente n�o possui um celular valido -' +
              'Marketing - ' + copy(dmuPrincipal.qryRelClientes['NOME'], 1,
              40) + ' - ' + FormatDateTime('dd/mm/yyyy',
              Date) + '-' + FormatDateTime('hh:mm:ss', Time));
        dmuPrincipal.qryRelClientes.Next;
        ContadorClientes := ContadorClientes + 1;
        if ContadorClientes = TotalClientes then
          TotalSms := 0;
      end;
      CloseFile(Arq);
      if VerificaInternet then
      Begin
        // EnviaAcrescentaArquivo('EnviaPromocao.txt',True);
        if ckPausarAvisoDeEnvio.Checked = False then
          pcListas.Show;
      end
      else
      begin
        tAguardaReconexao.Enabled := true;
        mmCaixaDeSaida.Lines.SaveToFile('NaoEnviadas.txt');
        pcCaixaDeSaida.Show;
        lbEnviadosPromocao.Caption := IntToStr
          (StrToInt(lbEnviadosPromocao.Caption) - NumeroSmsEnviadosAgora);
        GravandoNumeroMsgNaoEnviadas(IntToStr(NumeroSmsEnviadosAgora),
          IntToStr(0), IntToStr(0), IntToStr(0));
      end;
    end;

    procedure BaixarDllNecessarias;
    begin
      if FileExists('libmySQL.dll') = False then
        BaixaFtp('libmySQL.dll');
      if FileExists('dbxopenmysql50.dll') = False then
        BaixaFtp('dbxopenmysql50.dll');
      if FileExists('libmysqld.dll') = False then
        BaixaFtp('libmysqld.dll');
      if FileExists('Midas.dll') = False then
        BaixaFtp('Midas.dll');
    end;

    procedure TSms.FormCreate(Sender: TObject);
    begin
      { Esconde o ComboBox }

      { try
        BaixarDllNecessarias;
        Except

        end; }
      ShortDateFormat := 'dd/mm/yyyy';
      tpSelecionaDataPromocao.Date := StrToDate(FormatDateTime('dd/mm/yyyy',
          Date));
    end;

    procedure TSms.IdFTPWork(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    var
      TotalBytes: string;
    begin
      { lblTaxa.Caption := IntToStr(AWorkCount) + ' bytes de ' + TotalBytes + ' bytes';
        pgTranferencia.Position := aWorkCount;
        pgTranferencia.Update; }
    end;

    procedure TSms.IdFTPWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    var
      TotalBytes: string;
    begin
      { TotalBytes := IntToStr(AWorkCountMax);
        pgTranferencia.Max := AWorkCountMax;
        lblTaxa.Caption := '0 bytes de ' + TotalBytes + ' bytes'; }
    end;

    procedure TSms.IdFTPWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    begin
      { lblTaxa.Caption := 'Transfer�ncia completa.';
        lblTaxa.Caption := 'Transfer�ncia';
        pgTranferencia.Position :=0; }
    end;

    procedure TSms.tVerificaTimer(Sender: TObject);
    var
      i: Integer;
    begin
      if (btAtivaDesativaInadimplentes.Caption = 'Desativar') and
        (PermitidaVerificacaoNodia) then
      begin
        if VerificaProgramacao(lbUltimoEnvioInadimplentesSms.Caption, 'N�o',
          mkHoraInicioInadimplentes.Text) = true then
        begin
          lbUltimoEnvioInadimplentesSms.Caption := FormatDateTime('dd/mm/yyyy',
            Date);
          btIniciaInadimplentes.Click;
          if ckEnviaEmailCobranca.Checked then
          begin
            lbUltimoEnvioCobrancaEmail.Caption := FormatDateTime('dd/mm/yyyy',
              Date);
            btIniciaInadimplentesEmail.Click;
          end;
        end;
      end;

      if (btAtivarAvisoVencimento.Caption = 'Desativar') and
        (PermitidaVerificacaoNodia) then
      begin
        if VerificaProgramacao(lbUltimoEnvioSmsAvisoVencimento.Caption, 'N�o',
          edHoraAvisoVencimento.Text) = true then
        begin
          lbUltimoEnvioSmsAvisoVencimento.Caption := FormatDateTime
            ('dd/mm/yyyy', Date);
          btIniciaAvisoVencimentoSms.Click;
          if ckEnviaEmailAvisoVencimento.Checked then
          begin
            lbUltimoEnvioSmsAvisoVencimento.Caption := FormatDateTime
              ('dd/mm/yyyy', Date);
            btIniciaAvisoVencimentoEmail.Click;
          end;
        end;
      end;

      if (btAtivarDesativarAniversario.Caption = 'Desativar') and
        (PermitidaVerificacaoNodia) then
      begin
        if VerificaProgramacao(lbUltimoEnvioAniversario.Caption, 'N�o',
          mkHoraIncioAniversario.Text) = true then
        begin
          lbUltimoEnvioAniversario.Caption := FormatDateTime('dd/mm/yyyy',
            Date);
          btIniciarAniversario.Click;
        end;
      end;

      // lbStatusGeral.Caption := 'Verifica��o Terminada';
    end;

    procedure TSms.btInserirClientePromocaoClick(Sender: TObject);
    begin
      if (pos('[cliente______________________________]',
          UltimoControleOpcaoTextoMarketing.Text) > 0) then
        ShowMessage('J� existe a variavel na mensagem')
      else
        UltimoControleOpcaoTextoMarketing.SelText :=
          '[cliente______________________________]';
    end;

    procedure BuscarInadimplentes;
    var
      LTipo, SQL: String;
      Contador: Integer;
      Arq: TextFile;
    begin
      Contador := 0;
      while Contador <= Sms.mmListaTiposDocumentos.Lines.Count do
      begin
        LTipo := LTipo + Sms.mmListaTiposDocumentos.Lines[Contador];
        Contador := Contador + 1;
      end;
      with dmuPrincipal do
      begin
        qryInadimplentes.Close;
        qryInadimplentes.SQL[7] := 'AND NTIPO IN (' + LTipo + ')';
        if Trim(Sms.mmListaNEnviarCobranca.Text) = '' then
          qryInadimplentes.SQL[8] := ''
        else
          qryInadimplentes.SQL[8] := 'AND NCLIENTE NOT IN (' + Trim
            (Sms.mmListaNEnviarCobranca.Text) + ')';
        qryInadimplentes.SQL[9] :=
          'and DATEDIFF(DAY,VENCIMENTO,GETDATE())  >= ' +
          Sms.edMinDiasVencidos.Text
          + ' and  DATEDIFF(DAY,VENCIMENTO,GETDATE())   <= ' + (Sms.edMaxDiasVencidos.Text);
        qryInadimplentes.SQL[10] := 'and VALORNAMOEDA1-CREDITOACUMULADO >' +
          (Sms.edMinValorVencido.Text);
        if Sms.ckLimitaFiliaisCobranca.Checked then
          qryInadimplentes.SQL[11] :=
            'And FILIALCAD.Filial in (' + Sms.edFiliaisCobranca.Text + ')'
        else
          qryInadimplentes.SQL[11] := '';
        Try
          qryInadimplentes.Open;
        Except
          SQL := qryInadimplentes.SQL.Text;
          inputquery('Copie este codigo e envie ao suporte por email',
            'SimplesSms@gmail.com.br', SQL);
        end;
      end;
    end;

    procedure BuscarParcelasProximasVencimento;
    var
      LTipo: String;
      Contador: Integer;
    var
      SQL: String;
    begin
      Contador := 0;
      while Contador <= Sms.mmListaTipoDocumentoAvisoVencimento.Lines.Count do
      begin
        LTipo := LTipo + Sms.mmListaTipoDocumentoAvisoVencimento.Lines
          [Contador];
        Contador := Contador + 1;
      end;
      with dmuPrincipal do
      begin
        qryParcelasVencer.Close;
        qryParcelasVencer.SQL[15] := 'NTIPO IN (' + LTipo + ')';
        if Trim(Sms.mmListaNegraAvisoVencimento.Text) = '' then
          qryParcelasVencer.SQL[16] := ''
        else
          qryParcelasVencer.SQL[16] := 'AND NCLIENTE NOT IN (' + Trim
            (Sms.mmListaNegraAvisoVencimento.Text) + ')';
        qryParcelasVencer.SQL[17] :=
          'and abs(DATEDIFF(DAY,VENCIMENTO,GETDATE()))  <= ' +
          Sms.edMinDiasAvisoVencimento.Text;
        qryParcelasVencer.SQL[18] :=
          'and abs(DATEDIFF(DAY,VENCIMENTO,GETDATE()))   >= ' +
          (Sms.edMaxDiasAvisoVencimento.Text);
        qryParcelasVencer.SQL[19] := 'and VALORNAMOEDA1-CREDITOACUMULADO >' +
          (Sms.edValorAvisoVencimento.Text);
        // Sql := qryParcelasVencer.SQL.Text;
        // InputQuery('','',Sql);
        qryParcelasVencer.Open;
      end;
    end;

    procedure TSms.btIniciaInadimplentesClick(Sender: TObject);
    var
      Contador: Integer;
      Mensagem, Celular, Comando: String;
      Texto: PansiChar;
      Arq: TextFile;
      TotalSms: Integer;
      ContadorCobrancas: Integer;
      TotalInadimplentes: Integer;
      NumeroSmsEnviadosAgora: Integer;
    begin
      BuscarInadimplentes;
      lbEnviadosCobranca.Caption := '0';
      TotalInadimplentes := dmuPrincipal.qryInadimplentes.RecordCount;
      if rgMaxSmsCobranca.ItemIndex = 0 then
        TotalSms := TotalInadimplentes
      else
        TotalSms := StrToInt(edMaxSmsInadimpentes.Text);

      Contador := 0;
      ContadorCobrancas := 0;
      if TotalInadimplentes = 0 then
      begin
        mmListaEnviados.Lines.Add('Sem Inadimplentes para enviar sms');
        TotalSms := 0;
      end;
      while Contador <= TotalSms - 1 do
      begin
        Mensagem := mmMensagemInadimplente.Text;
        Mensagem := SubstituirTexto(Mensagem,
          '[cliente______________________________]',
          copy(dmuPrincipal.qryInadimplentes['NCLIENTE'], 1, 40));
        Mensagem := SubstituirTexto(Mensagem, '[Vencimento]',
          dmuPrincipal.qryInadimplentes['Vencimento']);
        // Mensagem := SubstituirTexto(Mensagem,'[Valor]',formatfloat('"R$ ",.00',dmuPrincipal.qryParcelasVencer.fieldbyname('ValorNaMoeda1').AsCurrency));
        // Mensagem := SubstituirTexto(Mensagem,'[Valor+Juros]',dmuPrincipal.qryInadimplentes['ValorComJuros']);  preciso travar o campo
        Mensagem := SubstituirTexto(Mensagem, '[TipoVencimento]',
          dmuPrincipal.qryInadimplentes['Ntipo']);
        Mensagem := SubstituirTexto(Mensagem, '[Dias]',
          dmuPrincipal.qryInadimplentes['Dias']);
        Mensagem := SubstituirTexto(Mensagem, '[Numero]',
          dmuPrincipal.qryInadimplentes['Codigo']);
        if (not(BuscaCelular(dmuPrincipal.qryInadimplentes['RCLIENTE'],
              '1075') = '')) or (rgOpcaoDeEnvio.ItemIndex = 0) then
        begin
          case rgOpcaoDeEnvio.ItemIndex of
            1:
              Celular := BuscaCelular
                (dmuPrincipal.qryInadimplentes['RCLIENTE'], '1075,1071');
            0:
              Celular := edCelularTeste.Text;
          end;
          if not EstaNaListaNegra(Celular) then
          begin
            InsereSms(Celular, Mensagem);
          end;
          if not VerificaInternet then
          Begin
            mmListaEnviados.Lines.Add(
              'Computador Sem internet Verifique sua conex�o');
            mmCaixaDeSaida.Lines.Add('Cobran�a ' + FormatDateTime('dd/mm/yyyy',
                Date) + '-' + FormatDateTime('hh:mm:ss',
                Time) + '-' + Celular + ' ' + Mensagem);
          end
          else
          begin
            if EstaNaListaNegra(Celular) then
              mmListaEnviados.Lines.Add(
                'Sms Cobran�a N�o Enviado Lista Negra - ' + FormatDateTime
                  ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                  Time) + '-' + Celular + ' ' + Mensagem)
            else
            begin
              mmListaEnviados.Lines.Add('Sms Cobran�a -  ' + FormatDateTime
                  ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                  Time) + '-' + Celular + ' ' + Mensagem);
              // SalvarArquivoHistorico('Sms - Cobran�a - '+FormatDateTime('dd/mm/yyyy',Date)+'-'+FormatDatetime('hh:mm:ss',Time)+'-'+Celular+' '+Mensagem);
            end;
          end;
          Contador := Contador + 1;
          // lbEnviadosCobranca.Caption := IntToStr(StrToInt(lbEnviadosCobranca.Caption)+ 1) ;
          NumeroSmsEnviadosAgora := NumeroSmsEnviadosAgora + 1;
        end
        else
          mmListaEnviados.Lines.Add(
            'Sms n�o enviado o cliente n�o possui um celular valido -' +
              'Cobran�a - ' + copy(dmuPrincipal.qryInadimplentes['NCLIENTE'],
              1, 40) + ' - ' + FormatDateTime('dd/mm/yyyy',
              Date) + '-' + FormatDateTime('hh:mm:ss', Time));
        dmuPrincipal.qryInadimplentes.Next;
        ContadorCobrancas := ContadorCobrancas + 1;
        if ContadorCobrancas = TotalInadimplentes then
          TotalSms := 0;
      end;
      if VerificaInternet = False then
      begin
        // EnviaAcrescentaArquivo('EnviaInadimplentes.txt',True);
      end
      else
      begin
        // tAguardaReconexao.Enabled := True;
        // mmCaixaDeSaida.Lines.SaveToFile('NaoEnviadas.txt');
        // pcCaixaDeSaida.Show;
        if ckPausarAvisoDeEnvio.Checked = False then
          pcListas.Show;
        lbNumeroSmsEnviadosCobranca.Caption := IntToStr
          (StrToInt(lbNumeroSmsEnviadosCobranca.Caption)
            + NumeroSmsEnviadosAgora);
        // GravandoNumeroMsgNaoEnviadas(IntToStr(0),IntToStr(NumeroSmsEnviadosAgora),IntToStr(0),IntToStr(0));
      end;
    end;

    procedure TSms.btInserirClienteInadimplentesClick(Sender: TObject);
    begin
      if pos('[cliente______________________________]',
        mmMensagemInadimplente.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmMensagemInadimplente.SelText :=
          '[cliente______________________________]';
    end;

    procedure TSms.btAtivaDesativaInadimplentesClick(Sender: TObject);
      procedure DesativaAtivarControles(Comando: String);
      begin
        if Comando = 'Desativar' then
        Begin
          btInserirClienteInadimplentes.Enabled := False;
          btInsereVencimentoInadimplentes.Enabled := False;
          btInsereValorInadimplentes.Enabled := False;
          btInsereTipoCobrancaInadimplentes.Enabled := False;
          btDiasVencidosInadimplentes.Enabled := False;
          btInsereNumero.Enabled := False;
          btInsereValorJuros.Enabled := False;
          mmMensagemInadimplente.Enabled := False;
          edMinDiasVencidos.Enabled := False;
          edMaxDiasVencidos.Enabled := False;
          edMinValorVencido.Enabled := False;
          edMaxSmsInadimpentes.Enabled := False;
          mkHoraInicioInadimplentes.Enabled := False;
          cbLIstaClientes.Enabled := False;
          sbAddClienteListaNEnviarCobranca.Enabled := False;
          sbRemoverLIistaNEnviarCobranca.Enabled := False;
          btSalvarInadimplencia.Enabled := False;
          cbTiposDocumentos.Enabled := False;
          sbAddTipo.Enabled := False;
          sbRemoveTipo.Enabled := False;
          rgMaxSmsCobranca.Enabled := False;
          ckEnviaEmailCobranca.Enabled := False;
          if ckEnviaEmailCobranca.Checked then
            rgEmailDeCobranca.Enabled := False;
          gbSelecioneClientesListaNegra.Enabled := False;
          if ckLimitaFiliaisCobranca.Checked then
            edFiliaisCobranca.Enabled := False;
        end;
        if Comando = 'Ativar' then
        Begin
          btInserirClienteInadimplentes.Enabled := true;
          btInsereVencimentoInadimplentes.Enabled := true;
          btInsereNumero.Enabled := true;
          btInsereTipoCobrancaInadimplentes.Enabled := true;
          btDiasVencidosInadimplentes.Enabled := true;
          btInsereValorInadimplentes.Enabled := true;
          btInsereValorJuros.Enabled := true;
          mmMensagemInadimplente.Enabled := true;
          edMinDiasVencidos.Enabled := true;
          edMaxDiasVencidos.Enabled := true;
          edMinValorVencido.Enabled := true;
          edMaxSmsInadimpentes.Enabled := true;
          mkHoraInicioInadimplentes.Enabled := true;
          cbLIstaClientes.Enabled := true;
          sbAddClienteListaNEnviarCobranca.Enabled := true;
          sbRemoverLIistaNEnviarCobranca.Enabled := true;
          btSalvarInadimplencia.Enabled := true;
          cbTiposDocumentos.Enabled := true;
          sbAddTipo.Enabled := true;
          sbRemoveTipo.Enabled := true;
          rgMaxSmsCobranca.Enabled := true;
          ckEnviaEmailCobranca.Enabled := true;
          if ckEnviaEmailCobranca.Checked then
            rgEmailDeCobranca.Enabled := true;
          gbSelecioneClientesListaNegra.Enabled := true;
          if ckLimitaFiliaisCobranca.Checked then
            edFiliaisCobranca.Enabled := true;
        end;
      end;
      Function VerificaPreenchimento: Boolean;
      begin
        Result := False;
        if mmMensagemInadimplente.Text = '' then
        begin
          ShowMessage('Preencha uma mensagem para envio');
          Result := true;
        end;
        if mkHoraInicioInadimplentes.Text = '  :  ' then
        begin
          ShowMessage('Preencha uma hora para programa��o');
          Result := true;
        end;
        if (edMaxSmsInadimpentes.Text = '') and
          (rgMaxSmsCobranca.ItemIndex = 1) then
        begin
          ShowMessage('Preencha um valor de Sms para serem enviados');
          Result := true;
        end;
        if edMinDiasVencidos.Text = '' then
        begin
          ShowMessage('Preencha um valor para minimo de dias vencidos');
          Result := true;
        end;
        if edMaxDiasVencidos.Text = '' then
        begin
          ShowMessage('Preencha um valor para maximo de dias vencidos');
          Result := true;
        end;
        if edMinValorVencido.Text = '' then
        begin
          ShowMessage('Preencha um valor para minimo valor vencido');
          Result := true;
        end;
        if mmListaTiposDocumentos.Text = '' then
        begin
          ShowMessage('Adicione pelo menos um tipo de documento');
          Result := true;
        end;
        if (rgOpcaoDeEnvio.ItemIndex = 0) and
          ((Trim(edCelularTeste.Text) = '') or
            (Length(Trim(edCelularTeste.Text)) < 10)) then
        begin
          ShowMessage('Preencha um celular valido pra teste');
          Result := true;
          edCelularTeste.SetFocus;
        end;
        if (ckEnviaEmailCobranca.Checked) and (edTItuloEmailCobranca.Text = '')
          then
        begin
          ShowMessage('Preencha um Titulo para o Email de Cobran�a');
          Result := true;
          edTItuloEmailCobranca.SetFocus;
        end;
        if (ckEnviaEmailCobranca.Checked) and
          (mmMensagemInadimplenteEmail.Text = '') then
        begin
          ShowMessage('Preencha um Texto para o Email de Cobran�a');
          Result := true;
          mmMensagemInadimplenteEmail.SetFocus;
        end;
        if (ckLimitaFiliaisCobranca.Checked) and (edFiliaisCobranca.Text = '')
          then
        begin
          ShowMessage('Preencha as Filiais de Limita��o');
          Result := true;
          edFiliaisCobranca.SetFocus;
        end;
      end;

    begin
      if VerificaPreenchimento = False then
      Begin
        if btConectaBancoDeDados.Caption = 'Desconectar' then
        begin
          if btAtivaDesativaInadimplentes.Caption = 'Ativar' then
          Begin
            btAtivaDesativaInadimplentes.Caption := 'Desativar';
            btAtivaDesativaInadimplentes.Font.Color := clRed;
            DesativaAtivarControles('Desativar');
            mmMsgCobranca.Lines.Text :=
              'Ativo o Envio de Sms de Cobran�a para inicio as ' +
              mkHoraInicioInadimplentes.Text + ' dos Proximos dias';
          end
          else
          Begin
            btAtivaDesativaInadimplentes.Caption := 'Ativar';
            btAtivaDesativaInadimplentes.Font.Color := clGreen;
            DesativaAtivarControles('Ativar');
            mmMsgCobranca.Clear;
          end;
        end
        else
        begin
          ShowMessage(
            '� Necess�rio se conectar no banco de dados antes Enviar SMS');
          tsConfiguracao.Show;
        end;
        if not VerificaInternet then
          ShowMessage('Computador Sem internet Verifique sua conex�o');
        SalvarStatusBotao(btAtivaDesativaInadimplentes);
      end;
    end;

    procedure TSms.btAtivaDesativaEntregaClick(Sender: TObject);
      procedure DesativaAtivarControles(Comando: String);
      begin
        if Comando = 'Desativar' then
        Begin
          btInsereClienteEntregaFilial.Enabled := False;
          btInsereClienteEntregaCentro.Enabled := False;
          mmMensagemAvisoEntregaCentro.Enabled := False;
          mmMensagemAvisoEntregaFiliais.Enabled := False;
          edFiliais.Enabled := False;
          edCentroDeDistribicao.Enabled := False;
          edMaxSmsEntrega.Enabled := False;
          mkHoraInicioAvisoEntrega.Enabled := False;
          mkHoraFinalAvisoEntrega.Enabled := False;
          btSalvarAvisoEntrega.Enabled := False;
          cbListaCategorias.Enabled := False;
          rgAguardarpor.Enabled := False;
          rgMaxSmsEntrega.Enabled := False;
          edNomeSerie.Enabled := False;
          edEsperaEnvio.Enabled := False;
          ckUsaSerie.Enabled := False;
        end;
        if Comando = 'Ativar' then
        Begin
          btInsereClienteEntregaFilial.Enabled := true;
          mmMensagemAvisoEntregaFiliais.Enabled := true;
          btInsereClienteEntregaCentro.Enabled := true;
          mmMensagemAvisoEntregaCentro.Enabled := true;
          edFiliais.Enabled := true;
          edCentroDeDistribicao.Enabled := true;
          edMaxSmsEntrega.Enabled := true;
          mkHoraInicioAvisoEntrega.Enabled := true;
          mkHoraFinalAvisoEntrega.Enabled := true;
          btSalvarAvisoEntrega.Enabled := true;
          cbListaCategorias.Enabled := true;
          rgAguardarpor.Enabled := true;
          rgMaxSmsEntrega.Enabled := true;
          edNomeSerie.Enabled := true;
          edEsperaEnvio.Enabled := true;
          ckUsaSerie.Enabled := true;
        end;
      end;
      Function VerificaPreenchimento: Boolean;
      begin
        Result := False;
        if (mmMensagemAvisoEntregaFiliais.Text = '') and
          (rgAguardarpor.ItemIndex = 0) then
        begin
          ShowMessage('Preencha uma mensagem para envio');
          Result := true;
        end;
        if (mmMensagemAvisoEntregaCentro.Text = '') then
        begin
          ShowMessage('Preencha uma mensagem para envio');
          Result := true;
        end;
        if mkHoraInicioAvisoEntrega.Text = '  :  ' then
        begin
          ShowMessage('Preencha uma hora para inicio da programa��o');
          Result := true;
        end;
        if mkHoraFinalAvisoEntrega.Text = '  :  ' then
        begin
          ShowMessage('Preencha uma hora para final da programa��o');
          Result := true;
        end;
        if (edMaxSmsEntrega.Text = '') and (rgMaxSmsEntrega.ItemIndex = 1) then
        begin
          ShowMessage('Preencha um valor de Sms para serem enviados');
          Result := true;
        end;
        if cbListaCategorias.Text = '' then
        begin
          ShowMessage('Escolha um tipo de categoria de celular');
          Result := true;
        end;
        if rgOpcaoDeEnvio.ItemIndex = -1 then
        begin
          ShowMessage('Escolha Quando o Sms Ser� Enviado');
          Result := true;
        end;
        if (rgOpcaoDeEnvio.ItemIndex = 0) and
          ((Trim(edCelularTeste.Text) = '') or
            (Length(Trim(edCelularTeste.Text)) < 10)) then
        begin
          ShowMessage('Preencha um celular valido pra teste');
          Result := true;
          edCelularTeste.SetFocus;
        end;
        if (edNomeSerie.Text = '') and (ckUsaSerie.Checked) then
        begin
          ShowMessage('Preencha uma Serie');
          Result := true;
        end;
        if edEsperaEnvio.Text = '' then
        begin
          ShowMessage('Preencha um tempo para espera de envio');
          Result := true;
        end;
      end;

    begin
      if VerificaPreenchimento = False then
      Begin
        if btConectaBancoDeDados.Caption = 'Desconectar' then
        begin
          if btAtivaDesativaEntrega.Caption = 'Ativar' then
          Begin
            btAtivaDesativaEntrega.Caption := 'Desativar';
            btAtivaDesativaEntrega.Font.Color := clRed;
            DesativaAtivarControles('Desativar');
            tVerificaEntrega.Enabled := true;
            mmMsgEntrega.Lines.Text :=
              'Ativo o Envio de Sms de Aviso de Entrega para inicio as ' +
              mkHoraInicioAvisoEntrega.Text + ' dos Proximos dias';
          end
          else
          Begin
            btAtivaDesativaEntrega.Caption := 'Ativar';
            btAtivaDesativaEntrega.Font.Color := clGreen;
            DesativaAtivarControles('Ativar');
            tVerificaEntrega.Enabled := False;
            mmMsgEntrega.Clear;
          end;
        end
        else
        begin
          ShowMessage(
            '� Necess�rio se conectar no banco de dados antes Enviar SMS');
          tsConfiguracao.Show;
        end;
        if not VerificaInternet then
          ShowMessage('Computador Sem internet Verifique sua conex�o');
      end;
      SalvarStatusBotao(btAtivaDesativaEntrega);
    end;

    procedure TSms.btIniciarEntregaClick(Sender: TObject);
    var
      Contador: Integer;
      Mensagem, Celular, Comando, Filial: String;
      Texto: PansiChar;
      Arq: TextFile;
      TotalSms: Integer;
      ContadorEntregas: Integer;
      TotalEntregas: Integer;
      NumeroSmsEnviadosAgora: Integer;
    begin
      lbEnviadosEntrega.Caption := IntToStr(TotalSmsEnviados);
      ContadorEntregas := 0;
      TotalEntregas := dmuPrincipal.qryEntregas.RecordCount;
      if rgMaxSmsEntrega.ItemIndex = 0 then
        TotalSms := TotalEntregas
      else
        TotalSms := StrToInt(edMaxSmsEntrega.Text);
      tVerificaEntrega.Enabled := False;
      Contador := TotalSmsEnviados;

      if TotalEntregas = 0 then
      begin
        TotalSms := 0;
      end;
      while Contador <= TotalSms - 1 do
      begin
        Filial := dmuPrincipal.qryEntregasFilial.Value;
        if AnsiContainsStr(edFiliais.Text, Filial) then
          Mensagem := SubstituirTexto(mmMensagemAvisoEntregaFiliais.Text,
            '[cliente______________________________]',
            copy(dmuPrincipal.qryEntregas['Nome'], 1, 40));
        if AnsiContainsStr(edCentroDeDistribicao.Text, Filial) then
          Mensagem := SubstituirTexto(mmMensagemAvisoEntregaCentro.Text,
            '[cliente______________________________]',
            copy(dmuPrincipal.qryEntregas['Nome'], 1, 40));
        if (not(BuscaCelular(dmuPrincipal.qryEntregas['codclie'],
              IntToStr(cbListaCategorias.KeyValue)) = '')) or
          (rgOpcaoDeEnvio.ItemIndex = 0) then
        begin
          case rgOpcaoDeEnvio.ItemIndex of
            1:
              Celular := BuscaCelular(dmuPrincipal.qryEntregas['codclie'],
                IntToStr(cbListaCategorias.KeyValue));
            0:
              Celular := edCelularTeste.Text;
          end;
          if not EstaNaListaNegra(Celular) then
          begin
            InsereSms(Celular, Mensagem);
          end;
          if not VerificaInternet then
          begin
            mmListaEnviados.Lines.Add(
              'Computador Sem internet Verifique sua conex�o');
            mmCaixaDeSaida.Lines.Add('AvisoEntrega ' + FormatDateTime
                ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                Time) + '-' + Celular + ' ' + Mensagem);
          end
          else
          begin
            if EstaNaListaNegra(Celular) then
              mmListaEnviados.Lines.Add(
                'Sms AvisoEntrega N�o Enviado Lista Negra - ' + FormatDateTime
                  ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                  Time) + '-' + Celular + ' ' + Mensagem)
            else
            begin
              mmListaEnviados.Lines.Add('Sms AvisoEntrega - ' + FormatDateTime
                  ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                  Time) + '-' + Celular + ' ' + Mensagem);
              // SalvarArquivoHistorico('Sms AvisoEntrega - '+FormatDateTime('dd/mm/yyyy',Date)+'-'+FormatDatetime('hh:mm:ss',Time)+'-'+Celular+' '+Mensagem);
            end;
          end;
          Contador := Contador + 1;
          lbEnviadosEntrega.Caption := IntToStr
            (StrToInt(lbEnviadosEntrega.Caption) + 1);
          NumeroSmsEnviadosAgora := NumeroSmsEnviadosAgora + 1;
        end
        else
          mmListaEnviados.Lines.Add(
            'Sms n�o enviado o cliente n�o possui um celular valido -' +
              'Aviso de Entrega - ' + copy(dmuPrincipal.qryEntregas['Nome'], 1,
              40) + ' - ' + FormatDateTime('dd/mm/yyyy',
              Date) + '-' + FormatDateTime('hh:mm:ss', Time));
        dmuPrincipal.qryEntregas.Next;
        ContadorEntregas := ContadorEntregas + 1;
        if ContadorEntregas = TotalEntregas then
          TotalSms := 0;
      end;
      if VerificaInternet then
      begin
        if ckPausarAvisoDeEnvio.Checked = False then
          pcListas.Show;
      end
      else
      begin
        tAguardaReconexao.Enabled := true;
        tVerificaEntrega.Enabled := False;
        mmCaixaDeSaida.Lines.SaveToFile('NaoEnviadas.txt');
        pcCaixaDeSaida.Show;
        lbEnviadosEntrega.Caption := IntToStr
          (StrToInt(lbEnviadosEntrega.Caption) - NumeroSmsEnviadosAgora);
        GravandoNumeroMsgNaoEnviadas(IntToStr(0), IntToStr(0),
          IntToStr(NumeroSmsEnviadosAgora), IntToStr(0));
      end;
      lbUltimaEntrega.Caption := dmuPrincipal.qryEntregas['numnota'];
      TotalSmsEnviados := StrToInt(lbEnviadosEntrega.Caption);
      tVerificaEntrega.Enabled := true;
    end;

    procedure TSms.btInsereClienteEntregaFilialClick(Sender: TObject);
    begin
      if pos('[cliente______________________________]',
        mmMensagemAvisoEntregaFiliais.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmMensagemAvisoEntregaFiliais.SelText :=
          '[cliente______________________________]';
    end;

    procedure TSms.btAtivaDesativaPromocaoClick(Sender: TObject);
      Function OrganizaDatas: String;
      Var
        Contador: Integer;
      begin
        Contador := 0;
        While Contador <= mmDatasPromocao.Lines.Count do
        begin
          Result := Result + mmDatasPromocao.Lines[Contador] + ',';
          Contador := Contador + 1;
        end;
      end;
      procedure DesativaAtivarControles(Comando: String);
      begin
        if Comando = 'Desativar' then
        Begin
          btInserirClientePromocao.Enabled := False;
          mmMensagemPromocao.Enabled := False;
          tpSelecionaDataPromocao.Enabled := False;
          sbAdicionaDataPromocao.Enabled := False;
          sbRemoverDataPromocao.Enabled := False;
          mkhoraInicioPromocao.Enabled := False;
          ckNEnviarNEnviados.Enabled := False;
          // btZerarNEnviados.Enabled := False;
          edMaxSmsPromocao.Enabled := False;
          btSalvarPromocao.Enabled := False;
          rgMaxSmsMarketing.Enabled := False;
          ckFiltrarClientesMarketing.Enabled := False;
          gbFiltrosMarketing.Enabled := False;
          cbListaFiltrosMarketing.Enabled := False;
          edDiasOrcamento.Enabled := False;
          edDiasDeCompra.Enabled := False;
          cbListaCategoriasMarketing.Enabled := False;
          btAgendarMarketing.Enabled := False;
          mmMensagemPromocaoEmail.Enabled := False;
          ckEnviaEmail.Enabled := False;
          EdTitulo.Enabled := False;
        end;
        if Comando = 'Ativar' then
        Begin
          btInserirClientePromocao.Enabled := true;
          mmMensagemPromocao.Enabled := true;
          tpSelecionaDataPromocao.Enabled := true;
          sbAdicionaDataPromocao.Enabled := true;
          sbRemoverDataPromocao.Enabled := true;
          mkhoraInicioPromocao.Enabled := true;
          ckNEnviarNEnviados.Enabled := true;
          // btZerarNEnviados.Enabled := True;
          edMaxSmsPromocao.Enabled := true;
          btSalvarPromocao.Enabled := true;
          rgMaxSmsMarketing.Enabled := true;
          ckFiltrarClientesMarketing.Enabled := true;
          gbFiltrosMarketing.Enabled := true;
          cbListaFiltrosMarketing.Enabled := true;
          edDiasOrcamento.Enabled := true;
          edDiasDeCompra.Enabled := true;
          cbListaCategoriasMarketing.Enabled := true;
          btAgendarMarketing.Enabled := true;
          mmMensagemPromocaoEmail.Enabled := true;
          ckEnviaEmail.Enabled := true;
          EdTitulo.Enabled := true;
        end;
      end;
      Function VerificaPreenchimento: Boolean;
      begin
        Result := False;
        if mmMensagemPromocao.Text = '' then
        begin
          ShowMessage('Preencha uma mensagem para envio');
          Result := true;
        end;
        if mmDatasPromocao.Text = '' then
        begin
          ShowMessage('Adicione uma data para Marketing');
          Result := true;
        end;
        if mkhoraInicioPromocao.Text = '  :  ' then
        begin
          ShowMessage('Preencha uma hora para Marketing');
          Result := true;
        end;
        if (edMaxSmsPromocao.Text = '') and (rgMaxSmsMarketing.ItemIndex = 1)
          then
        begin
          ShowMessage('Preencha um valor de Sms para serem enviados');
          Result := true;
        end;
        if (rgOpcaoDeEnvio.ItemIndex = 0) and
          ((Trim(edCelularTeste.Text) = '') or
            (Length(Trim(edCelularTeste.Text)) < 10)) then
        begin
          ShowMessage('Preencha um celular valido pra teste');
          Result := true;
          edCelularTeste.SetFocus;
        end;
        if ckFiltrarClientesMarketing.Checked and
          (cbListaFiltrosMarketing.Text = '') then
        begin
          ShowMessage('A op��o de filtro est� ativa ent�o selecione um filtro');
          Result := true;
          cbListaFiltrosMarketing.SetFocus;
        end;
      end;

    begin
      { if VerificaPreenchimento  = False then
        Begin
        if btConectaBancoDeDados.Caption = 'Desconectar' then
        begin
        if btAtivaDesativaPromocao.Caption = 'Ativar' then
        Begin
        btAtivaDesativaPromocao.Caption := 'Desativar' ;
        btAtivaDesativaPromocao.Font.Color := clRed;
        DesativaAtivarControles('Desativar');
        mmMsgMarketing.Lines.Text := 'Ativo o Envio de Sms de Marketing para inicio as ' +
        mkhoraInicioPromocao.Text + ' nos dias : ' ;
        mmMsgMarketing.Lines.Add(OrganizaDatas);
        end else
        Begin
        btAtivaDesativaPromocao.Caption := 'Ativar';
        btAtivaDesativaPromocao.Font.Color := clGreen;
        DesativaAtivarControles('Ativar');
        mmMsgMarketing.Clear;
        end;
        end else
        begin
        ShowMessage('� Necess�rio se conectar no banco de dados antes Enviar SMS');
        tsConfiguracao.Show;
        end;
        if not VerificaInternet then
        Showmessage('Computador Sem internet Verifique sua conex�o');
        end; }
    end;

    Function BuscaEntregas(UltimaEntrega: String): Boolean;
    var
      SQL: String;
    begin
      Result := False;
      dmuPrincipal.qryEntregas.Close;
      dmuPrincipal.qryEntregas.SQL[8] :=
        'and serie like ' + '''%' + Sms.edNomeSerie.Text + '%''';
      dmuPrincipal.qryEntregas.SQL[13] :=
        'and convert(nvarchar(5),Dateadd(MI,' +
        Sms.edEsperaEnvio.Text +
        ',c.DtEmis),108) < = convert(nvarchar(5),GETDATE(),108)';
      dmuPrincipal.qryEntregas.Parameters.ParamByName('UltimaNota').Value :=
        UltimaEntrega;
      dmuPrincipal.qryEntregas.Open;
      // Sql := dmuPrincipal.qryEntregas.SQL.Text;
      // inputquery('Sql Entregas','',Sql);
      if dmuPrincipal.qryEntregas.RecordCount > 0 then
        Result := true;
    end;

    Function BuscaCargas(UltimaEntrega: String): Boolean;
    begin
      Result := False;
      dmuPrincipal.qryCargas.Close;
      dmuPrincipal.qryCargas.Parameters.ParamByName('UltimaCarga').Value :=
        UltimaEntrega;
      dmuPrincipal.qryCargas.Open;
      if dmuPrincipal.qryCargas.RecordCount > 0 then
        Result := true;
    end;

    procedure TSms.tVerificaEntregaTimer(Sender: TObject);
    Var
      MaxSms: Integer;
      SQL: String;
    begin
      if rgMaxSmsEntrega.ItemIndex = 0 then
        MaxSms := 900000000
      else
        MaxSms := StrToInt(edMaxSmsEntrega.Text);
      if (btAtivaDesativaEntrega.Caption = 'Desativar') and
        (MaxSms <> TotalSmsEnviados) and (PermitidaVerificacaoNodia) then
      begin
        if (FormatDateTime('hh:mm', Time) >= mkHoraInicioAvisoEntrega.Text) and
          (FormatDateTime('hh:mm', Time) <= mkHoraFinalAvisoEntrega.Text) then
        begin
          case rgAguardarpor.ItemIndex of
            0:
              Begin
                if (FormatDateTime('hh:mm',
                    Time) = mkHoraInicioAvisoEntrega.Text) then
                begin
                  dmuPrincipal.qryUltimaNota.Close;
                  if ckUsaSerie.Checked then
                    dmuPrincipal.qryUltimaNota.SQL[2] :=
                      'and serie like ' + '''%' + Sms.edNomeSerie.Text + '%'''
                  else
                    dmuPrincipal.qryUltimaNota.SQL[2] := '';
                  dmuPrincipal.qryUltimaNota.Open;
                  // Sql :=  dmuPrincipal.qryUltimaNota.SQL.Text;
                  // inputquery('Sql ultima nota','',Sql);
                  lbUltimaEntrega.Caption := dmuPrincipal.qryUltimaNota
                    ['UltimaNota'];
                end;
                if BuscaEntregas(lbUltimaEntrega.Caption) = true then
                  btIniciarEntrega.Click;
              end;
            1:
              begin
                if (FormatDateTime('hh:mm',
                    Time) = mkHoraInicioAvisoEntrega.Text) then
                begin
                  dmuPrincipal.qryUltimaCarga.Close;
                  dmuPrincipal.qryUltimaCarga.Open;
                  lbUltimaCarga.Caption := dmuPrincipal.qryUltimaCarga
                    ['UltimaCarga'];
                end;
                if BuscaCargas(lbUltimaCarga.Caption) = true then
                  btInciaCarga.Click;
              end;
          end;
        end;
      end;
    end;

    Function MontaMensagenPesquisaSatisfacao: String;
    var
      Texto: TMemo;
    begin
      Texto := TMemo.create(Nil);
      Texto.Parent := Sms;
      Texto.Lines.Add(Sms.mmMensagemSatisfacao.Text);
      // Texto.Lines.Add('');
      Texto.Lines.Add('Responda:');
      // Texto.Lines.Add('');
      Texto.Lines.Add('1 - P/ Otimo :-)');
      // Texto.Lines.Add('');
      Texto.Lines.Add('2 - P/ Bom :-*');
      // Texto.Lines.Add('');
      Texto.Lines.Add('3 - P/ Ruim :-(');
      Result := Texto.Text;
      Texto.Destroy;
    end;

    procedure EnviaSmsPesquisaSatisfacao(CodClie, Nome, Tipo: String);
    var
      Contador: Integer;
      Mensagem, Celular: String;
      Arq: TextFile;
      NumeroSmsEnviadosAgora: Integer;
    begin
      Sms.tVerificaPesquisaDeSatisfacao.Enabled := False;
      if Tipo = 'P' then
        Mensagem := MontaMensagenPesquisaSatisfacao;
      if Tipo = 'V' then
        Mensagem := MontaMensagenPesquisaSatisfacao;
      if Tipo = 'R' then
        Mensagem := Trim(Sms.mmMensagemSatisfacaoNotaRuim.Text);

      if (not(BuscaCelular(CodClie, '1075,1071') = '')) or
        (Sms.rgOpcaoDeEnvio.ItemIndex = 0) then
      begin
        case Sms.rgOpcaoDeEnvio.ItemIndex of
          1:
            Celular := BuscaCelular(CodClie, '1075,1071');
          0:
            Celular := Sms.edCelularTeste.Text;
        end;
        if not EstaNaListaNegra(Celular) then
        begin
          Sms.InsereSms(Celular, Mensagem);
        end;
        if not VerificaInternet then
        begin
          Sms.mmListaEnviados.Lines.Add(
            'Computador Sem internet Verifique sua conex�o');
          Sms.mmCaixaDeSaida.Lines.Add
            ('Sms PesquisaSatisfa��o ' + FormatDateTime('dd/mm/yyyy',
              Date) + '-' + FormatDateTime('hh:mm:ss',
              Time) + '-' + Celular + ' ' + Mensagem);
        end
        else
        begin
          if EstaNaListaNegra(Celular) then
            Sms.mmListaEnviados.Lines.Add(
              'Sms PesquisaSatisfa��o N�o Enviado Lista Negra - ' +
                FormatDateTime('dd/mm/yyyy', Date) + '-' + FormatDateTime
                ('hh:mm:ss', Time) + '-' + Celular + ' ' + Mensagem)
          else
          begin
            Sms.mmListaEnviados.Lines.Add
              ('Sms PesquisaSatisfa��o - ' + FormatDateTime('dd/mm/yyyy',
                Date) + '-' + FormatDateTime('hh:mm:ss',
                Time) + '-' + Celular + ' ' + Mensagem);

          end;
        end;
        Sms.lbSmsEnviadosPesquisaSatisfacao.Caption := IntToStr
          (StrToInt(Sms.lbSmsEnviadosPesquisaSatisfacao.Caption) + 1);
      end
      else
        Sms.mmListaEnviados.Lines.Add(
          'Sms n�o enviado o cliente n�o possui um celular valido -' +
            'Pesquisa de Satisfa��o - ' + copy(Nome, 1,
            40) + ' - ' + FormatDateTime('dd/mm/yyyy',
            Date) + '-' + FormatDateTime('hh:mm:ss', Time));
      if VerificaInternet then
      begin
        if Sms.ckPausarAvisoDeEnvio.Checked = False then
          Sms.pcListas.Show;
      end
      else
      begin
        Sms.tAguardaReconexao.Enabled := true;
        Sms.mmCaixaDeSaida.Lines.SaveToFile('NaoEnviadas.txt');
        Sms.pcCaixaDeSaida.Show;
        Sms.lbSmsEnviadosPesquisaSatisfacao.Caption := IntToStr
          (StrToInt(Sms.lbSmsEnviadosPesquisaSatisfacao.Caption) + 1);
        NumeroSmsEnviadosAgora := 1;
        GravandoNumeroMsgNaoEnviadas(IntToStr(0), IntToStr(0),
          IntToStr(NumeroSmsEnviadosAgora), IntToStr(0));
      end;
      if Tipo = 'V' then
      begin
        Sms.lbUltimaVendaSatisfacao.Caption := IntToStr
          (dmuPrincipal.qryVendasSatisfacao.FieldByName('Numped').AsInteger);
      end;
      if Tipo = 'P' then
      begin
        Sms.lbUltimaConfirmacaoEntregaSatisfacao.Caption :=
          dmuPrincipal.qryConfirmacaoEntregaSatisfacao['NumNota'];
      end;
      // Sms.tVerificaPesquisaDeSatisfacao.Enabled := True;

    end;

    procedure TSms.tVerificaPesquisaDeSatisfacaoTimer(Sender: TObject);

      procedure VerificaConfirmacaoEntregaSatisfacao;
      begin
        dmuPrincipal.qryConfirmacaoEntregaSatisfacao.Close;
        Try
          dmuPrincipal.qryConfirmacaoEntregaSatisfacao.Open;
        Except

        End;
        if lbUltimaConfirmacaoEntregaSatisfacao.Caption <> Isnull
          (dmuPrincipal.qryConfirmacaoEntregaSatisfacao['NumNota']) then
        begin
          EnviaSmsPesquisaSatisfacao(dmuPrincipal.
              qryConfirmacaoEntregaSatisfacao['CodClie'],
            dmuPrincipal.qryConfirmacaoEntregaSatisfacao['Nome'], 'P');
        end;
      end;

      procedure VerificaVendaSatisfacao;
      begin
        Application.ProcessMessages;
        dmuPrincipal.qryVendasSatisfacao.Close;
        Try
          dmuPrincipal.qryVendasSatisfacao.Open;
        Except
          tVerificaPesquisaDeSatisfacao.Enabled := true;
        End;
        if Isnull(IntToStr(dmuPrincipal.qryVendasSatisfacao.FieldByName
              ('Numped').AsInteger)) <>
          (Sms.lbUltimaVendaSatisfacao.Caption) then
        begin
          // showmessage('envia venda');
          EnviaSmsPesquisaSatisfacao(dmuPrincipal.qryVendasSatisfacao['OID'],
            dmuPrincipal.qryVendasSatisfacao['Nome'], 'V');
          dmuPrincipal.qryVendasSatisfacao.Close;
        end;
      end;

    begin
      if True then

      tVerificaPesquisaDeSatisfacao.Enabled := False;
      // VerificaConfirmacaoEntregaSatisfacao;
      Try
        VerificaVendaSatisfacao;
      Except
        tVerificaPesquisaDeSatisfacao.Enabled := true;
      end;
      tVerificaPesquisaDeSatisfacao.Enabled := true;
    end;

    procedure TSms.btInsereVencimentoInadimplentesClick(Sender: TObject);
    begin
      if pos('[Vencimento]', mmMensagemInadimplente.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmMensagemInadimplente.SelText := '[Vencimento]';
    end;

    procedure TSms.btInsereValorInadimplentesClick(Sender: TObject);
    begin
      if pos('[Valor]', mmMensagemInadimplente.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmMensagemInadimplente.SelText := '[Valor]';
    end;

    procedure TSms.btInsereTipoCobrancaInadimplentesClick(Sender: TObject);
    begin
      if pos('[TipoVencimento]', mmMensagemInadimplente.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmMensagemInadimplente.SelText := '[TipoVencimento]';
    end;

    procedure TSms.btDiasVencidosInadimplentesClick(Sender: TObject);
    begin
      if pos('[Dias]', mmMensagemInadimplente.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmMensagemInadimplente.SelText := '[Dias]';
    end;

    procedure TSms.sbChamaListaClientesClick(Sender: TObject);
    begin
      ShowMessage('N�o Implementado');
    end;

    Procedure BancoDesativo;
    begin
      with Sms do
      begin
        // ShowMessage('Inicio');
        Sms.lbStatusConexao.Caption := 'Conectado';
        Sms.lbStatusConexao.Font.Color := clGreen;
        Sms.btConectaBancoDeDados.Font.Color := clRed;
        Sms.btConectaBancoDeDados.Caption := 'Desconectar';
        edUsuario.Enabled := False;
        edSenha.Enabled := False;
        edBancoDeDados.Enabled := False;
        edInstancia.Enabled := False;
        edCnpj.Enabled := False;
        edEmail.Enabled := False;
        // EdTitulo.Enabled := False;

        edEmailAviso.Enabled := False;
        edCelularAviso.Enabled := False;
        edCelularCopiaResposta.Enabled := False;
        ckCopiaSmsResposta.Enabled := False;
        // dmuPrincipal.qryListaNEnviar.Active := True;
        Try
          dmuPrincipal.qryAniversariantes.Active := true;
        Except
        end;
        Try
          dmuPrincipal.qryCategoriasCel.Active := true;
        Except
        end;
        Try
          dmuPrincipal.qryRelClientes.Active := true;
        Except
        end;
        Try
          dmuPrincipal.qryCelulares.Active := true;
        Except
        end;
        Try
          dmuPrincipal.qryInadimplentes.Active := true;
        Except
        end;
        Try
          dmuPrincipal.qryEntregas.Active := true;
        Except
        end;
        Try
          dmuPrincipal.qryCargas.Active := true;
        Except
        end;
        Try
          dmuPrincipal.qryUltimaCarga.Active := true;
        Except
        end;
        Try
          dmuPrincipal.qryUltimaNota.Active := true;
        Except
        end;
        // dmuPrincipal.qryDDD.Active := True;
        Try
          dmuPrincipal.qryCategoriaProdutos.Active := true;
          dmuPrincipal.qryCategoriaProdutosNaoComprou.Active := true;
        Except
        end;
        Try
          dmuPrincipal.qryMediaVendasDia.Active := true;
        Except
        end;
        Try
          dmuPrincipal.qryMediaNotas.Active := true;
        Except
        end;
        Try
          dmuPrincipal.qryProdutosEmOferta.Active := true;
        Except
        end;
        Try
          dmuPrincipal.qryCategoriaOferta.Active := true;
        Except
        end;
        // dmuPrincipal.qryRelClientesListaNegra.Active := True;
        // dmuPrincipal.cdsClientesListaNegra.Active := True;
        Sms.tVerificaAgendamentos.Enabled := true;
        Sms.tVerificaRespostasSms.Enabled := true;
        // ShowMessage('ativo');
        Sms.tAvisaQueEstaAtivo.Enabled := true;
        GravaAtividade('Ligar');
      end;
    end;

    Function ConectaBancoDeDados(Usuario, Senha, Banco, Instancia: String)
      : Boolean;
    Var
      StringConexao: String;
    begin
      { try
        BaixarDllNecessarias;
        Except

        end; }
      StringConexao := 'Provider=SQLOLEDB.1;Password=' + Senha +
        ';Persist Security Info=True; ' + 'User ID=' + Usuario +
        ';Initial Catalog=' + Banco + '; ' + 'Data Source=' + Instancia +
        '; '
        + 'Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096; ' + 'Workstation ID=GPHER161;Use Encryption ' + 'for Data=False;Tag with column collation when possible=False;';
      dmuPrincipal.dbPrincipal.Connected := False;
      dmuPrincipal.dbPrincipal.ConnectionString := StringConexao;
      BancoDesativo;
      Try
        dmuPrincipal.dbPrincipal.Connected := true;
      Finally
        if Sms.ckManterConectado.Checked then
        begin
          SalvarConfiguracao('ConfiguracaoConexao.ini', Sms.edInstancia.Text,
            Sms.edBancoDeDados.Text, Sms.edUsuario.Text,
            Criptografia(Sms.edSenha.Text, '236'), 'True', Sms.edCnpj.Text,
            '');
          with Sms do
          begin
            SalvarConfiguracao('ConfiguracaoEmail.ini', edEmail.Text, '', '',
              '', '', '', '');
          end;
        end;
      end;
      if (Sms.ckAvisoFerramentaDesconectada.Checked) then
      begin
        Sms.tAvisaQueEstaAtivo.Enabled := true;
        GravaAtividade('Ligar');
      end;
      if Sms.edCnpj.Text = '14450126000172' then
      begin
        Sms.gbListaPesquisaSatisfa��o.Show;
        Sms.gbResultadoPesquisaSatisfacao.Show;
      end
      else
      begin
        Sms.gbListaPesquisaSatisfa��o.Hide;
        Sms.gbResultadoPesquisaSatisfacao.Hide;
      end;
    end;

    Procedure BancoAtivo;
    begin
      with Sms do
      begin
        btConectaBancoDeDados.Caption := 'Conectar';
        btConectaBancoDeDados.Font.Color := clRed;
        lbStatusConexao.Caption := 'Desconectado';
        lbStatusConexao.Font.Color := clRed;
        edUsuario.Enabled := true;
        edSenha.Enabled := true;
        edBancoDeDados.Enabled := true;
        edInstancia.Enabled := true;
        edCnpj.Enabled := true;
        edEmail.Enabled := true;
        edEmailAviso.Enabled := true;
        edCelularAviso.Enabled := true;
        gbConfiguraEmail.Enabled := true;
        edCelularCopiaResposta.Enabled := true;
        ckCopiaSmsResposta.Enabled := true;
        dmuPrincipal.qryListaNEnviar.Active := False;
        dmuPrincipal.qryRelTipo.Active := False;
        dmuPrincipal.qryAniversariantes.Active := False;
        dmuPrincipal.qryCategoriasCel.Active := False;
        dmuPrincipal.qryRelClientes.Active := False;
        dmuPrincipal.qryCelulares.Active := False;
        dmuPrincipal.qryInadimplentes.Active := False;
        dmuPrincipal.qryEntregas.Active := False;
        dmuPrincipal.qryCargas.Active := False;
        dmuPrincipal.qryUltimaCarga.Active := False;
        dmuPrincipal.qryUltimaNota.Active := False;
        dmuPrincipal.qryCategoriaProdutos.Active := False;
        dmuPrincipal.qryCategoriaProdutosNaoComprou.Active := False;
        dmuPrincipal.qryMediaVendasDia.Active := False;
        dmuPrincipal.qryMediaNotas.Active := False;
        dmuPrincipal.qryProdutosEmOferta.Active := False;
        dmuPrincipal.qryCategoriaOferta.Active := False;
        Sms.tVerificaAgendamentos.Enabled := False;
        tVerificaRespostasSms.Enabled := False;
        dmuPrincipal.dbPrincipal.Connected := False;
        Log('desativou as querys e deixou os botoes em enable')
      end;
    end;

    procedure ColocandoAplicacaoNoInicioAutomatico;
    var
      Reg: TRegistry;
      S: string;
    begin
      Reg := TRegistry.create(KEY_WRITE);
      S := ExtractFileDir(Application.ExeName) + '\' + ExtractFileName
        (Application.ExeName);
      Reg.rootkey := HKEY_LOCAL_MACHINE;
      Reg.Openkey('SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN', true);
      Reg.WriteString('SimplesSms', S);
      Reg.closekey;
      Reg.Free;
    end;

    procedure RemovendoAplicacaoInicioAutomatico;
    var
      Reg: TRegistry;
      S: string;
    begin
      Reg := TRegistry.create(KEY_WRITE);
      S := ExtractFileDir(Application.ExeName) + '\' + ExtractFileName
        (Application.ExeName);
      Reg.rootkey := HKEY_LOCAL_MACHINE;
      Reg.Openkey('SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN', true);
      Reg.DeleteValue('SimplesSms');
      Reg.closekey;
      Reg.Free;
    end;

    procedure TSms.btConectaBancoDeDadosClick(Sender: TObject);
    begin
      if btConectaBancoDeDados.Caption = 'Desconectar' then
      begin
        BancoAtivo;
        Exit;
      end
      else
      begin
        ConectaBancoDeDados(edUsuario.Text, edSenha.Text, edBancoDeDados.Text,
          edInstancia.Text);
      end;
    end;

    procedure PreencherPermissaoDeDiasDeEnvio;
    begin
      LerConfiguracao('DiasPermitidoEnvio.txt');
      with Sms do
      begin
        if FileExists('DiasPermitidoEnvio.txt') then
        begin
          ckSeg.Checked := StrToBool(Linha1);
          ckTer.Checked := StrToBool(Linha2);
          ckQua.Checked := StrToBool(Linha3);
          ckQui.Checked := StrToBool(Linha4);
          ckSex.Checked := StrToBool(Linha5);
          ckSab.Checked := StrToBool(Linha6);
          ckDom.Checked := StrToBool(Linha7);
        end;
      end;
    end;

    Function VerificaReativar(Verificar: String): Boolean;
    Var
      Arq: TextFile;
      Linha: String;
    begin
      Result := False;
      if FileExists('ListaAtivos.txt') then
      begin
        AssignFile(Arq, 'ListaAtivos.txt');
        Reset(Arq);
        while not Eof(Arq) do
        begin
          Readln(Arq, Linha);
          if Linha = Verificar then
            Result := true;
        end;
        CloseFile(Arq);
      end;
    end;

    procedure ReativarAtivadosChecks;
    var
      Arq: TextFile;
      Linha: String;
      Objeto: TCheckBox;
      i: Integer;
    begin
      FerramentaAtiva := False;
      For i := 0 to Sms.ComponentCount - 1 do
      begin
        try
          if (Sms.Components[i] is TCheckBox) then
            if VerificaReativar(TCheckBox(Sms.Components[i]).Name) then
              TCheckBox(Sms.Components[i]).Checked := true;
        except
          Sms.Log('erro no check ' + IntToStr(i));
        end;
      end;
    end;

    procedure RecuperarValoresMemos;
    Var
      i: Integer;
    begin
      For i := 0 to Sms.ComponentCount - 1 do
      begin
        try
          if (Sms.Components[i] is TMemo) then
            if FileExists(TMemo(Sms.Components[i]).Name + '.txt') then
  (TMemo(Sms.Components[i]).Lines.LoadFromFile(TMemo(Sms.Components[i])
                    .Name + '.txt'))
              ;
        except
          Sms.Log('erro no memo ' + IntToStr(i));
        end;
      end;
    end;

    procedure RecuperarValoresEdits;
    Var
      i: Integer;
      Arq: TextFile;
      Linha: String;
    begin
      For i := 0 to Sms.ComponentCount - 1 do
      begin
        if (Sms.Components[i] is TLabeledEdit) then
          if FileExists(TLabeledEdit(Sms.Components[i]).Name + '.txt') then
          begin
            AssignFile(Arq, TLabeledEdit(Sms.Components[i]).Name + '.txt');
            Reset(Arq);
            Readln(Arq, Linha);
            TLabeledEdit(Sms.Components[i]).Text := Linha;
            CloseFile(Arq);
          end;
      end;
    end;

    procedure ReativarConexaoBancoDeDados;
    begin
      Sms.Log('Come�ou a carregar os dados do banco');
      LerConfiguracao('ConfiguracaoConexao.ini');
      with Sms do
      begin
        edInstancia.Text := Linha1;
        Log('Leu a Instancia');
        edBancoDeDados.Text := Linha2;
        Log('Leu  o nome do banco');
        edUsuario.Text := Linha3;
        Log('Leu o usuario');
        edSenha.Text := Criptografia(Linha4, '236');
        Log('Leu a senha');
        edCnpj.Text := Linha6;
        Log('Leu o cnpj');
        if Linha5 = 'True' then
        begin
          ckManterConectado.Checked := true;
          Log('ativou manter conectado');
          btConectaBancoDeDados.Click;
          Log('clicou em conectar banco');
          pcListas.Show;
          gbListaEnviados.Show;
        end
        else
          tsConfiguracao.Show;
      end;
    end;

    procedure ReativarAtivos;
    begin
      if VerificaReativar('ckReativaAtivados') then
      begin
        ReativarAtivadosChecks;
        Sms.ckReativaAtivados.Checked := true;
        ReativarBotoes;
      end;
      if (Sms.ckAvisoFerramentaDesconectada.Checked) then
      begin
        Sms.tAvisaQueEstaAtivo.Enabled := true;
        GravaAtividade('Ligar');
      end;
      FerramentaAtiva := true;
      if Sms.ckTravaAlteracao.Checked then
        TravandoEdicaoEmMenuEditMaskBotoesEdicao;
      if Sms.ckAtualizarCelularEmailSatisfacao.Checked then
        Sms.gbCelularEmailSatisfacao.Show
      else
        Sms.gbCelularEmailSatisfacao.Hide;
      if Sms.ckSoliciatarMotivoSatisfacao.Checked then
        Sms.gbMensagemSatisfacaoNotaRuim.Show
      else
        Sms.gbMensagemSatisfacaoNotaRuim.Hide;
    end;

    procedure TSms.FormShow(Sender: TObject);
    Var
      btSelecionado: Integer;
    begin
      FerramentaAtiva := False;
      if Minimizado = False then
      begin
        dmuPrincipal.dbPrincipal.Connected := False;
        if FileExists('PsmsOld.exe') then
          DeleteFile('PsmsOld.exe');
        Try
          LerConfiguracao('ConfiguracaoEmail.ini');
          Log('Configurou o Email');
          edEmail.Text := Linha1;
          lbEnviadosPromocao.Caption := '0';
          lbEnviadosCobranca.Caption := '0';
          lbEnviadosEntrega.Caption := '0';
        except

        End;
        try
          LerConfiguracao('OpcaoDeEnvio.ini');
          Log('Configurou a Op��o de Envio');
          if Linha1 <> '' then
            rgOpcaoDeEnvio.ItemIndex := StrToInt(Linha1);
          if Linha2 <> '' then
            rgOpcaoDeEnvioEmail.ItemIndex := StrToInt(Linha2);
        except

        end;
        try
          // VerificaAtualizacao;
          Log('Verificou a Atualiza��o');
        Except

        end;
        { try
          VerificaAtualizacao;
          except
          end; }
        if ckFiltrarClientesMarketing.Checked then
        begin
          gbFiltrosMarketing.Show;
        end
        else
        begin
          gbFiltrosMarketing.Hide;
        end;
        RecarregandoStringGridAgendamentoMarketing;
        // colocar if
        try
          RecarregandoStringGridListaExterna;
          Log('Carregou a Lista externa');
        Except
          Log('N�o Carregou a Lista externa');
        end;
        Log('Recarregou os Agendamentos');
        PreencherPermissaoDeDiasDeEnvio;
        Log('Recarregou os dias de Envio');
        if FileExists('ListaNegra.txt') then
          mmListaNegra.Lines.LoadFromFile('ListaNegra.txt');
        Log('Recarregou a Lista Negra');
        Minimizado := False;
        clDatas.Date := Date;
        RecuperarTelas;
        Log('Recuperou as Telas');
        RecuperarValoresMemos;
        Log('Recuperou Valores Memo');
        RecuperarValoresEdits;
        Log('Recuperou as Edits');
        ReativarConexaoBancoDeDados;
        Log('Recuperou configura��o banco');
        ReativarAtivos;
        Log('Reativou os ativos');

      end;
    end;

    procedure TSms.ckManterConectadoClick(Sender: TObject);
    begin
      if ckManterConectado.Checked = False then
        DeleteFile('ConfiguracaoConexao.ini');
    end;

    procedure TSms.btZerarNEnviadosClick(Sender: TObject);
    Var
      Arq: TextFile;
    begin
      { AssignFile(Arq,'JaEnviados.txt');
        Rewrite(arq);
        CloseFile(Arq);
        btZerarNEnviados.Enabled := False;
        mmMsgMarketing.Text := 'Foi zerada a lista de pessoas que j� receberam os sms de marketing'; }
    end;

    procedure TSms.ckNEnviarNEnviadosClick(Sender: TObject);
    var
      Arq: TextFile;
    begin
      // btZerarNEnviados.Enabled := True;
      if not FileExists('JaEnviados.txt') then
      begin
        AssignFile(Arq, 'JaEnviados.txt');
        Rewrite(Arq);
        CloseFile(Arq);
      end;
      if ckNEnviarNEnviados.Checked then
        mmMsgMarketing.Text :=
          'Foi ativo o controle de envio de Sms de Marketing repetidos'
      else
        mmMsgMarketing.Text :=
          'Foi desativado o controle de envio de Sms Marketing repetidos';
    end;

    procedure TSms.tAguardaReconexaoTimer(Sender: TObject);
    var
      Arq: TextFile;
      Linha: String;
      ContaLinha: Integer;
      function ReenviandoMsgs: Boolean;
      begin
        Result := False;
        if FileExists('EnviaPromocao.txt') then
        Begin
          EnviaAcrescentaArquivo('EnviaPromocao.txt', true);
          Result := true;
        end;
        if FileExists('EnviaInadimplentes.txt') then
        Begin
          EnviaAcrescentaArquivo('EnviaInadimplentes.txt', true);
          Result := true;
        end;
        if FileExists('EnviaEntrega.txt') then
        Begin
          EnviaAcrescentaArquivo('EnviaEntrega.txt', true);
          Result := true;
        end;
        if FileExists('EnviaAniversarios.txt') then
        Begin
          EnviaAcrescentaArquivo('EnviaAniversarios.txt', true);
          Result := true;
        end;
      end;

    begin
      { pnReenviarMsg.Caption := 'Tentando Reenviar Menssagens ,AGuardando Conex�o com a internet';
        With pnReenviarMsg do Visible := not Visible;
        if  VerificaInternet = True then
        begin
        pcListas.Show;
        if btIniciarEntrega.Caption = 'Desativar' then
        tVerificaEntrega.Enabled := True;
        tAguardaReconexao.Enabled := False;
        if ReenviandoMsgs = True then
        begin
        mmListaEnviados.Text := mmCaixaDeSaida.Text ;
        ContaLinha :=0;
        while mmListaEnviados.Lines.Count-1 >= ContaLinha  do begin
        SalvarArquivoHistorico(mmListaEnviados.Lines[ContaLinha]);
        ContaLInha := ContaLInha + 1;
        end;
        mmCaixaDeSaida.Lines.Clear;
        AssignFile(Arq,'NumeroMsgNaoEnviadas.txt');
        Reset(Arq);
        ReadLn(Arq,Linha);
        lbEnviadosPromocao.Caption := IntToStr(StrToInt(lbEnviadosPromocao.Caption) + StrToInt(Linha));
        ReadLn(Arq,Linha) ;
        lbEnviadosCobranca.Caption := IntToStr(StrToInt(lbEnviadosCobranca.Caption) + StrToInt(Linha));
        ReadLn(Arq,Linha) ;
        lbEnviadosEntrega.Caption  := IntToStr(StrToInt(lbEnviadosEntrega.Caption)  + StrToInt(Linha));
        CloseFile(Arq);
        DeleteFile('NumeroMsgNaoEnviadas.txt');
        end else
        mmListaEnviados.Lines.Add('Nenhuma messagem conseguiu ser reenviada');
        DeleteFile('NaoEnviadas.txt');
        end; }

    end;

    procedure TSms.sbAddTipoClick(Sender: TObject);
    begin
      if cbTiposDocumentos.Text = '' then
        ShowMessage('Selecione um Tipo')
      else
      begin
        if Trim(mmListaTiposDocumentos.Text) = '' then
          mmListaTiposDocumentos.Lines.Add('''' + cbTiposDocumentos.Text + '''')
        else
          mmListaTiposDocumentos.Lines.Add
            (',' + '''' + cbTiposDocumentos.Text + '''');
      end;
    end;

    procedure TSms.sbRemoveTipoClick(Sender: TObject);
    begin
      mmListaTiposDocumentos.SelText := '';
    end;

    procedure TSms.sbAddClienteListaNEnviarCobrancaClick(Sender: TObject);
    begin
      if cbLIstaClientes.Text = '' then
        ShowMessage('Selecione um Cliente')
      else
      begin
        if Trim(mmListaNEnviarCobranca.Text) = '' then
          mmListaNEnviarCobranca.Lines.Add('''' + cbLIstaClientes.Text + '''')
        else
          mmListaNEnviarCobranca.Lines.Add
            (',' + '''' + cbLIstaClientes.Text + '''');
      end;
    end;

    procedure TSms.btInserirClienteAniversarioClick(Sender: TObject);
    begin
      if pos('[cliente______________________________]',
        mmMensagemAniversariante.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmMensagemAniversariante.SelText :=
          '[cliente______________________________]';
    end;

    procedure TSms.mmMensagemAniversarianteChange(Sender: TObject);
    begin
      if mmMensagemAniversariante.Text <> '' then
        mmCaracteresFaltantesAniversariantes.Caption :=
          'Caracteres Faltantes : ' + IntToStr(ContaStringFalta('160',
            mmMensagemAniversariante.Text));
    end;

    procedure TSms.rgOpcaoDeEnvioClick(Sender: TObject);
    begin
      case rgOpcaoDeEnvio.ItemIndex of
        0:
          begin
            gbTesteCelular.Show;
            gbTesteCelular.SetFocus;
          end;
        1:
          gbTesteCelular.Hide;
      end;
      SalvarConfiguracao('OpcaoDeEnvio.ini',
        IntToStr(rgOpcaoDeEnvio.ItemIndex),
        IntToStr(rgOpcaoDeEnvioEmail.ItemIndex), '', '', '', '', '');
    end;

    procedure TSms.btIniciarAniversarioClick(Sender: TObject);
    var
      Contador: Integer;
      Mensagem, Celular: String;
      Arq: TextFile;
      TotalSms: Integer;
      TotalAniversariantes: Integer;
      ContadorAniversarios: Integer;
      NumeroSmsEnviadosAgora: Integer;
      DataAtual: TDate;
    begin
      DataAtual := StrToDate((FormatDateTime('dd/mm/yyyy', Date)));
      NumeroSmsEnviadosAgora := 0;
      lbEnviadosAniversario.Caption := '0';
      BuscaAniversariantes(MonthOF((DataAtual)), DayOf((DataAtual)));
      ContadorAniversarios := 0;
      Contador := 0;
      TotalAniversariantes := dmuPrincipal.qryAniversariantes.RecordCount;
      if rgMaxSmsAniversaio.ItemIndex = 0 then
        TotalSms := TotalAniversariantes
      else
        TotalSms := StrToInt(edMaxSmsAniversario.Text);
      if TotalAniversariantes = 0 then
      begin
        mmListaEnviados.Lines.Add('Sem Aniversariantes para enviar sms');
        TotalSms := 0;
      end;
      while Contador <= TotalSms - 1 do
      begin
        Mensagem := SubstituirTexto(mmMensagemAniversariante.Text,
          '[cliente______________________________]',
          copy(dmuPrincipal.qryAniversariantes['NOME'], 1, 40));
        if (not(BuscaCelular(dmuPrincipal.qryAniversariantes['Oid'],
              '1075,1071') = '')) or (rgOpcaoDeEnvio.ItemIndex = 0)
          then
        begin
          case rgOpcaoDeEnvio.ItemIndex of
            1:
              Celular := BuscaCelular(dmuPrincipal.qryAniversariantes['Oid'],
                '1075,1071');
            0:
              Celular := edCelularTeste.Text;
          end;
          if not EstaNaListaNegra(Celular) then
          begin
            InsereSms(Celular, Mensagem);
          end;
          if not VerificaInternet then
          begin
            mmListaEnviados.Lines.Add(
              'Computador Sem internet Verifique sua conex�o');
            mmCaixaDeSaida.Lines.Add('Aniversariante ' + FormatDateTime
                ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                Time) + '-' + Celular + ' ' + Mensagem);
          end
          else
          begin
            if EstaNaListaNegra(Celular) then
              mmListaEnviados.Lines.Add(
                'Sms Aniversariante N�o Enviado Lista Negra - ' + FormatDateTime
                  ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                  Time) + '-' + Celular + ' ' + Mensagem)
            else
            begin
              mmListaEnviados.Lines.Add('Sms Aniversariante - ' + FormatDateTime
                  ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                  Time) + '-' + Celular + ' ' + Mensagem);

            end;
          end;
          Contador := Contador + 1;
          lbEnviadosAniversario.Caption := IntToStr
            (1 + StrToInt(lbEnviadosAniversario.Caption));
          NumeroSmsEnviadosAgora := NumeroSmsEnviadosAgora + 1;
          if not VerificaInternet then
            mmListaEnviados.Lines.Add(
              'Computador Sem internet Verifique sua conex�o');
        end
        else
          mmListaEnviados.Lines.Add(
            'Sms n�o enviado o cliente n�o possui um celular valido -' +
              'Aniversariante - ' + copy
              (dmuPrincipal.qryAniversariantes['NOME'], 1,
              40) + ' - ' + FormatDateTime('dd/mm/yyyy',
              Date) + '-' + FormatDateTime('hh:mm:ss', Time));
        dmuPrincipal.qryAniversariantes.Next;
        ContadorAniversarios := ContadorAniversarios + 1;
        if ContadorAniversarios = TotalAniversariantes then
          TotalSms := 0;

      end;
      if VerificaInternet then
      Begin
        if ckPausarAvisoDeEnvio.Checked = False then
          pcListas.Show;
      end
      else
      begin
        tAguardaReconexao.Enabled := true;
        mmCaixaDeSaida.Lines.SaveToFile('NaoEnviadas.txt');
        pcCaixaDeSaida.Show;
        lbEnviadosAniversario.Caption := IntToStr
          (StrToInt(lbEnviadosAniversario.Caption)
            - NumeroSmsEnviadosAgora);
        GravandoNumeroMsgNaoEnviadas(IntToStr(0), IntToStr(0), IntToStr(0),
          IntToStr(NumeroSmsEnviadosAgora));
      end;
    end;

    procedure TSms.btAtivarDesativarAniversarioClick(Sender: TObject);
      procedure DesativaAtivarControles(Comando: String);
      begin
        if Comando = 'Desativar' then
        Begin
          btInserirClienteAniversario.Enabled := False;
          mmMensagemAniversariante.Enabled := False;
          mkHoraIncioAniversario.Enabled := False;
          edMaxSmsAniversario.Enabled := False;
          btSalvarAniversario.Enabled := False;
          rgMaxSmsAniversaio.Enabled := False;
        end;
        if Comando = 'Ativar' then
        Begin
          btInserirClienteAniversario.Enabled := true;
          mmMensagemAniversariante.Enabled := true;
          mkHoraIncioAniversario.Enabled := true;
          edMaxSmsAniversario.Enabled := true;
          btSalvarAniversario.Enabled := true;
          rgMaxSmsAniversaio.Enabled := true;
        end;
      end;
      Function VerificaPreenchimento: Boolean;
      begin
        Result := False;
        if mmMensagemAniversariante.Text = '' then
        begin
          ShowMessage('Preencha uma mensagem para envio');
          Result := true;
        end;
        if mkHoraIncioAniversario.Text = '  :  ' then
        begin
          ShowMessage('Preencha uma hora para programa��o');
          Result := true;
        end;
        if (edMaxSmsAniversario.Text = '') and
          (rgMaxSmsAniversaio.ItemIndex = 1) then
        begin
          ShowMessage('Preencha um valor de Sms para serem enviados');
          Result := true;
        end;
        if (rgOpcaoDeEnvio.ItemIndex = 0) and
          ((Trim(edCelularTeste.Text) = '') or
            (Length(Trim(edCelularTeste.Text)) < 10)) then
        begin
          ShowMessage('Preencha um celular valido pra teste');
          Result := true;
          edCelularTeste.SetFocus;
        end;
      end;

    begin
      if VerificaPreenchimento = False then
      Begin
        if btConectaBancoDeDados.Caption = 'Desconectar' then
        begin
          if btAtivarDesativarAniversario.Caption = 'Ativar' then
          Begin
            btAtivarDesativarAniversario.Caption := 'Desativar';
            btAtivarDesativarAniversario.Font.Color := clRed;
            DesativaAtivarControles('Desativar');
            mmMsgAniversariante.Lines.Text :=
              'Ativo o Envio de Sms de parab�ns para inicio as ' +
              mkHoraIncioAniversario.Text + ' dos Proximos dias';
          end
          else
          Begin
            btAtivarDesativarAniversario.Caption := 'Ativar';
            btAtivarDesativarAniversario.Font.Color := clGreen;
            DesativaAtivarControles('Ativar');
            mmMsgAniversariante.Clear;
          end;
        end
        else
        begin
          ShowMessage(
            '� Necess�rio se conectar no banco de dados antes de Enviar SMS');
          tsConfiguracao.Show;
        end;
        if not VerificaInternet then
          ShowMessage('Computador Sem internet Verifique sua conex�o');
      end;
      SalvarStatusBotao(btAtivarDesativarAniversario);
    end;

    procedure TSms.btInciaCargaClick(Sender: TObject);
    var
      Contador: Integer;
      Mensagem, Celular, Filial: String;
      Arq: TextFile;
      TotalSms: Integer;
      ContadorEntregas: Integer;
      TotalEntregas: Integer;
      NumeroSmsEnviadosAgora: Integer;
    begin
      lbEnviadosEntrega.Caption := IntToStr(TotalSmsEnviados);
      ContadorEntregas := 0;
      tVerificaEntrega.Enabled := False;
      Contador := TotalSmsEnviados;
      TotalEntregas := dmuPrincipal.qryCargas.RecordCount;
      if rgMaxSmsEntrega.ItemIndex = 0 then
        TotalSms := TotalEntregas
      else
        TotalSms := StrToInt(edMaxSmsEntrega.Text);
      if TotalEntregas = 0 then
      begin
        TotalSms := 0;
      end;
      while Contador <= TotalSms - 1 do
      begin
        Mensagem := SubstituirTexto(mmMensagemAvisoEntregaCentro.Text,
          '[cliente______________________________]',
          copy(dmuPrincipal.qryCargas['razaocli'], 1, 40));
        if (not(BuscaCelular(dmuPrincipal.qryCargas['codclie'],
              IntToStr(cbListaCategorias.KeyValue)) = '')) or
          (rgOpcaoDeEnvio.ItemIndex = 0) then
        begin
          case rgOpcaoDeEnvio.ItemIndex of
            1:
              Celular := BuscaCelular(dmuPrincipal.qryCargas['codclie'],
                IntToStr(cbListaCategorias.KeyValue));
            0:
              Celular := edCelularTeste.Text;
          end;
          if not EstaNaListaNegra(Celular) then
          begin
            InsereSms(Celular, Mensagem);
          end;
          if not VerificaInternet then
          begin
            mmListaEnviados.Lines.Add(
              'Computador Sem internet Verifique sua conex�o');
            mmCaixaDeSaida.Lines.Add('AvisoEntrega ' + FormatDateTime
                ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                Time) + '-' + Celular + ' ' + Mensagem);
          end
          else
          begin
            if EstaNaListaNegra(Celular) then
              mmListaEnviados.Lines.Add(
                'Sms AvisoEntrega N�o Enviado Lista Negra - ' + FormatDateTime
                  ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                  Time) + '-' + Celular + ' ' + Mensagem)
            else
              mmListaEnviados.Lines.Add('Sms AvisoEntrega - ' + FormatDateTime
                  ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                  Time) + '-' + Celular + ' ' + Mensagem);
            // SalvarArquivoHistorico('Sms AvisoEntrega - '+FormatDateTime('dd/mm/yyyy',Date)+'-'+FormatDatetime('hh:mm:ss',Time)+'-'+Celular+' '+Mensagem);
          end;
          Contador := Contador + 1;
          lbEnviadosEntrega.Caption := IntToStr
            (StrToInt(lbEnviadosEntrega.Caption) + 1);
          NumeroSmsEnviadosAgora := NumeroSmsEnviadosAgora + 1;
        end
        else
          mmListaEnviados.Lines.Add(
            'Sms n�o enviado o cliente n�o possui um celular valido -' +
              'Aviso de Entrega - ' + copy(dmuPrincipal.qryCargas['razaocli'],
              1, 40) + ' - ' + FormatDateTime('dd/mm/yyyy',
              Date) + '-' + FormatDateTime('hh:mm:ss', Time));
        dmuPrincipal.qryCargas.Next;
        ContadorEntregas := ContadorEntregas + 1;
        if ContadorEntregas = TotalEntregas then
          TotalSms := 0;
      end;
      // if GetFileSize('EnviaEntrega.txt') > 0 then
      // begin
      if VerificaInternet then
      begin
        if ckPausarAvisoDeEnvio.Checked = False then
          pcListas.Show;
      end
      else
      begin
        tAguardaReconexao.Enabled := true;
        tVerificaEntrega.Enabled := False;
        mmCaixaDeSaida.Lines.SaveToFile('NaoEnviadas.txt');
        pcCaixaDeSaida.Show;
        lbEnviadosEntrega.Caption := IntToStr
          (StrToInt(lbEnviadosEntrega.Caption) - NumeroSmsEnviadosAgora);
        GravandoNumeroMsgNaoEnviadas(IntToStr(0), IntToStr(0),
          IntToStr(NumeroSmsEnviadosAgora), IntToStr(0));
      end;
      // end;
      dmuPrincipal.qryUltimaCarga.Close;
      dmuPrincipal.qryUltimaCarga.Open;
      lbUltimaCarga.Caption := dmuPrincipal.qryUltimaCarga['UltimaCarga'];
      TotalSmsEnviados := StrToInt(lbEnviadosEntrega.Caption);
      tVerificaEntrega.Enabled := true;
    end;

    procedure TSms.btInsereNumeroClick(Sender: TObject);
    begin
      if pos('[Numero]', mmMensagemInadimplente.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmMensagemInadimplente.SelText := '[Numero]';
    end;

    procedure TSms.btCelularesInvalidosClick(Sender: TObject);
    begin
      { if lbStatusConexao.Caption = 'Conectado' then
        begin
        with dmuPrincipal do begin
        qryCelularesInvalidos.Active := True;
        qryCelularesInvalidos.Close;
        qryCelularesInvalidos.Open;
        qrCelularesInvalidos.ReportTitle:='Lista De Celulares Invalidos';
        qrCelularesInvalidos.preview;
        end;
        end else
        Showmessage('O banco de dados Precisa estar conectado'); }
    end;

    procedure TSms.rgMaxSmsMarketingClick(Sender: TObject);
    begin
      case rgMaxSmsMarketing.ItemIndex of
        0:
          begin
            edMaxSmsPromocao.Hide;
            mmMsgMarketing.Text :=
              'Os Sms de Marketing ser�o enviados a todos os clientes';
          end;
        1:
          begin
            edMaxSmsPromocao.Show;
            mmMsgMarketing.Text :=
              'Os Sms de Marketing ser�o enviados ao numero de Sms definidos';
          end;
      end;
    end;

    procedure TSms.rgMaxSmsCobrancaClick(Sender: TObject);
    begin
      case rgMaxSmsCobranca.ItemIndex of
        0:
          begin
            edMaxSmsInadimpentes.Hide;
            mmMsgCobranca.Text :=
              'Os Sms de Cobran�a ser�o enviados a todos os inadimples do filtro';
          end;
        1:
          begin
            edMaxSmsInadimpentes.Show;
            mmMsgCobranca.Text :=
              'Os Sms de Cobran�a ser�o enviados a os numero de Inadimples definidos';
          end;
      end;
    end;

    procedure TSms.rgMaxSmsEntregaClick(Sender: TObject);
    begin
      case rgMaxSmsEntrega.ItemIndex of
        0:
          begin
            edMaxSmsEntrega.Hide;
            mmMsgEntrega.Text :=
              'Os Sms de Aviso de Entrega ser� Enviado a todas as entregas';
          end;
        1:
          begin
            edMaxSmsEntrega.Show;
            mmMsgEntrega.Text :=
              'Os Sms de Aviso de Entrega ser� limitado o numero de Sms informado';
          end;
      end;
    end;

    procedure TSms.rgMaxSmsAniversaioClick(Sender: TObject);
    begin
      case rgMaxSmsAniversaio.ItemIndex of
        0:
          begin
            edMaxSmsAniversario.Hide;
            mmMsgAniversariante.Text :=
              'Ser� enviado Sms de Parab�ns a todos os aniversariantes';
          end;
        1:
          begin
            edMaxSmsAniversario.Show;
            mmMsgAniversariante.Text :=
              'Ser� enviado Sms de parab�ns ao numero de Sms definido ';
          end;
      end;
    end;

    procedure TSms.FormClose(Sender: TObject; var Action: TCloseAction);
      Procedure LiberaCampos;
      begin
        FreeAndNil(Campo1);
        FreeAndNil(Campo2);
        FreeAndNil(Campo3);
        FreeAndNil(Campo4);
        FreeAndNil(Campo5);
        FreeAndNil(Campo6);
        FreeAndNil(Campo7);
        FreeAndNil(Campo8);
        FreeAndNil(Campo9);
      end;

    begin
      LiberaCampos;
    end;

    procedure TSms.btSalvarAniversarioClick(Sender: TObject);
    begin
      SalvarTela('Aniversario.txt', mmMensagemAniversariante.Text,
        mkHoraIncioAniversario.Text, IntToStr(rgMaxSmsAniversaio.ItemIndex),
        edMaxSmsAniversario.Text, '', '', '', '', '');
      mmMsgAniversariante.Lines.Text :=
        'Configura��o de Aniversariante Salvas com Sucesso';
    end;

    Procedure TSms.ItemClickMarketing(Sender: TObject);
    begin
      mmMensagemPromocao.Text := (Sender as TMenuItem).Caption;
    end;

    Procedure TSms.ItemClickCobranca(Sender: TObject);
    begin
      mmMensagemInadimplente.Text := (Sender as TMenuItem).Caption;
    end;

    Procedure TSms.ItemClickEntrega(Sender: TObject);
    begin
      mmMensagemAvisoEntregaFiliais.Text := (Sender as TMenuItem).Caption;
    end;

    Procedure TSms.ItemClickAniversariante(Sender: TObject);
    begin
      mmMensagemAniversariante.Text := (Sender as TMenuItem).Caption;
    end;

    procedure TSms.mnExemplosMarketingPopup(Sender: TObject);
      Procedure CarregandoGridMarketing;
      Var
        Arquivo: String;
        Arq: TextFile;
        Linha: String;
        Contador: Integer;
        mItem: TMenuItem;
      begin
        Arquivo := 'ExemplosSmsMarketing.txt';
        if FileExists(Arquivo) then
        begin
          AssignFile(Arq, Arquivo);
          Reset(Arq);
          Contador := 0;
          mnExemplosMarketing.Items.Clear;
          while not Eof(Arq) do
          begin
            Readln(Arq, Linha);
            mItem := TMenuItem.create(Self);
            mItem.Caption := Linha;
            mItem.OnClick := ItemClickMarketing;
            mnExemplosMarketing.Items.Add(mItem);
            Contador := Contador + 1;
          end;
          CloseFile(Arq);
        end;
      end;

    begin
      VerificandoBaixandoExemplosSms('ExemplosSmsMarketing.txt');
      CarregandoGridMarketing;
    end;

    procedure TSms.mmExemplosCobrancaPopup(Sender: TObject);
      Procedure CarregandoGridCobranca;
      Var
        Arquivo: String;
        Arq: TextFile;
        Linha: String;
        Contador: Integer;
        mItem: TMenuItem;
      begin
        Arquivo := 'ExemplosSmsCobran�a.txt';
        if FileExists(Arquivo) then
        begin
          AssignFile(Arq, Arquivo);
          Reset(Arq);
          Contador := 0;
          mmExemplosCobranca.Items.Clear;
          while not Eof(Arq) do
          begin
            Readln(Arq, Linha);
            mItem := TMenuItem.create(Self);
            mItem.Caption := Linha;
            mItem.OnClick := ItemClickCobranca;
            mmExemplosCobranca.Items.Add(mItem);
            Contador := Contador + 1;
          end;
          CloseFile(Arq);
        end;
      end;

    begin
      VerificandoBaixandoExemplosSms('ExemplosSmsCobran�a.txt');
      CarregandoGridCobranca;
    end;

    procedure TSms.mmExemplosEntregaPopup(Sender: TObject);
      Procedure CarregandoGridEntrega;
      Var
        Arquivo: String;
        Arq: TextFile;
        Linha: String;
        Contador: Integer;
        mItem: TMenuItem;
      begin
        Arquivo := 'ExemplosSmsEntrega.txt';
        if FileExists(Arquivo) then
        begin
          AssignFile(Arq, Arquivo);
          Reset(Arq);
          Contador := 0;
          mmExemplosEntrega.Items.Clear;
          while not Eof(Arq) do
          begin
            Readln(Arq, Linha);
            mItem := TMenuItem.create(Self);
            mItem.Caption := Linha;
            mItem.OnClick := ItemClickEntrega;
            mmExemplosEntrega.Items.Add(mItem);
            Contador := Contador + 1;
          end;
          CloseFile(Arq);
        end;
      end;

    begin
      VerificandoBaixandoExemplosSms('ExemplosSmsEntrega.txt');
      CarregandoGridEntrega;
    end;

    procedure TSms.mmExemplosAniversariantePopup(Sender: TObject);
      Procedure CarregandoGridAniversariante;
      Var
        Arquivo: String;
        Arq: TextFile;
        Linha: String;
        Contador: Integer;
        mItem: TMenuItem;
      begin
        Arquivo := 'ExemploSmsAniversariante.txt';
        if FileExists(Arquivo) then
        begin
          AssignFile(Arq, Arquivo);
          Reset(Arq);
          Contador := 0;
          mmExemplosAniversariante.Items.Clear;
          while not Eof(Arq) do
          begin
            Readln(Arq, Linha);
            mItem := TMenuItem.create(Self);
            mItem.Caption := Linha;
            mItem.OnClick := ItemClickAniversariante;
            mmExemplosAniversariante.Items.Add(mItem);
            Contador := Contador + 1;
          end;
          CloseFile(Arq);
        end;
      end;

    begin
      VerificandoBaixandoExemplosSms('ExemploSmsAniversariante.txt');
      CarregandoGridAniversariante;
    end;

    procedure TSms.mmMensagemPromocaoEnter(Sender: TObject);
    begin
      mmMsgMarketing.Text :=
        'Se precisar clique com o bot�o direito na mensagem de marketing e veja exemplos de Sms Marketing';
      mmMensagemPromocao.Color := $00CCFFFF;
      UltimoControleOpcaoTextoMarketing := mmMensagemPromocao;
    end;

    procedure TSms.mmMensagemInadimplenteEnter(Sender: TObject);
    begin
      mmMsgCobranca.Text :=
        'Se precisar clique com o bot�o direito na mensagem de cobran�a e veja exemplos de Sms Cobran�a';
      mmMensagemInadimplente.Color := $00CCFFFF;
    end;

    procedure TSms.mmMensagemAvisoEntregaFiliaisEnter(Sender: TObject);
    begin
      mmMensagemAvisoEntregaFiliais.Color := $00CCFFFF;
      mmMsgEntrega.Text :=
        'Se precisar clique com o bot�o direito na mensagem de Aviso de Entrega e veja exemplos de Sms Aviso de Entrega';
    end;

    procedure TSms.mmMensagemAniversarianteEnter(Sender: TObject);
    begin
      mmMensagemAniversariante.Color := $00CCFFFF;
      mmMsgAniversariante.Text :=
        'Se precisar clique com o bot�o direito na mensagem de parab�ns e veja exemplos de Sms de Parab�ns';
    end;

    procedure TSms.gbMensagemAniversarianteExit(Sender: TObject);
    begin
      mmMsgAniversariante.Clear;
    end;

    procedure TSms.mmMensagemAvisoEntregaFiliaisExit(Sender: TObject);
    begin
      mmMsgEntrega.Clear;
      mmMensagemAvisoEntregaFiliais.Color := clWindow;
    end;

    procedure TSms.mmMensagemInadimplenteExit(Sender: TObject);
    begin
      mmMsgCobranca.Clear;
      mmMensagemInadimplenteEmail.Color := clWindow;
      SalvaMemo(mmMensagemInadimplente);
    end;

    procedure TSms.mmMensagemPromocaoExit(Sender: TObject);
    begin
      mmMsgMarketing.Clear;
      mmMensagemPromocao.Color := clWhite;
    end;

    procedure TSms.tpSelecionaDataPromocaoEnter(Sender: TObject);
    begin
      tpSelecionaDataPromocao.Color := $00CCFFFF;
      mmMsgMarketing.Text :=
        'Adicione as datas que ser�o enviados Sms de Marketing clicando no ' +
        ' ao lado';
    end;

    procedure TSms.mkhoraInicioPromocaoEnter(Sender: TObject);
    begin
      mkhoraInicioPromocao.Color := $00CCFFFF;
      mmMsgMarketing.Text :=
        'Defina a hora de inicio para os Sms de Marketing para as datas programadas';
    end;

    procedure TSms.edMaxSmsPromocaoEnter(Sender: TObject);
    begin
      edMaxSmsPromocao.Color := $00CCFFFF;
      mmMsgMarketing.Text :=
        'Digite um Valor max de Sms Marketing para cada dia programado ';
    end;

    procedure TSms.tpSelecionaDataPromocaoExit(Sender: TObject);
    begin
      tpSelecionaDataPromocao.Color := clWindow;
      mmMsgMarketing.Clear;
    end;

    procedure TSms.mkhoraInicioPromocaoExit(Sender: TObject);
    begin
      mkhoraInicioPromocao.Color := clWindow;
      mmMsgMarketing.Clear;
    end;

    procedure TSms.edMaxSmsPromocaoExit(Sender: TObject);
    begin
      edMaxSmsPromocao.Color := clWindow;
      mmMsgMarketing.Clear;
    end;

    procedure TSms.ckNEnviarNEnviadosExit(Sender: TObject);
    begin
      mmMsgMarketing.Clear;
    end;

    procedure TSms.ckPausarAvisoDeEnvioClick(Sender: TObject);
    begin
      AbasteceListaAtivados(ckPausarAvisoDeEnvio);
    end;

    procedure TSms.ckNEnviarNEnviadosEnter(Sender: TObject);
    begin
      mmMsgMarketing.Text :=
        'Se marcada a op��o os Marketing n�o ser�o enviados para os mesmos clientes';
    end;

    procedure TSms.edMinDiasVencidosEnter(Sender: TObject);
    begin
      mmMsgCobranca.Text :=
        'Digite um Valor de dias minimos para o vencimento das parcelas';
      edMinDiasVencidos.Color := $00CCFFFF;
    end;

    procedure TSms.edMinValorVencidoEnter(Sender: TObject);
    begin
      mmMsgCobranca.Text := 'Digite um Valor minimo para as parcelas vencidas';
      edMinValorVencido.Color := $00CCFFFF;
    end;

    procedure TSms.mkHoraInicioInadimplentesEnter(Sender: TObject);
    begin
      mmMsgCobranca.Text :=
        'Digite uma hora de inicio para o envio dos Sms de Cobran�as';
      mkHoraInicioInadimplentes.Color := $00CCFFFF;
    end;

    procedure TSms.edMaxDiasVencidosEnter(Sender: TObject);
    begin
      mmMsgCobranca.Text :=
        'Digite um valor para o max de dias vencidos das parcelas';
      edMaxDiasVencidos.Color := $00CCFFFF;
    end;

    procedure TSms.rgMaxSmsCobrancaEnter(Sender: TObject);
    begin
      mmMsgCobranca.Text :=
        'Informe se as msgs ser�o envias para todos o devedore do filtro ou somente para o numero definido';
    end;

    procedure TSms.rgMaxSmsMarketingEnter(Sender: TObject);
    begin
      mmMsgMarketing.Text :=
        'Informe se os Sms Marketing ser�o enviados para todos os clientes ou para alguns definidos';
    end;

    procedure TSms.edMaxSmsInadimpentesEnter(Sender: TObject);
    begin
      mmMsgCobranca.Text :=
        'Digite um valor para o max de Sms de Cobran�a a serem enviados';
      edMaxSmsInadimpentes.Color := $00CCFFFF;
    end;

    procedure TSms.cbTiposDocumentosEnter(Sender: TObject);
    begin
      dmuPrincipal.qryRelTipo.Active := true;
      mmMsgCobranca.Text := 'Clique no bot�o ao lado ' +
        ' para adicionar tipos de doccumentos vencidos';
      cbTiposDocumentos.Color := $00CCFFFF;
    end;

    procedure TSms.cbLIstaClientesEnter(Sender: TObject);
    begin
      dmuPrincipal.qryListaNEnviar.Active := true;
      mmMsgCobranca.Text := 'Clique no bot�o ao lado ' +
        ' e adicione clientes a lista de pessoas que n�o devem receber sms de cobran�a';
      cbLIstaClientes.Color := $00CCFFFF;
    end;

    procedure TSms.edMinDiasVencidosExit(Sender: TObject);
    begin
      edMinDiasVencidos.Color := clWindow;
      mmMsgCobranca.Clear;
    end;

    procedure TSms.edMinValorVencidoExit(Sender: TObject);
    begin
      edMinValorVencido.Color := clWindow;
      mmMsgCobranca.Clear;
    end;

    procedure TSms.mkHoraInicioInadimplentesExit(Sender: TObject);
    begin
      mkHoraInicioInadimplentes.Color := clWindow;
      mmMsgCobranca.Clear;
    end;

    procedure TSms.edMaxDiasVencidosExit(Sender: TObject);
    begin
      edMaxDiasVencidos.Color := clWindow;
      mmMsgCobranca.Clear;
    end;

    procedure TSms.rgMaxSmsCobrancaExit(Sender: TObject);
    begin
      mmMsgCobranca.Clear;
    end;

    procedure TSms.edMaxSmsInadimpentesExit(Sender: TObject);
    begin
      edMaxSmsInadimpentes.Color := clWindow;
      mmMsgCobranca.Clear;
    end;

    procedure TSms.cbTiposDocumentosExit(Sender: TObject);
    begin
      cbTiposDocumentos.Color := clWindow;
      mmMsgCobranca.Clear;
    end;

    procedure TSms.cesExit(Sender: TObject);
    begin
      cbLIstaClientes.Color := clWindow;
      mmMsgCobranca.Clear;
    end;

    procedure TSms.ckSoliciatarMotivoSatisfacaoClick(Sender: TObject);
    begin
      AbasteceListaAtivados(ckSoliciatarMotivoSatisfacao);
      if ckSoliciatarMotivoSatisfacao.Checked then
        gbMensagemSatisfacaoNotaRuim.Show
      else
        gbMensagemSatisfacaoNotaRuim.Hide;
    end;

    procedure TSms.ckAtualizarCelularEmailSatisfacaoClick(Sender: TObject);
    begin
      AbasteceListaAtivados(ckAtualizarCelularEmailSatisfacao);
      if ckAtualizarCelularEmailSatisfacao.Checked then
        gbCelularEmailSatisfacao.Show
      else
        gbCelularEmailSatisfacao.Hide;

    end;

    function BuscaCelularUltimaRespostaSatisfacao(Resposta: String): String;
    begin
      // Application.ProcessMessages;
      dmServidor.qryRespostaSatisfacao.Active := False;
      dmServidor.qryRespostaSatisfacao.Close;
      dmServidor.qryRespostaSatisfacao.ParamByName('Cnpj').Value := Trim
        (Sms.edCnpj.Text);
      dmServidor.qryRespostaSatisfacao.ParamByName('Resposta')
        .Value := Resposta;
      Try
        dmServidor.qryRespostaSatisfacao.Active := true;
      Except
        Sms.tVerificaRepostaPesquisa.Enabled := true;
      end;
      try
        dmServidor.qryRespostaSatisfacao.Open;
      Except
      end;
      dmServidor.qryRespostaSatisfacao.Last;
      if dmServidor.qryRespostaSatisfacao['Numero'] = null then
        Result := ''
      else
        Result := dmServidor.qryRespostaSatisfacao['Numero'];
      dmServidor.qryRespostaSatisfacao.Active := False;
    end;

    procedure TSms.ckAtivaDesativaSatisfacaoClick(Sender: TObject);

      Function VerificaPreenchimentoSmsSatisfacao: Boolean;
      begin
        Result := true;
        if Trim(mmMensagemSatisfacao.Text) = '' then
        begin
          Result := False;
          ckAtivaDesativaSatisfacao.Checked := False;
          mmMsgSatisfacao.Text :=
            'Preencha uma Mensagem para o Sms de Satisfacao';
        end;
        if (Trim(mmMensagemSatisfacaoNotaRuim.Text) = '') and
          (ckSoliciatarMotivoSatisfacao.Checked) then
        begin
          Result := False;
          ckAtivaDesativaSatisfacao.Checked := False;
          mmMsgSatisfacao.Text :=
            'Preencha uma Mensagem para solicita��o de Voto Ruim';
        end;
        if (Trim(edEmailSatisfacao.Text) = '') and
          (ckAtualizarCelularEmailSatisfacao.Checked) then
        begin
          Result := False;
          ckAtivaDesativaSatisfacao.Checked := False;
          mmMsgSatisfacao.Text :=
            'Preencha um email para ser atualizado dos votos de satisfa��o';
        end;
        if (Trim(edCelularSatisfacao.Text) = '') and
          (ckAtualizarCelularEmailSatisfacao.Checked) then
        begin
          Result := False;
          ckAtivaDesativaSatisfacao.Checked := False;
          mmMsgSatisfacao.Text :=
            'Preencha um Celular para ser atualizado dos votos de satisfa��o';
        end;
      end;

      procedure AtivaDesativaSatisfacao;
      begin
        Application.ProcessMessages;
        if (ckAtivaDesativaSatisfacao.Checked = true) and
          (VerificaPreenchimentoSmsSatisfacao) then
        begin
          mmMensagemSatisfacao.Enabled := False;
          ckSoliciatarMotivoSatisfacao.Enabled := False;
          ckAtualizarCelularEmailSatisfacao.Enabled := False;
          mmMensagemSatisfacaoNotaRuim.Enabled := False;
          btSalvarSatisfacao.Enabled := False;
          dmuPrincipal.qryVendasSatisfacao.Active := true;
          dmuPrincipal.qryVendasSatisfacao.Close;
          Try
            dmuPrincipal.qryVendasSatisfacao.Open;
          Except
          end;
          Try
            lbUltimaVendaSatisfacao.Caption := Isnull
              (IntToStr(dmuPrincipal.qryVendasSatisfacao.FieldByName('Numped')
                  .AsInteger));
            dmuPrincipal.qryVendasSatisfacao.Active := False;
          Except
          end;
          { dmuPrincipal.qryConfirmacaoEntregaSatisfacao.Active := True;
            dmuPrincipal.qryConfirmacaoEntregaSatisfacao.Close;
            Try
            dmuPrincipal.qryConfirmacaoEntregaSatisfacao.Open;
            Except
            end; }
          { try
            lbUltimaConfirmacaoEntregaSatisfacao.Caption :=
            Isnull(dmuPrincipal.qryConfirmacaoEntregaSatisfacao['NumNota']);
            Except
            end; }
          // ShowMessage('ativo');
          if BuscaCelularUltimaRespostaSatisfacao('3') = null then
            lbUltimoCelular.Caption := ''
          else
          begin
            try
              lbUltimoCelular.Caption := Trim
                (BuscaCelularUltimaRespostaSatisfacao('3'));
            Except
            end;
          end;
          tVerificaPesquisaDeSatisfacao.Enabled := true;
          tVerificaRepostaPesquisa.Enabled := true;
          TotalRespostaSatisfacao := VerificaNovasRespostaSatisfacao;
          AtualizaSatisfacao := 0;
          gbCelularEmailSatisfacao.Enabled := False;
          mmMsgSatisfacao.Text := 'Pesquisa de Satisfa��o Ativo';
        end
        else
        begin
          gbCelularEmailSatisfacao.Enabled := true;
          mmMensagemSatisfacao.Enabled := true;
          ckSoliciatarMotivoSatisfacao.Enabled := true;
          ckAtualizarCelularEmailSatisfacao.Enabled := true;
          mmMensagemSatisfacaoNotaRuim.Enabled := true;
          btSalvarSatisfacao.Enabled := true;
          mmMsgSatisfacao.Text := 'Pesquisa de Satisfa��o Desativado';
          tVerificaPesquisaDeSatisfacao.Enabled := False;
          tVerificaRepostaPesquisa.Enabled := False;
        end;
      end;

    begin
      AtivaDesativaSatisfacao;
      AbasteceListaAtivados(ckAtivaDesativaSatisfacao);
    end;

    procedure TSms.CheckBox4Click(Sender: TObject);
    begin
      AbasteceListaAtivados(ckEnviaEmailCobranca);
    end;

    procedure TSms.mkHoraInicioAvisoEntregaEnter(Sender: TObject);
    begin
      mmMsgEntrega.Text :=
        'Digite uma hora para inicio de envio de sms de Avido de Entrega';
      mkHoraInicioAvisoEntrega.Color := $00CCFFFF;
    end;

    procedure TSms.mkHoraFinalAvisoEntregaEnter(Sender: TObject);
    begin
      mmMsgEntrega.Text :=
        'Digite uma hora para final de envio de sms de Avido de Entrega';
      mkHoraFinalAvisoEntrega.Color := $00CCFFFF;
    end;

    procedure TSms.ccc(Sender: TObject);
    begin
      mmMsgEntrega.Text :=
        'Selecione a categoria de telefone que receber�o o Sms de Aviso de entrega';
      cbListaCategorias.Color := $00CCFFFF;
    end;

    function TSms.CelularValido(Celular: String): Boolean;
    Var
      InicioValido: String;
    begin
      Result := False;
      InicioValido := '7,8,9';
      if (Length(Celular) = 8) and AnsiContainsStr(InicioValido, Celular[1])
        then
        Result := true;
      if (Length(Celular) = 10) and AnsiContainsStr(InicioValido, Celular[3])
        then
        Result := true;
      if (Length(Celular) = 11) and AnsiContainsStr(InicioValido, Celular[4])
        then
        Result := true;
      if (Length(Celular) = 12) and AnsiContainsStr(InicioValido, Celular[5])
        then
        Result := true;
    end;

    procedure TSms.edNomeSerieEnter(Sender: TObject);
    begin
      mmMsgEntrega.Text := 'Informe a nomenclatura da serie de nota de saida';
      edNomeSerie.Color := $00CCFFFF;
    end;

    procedure TSms.edEsperaEnvioEnter(Sender: TObject);
    begin
      mmMsgEntrega.Text :=
        'Digite o tempo de Espera para enviar o aviso de nota';
      edEsperaEnvio.Color := $00CCFFFF;
    end;

    procedure TSms.rgMaxSmsEntregaEnter(Sender: TObject);
    begin
      mmMsgEntrega.Text :=
        'Selecione se quer enviar Sms de Aviso de entrega para Todas as entregas ou para um numero limitado';
    end;

    procedure TSms.edMaxSmsEntregaEnter(Sender: TObject);
    begin
      mmMsgEntrega.Text :=
        'Informe o Numero de Sms de Aviso de Entrega Ser�o enviados';
      edMaxSmsEntrega.Color := $00CCFFFF;
    end;

    procedure TSms.rgAguardarporEnter(Sender: TObject);
    begin
      mmMsgEntrega.Text :=
        'Informe se os Sms ser�o disparados na Emiss�o da Nota ou Montagem de Carga';
    end;

    procedure TSms.rgAguardarporClick(Sender: TObject);
    begin
      case rgAguardarpor.ItemIndex of
        0:
          begin
            btInsereClienteEntregaFilial.Show;
            gbMenssagemAvisoEntregaFilial.Show;
            mmFaltaCaracteresAvisoEntregaFilial.Show;
            edFiliais.Show;
            edCentroDeDistribicao.Show;
            mmMsgEntrega.Text :=
              'Os Sms de Aviso de Entrega ser�o enviados no momento da Emiss�o da Nota Fiscal';
          end;
        1:
          begin
            edFiliais.Hide;
            edCentroDeDistribicao.Hide;
            btInsereClienteEntregaFilial.Hide;
            gbMenssagemAvisoEntregaFilial.Hide;
            mmFaltaCaracteresAvisoEntregaFilial.Hide;
            mmMsgEntrega.Text :=
              'Os Sms de Aviso de Entrega ser�o enviados no momento da montagem de carga';
          end;
      end;
    end;

    procedure TSms.mkHoraInicioAvisoEntregaExit(Sender: TObject);
    begin
      mkHoraInicioAvisoEntrega.Color := clWindow;
      mmMsgEntrega.Clear;
    end;

    procedure TSms.mkHoraFinalAvisoEntregaExit(Sender: TObject);
    begin
      mkHoraFinalAvisoEntrega.Color := clWindow;
      mmMsgEntrega.Clear;
    end;

    procedure TSms.cbListaCategoriasExit(Sender: TObject);
    begin
      cbListaCategorias.Color := clWindow;
      mmMsgEntrega.Clear;
    end;

    procedure TSms.edNomeSerieExit(Sender: TObject);
    begin
      edNomeSerie.Color := clWindow;
      mmMsgEntrega.Clear;
    end;

    procedure TSms.edEsperaEnvioExit(Sender: TObject);
    begin
      edEsperaEnvio.Color := clWindow;
      mmMsgEntrega.Clear;
    end;

    procedure TSms.edMaxSmsEntregaExit(Sender: TObject);
    begin
      edMaxSmsEntrega.Color := clWindow;
      mmMsgEntrega.Clear;
    end;

    procedure TSms.rgMaxSmsEntregaExit(Sender: TObject);
    begin
      mmMsgEntrega.Clear;
    end;

    procedure TSms.rgAguardarporExit(Sender: TObject);
    begin
      mmMsgEntrega.Clear;
    end;

    procedure TSms.mkHoraIncioAniversarioEnter(Sender: TObject);
    begin
      mmMsgAniversariante.Text :=
        'Informe o horario de inicio de envio de Sms de Aniversariante';
      mkHoraIncioAniversario.Color := $00CCFFFF;
    end;

    procedure TSms.edMaxSmsAniversarioEnter(Sender: TObject);
    begin
      mmMsgAniversariante.Text :=
        'Informe o numero de Sms que ser�o enviados para Aniversariantes';
      edMaxSmsAniversario.Color := $00CCFFFF;
    end;

    procedure TSms.rgMaxSmsAniversaioEnter(Sender: TObject);
    begin
      mmMsgAniversariante.Text :=
        'Selecione se os Sms ser�o enviados a todos os Aniversariantes ou a um numero definido';
    end;

    procedure TSms.rgMaxSmsAniversaioExit(Sender: TObject);
    begin
      mmMsgAniversariante.Clear;
    end;

    procedure TSms.mkHoraIncioAniversarioExit(Sender: TObject);
    begin
      mmMsgAniversariante.Clear;
      mkHoraIncioAniversario.Color := clWindow;
    end;

    procedure TSms.edMaxSmsAniversarioExit(Sender: TObject);
    begin
      mmMsgAniversariante.Clear;
      edMaxSmsAniversario.Color := clWindow;
    end;

    procedure TSms.mmMensagemAniversarianteExit(Sender: TObject);
    begin
      mmMensagemAniversariante.Color := clWindow;
      mmMsgAniversariante.Clear;
    end;

    procedure TSms.ckControleEnvioSmsClick(Sender: TObject);
    begin
      if ckControleEnvioSms.Checked = true then
        gbControledeEnvioSms.Visible := true
      else
        gbControledeEnvioSms.Visible := False;
    end;

    procedure TSms.ckControlePorEmailClick(Sender: TObject);
    begin
      if ckControlePorEmail.Checked then
        edEmailControleSms.Enabled := true
      else
        edEmailControleSms.Enabled := False;
    end;

    procedure TSms.ckControlePorSmsClick(Sender: TObject);
    begin
      if ckControlePorSms.Checked then
        edCelularControleSms.Enabled := true
      else
        edCelularControleSms.Enabled := False;
    end;

    procedure TSms.ckControleSmsMarketingClick(Sender: TObject);
    begin
      if ckControleSmsMarketing.Checked then
        edqtdControleMarketing.Enabled := true
      else
        edqtdControleMarketing.Enabled := False;

    end;

    procedure TSms.ckCopiaSmsRespostaClick(Sender: TObject);

      procedure GravaCelularSmsRecebido(Celular: String);
      Var
        dbPrincipal: TZConnection;
        qryAtividade: TZQuery;
      begin
        Application.ProcessMessages;
        dbPrincipal := TZConnection.create(nil);
        dbPrincipal.HostName :=
          'Cadmustech.cet2loe0ehxw.us-west-2.rds.amazonaws.com';
        dbPrincipal.LibraryLocation := 'libmySQL.dll';
        dbPrincipal.user := 'cadmus182';
        dbPrincipal.Port := 3306;
        dbPrincipal.Password := 'cadmus182';
        dbPrincipal.Database := 'mercurio';
        dbPrincipal.Protocol := 'mysql-5';
        dbPrincipal.Connect;
        qryAtividade := TZQuery.create(nil);
        qryAtividade.connection := dbPrincipal;
        qryAtividade.SQL.Text :=
          'update Clientes set CelularResposta=' + '''' +
          Sms.edCelularCopiaResposta.Text + '''' + #13 + 'where Cnpj=' +
          '''' + Sms.edCnpj.Text + '''';
      end;

    begin
      if ckCopiaSmsResposta.Checked then
      begin
        if (edCelularCopiaResposta.Text <> '') and
          (Length(edCelularCopiaResposta.Text) > 10) then
        begin
          AbasteceListaAtivados(ckCopiaSmsResposta);
          SalvaEdit(edCelularCopiaResposta);
          edCelularCopiaResposta.Enabled := False;
        end
        else
        begin
          ckCopiaSmsResposta.Checked := False;
          edCelularCopiaResposta.Enabled := true;
          ShowMessage('Insira um Celular Valido');
        end;
      end;
      GravaCelularSmsRecebido(Sms.edCelularCopiaResposta.Text);
    end;

    procedure TSms.ckControleSmsCobrancaClick(Sender: TObject);
    begin
      if ckControleSmsCobranca.Checked then
        edqtdControleCobranca.Enabled := true
      else
        edqtdControleCobranca.Enabled := False;
    end;

    procedure TSms.ckControleSmsEntregaClick(Sender: TObject);
    begin
      if ckControleSmsEntrega.Checked then
        edqtdControleEntrega.Enabled := true
      else
        edqtdControleEntrega.Enabled := False;
    end;

    procedure TSms.ckControleSmsAniversarianteClick(Sender: TObject);
    begin
      if ckControleSmsAniversariante.Checked then
        edqtdControleAniversariante.Enabled := true
      else
        edqtdControleAniversariante.Enabled := False;
    end;

    procedure TSms.edCelularSatisfacaoEnter(Sender: TObject);
    begin
      mmMsgSatisfacao.Text :=
        'Informe um Celular para receber atualiza��es da pesquisa de satisfa��o';
      edCelularSatisfacao.Color := $00CCFFFF;
    end;

    procedure TSms.edCelularSatisfacaoExit(Sender: TObject);
    begin
      mmMsgSatisfacao.Clear;
      edCelularSatisfacao.Color := clWhite;
    end;

    procedure TSms.edCelularTesteEnter(Sender: TObject);
    begin
      edCelularTeste.Color := $00CCFFFF;
    end;

    procedure TSms.edCelularTesteExit(Sender: TObject);
    begin
      edCelularTeste.Color := clWindow;
    end;

    procedure TSms.ckUsaSerieClick(Sender: TObject);
    begin
      if ckUsaSerie.Checked then
        edNomeSerie.Show
      else
        edNomeSerie.Hide;
    end;

    procedure TSms.btInsereValorJurosClick(Sender: TObject);
    begin
      if pos('[Valor+Juros]', mmMensagemInadimplente.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmMensagemInadimplente.SelText := '[Valor+Juros]';
    end;

    procedure TSms.ckFiltrarClientesMarketingClick(Sender: TObject);
    begin
      if ckFiltrarClientesMarketing.Checked then
      begin
        gbFiltrosMarketing.Show;
      end
      else
      begin
        gbFiltrosMarketing.Hide;
        btInserirProduto.Hide;
        btInserePedido.Hide;
      end;
    end;

    procedure TSms.cbListaFiltrosMarketingSelect(Sender: TObject);
      procedure Desabilitatabs;
      begin
        tsFiltro1.TabVisible := False;
        tsFiltro2.TabVisible := False;
        tsFiltro3.TabVisible := False;
        tsFiltro4.TabVisible := False;
        tsFiltro5.TabVisible := False;
      end;

    begin
      Desabilitatabs;
      pgFiltrosMarketing.Show;
      if (cbListaFiltrosMarketing.Text = 'Or�amento n�o aprovado em') or
        (cbListaFiltrosMarketing.Text = 'Nota Emitida em') then
      begin
        tsFiltro1.Show;
        edDiasOrcamento.SetFocus;
      end;
      if (cbListaFiltrosMarketing.Text = 'Comprou a') or
        (cbListaFiltrosMarketing.Text = 'Pedido com itens sem nota') then
      begin
        tsFiltro2.Show;
        edDiasDeCompra.SetFocus;
      end;
      if cbListaFiltrosMarketing.Text = 'Comprou Produtos da Categoria' then
      begin
        tsFiltro3.Show;
        cbListaCategoriasMarketing.SetFocus;
      end;
      if (cbListaFiltrosMarketing.Text = 'Possui Produtos em Oferta') then
      begin
        tsFiltro1.Show;
        edDiasOrcamento.SetFocus;
        btInserePedido.Show;
        btInserirProduto.Show;
      end
      else
      begin
        btInserePedido.Hide;
        btInserirProduto.Hide;
      end;
      if (cbListaFiltrosMarketing.Text = 'Indica Categoria  Para') then
      begin
        tsFiltro4.Show;
        cbListaCategoriaComprou.SetFocus;
        btInserirProduto.Show;
      end
      else
        btInserirProduto.Show;

      if (cbListaFiltrosMarketing.Text = 'Comprou No Periodo') then
      begin
        tsFiltro5.Show;
        dtInicioPeriodoFiltro5.DateTime := Date;
        dtFimPeriodoFiltro5.DateTime := Date;
        dtInicioPeriodoFiltro5.SetFocus;
      end;
    end;

    procedure TSms.ckFiltrarClientesMarketingEnter(Sender: TObject);
    begin
      mmMsgMarketing.Text :=
        'Informe um Filtro para os clientes que receber�o sms de Marketing';
    end;

    procedure TSms.cbListaFiltrosMarketingEnter(Sender: TObject);
    begin
      mmMsgMarketing.Text := 'Selecione Entre os Filtros Disponiveis';
    end;

    procedure TSms.edDiasOrcamentoEnter(Sender: TObject);
    begin
      mmMsgMarketing.Text := 'Indique a Quantidade de Dias do Filtro';
    end;

    procedure TSms.edDiasDeCompraEnter(Sender: TObject);
    begin
      mmMsgMarketing.Text := 'Indique a Quantidade de Dias do Filtro';
    end;

    procedure TSms.pgFiltrosMarketingEnter(Sender: TObject);
    begin
      mmMsgMarketing.Text := 'Selecione a Categoria do Filtro';
    end;

    procedure MontarListaAgendamento(Mensagem, Data, Hora, Limitar, MaxSms,
      Filtro, ParametroFiltro, ParametroFiltro2, Status, EnviarEnviados,
      Filtrar, ParametroFiltro3, Email, Tipo, EnviaExterno,
      FiltroExterno: String);

      procedure preenche(Linha, coluna: Integer; Texto: String);
      begin
        Sms.sgListaAgendamentosMarketing.Cells[coluna, Linha] := Texto
      end;

    Var
      Linha: Integer;
      Conteudo: String;
    begin
      with Sms do
      begin
        Linha := sgListaAgendamentosMarketing.RowCount - 1;
        Conteudo := sgListaAgendamentosMarketing.Cells[0, Linha];
        if Conteudo <> '' then
        begin
          sgListaAgendamentosMarketing.RowCount :=
            sgListaAgendamentosMarketing.RowCount + 1;
          Linha := Linha + 1
        end;
        preenche(Linha, 0, Mensagem);
        preenche(Linha, 1, Data);
        preenche(Linha, 2, Hora);
        preenche(Linha, 3, EnviarEnviados);
        preenche(Linha, 4, Limitar);
        preenche(Linha, 5, MaxSms);
        preenche(Linha, 6, Filtrar);
        preenche(Linha, 7, Filtro);
        preenche(Linha, 8, ParametroFiltro);
        preenche(Linha, 9, ParametroFiltro2);
        preenche(Linha, 10, ParametroFiltro3);
        preenche(Linha, 11, Status);
        preenche(Linha, 12, 'Sem');
        preenche(Linha, 13, Email);
        preenche(Linha, 14, Tipo);
        preenche(Linha, 15, EnviaExterno);
        preenche(Linha, 16, FiltroExterno);
        // Preenche(Linha,15,Email);
      end;

      if Tipo = 'Email' then
        Sms.mmMensagemPromocaoEmail.Lines.SaveToFile(Email + '.txt');
    end;

    procedure TSms.btAgendarMarketingClick(Sender: TObject);

      Function GeraNumeroEmail: Integer;
        Function VerificaSeJaExiste(Numero: Integer): Boolean;
        var
          Contador: Integer;
        begin
          Contador := 1;
          Result := False;
          while sgListaAgendamentosMarketing.RowCount >= Contador do
          begin
            if sgListaAgendamentosMarketing.Cells[13, Contador] = IntToStr
              (Numero) then
            begin
              Result := true;
            end;
            Contador := Contador + 1;
          end;
        end;

      Var
        Numero: Integer;
      begin
        while VerificaSeJaExiste(Numero) do
        begin
          Numero := RandomRange(1, 200);
        end;
        Result := Numero;
      end;

    Var
      ParametroFiltro, ParametroFiltro2, ParametroFiltro3,
        OpcaoDeFiltro: String;
      Contador, Total, NumeroEmail: Integer;
    begin
      Contador := 0;
      Total := mmDatasPromocao.Lines.Count;
      if Trim(mmDatasPromocao.Text) = '' then
        Total := 1;
      PreencherTitulosAgendamentos;
      if mmMensagemPromocao2.Text = '' then
        mmMensagemPromocao2.Text := mmMensagemPromocao.Text;
      if mmMensagemPromocao3.Text = '' then
        mmMensagemPromocao3.Text := mmMensagemPromocao.Text;
      while Contador <= Total - 1 do
      begin
        if (cbListaFiltrosMarketing.Text = 'Or�amento n�o aprovado em') or
          (cbListaFiltrosMarketing.Text = 'Possui Produtos em Oferta') then
          ParametroFiltro := edDiasOrcamento.Text;
        if (cbListaFiltrosMarketing.Text = 'Comprou a') or
          (cbListaFiltrosMarketing.Text = 'Pedido com itens sem nota') then
          ParametroFiltro := edDiasDeCompra.Text;
        if cbListaFiltrosMarketing.Text = 'Comprou Produtos da Categoria' then
          ParametroFiltro := cbListaCategoriasMarketing.Text;
        if cbListaFiltrosMarketing.Text = 'Possui Produtos em Oferta' then
          ParametroFiltro := edDiasOrcamento.Text;
        if cbListaFiltrosMarketing.Text = 'Nota Emitida em' then
          ParametroFiltro := edDiasOrcamento.Text;
        if (cbListaFiltrosMarketing.Text = 'Comprou No Periodo') then
        begin
          ParametroFiltro := DateToStr(dtInicioPeriodoFiltro5.Date);
          ParametroFiltro2 := DateToStr(dtFimPeriodoFiltro5.Date);
        end;
        if cbListaFiltrosMarketing.Text = 'Indica Categoria  Para' then
        begin
          ParametroFiltro := cbListaCategoriaComprou.Text;
          ParametroFiltro2 := cbListaCategoriaNComprou.Text;
          ParametroFiltro3 := edDiasIndicaCategoria.Text;
        end;
        if ckFiltrarClientesMarketing.Checked then
        begin
          OpcaoDeFiltro := cbListaFiltrosMarketing.Text;
        end
        else
        begin
          OpcaoDeFiltro := '';
          ParametroFiltro := '';
          ParametroFiltro2 := '';
          ParametroFiltro3 := '';
        end;

        MontarListaAgendamento(mmMensagemPromocao.Text + ';' +
            mmMensagemPromocao2.Text + ';' + mmMensagemPromocao3.Text,
          mmDatasPromocao.Lines[Contador], mkhoraInicioPromocao.Text,
          TraduzirNomesRg(rgMaxSmsMarketing.ItemIndex), edMaxSmsPromocao.Text,
          OpcaoDeFiltro, ParametroFiltro, ParametroFiltro2, 'Ativo',
          TraduzirNomesck(ckNEnviarNEnviados.Checked),
          TraduzirNomesck(ckFiltrarClientesMarketing.Checked),
          ParametroFiltro3, '', 'Sms',
          TraduzirNomesck(ckEnviarMarketingListaExterna.Checked),
          cbFiltroEnvioListaExterna.Text);

        if ckEnviaEmail.Checked then
          MontarListaAgendamento(EdTitulo.Text,
            mmDatasPromocao.Lines[Contador], mkhoraInicioPromocao.Text,
            TraduzirNomesRg(rgMaxSmsMarketing.ItemIndex),
            edMaxSmsPromocao.Text, cbListaFiltrosMarketing.Text,
            ParametroFiltro, ParametroFiltro2, 'Ativo',
            TraduzirNomesck(ckNEnviarNEnviados.Checked),
            TraduzirNomesck(ckFiltrarClientesMarketing.Checked),
            ParametroFiltro3, IntToStr(GeraNumeroEmail), 'Email',
            TraduzirNomesck(ckEnviarMarketingListaExterna.Checked),
            cbFiltroEnvioListaExterna.Text);

        Contador := Contador + 1;
      end;
      SalvandoStringGridAgendamentoMarketing;
      Contador := 0;
      while Contador <= Total - 1 do
      begin
        { GravaAgendamentoServidor(mmMensagemPromocao.Text+';'+mmMensagemPromocao2.Text+';'+mmMensagemPromocao3.Text,
          mmDatasPromocao.Lines[Contador],mkhoraInicioPromocao.Text,edCnpj.Text,'Sms'); }
        Contador := Contador + 1
      end;
      if ckEnviaEmail.Checked then
      begin
        Contador := 0;
        while Contador <= Total - 1 do
        begin
          // GravaAgendamentoServidor(EdTitulo.Text,mmDatasPromocao.Lines[Contador],mkhoraInicioPromocao.Text,edCnpj.Text,'Email');
          Contador := Contador + 1
        end;
      end;
      tsAgendamentosMarketing.Show;
    end;

    procedure TSms.tVerificaAgendamentosTimer(Sender: TObject);

      procedure EnviaAgendamentoPromocao(NumeroSms: Integer;
        Filtro, ParametroFiltro, ParametroFiltro2, Msg, Limitar, Filtrar,
        EnviarNEnviados, ParametroFiltro3: String);
      var
        Contador: Integer;
        Mensagem, Celular, Comando: String;
        Texto: PansiChar;
        Arq: TextFile;
        TotalSms: Integer;
        TotalClientes: Integer;
        ContadorClientes: Integer;
        NumeroSmsEnviadosAgora: Integer;
      begin
        NumeroSmsEnviadosAgora := 0;
        lbEnviadosPromocao.Caption := '0';
        BuscarClientes(EnviarNEnviados, Filtrar, Filtro, ParametroFiltro,
          ParametroFiltro2, ParametroFiltro3);
        ContadorClientes := 0;
        Contador := 0;
        TotalClientes := dmuPrincipal.qryRelClientes.RecordCount;
        if Limitar = 'N�o' then
          TotalSms := TotalClientes
        else
          TotalSms := (NumeroSms);
        if TotalClientes = 0 then
        begin
          mmListaEnviados.Lines.Add('Sem Clientes para enviar sms');
          TotalSms := 0;
        end;
        while Contador <= TotalSms - 1 do
        begin
          Application.ProcessMessages;
          if (not(BuscaCelular(dmuPrincipal.qryRelClientes['Oid'],
                '1075,1071') = '')) or ((rgOpcaoDeEnvio.ItemIndex = 0)) then
          begin
            case rgOpcaoDeEnvio.ItemIndex of
              1:
                Celular := BuscaCelular(dmuPrincipal.qryRelClientes['Oid'],
                  '1075,1071');
              0:
                Celular := edCelularTeste.Text;
            end;
            if ParametroFiltro <> '' then
              BuscaProdutoPedido(dmuPrincipal.qryRelClientes['Oid'],
                ParametroFiltro);
            Mensagem := EscolheOpcaoMsg(Msg);
            Mensagem := SubstituirTexto(Mensagem,
              '[cliente______________________________]',
              copy(dmuPrincipal.qryRelClientes['NOME'], 1, 40));

            if (Filtro = 'Possui Produtos em Oferta') and (Filtrar = 'Sim') and
              (dmuPrincipal.qryProdutosEmOferta['Descr'] <> null) then
            begin
              Mensagem := SubstituirTexto(Mensagem,
                '[Produto___________________]',
                copy(dmuPrincipal.qryProdutosEmOferta['Descr'], 1, 28));
              if dmuPrincipal.qryProdutosEmOferta['Numped'] <> null then
                Mensagem := SubstituirTexto(Mensagem, '[Pedido]',
                  copy(dmuPrincipal.qryProdutosEmOferta['Numped'], 1, 10));
            end;
            if (Filtro = 'Indica Categoria  Para') and (Filtrar = 'Sim') and
              (dmuPrincipal.qryCategoriaOferta['Descr'] <> null) then
            begin
              BuscaProdutoOferta(ParametroFiltro2);
              if dmuPrincipal.qryCategoriaOferta.RecordCount = 0 then
                Mensagem := SubstituirTexto(Mensagem,
                  '[Produto___________________]', '')
              else if not dmuPrincipal.qryCategoriaOfertadescr.Isnull then
                Mensagem := SubstituirTexto(Mensagem,
                  '[Produto___________________]',
                  copy(dmuPrincipal.qryCategoriaOferta['Descr'], 1, 28));
            end;
            if not EstaNaListaNegra(Celular) then
            begin
              InsereSms(Celular, Mensagem);
            end;
            if not VerificaInternet then
            begin
              mmListaEnviados.Lines.Add(
                'Computador Sem internet Verifique sua conex�o');
              mmCaixaDeSaida.Lines.Add
                ('Promo��o ' + FormatDateTime('dd/mm/yyyy',
                  Date) + '-' + FormatDateTime('hh:mm:ss',
                  Time) + '-' + Celular + ' ' + Mensagem);
            end
            else
            begin
              if EstaNaListaNegra(Celular) then
                mmListaEnviados.Lines.Add(
                  'Sms Maketing N�o Enviado Lista Negra - ' + FormatDateTime
                    ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                    Time) + '-' + Celular + ' ' + Mensagem)
              else
              begin
                mmListaEnviados.Lines.Add('Sms Maketing - ' + FormatDateTime
                    ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                    Time) + '-' + Celular + ' ' + Mensagem);
              end;
            end;
            Contador := Contador + 1;
            { if EnviarNEnviados = 'Sim' then
              begin
              if dmuPrincipal.qryCelulares['IdCliente'] <>  null then
              CriaListaJaEnviados(dmuPrincipal.qryCelulares['IdCliente'] );
              end; }
            lbEnviadosPromocao.Caption := IntToStr
              (1 + StrToInt(lbEnviadosPromocao.Caption));
            NumeroSmsEnviadosAgora := NumeroSmsEnviadosAgora + 1;
            if not VerificaInternet then
              mmListaEnviados.Lines.Add(
                'Computador Sem internet Verifique sua conex�o');
          end
          else
            mmListaEnviados.Lines.Add(
              'Sms n�o enviado o cliente n�o possui um celular valido -' +
                'Marketing - ' + copy(dmuPrincipal.qryRelClientes['NOME'], 1,
                40) + ' - ' + FormatDateTime('dd/mm/yyyy',
                Date) + '-' + FormatDateTime('hh:mm:ss', Time));
          dmuPrincipal.qryRelClientes.Next;
          ContadorClientes := ContadorClientes + 1;
          if ContadorClientes = TotalClientes then
            TotalSms := 0;
        end;
        CloseFile(Arq);
        if VerificaInternet then
        Begin
          // EnviaAcrescentaArquivo('EnviaPromocao.txt',True);
          if ckPausarAvisoDeEnvio.Checked = False then
            pcListas.Show;
        end
        else
        begin
          tAguardaReconexao.Enabled := true;
          mmCaixaDeSaida.Lines.SaveToFile('NaoEnviadas.txt');
          pcCaixaDeSaida.Show;
          lbEnviadosPromocao.Caption := IntToStr
            (StrToInt(lbEnviadosPromocao.Caption) - NumeroSmsEnviadosAgora);
          GravandoNumeroMsgNaoEnviadas(IntToStr(NumeroSmsEnviadosAgora),
            IntToStr(0), IntToStr(0), IntToStr(0));
        end;
      end;

      procedure EnviaAgendamentoPromocaoEmail(NumeroSms: Integer;
        Filtro, ParametroFiltro, ParametroFiltro2, Msg, Limitar, Filtrar,
        EnviarNEnviados, ParametroFiltro3, Titulo, CodigoTexto, Inicio,
        Data: String);
      var
        Contador: Integer;
        Mensagem, EmailaEnviar, Comando, Identificacao: String;
        Texto: PansiChar;
        Arq: TextFile;
        TotalSms: Integer;
        TotalClientes: Integer;
        ContadorClientes: Integer;
        NumeroEmailEnviadosAgora: Integer;
      begin
        NumeroEmailEnviadosAgora := 0;
        BuscarClientes(EnviarNEnviados, Filtrar, Filtro, ParametroFiltro,
          ParametroFiltro2, ParametroFiltro3);
        ContadorClientes := 0;
        Contador := 0;
        TotalClientes := dmuPrincipal.qryRelClientes.RecordCount;
        if Limitar = 'N�o' then
          TotalSms := TotalClientes
        else
          TotalSms := (NumeroSms);
        if TotalClientes = 0 then
        begin
          mmListaEnviados.Lines.Add('Sem Clientes para enviar Email');
          TotalSms := 0;
        end
        else
        begin
          Identificacao := dmuPrincipal.qryRelClientes['Oid'] +
            RemoveCaracteresEspeciais(FormatDateTime('dd/mm/yyyy', Date))
            + RandomRange(1, 300);
          if ckReceberControleAmostraEmail.Checked then
          begin
            Titulo := 'Email Controle - ' + 'Agendamento  - ' + ' - ' + Titulo;
            InsereEmail(edEmail.Text, edEmail.Text, Titulo, (Identificacao));
          end;
        end;
        while Contador <= TotalSms - 1 do
        begin
          Application.ProcessMessages;

          if ((not(BuscaEmail(dmuPrincipal.qryRelClientes['Oid'],
                  '32979') = '')) or (rgOpcaoDeEnvioEmail.ItemIndex = 0)) then
          begin
            Randomize;
            Identificacao := dmuPrincipal.qryRelClientes['Oid'] +
              RemoveCaracteresEspeciais(FormatDateTime('dd/mm/yyyy', Date))
              + RandomRange(1, 300);
            case rgOpcaoDeEnvioEmail.ItemIndex of
              1:
                EmailaEnviar := BuscaEmail(dmuPrincipal.qryRelClientes['Oid'],
                  '32979');
              0:
                EmailaEnviar := edEmailEnvio.Text;
            end;
            if ParametroFiltro <> '' then
              BuscaProdutoPedido(dmuPrincipal.qryRelClientes['Oid'],
                ParametroFiltro);
            Mensagem := Msg;
            if not VerificaInternet then
            begin
              mmListaEnviados.Lines.Add(
                'Computador Sem internet Verifique sua conex�o');
              mmCaixaDeSaida.Lines.Add('Email Marketing ' + FormatDateTime
                  ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                  Time) + '-' + EmailaEnviar + ' ' + Titulo);
            end
            else
            begin
              if EstaNaListaNegra(EmailaEnviar) then
                mmListaEnviados.Lines.Add(
                  'Email Marketing N�o Enviado Lista Negra - ' + FormatDateTime
                    ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                    Time) + '-' + EmailaEnviar + ' ' + Titulo)
              else
              begin
                if (rgOpcaoDeEnvioEmail.ItemIndex = 1) then
                begin
                  if ValidarEMail(EmailaEnviar) then
                  begin
                    InsereEmail(edEmail.Text, EmailaEnviar, Titulo,
                      Identificacao);
                    mmListaEnviados.Lines.Add
                      ('Email Marketing - ' + FormatDateTime('dd/mm/yyyy',
                        Date) + '-' + FormatDateTime('hh:mm:ss',
                        Time) + '-' + EmailaEnviar + ' ' + Titulo);
                    // SalvarArquivoHistorico('Email Marketing - '+FormatDateTime('dd/mm/yyyy',Date)+'-'+FormatDatetime('hh:mm:ss',Time)+'-'+EmailaEnviar+' '+Titulo);
                  end
                  else
                    mmListaEnviados.Lines.Add(
                      'Email n�o enviado o cliente n�o possui um Email valido -'
                        + 'Email Marketing - ' + copy
                        (dmuPrincipal.qryRelClientes['NOME'], 1,
                        40) + ' - ' + FormatDateTime('dd/mm/yyyy',
                        Date) + '-' + FormatDateTime('hh:mm:ss', Time));
                end;
                if (rgOpcaoDeEnvioEmail.ItemIndex = 0) then
                begin
                  InsereEmail(edEmail.Text, EmailaEnviar, Titulo,
                    Identificacao);
                  mmListaEnviados.Lines.Add
                    ('Email Marketing - ' + FormatDateTime('dd/mm/yyyy',
                      Date) + '-' + FormatDateTime('hh:mm:ss',
                      Time) + '-' + EmailaEnviar + ' ' + Titulo);
                end;
              end;
            end;
            Contador := Contador + 1;
            { if EnviarNEnviados = 'Sim' then
              begin
              if dmuPrincipal.qryCelulares['IdCliente'] <>  null then
              CriaListaJaEnviados(dmuPrincipal.qryCelulares['IdCliente'] );
              end; }
            // lbEnviadosPromocao.Caption := IntToStr(1 +  StrToInt(lbEnviadosPromocao.Caption))  ;
            NumeroEmailEnviadosAgora := NumeroEmailEnviadosAgora + 1;
            if not VerificaInternet then
              mmListaEnviados.Lines.Add(
                'Computador Sem internet Verifique sua conex�o');
          end
          else
            mmListaEnviados.Lines.Add(
              'Email n�o enviado o cliente n�o possui um Email valido -' +
                'Email Marketing - ' + copy
                (dmuPrincipal.qryRelClientes['NOME'], 1,
                40) + ' - ' + FormatDateTime('dd/mm/yyyy',
                Date) + '-' + FormatDateTime('hh:mm:ss', Time));
          dmuPrincipal.qryRelClientes.Next;
          ContadorClientes := ContadorClientes + 1;
          if ContadorClientes = TotalClientes then
            TotalSms := 0;
        end;
        if VerificaInternet then
        Begin
          if ckPausarAvisoDeEnvio.Checked = False then
            pcListas.Show;
        end
        else
        begin
          tAguardaReconexao.Enabled := true;
          mmCaixaDeSaida.Lines.SaveToFile('NaoEnviadas.txt');
          pcCaixaDeSaida.Show;
          // lbEnviadosPromocao.Caption := IntToStr(StrToInt(lbEnviadosPromocao.Caption) - NumeroSmsEnviadosAgora);
          GravandoNumeroMsgNaoEnviadas(IntToStr(NumeroEmailEnviadosAgora),
            IntToStr(0), IntToStr(0), IntToStr(0));
        end;
      end;

      procedure EnviaSmsListaExterna(NumeroSms: Integer;
        Filtro, ParametroFiltro, ParametroFiltro2, Msg, Limitar,
        Filtrar, EnviarNEnviados, ParametroFiltro3: String);
      var
        Contador, ContadorLinhas: Integer;
        Mensagem, Celular, Comando: String;
        Texto: PansiChar;
        Arq: TextFile;
        TotalSms: Integer;
        TotalClientes: Integer;
        ContadorClientes: Integer;
        NumeroSmsEnviadosAgora: Integer;
      begin
        ContadorClientes := 0;
        Contador := 1;
        ContadorLinhas := 1;
        TotalClientes := sgListaExterna.RowCount;
        if Limitar = 'N�o' then
          TotalSms := TotalClientes
        else
          TotalSms := (NumeroSms);
        while Contador <= sgListaExterna.RowCount - 1 do
        begin
          ContadorLinhas := ContadorLinhas + 1;
          Application.ProcessMessages;
          if (((Sms.sgListaExterna.Cells[2, Contador] <> '') or
                (rgOpcaoDeEnvio.ItemIndex = 0)) and
              (ParametroFiltro = Sms.sgListaExterna.Cells[3, Contador])) or
            (((Sms.sgListaExterna.Cells[2, Contador] <> '') or
                (rgOpcaoDeEnvio.ItemIndex = 0)) and (ParametroFiltro = 'Todos')
            ) then
          begin
            case rgOpcaoDeEnvio.ItemIndex of
              1:
                Celular := Sms.sgListaExterna.Cells[2, Contador];
              0:
                Celular := edCelularTeste.Text;
            end;
            Mensagem := EscolheOpcaoMsg(Msg);
            Mensagem := SubstituirTexto(Mensagem,
              '[cliente______________________________]',
              copy(Sms.sgListaExterna.Cells[0, Contador], 1, 40));
            if not EstaNaListaNegra(Celular) then
            begin
              InsereSms(Celular, Mensagem);
            end;
            if EstaNaListaNegra(Celular) then
              mmListaEnviados.Lines.Add(
                'Sms Maketing N�o Enviado Lista Negra - ' + FormatDateTime
                  ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                  Time) + '-' + Celular + ' ' + Mensagem)
            else
            begin
              mmListaEnviados.Lines.Add('Sms Maketing - ' + FormatDateTime
                  ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                  Time) + '-' + Celular + ' ' + Mensagem);

            end;
            Contador := Contador + 1;
            lbEnviadosPromocao.Caption := IntToStr
              (1 + StrToInt(lbEnviadosPromocao.Caption));
            NumeroSmsEnviadosAgora := NumeroSmsEnviadosAgora + 1;

          end;
          ContadorClientes := ContadorClientes + 1;
          if ContadorClientes = TotalClientes then
            TotalSms := 0;
          Contador := Contador + 1;
        end;
        if ckPausarAvisoDeEnvio.Checked = False then
          pcListas.Show;
      end;

      procedure EnviaEmailListaExterna(NumeroSms: Integer;
        Filtro, ParametroFiltro, ParametroFiltro2, Msg, Limitar, Filtrar,
        EnviarNEnviados, ParametroFiltro3, Titulo, CodigoTexto, Inicio,
        Data: String);
      var
        Contador, ContadorLinhas: Integer;
        Mensagem, Email, Comando: String;
        Texto: PansiChar;
        Arq: TextFile;
        TotalSms: Integer;
        TotalClientes: Integer;
        ContadorClientes: Integer;
        NumeroSmsEnviadosAgora: Integer;
        Identificacao: String;
        EmailaEnviar: String;
        Linha: String;
      begin
        ContadorClientes := 0;
        Contador := 1;
        ContadorLinhas := 1;
        TotalClientes := sgListaExterna.RowCount;
        if Limitar = 'N�o' then
          TotalSms := TotalClientes
        else
          TotalSms := (NumeroSms);
        while Contador <= sgListaExterna.RowCount - 1 do
        begin
          ContadorLinhas := ContadorLinhas + 1;
          Application.ProcessMessages;
          Linha := Sms.sgListaExterna.Cells[1, Contador];
          if (((Sms.sgListaExterna.Cells[1, Contador] <> '') or
                (rgOpcaoDeEnvio.ItemIndex = 0)) and
              (ParametroFiltro = Sms.sgListaExterna.Cells[3, Contador])) or
            (((Sms.sgListaExterna.Cells[1, Contador] <> '') or
                (rgOpcaoDeEnvio.ItemIndex = 0)) and (ParametroFiltro = 'Todos')
            ) then
          begin
            case rgOpcaoDeEnvio.ItemIndex of
              1:
                EmailaEnviar := Sms.sgListaExterna.Cells[1, Contador];
              0:
                EmailaEnviar := edEmailEnvio.Text;
            end;
            Mensagem := Msg;
            // Mensagem := SubstituirTexto(Mensagem,'[cliente______________________________]',
            // copy(Sms.sgListaExterna.Cells[0,Contador], 1, 40));
            if not EstaNaListaNegra(EmailaEnviar) then
            begin
              Randomize;
              Identificacao := IntToStr(Length(EmailaEnviar))
                + RemoveCaracteresEspeciais(FormatDateTime('dd/mm/yyyy',
                  Date)) + IntToStr(RandomRange(1, 300));
              InsereEmail(edEmail.Text, EmailaEnviar, Titulo, CodigoTexto);
            end;
            if EstaNaListaNegra(EmailaEnviar) then
              mmListaEnviados.Lines.Add(
                'Email Maketing N�o Enviado Lista Negra - ' + FormatDateTime
                  ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                  Time) + '-' + EmailaEnviar + ' ' + Mensagem)
            else
            begin
              mmListaEnviados.Lines.Add
                ('Email Maketing Lista Externa- ' + FormatDateTime
                  ('dd/mm/yyyy', Date) + '-' + FormatDateTime
                  ('hh:mm:ss', Time) + '-' + EmailaEnviar + ' ' + Mensagem);

            end;
            // Contador := Contador + 1;
            lbEnviadosPromocao.Caption := IntToStr
              (1 + StrToInt(lbEnviadosPromocao.Caption));
            NumeroSmsEnviadosAgora := NumeroSmsEnviadosAgora + 1;

          end;
          ContadorClientes := ContadorClientes + 1;
          if ContadorClientes = TotalClientes then
            TotalSms := 0;
          Contador := Contador + 1;
        end;
        if ckPausarAvisoDeEnvio.Checked = False then
          pcListas.Show;
      end;

      procedure VerificaAgendamento;
      Var
        Total, Contador: Integer;
        Conteudo, Filtro, ParametroFiltro, ParametroFiltro2, Msg, Limitar,
          Filtrar, EnviarNEnviado, ParametroFiltro3, EnviarEmail, Titulo,
          Email, Tipo, ValorLInha: String;
        NumeroSms: Integer;
      begin
        Total := sgListaAgendamentosMarketing.RowCount;
        Contador := 1;
        PreencherTitulosAgendamentos;
        while Contador <= Total - 1 do
        begin
          Application.ProcessMessages;
          Conteudo := Trim(sgListaAgendamentosMarketing.Cells[11, Contador]);
          if (Conteudo = ('Ativo')) and (PermitidaVerificacaoNodia) and
            (Trim(sgListaAgendamentosMarketing.Cells[12, Contador])
              <> FormatDateTime('dd/mm/yyyy', Date)) and
            (Trim(sgListaAgendamentosMarketing.Cells[2, Contador])
              = FormatDateTime('hh:mm', Time)) and
            ((Trim(sgListaAgendamentosMarketing.Cells[1,
                Contador]) = FormatDateTime('dd/mm/yyyy', Date)) or
              (Trim(sgListaAgendamentosMarketing.Cells[1, Contador]) = '') or
              (Trim(sgListaAgendamentosMarketing.Cells[1,
                Contador]) = FormatDateTime('dd', Date))) then
          begin
            if sgListaAgendamentosMarketing.Cells[5, Contador] <> '' then
              NumeroSms := StrToInt(sgListaAgendamentosMarketing.Cells[5,
                Contador]);
            Filtro := sgListaAgendamentosMarketing.Cells[7, Contador];
            ParametroFiltro := sgListaAgendamentosMarketing.Cells[8, Contador];
            ParametroFiltro2 := sgListaAgendamentosMarketing.Cells[9, Contador];
            ParametroFiltro3 := sgListaAgendamentosMarketing.Cells[10,
              Contador];
            Msg := Trim(sgListaAgendamentosMarketing.Cells[0, Contador]);
            Limitar := Trim(sgListaAgendamentosMarketing.Cells[4, Contador]);
            Filtrar := sgListaAgendamentosMarketing.Cells[6, Contador];
            EnviarNEnviado := sgListaAgendamentosMarketing.Cells[3, Contador];
            Titulo := Trim(sgListaAgendamentosMarketing.Cells[0, Contador]);
            Tipo := sgListaAgendamentosMarketing.Cells[14, Contador];
            if Tipo = 'Email' then
              Email := sgListaAgendamentosMarketing.Cells[13, Contador];
            if Tipo = 'Sms' then
            begin
              sgListaAgendamentosMarketing.Cells[12, Contador] := FormatDateTime
                ('dd/mm/yyyy', Date);
              SalvandoStringGridAgendamentoMarketing;

              EnviaAgendamentoPromocao(NumeroSms, Filtro, ParametroFiltro,
                ParametroFiltro2, Msg, Limitar, Filtrar, EnviarNEnviado,
                ParametroFiltro3); // comentado para teste lista externa
              // ===================== Envio Lista Externa=====================================
              ValorLInha := sgListaAgendamentosMarketing.Cells[15, Contador];
              if sgListaAgendamentosMarketing.Cells[15, Contador] = 'Sim' then
              begin
                EnviaSmsListaExterna(NumeroSms, Filtro,
                  sgListaAgendamentosMarketing.Cells[16, Contador], '', Msg,
                  Limitar, '', EnviarNEnviado, '');
              end;
              // ==============================================================================
            end;
            if Tipo = 'Email' then
            begin

              EnviaAgendamentoPromocaoEmail(NumeroSms, Filtro, ParametroFiltro,
                ParametroFiltro2, Msg, Limitar, Filtrar, EnviarNEnviado,
                ParametroFiltro3, Titulo, Email,
                Trim(sgListaAgendamentosMarketing.Cells[2, Contador]),
                FormatDateTime('dd/mm/yyyy', Date)); // retirado para teste

              sgListaAgendamentosMarketing.Cells[12, Contador] := FormatDateTime
                ('dd/mm/yyyy', Date);
              SalvandoStringGridAgendamentoMarketing;
              // ===================== Envio Lista Externa Email ==============================
              if sgListaAgendamentosMarketing.Cells[15, Contador] = 'Sim' then
              begin
                EnviaEmailListaExterna(NumeroSms, Filtro,
                  sgListaAgendamentosMarketing.Cells[16, Contador],
                  ParametroFiltro2, Msg, Limitar, Filtrar, EnviarNEnviado,
                  ParametroFiltro3, Titulo, Email,
                  Trim(sgListaAgendamentosMarketing.Cells[2, Contador]),
                  FormatDateTime('dd/mm/yyyy', Date));
              end;
              // ==============================================================================
            end;

            // BuscaAgendamentoServidor(Titulo,sgListaAgendamentosMarketing.Cells[1,Contador],sgListaAgendamentosMarketing.Cells[2,Contador],sgListaAgendamentosMarketing.Cells[14,Contador],edCnpj.Text);
            // EditarAgendamentoServidor(Titulo,sgListaAgendamentosMarketing.Cells[1,Contador],sgListaAgendamentosMarketing.Cells[2,Contador],edCnpj.Text,sgListaAgendamentosMarketing.Cells[14,Contador],sgListaAgendamentosMarketing.Cells[12,Contador]);
          end;
          Contador := Contador + 1;
        end;
      end;

    begin
      if (PermitidaVerificacaoNodia) then
      begin
        tVerificaAgendamentos.Enabled := False;
        try
          VerificaAgendamento;
          tVerificaAgendamentos.Enabled := true;
        except
          tVerificaAgendamentos.Enabled := true;
        end;
      end;
    end;

    procedure TSms.Ativar1Click(Sender: TObject);
    begin
      Sms.sgListaAgendamentosMarketing.Cells[11, LinhaSelecionada] := 'Ativo';
      SalvandoStringGridAgendamentoMarketing;
    end;

    procedure TSms.Desativar1Click(Sender: TObject);
    begin
      Sms.sgListaAgendamentosMarketing.Cells[11,
        LinhaSelecionada] := 'Desativado';
      SalvandoStringGridAgendamentoMarketing;
    end;

    procedure TSms.sgListaAgendamentosMarketingSelectCell(Sender: TObject;
      ACol, ARow: Integer; var CanSelect: Boolean);
    begin
      ColunaSelecionada := ACol;
      LinhaSelecionada := ARow;
    end;

    procedure TSms.sgListaExternaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    begin
      if LinhaSelecionadaListaExterna + 1 = sgListaExterna.RowCount then
        sgListaExterna.RowCount := sgListaExterna.RowCount + 1;
    end;

    procedure TSms.sgListaExternaKeyPress(Sender: TObject; var Key: Char);
    begin
      if Key = #13 then
        SalvandoStringGridListaExterna;
    end;

    procedure TSms.sgListaExternaSelectCell(Sender: TObject;
      ACol, ARow: Integer; var CanSelect: Boolean);
    begin
      LinhaSelecionadaListaExterna := ARow;
      ColunaSelecionadaListaExterna := ACol;
      ComboNaListaExterna;
    end;

    procedure TSms.btInserirAgendamentoClick(Sender: TObject);
    begin
      tsMarketing.Show;
    end;

    procedure TSms.btRemoverAgendamentoClick(Sender: TObject);
      procedure preenche(Linha, coluna: Integer; Texto: String);
      begin
        Sms.sgListaAgendamentosMarketing.Cells[coluna, Linha] := Texto;
      end;

    begin
      // ApagarAgendamentoServidor(LinhaSelecionada);
      preenche(LinhaSelecionada, 0, '');
      preenche(LinhaSelecionada, 1, '');
      preenche(LinhaSelecionada, 2, '');
      preenche(LinhaSelecionada, 3, '');
      preenche(LinhaSelecionada, 4, '');
      preenche(LinhaSelecionada, 5, '');
      preenche(LinhaSelecionada, 6, '');
      preenche(LinhaSelecionada, 7, '');
      preenche(LinhaSelecionada, 8, '');
      preenche(LinhaSelecionada, 9, '');
      preenche(LinhaSelecionada, 10, '');
      preenche(LinhaSelecionada, 11, '');
      preenche(LinhaSelecionada, 12, '');
      preenche(LinhaSelecionada, 13, '');
      preenche(LinhaSelecionada, 14, '');
      TAuxGrid(sgListaAgendamentosMarketing).DeleteRow(LinhaSelecionada);
      SalvandoStringGridAgendamentoMarketing;
      // RecarregandoStringGridAgendamentoMarketing;
    end;

    procedure TSms.mmMensagemAvisoVendaSmsEnter(Sender: TObject);
    begin
      mmMensagemAvisoVendaEmail.Color := $00CCFFFF;
      mmMsgEntrega.Text :=
        'Se precisar clique com o bot�o direito na mensagem de Aviso de Venda de Email e veja exemplos de Sms Aviso de Venda de Email';
    end;

    procedure TSms.mmMensagemAvisoVendaSmsExit(Sender: TObject);
    begin
      mmMsgEntrega.Clear;
      mmMensagemAvisoVendaEmail.Color := clWindow;
    end;

    procedure TSms.ckAtivarOEnviodeSmsVendaSmsClick(Sender: TObject);

      Function VerificaPreenchimentoMsgVenda: Boolean;
      begin
        Result := true;
        if Trim(mmMensagemAvisoVendaSms.Text) = '' then
        begin
          Result := False;
          ckAtivarOEnviodeSmsVendaSms.Checked := False;
          mmMsgEntrega.Text := 'Preencha uma Mensagem para o Aviso de Venda';
        end;
      end;

      procedure AtivaDEsativaEnvioVenda;
      begin
        if (ckAtivarOEnviodeSmsVendaSms.Checked = true) and
          (VerificaPreenchimentoMsgVenda) then
        begin
          mmMensagemAvisoVendaSms.Enabled := False;
          btInsereClienteVendaSms.Enabled := False;
          ckAtivarOEnviodeSmsVendaSms.Checked := true;
          dmuPrincipal.qryVendas.Active := true;
          UltimaVenda := dmuPrincipal.qryVendasNumped.AsInteger;
          mmMsgEntrega.Text := 'Aviso de Venda Sms Ativo';
          tVerificaVendaOrcamento.Enabled := true;
        end
        else
        begin
          mmMensagemAvisoVendaSms.Enabled := true;
          btInsereClienteVendaSms.Enabled := true;
          ckAtivarOEnviodeSmsVendaEmail.Checked := False;
          mmMsgEntrega.Text := 'Aviso de Venda Sms Desativado';
        end;
      end;

    begin
      AtivaDEsativaEnvioVenda;
      AbasteceListaAtivados(ckAtivarOEnviodeSmsVendaSms);
      SalvaMemo(mmMensagemAvisoVendaSms);
      SalvaEdit(edCelularTeste);
      SalvaEdit(edEmailEnvio);
    end;

    procedure TSms.btIniciarVendaClick(Sender: TObject);
    var
      Contador: Integer;
      Mensagem, Celular: String;
      Arq: TextFile;
      NumeroSmsEnviadosAgora: Integer;
    begin
      tVerificaVendaOrcamento.Enabled := False;
      Mensagem := SubstituirTexto(mmMensagemAvisoVendaSms.Text,
        '[cliente______________________________]',
        copy(dmuPrincipal.qryVendas['NOME'], 1, 40));

      if (not(BuscaCelular(dmuPrincipal.qryVendas['OID'], '1075,1071') = ''))
        or (rgOpcaoDeEnvio.ItemIndex = 0) then
      begin
        case rgOpcaoDeEnvio.ItemIndex of
          1:
            Celular := BuscaCelular(dmuPrincipal.qryVendas['OID'], '1075,1071');
          0:
            Celular := edCelularTeste.Text;
        end;
        if not EstaNaListaNegra(Celular) then
        begin
          InsereSms(Celular, Mensagem);
        end;
        // CloseFile(arq);
        if not VerificaInternet then
        begin
          mmListaEnviados.Lines.Add(
            'Computador Sem internet Verifique sua conex�o');
          mmCaixaDeSaida.Lines.Add('Sms AvisoVenda ' + FormatDateTime
              ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
              Time) + '-' + Celular + ' ' + Mensagem);
        end
        else
        begin
          if EstaNaListaNegra(Celular) then
            mmListaEnviados.Lines.Add(
              'Sms AvisoVenda N�o Enviado Lista Negra - ' + FormatDateTime
                ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                Time) + '-' + Celular + ' ' + Mensagem)
          else
          begin
            mmListaEnviados.Lines.Add('Sms AvisoVenda - ' + FormatDateTime
                ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                Time) + '-' + Celular + ' ' + Mensagem);

          end;
        end;
        lbEnviadosVendaSms.Caption := IntToStr
          (StrToInt(lbEnviadosVendaSms.Caption) + 1);
      end
      else
        mmListaEnviados.Lines.Add(
          'Sms n�o enviado o cliente n�o possui um celular valido -' +
            'Aviso de Venda - ' + copy(dmuPrincipal.qryVendas['Nome'], 1,
            40) + ' - ' + FormatDateTime('dd/mm/yyyy',
            Date) + '-' + FormatDateTime('hh:mm:ss', Time));
      // if GetFileSize('EnviaEntrega.txt') > 0 then
      // begin
      if VerificaInternet then
      begin
        if ckPausarAvisoDeEnvio.Checked = False then
          pcListas.Show;
      end
      else
      begin
        tAguardaReconexao.Enabled := true;
        tVerificaVendaOrcamento.Enabled := False;
        mmCaixaDeSaida.Lines.SaveToFile('NaoEnviadas.txt');
        pcCaixaDeSaida.Show;
        lbEnviadosVendaSms.Caption := IntToStr
          (StrToInt(lbEnviadosVendaSms.Caption) + 1);
        NumeroSmsEnviadosAgora := 1;
        GravandoNumeroMsgNaoEnviadas(IntToStr(0), IntToStr(0),
          IntToStr(NumeroSmsEnviadosAgora), IntToStr(0));
      end;
      // end;
      UltimaVenda := dmuPrincipal.qryVendas['Numped'];
      tVerificaVendaOrcamento.Enabled := true;
    end;

    procedure TSms.ckAtivaAvisoOrcamentoSmsClick(Sender: TObject);

      Function VerificaPreenchimentoMsgOrcamento: Boolean;
      begin
        Result := true;
        if Trim(mmMensagemAvisoOrcamentoSms.Text) = '' then
        begin
          Result := False;
          ckAtivaAvisoOrcamentoSms.Checked := False;
          mmMsgEntrega.Text :=
            'Preencha uma Mensagem para o Aviso de Or�amento';
        end;
      end;

      procedure AtivaDesativaEnvioOrcamento;
      begin
        if (ckAtivaAvisoOrcamentoSms.Checked = true) and
          (VerificaPreenchimentoMsgOrcamento) then
        begin
          mmMensagemAvisoOrcamentoSms.Enabled := False;
          btInsereClienteOrcamentoSms.Enabled := False;
          ckAtivaAvisoOrcamentoSms.Checked := true;
          dmuPrincipal.qryOrcamento.Active := true;
          UltimoOrcamento := dmuPrincipal.qryOrcamentoNumped.AsInteger;
          mmMsgEntrega.Text := 'Aviso de Or�amento Ativo';
          tVerificaVendaOrcamento.Enabled := true;
        end
        else
        begin
          mmMensagemAvisoOrcamentoSms.Enabled := true;
          btInsereClienteOrcamentoSms.Enabled := true;
          // tVerificaVendaOrcamento.Enabled := False;
          mmMsgEntrega.Text := 'Aviso de Or�amento Desativado';
          ckAtivaAvisoOrcamentoEmail.Checked := False;
        end;
      end;

    begin
      AtivaDesativaEnvioOrcamento;
      AbasteceListaAtivados(ckAtivaAvisoOrcamentoSms);
      SalvaMemo(mmMensagemAvisoOrcamentoSms);
      SalvaEdit(edCelularTeste);
      SalvaEdit(edEmailEnvio);
    end;

    procedure TSms.mmMensagemAvisoOrcamentoSmsChange(Sender: TObject);
    begin
      if mmMensagemAvisoOrcamentoSms.Text <> '' then
        mmFaltaCaracteresAvisoOrcamento.Caption :=
          'Caracteres Faltantes : ' + IntToStr(ContaStringFalta('160',
            mmMensagemAvisoOrcamentoSms.Text));
    end;

    procedure TSms.mmMensagemAvisoOrcamentoSmsEnter(Sender: TObject);
    begin
      mmMensagemAvisoOrcamentoSms.Color := $00CCFFFF;
      mmMsgEntrega.Text :=
        'Se precisar clique com o bot�o direito na mensagem de Aviso de Or�amento e veja exemplos de Sms Aviso de Or�amento';
    end;

    procedure TSms.mmMensagemAvisoOrcamentoSmsExit(Sender: TObject);
    begin
      mmMsgEntrega.Clear;
      mmMensagemAvisoOrcamentoSms.Color := clWindow;
    end;

    procedure TSms.btInsereClienteOrcamentoSmsClick(Sender: TObject);
    begin
      if pos('[cliente______________________________]',
        mmMensagemAvisoOrcamentoSms.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmMensagemAvisoOrcamentoSms.SelText :=
          '[cliente______________________________]';
    end;

    procedure TSms.btInsereClienteVendaSmsClick(Sender: TObject);
    begin
      if pos('[cliente______________________________]',
        mmMensagemAvisoVendaSms.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmMensagemAvisoVendaSms.SelText :=
          '[cliente______________________________]';
    end;

    procedure TSms.tVerificaVendaOrcamentoTimer(Sender: TObject);

      procedure IniciaEnvioVendaEmail;
      var
        Mensagem, Email: String;
        Arq: TextFile;
        NumeroSmsEnviadosAgora: Integer;
      begin
        tVerificaVendaOrcamento.Enabled := False;
        Mensagem := SubstituirTexto(mmMensagemAvisoVendaEmail.Text,
          '[cliente______________________________]',
          copy(dmuPrincipal.qryVendas['NOME'], 1, 40));
        SalvarAquivoTextoEmail(Mensagem, 'EmailAvisoVenda');
        if (not(BuscaEmail(dmuPrincipal.qryVendas['OID'], '32979') = '')) or
          (rgOpcaoDeEnvioEmail.ItemIndex = 0) then
        begin
          case rgOpcaoDeEnvioEmail.ItemIndex of
            1:
              Email := BuscaEmail(dmuPrincipal.qryVendas['OID'], '32979');
            0:
              Email := edEmailEnvio.Text;
          end;
          if not VerificaInternet then
          begin
            mmListaEnviados.Lines.Add(
              'Computador Sem internet Verifique sua conex�o');
            mmCaixaDeSaida.Lines.Add('AvisoVendaEmail - ' + FormatDateTime
                ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                Time) + '-' + Email + ' ' + 'EmailAvisoVenda');
          end
          else
          begin
            if EstaNaListaNegra(Email) then
              mmListaEnviados.Lines.Add(
                'AvisoVendaEmail N�o Enviado Lista Negra - ' + FormatDateTime
                  ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                  Time) + '-' + Email + ' ' + 'EmailAvisoVenda')
            else
            begin
              if (ValidarEMail(Email)) then
              begin

                InsereEmail(edEmail.Text, Email, edTituloEmailAvisoVenda.Text,
                  'TextoEmailVenda');
                mmListaEnviados.Lines.Add('AvisoVendaEmail - ' + FormatDateTime
                    ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                    Time) + '-' + Email + ' ' + 'EmailAvisoVenda');

              end
              else
                mmListaEnviados.Lines.Add(
                  'Email n�o enviado o cliente n�o possui um Email valido -' +
                    'Aviso de Venda Email - ' + copy
                    (dmuPrincipal.qryVendas['Nome'], 1,
                    40) + ' - ' + FormatDateTime('dd/mm/yyyy',
                    Date) + '-' + FormatDateTime('hh:mm:ss', Time));
            end;
          end;
          lbEnviadosVendaEmail.Caption := IntToStr
            (StrToInt(lbEnviadosVendaEmail.Caption) + 1);
        end
        else
          mmListaEnviados.Lines.Add(
            'Email n�o enviado o cliente n�o possui um Email valido -' +
              'Aviso de Venda Email - ' + copy(dmuPrincipal.qryVendas['Nome'],
              1, 40) + ' - ' + FormatDateTime('dd/mm/yyyy',
              Date) + '-' + FormatDateTime('hh:mm:ss', Time));
        // if GetFileSize('EnviaEmailVenda.txt') > 0 then
        // begin
        if VerificaInternet then
        begin
          if ckPausarAvisoDeEnvio.Checked = False then
            pcListas.Show;
        end
        else
        begin
          tAguardaReconexao.Enabled := true;
          tVerificaVendaOrcamento.Enabled := False;
          mmCaixaDeSaida.Lines.SaveToFile('NaoEnviadas.txt');
          pcCaixaDeSaida.Show;
          lbEnviadosVendaEmail.Caption := IntToStr
            (StrToInt(lbEnviadosVendaEmail.Caption) + 1);
          NumeroSmsEnviadosAgora := 1;
          GravandoNumeroMsgNaoEnviadas(IntToStr(0), IntToStr(0),
            IntToStr(NumeroSmsEnviadosAgora), IntToStr(0));
        end;
        // end;
        // UltimaVenda := dmuPrincipal.qryVendas['Numped'];
        tVerificaVendaOrcamento.Enabled := true;
      end;

      procedure IniciaEnvioOrcamentoEmail;
      var
        Contador: Integer;
        Mensagem, Email: String;
        Arq: TextFile;
        NumeroSmsEnviadosAgora: Integer;
      begin
        tVerificaVendaOrcamento.Enabled := False;
        Mensagem := SubstituirTexto(mmMensagemAvisoOrcamentoEmail.Text,
          '[cliente______________________________]',
          copy(dmuPrincipal.qryOrcamento['NOME'], 1, 40));
        SalvarAquivoTextoEmail(Mensagem, 'TextoEmailOrcamento');
        if (not(BuscaEmail(dmuPrincipal.qryOrcamento['OID'], '32979') = '')) or
          (rgOpcaoDeEnvioEmail.ItemIndex = 0) then
        begin
          case rgOpcaoDeEnvioEmail.ItemIndex of
            1:
              Email := BuscaEmail(dmuPrincipal.qryOrcamento['OID'], '32979');
            0:
              Email := edEmailEnvio.Text;
          end;
          if not VerificaInternet then
          begin
            mmListaEnviados.Lines.Add(
              'Computador Sem internet Verifique sua conex�o');
            mmCaixaDeSaida.Lines.Add('AvisoOr�amentoEmail - ' + FormatDateTime
                ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                Time) + '-' + Email + ' ' + 'EmailOr�amento');
          end
          else
          begin
            if EstaNaListaNegra(Email) then
              mmListaEnviados.Lines.Add(
                'AvisoOr�amentoEmail N�o Enviado Lista Negra - ' +
                  FormatDateTime('dd/mm/yyyy', Date) + '-' + FormatDateTime
                  ('hh:mm:ss', Time) + '-' + Email + ' ' + 'EmailOr�amento')
            else
            begin
              if (ValidarEMail(Email)) then
              begin
                InsereEmail(edEmail.Text, Email,
                  edTituloEmailAvisoOrcamento.Text, 'TextoEmailOrcamento');
                mmListaEnviados.Lines.Add
                  ('AvisoOr�amentoEmail - ' + FormatDateTime('dd/mm/yyyy',
                    Date) + '-' + FormatDateTime('hh:mm:ss',
                    Time) + '-' + Email + ' ' + 'EmailOr�amento');

              end
              else
                mmListaEnviados.Lines.Add(
                  'Email n�o enviado o cliente n�o possui um Email valido -' +
                    'Aviso de Or�amento Email - ' + copy
                    (dmuPrincipal.qryOrcamento['Nome'], 1,
                    40) + ' - ' + FormatDateTime('dd/mm/yyyy',
                    Date) + '-' + FormatDateTime('hh:mm:ss', Time));
            end;
          end;
          lbAvisoOrcamentoEmail.Caption := IntToStr
            (StrToInt(lbAvisoOrcamentoEmail.Caption) + 1);
        end
        else
          mmListaEnviados.Lines.Add(
            'Email n�o enviado o cliente n�o possui um Email valido -' +
              'Aviso de Or�amento Email - ' + copy
              (dmuPrincipal.qryOrcamento['Nome'], 1,
              40) + ' - ' + FormatDateTime('dd/mm/yyyy',
              Date) + '-' + FormatDateTime('hh:mm:ss', Time));
        // if GetFileSize('EnviaEmailOrcamento.txt') > 0 then
        // begin
        if VerificaInternet then
        begin
          if ckPausarAvisoDeEnvio.Checked = False then
            pcListas.Show;
        end
        else
        begin
          tAguardaReconexao.Enabled := true;
          tVerificaVendaOrcamento.Enabled := False;
          mmCaixaDeSaida.Lines.SaveToFile('NaoEnviadas.txt');
          pcCaixaDeSaida.Show;
          lbAvisoOrcamentoEmail.Caption := IntToStr
            (StrToInt(lbAvisoOrcamentoEmail.Caption) + 1);
          NumeroSmsEnviadosAgora := 1;
          GravandoNumeroMsgNaoEnviadas(IntToStr(0), IntToStr(0),
            IntToStr(NumeroSmsEnviadosAgora), IntToStr(0));
        end;
        // end;
        // UltimaVenda := dmuPrincipal.qryVendas['Numped'];
        tVerificaVendaOrcamento.Enabled := true;
      end;

      procedure VerificaVenda;
      begin
        if ckAtivarOEnviodeSmsVendaSms.Checked then
        begin
          dmuPrincipal.qryVendas.Close;
          dmuPrincipal.qryVendas.Open;
          if dmuPrincipal.qryVendasNumped.AsInteger > UltimaVenda then
          begin
            btIniciarVenda.Click;
            if ckAtivarOEnviodeSmsVendaEmail.Checked then
              IniciaEnvioVendaEmail;
          end;
        end;
      end;

      procedure VerificaOrcamento;
      begin
        if ckAtivaAvisoOrcamentoSms.Checked then
        begin
          dmuPrincipal.qryOrcamento.Close;
          dmuPrincipal.qryOrcamento.Open;
          if dmuPrincipal.qryOrcamentoNumped.AsInteger > UltimoOrcamento then
          begin
            btIniciaOrcamento.Click;
            if ckAtivaAvisoOrcamentoEmail.Checked then
              IniciaEnvioOrcamentoEmail;
          end;
        end;
      end;

    begin
      if (PermitidaVerificacaoNodia) then
      begin
        VerificaVenda;
        VerificaOrcamento;
        tVerificaVendaOrcamento.Enabled := true;
      end;
    end;

    procedure TSms.btIniciaOrcamentoClick(Sender: TObject);
    var
      Contador: Integer;
      Mensagem, Celular: String;
      Arq: TextFile;
      NumeroSmsEnviadosAgora: Integer;
    begin
      tVerificaVendaOrcamento.Enabled := False;
      Mensagem := SubstituirTexto(mmMensagemAvisoOrcamentoSms.Text,
        '[cliente______________________________]',
        copy(dmuPrincipal.qryOrcamento['NOME'], 1, 40));
      if (not(BuscaCelular(dmuPrincipal.qryOrcamento['OID'], '1075,1071') = '')
        ) or (rgOpcaoDeEnvio.ItemIndex = 0) then
      begin
        case rgOpcaoDeEnvio.ItemIndex of
          1:
            Celular := BuscaCelular(dmuPrincipal.qryOrcamento['OID'],
              '1075,1071');
          0:
            Celular := edCelularTeste.Text;
        end;
        if not EstaNaListaNegra(Celular) then
        begin
          InsereSms(Celular, Mensagem);
        end;
        if not VerificaInternet then
        begin
          mmListaEnviados.Lines.Add(
            'Computador Sem internet Verifique sua conex�o');
          mmCaixaDeSaida.Lines.Add('Sms AvisoOr�amento ' + FormatDateTime
              ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
              Time) + '-' + Celular + ' ' + Mensagem);
        end
        else
        begin
          if EstaNaListaNegra(Celular) then
            mmListaEnviados.Lines.Add(
              'Sms AvisoO�amento N�o Enviado Lista Negra - ' + FormatDateTime
                ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                Time) + '-' + Celular + ' ' + Mensagem)
          else
          begin
            mmListaEnviados.Lines.Add('Sms AvisoO�amento - ' + FormatDateTime
                ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                Time) + '-' + Celular + ' ' + Mensagem);
            // SalvarArquivoHistorico('Sms AvisoOr�amento - '+FormatDateTime('dd/mm/yyyy',Date)+'-'+FormatDatetime('hh:mm:ss',Time)+'-'+Celular+' '+Mensagem);
          end;
        end;
        lbAvisoOrcamento.Caption := IntToStr
          (StrToInt(lbAvisoOrcamento.Caption) + 1);
      end
      else
        mmListaEnviados.Lines.Add(
          'Sms n�o enviado o cliente n�o possui um celular valido -' +
            'Aviso de Or�amento - ' + copy(dmuPrincipal.qryOrcamento['Nome'],
            1, 40) + ' - ' + FormatDateTime('dd/mm/yyyy',
            Date) + '-' + FormatDateTime('hh:mm:ss', Time));
      if GetFileSize('EnviaEntrega.txt') > 0 then
      begin
        if VerificaInternet then
        begin
          if ckPausarAvisoDeEnvio.Checked = False then
            pcListas.Show;
        end
        else
        begin
          tAguardaReconexao.Enabled := true;
          tVerificaVendaOrcamento.Enabled := False;
          mmCaixaDeSaida.Lines.SaveToFile('NaoEnviadas.txt');
          pcCaixaDeSaida.Show;
          lbAvisoOrcamento.Caption := IntToStr
            (StrToInt(lbAvisoOrcamento.Caption) + 1);
          NumeroSmsEnviadosAgora := 1;
          GravandoNumeroMsgNaoEnviadas(IntToStr(0), IntToStr(0),
            IntToStr(NumeroSmsEnviadosAgora), IntToStr(0));
        end;
      end;
      UltimoOrcamento := dmuPrincipal.qryOrcamento['Numped'];
      tVerificaVendaOrcamento.Enabled := true;
    end;

    procedure TSms.tsAvisoDeEntregaShow(Sender: TObject);
    begin
      pnEscondeControleEntrega.Show;
    end;

    procedure TSms.tsAvisoDeVendaShow(Sender: TObject);
    begin
      mmMsgEntrega.Text :=
        'Os Sms de Aviso de venda ser�o entregues no momento que a venda for registrada';
      pnEscondeControleEntrega.Hide;
    end;

    procedure TSms.tsExternoShow(Sender: TObject);
    begin
      CarregaListaCategoriaExternaComboListaCategoriasExterno;
    end;

    procedure TSms.TabSheet2Show(Sender: TObject);
    begin
      mmMsgEntrega.Text :=
        'Os Sms de Aviso de venda ser�o entregues no momento que o Or�amento for registrado';
      pnEscondeControleEntrega.Hide;
    end;

    procedure TSms.btInserirProdutoClick(Sender: TObject);
    begin
      if pos('[Produto___________________]',
        UltimoControleOpcaoTextoMarketing.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        UltimoControleOpcaoTextoMarketing.SelText :=
          '[Produto___________________]';
    end;

    procedure TSms.btInserePedidoClick(Sender: TObject);
    begin
      if pos('[Pedido]', UltimoControleOpcaoTextoMarketing.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        UltimoControleOpcaoTextoMarketing.SelText := '[Pedido]';
    end;

    procedure TSms.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    begin
      CanClose := False;

      Sms.Hide;
      Minimizado := true;
      tIcon.Visible := true;
      tIcon.BalloonHint := 'Clique com o bot�o direito para Mostrar';
      tIcon.BalloonTitle := 'A Ferramenta Continua ativa na bandeja';
      tIcon.Animate := true;
      tIcon.ShowBalloonHint();
      // Showmessage('O programa contunuar� ativo na bandeija');
    end;

    procedure TSms.Mostar1Click(Sender: TObject);
    begin
      Sms.Visible := true;
      Sms.tIcon.Visible := False;
      FerramentaAtiva := true;
    end;

    procedure TSms.Sair1Click(Sender: TObject);
    begin
      Application.Terminate;
    end;

    procedure TSms.btApagarTodosAgendamentosClick(Sender: TObject);
      procedure preenche(Linha, coluna: Integer; Texto: String);
      begin
        Sms.sgListaAgendamentosMarketing.Cells[coluna, Linha] := Texto;
      end;

      procedure preencheAsLinhas;
      begin
        preenche(LinhaSelecionada, 0, '');
        preenche(LinhaSelecionada, 1, '');
        preenche(LinhaSelecionada, 2, '');
        preenche(LinhaSelecionada, 3, '');
        preenche(LinhaSelecionada, 4, '');
        preenche(LinhaSelecionada, 5, '');
        preenche(LinhaSelecionada, 6, '');
        preenche(LinhaSelecionada, 7, '');
        preenche(LinhaSelecionada, 8, '');
        preenche(LinhaSelecionada, 9, '');
        preenche(LinhaSelecionada, 10, '');
        preenche(LinhaSelecionada, 11, '');
        preenche(LinhaSelecionada, 12, '');
        preenche(LinhaSelecionada, 13, '');
        preenche(LinhaSelecionada, 14, '');
      end;

    var
      Linha, Todas: Integer;
    begin
      Linha := 2;
      Todas := sgListaAgendamentosMarketing.RowCount;
      while Todas >= Linha do
      begin
        // ApagarAgendamentoServidor(Linha);
        preencheAsLinhas;
        TAuxGrid(sgListaAgendamentosMarketing).DeleteRow(Linha);
        SalvandoStringGridAgendamentoMarketing;
        RecarregandoStringGridAgendamentoMarketing;
        Linha := Linha + 1;
      end;
      if FileExists('AgendamentoMarketing.txt') then
        DeleteFile('AgendamentoMarketing.txt');
    end;

    Procedure SalvarArquivo;
    begin
      with Sms do
      begin
        SalvarConfiguracao('DiasPermitidoEnvio.txt', BoolToStr(ckSeg.Checked),
          BoolToStr(ckTer.Checked), BoolToStr(ckQua.Checked),
          BoolToStr(ckQui.Checked), BoolToStr(ckSex.Checked),
          BoolToStr(ckSab.Checked), BoolToStr(ckDom.Checked));
      end;
    end;

    procedure TSms.ckSegClick(Sender: TObject);
    begin
      SalvarArquivo;
    end;

    procedure TSms.ckTerClick(Sender: TObject);
    begin
      SalvarArquivo;
    end;

    procedure TSms.ckQuaClick(Sender: TObject);
    begin
      SalvarArquivo;
    end;

    procedure TSms.ckQuiClick(Sender: TObject);
    begin
      SalvarArquivo;
    end;

    procedure TSms.ckSexClick(Sender: TObject);
    begin
      SalvarArquivo;
    end;

    procedure TSms.ckSabClick(Sender: TObject);
    begin
      SalvarArquivo;
    end;

    procedure TSms.ckDomClick(Sender: TObject);
    begin
      SalvarArquivo;
    end;

    procedure TSms.VerificarImpactados1Click(Sender: TObject);
    Var
      Total, Contador, Dias: Integer;
      Conteudo, Filtro, ParametroFiltro, ParametroFiltro2, Msg, Limitar,
        Filtrar, ParametroFiltro3, EnviarNEnviados: String;
      NumeroSms: Integer;
      DataAgendamento: TDateTime;
    begin
      if sgListaAgendamentosMarketing.Cells[5, LinhaSelecionada] <> '' then
        if sgListaAgendamentosMarketing.Cells[5, LinhaSelecionada] <> '' then
          NumeroSms := StrToInt(sgListaAgendamentosMarketing.Cells[5,
            LinhaSelecionada]);
      Filtro := sgListaAgendamentosMarketing.Cells[7, LinhaSelecionada];
      ParametroFiltro := sgListaAgendamentosMarketing.Cells[8,
        LinhaSelecionada];
      ParametroFiltro2 := sgListaAgendamentosMarketing.Cells[9,
        LinhaSelecionada];
      ParametroFiltro3 := sgListaAgendamentosMarketing.Cells[10,
        LinhaSelecionada];
      Msg := Trim(sgListaAgendamentosMarketing.Cells[0, LinhaSelecionada]);
      Limitar := Trim(sgListaAgendamentosMarketing.Cells[4, LinhaSelecionada]);
      Filtrar := sgListaAgendamentosMarketing.Cells[6, LinhaSelecionada];
      EnviarNEnviados := sgListaAgendamentosMarketing.Cells[3,
        LinhaSelecionada];
      BuscarClientes(EnviarNEnviados, Filtrar, Filtro, ParametroFiltro,
        ParametroFiltro2, ParametroFiltro3);
      if (Filtro = 'Or�amento n�o aprovado em') or (Filtro = 'Comprou a') or
        (Filtro = 'Possui Produtos em Oferta') or (Filtro = 'Nota Emitida em')
        then
      begin
        Dias := StrToInt(ParametroFiltro);
      end;
      if Filtro = 'Indica Categoria  Para' then
      begin
        Dias := StrToInt(ParametroFiltro3);
      end;

      if Filtrar = 'Sim' then
      Begin
        DataAgendamento := StrToDate(FormatDateTime('dd/mm/yyy', Date)) - Dias;
        if DayOfWeek(DataAgendamento) = 1 then
          ShowMessage('Este Agendamento hoje Cai em um Domingo');
      end;
      if Limitar = 'Sim' then
        ShowMessage('Numero de Possiveis Sms Hoje em raz�o do limite - ' +
            IntToStr(NumeroSms) + #13 + 'N�o Cosidera Clientes Sem Celular')
      else
        ShowMessage('Numero de Possiveis Sms - ' + IntToStr
            (dmuPrincipal.qryRelClientes.RecordCount) + #13 +
            'N�o Cosidera Clientes Sem Celular');
    end;

    procedure TSms.Memo1Change(Sender: TObject);
    begin
      // if mmMensagemPromocaoCentro.Text <> '' then
      // mmFaltaCaracteresPromocaoCentro.Caption := 'Caracteres Faltantes : '+IntToStr(ContaStringFalta('160',mmMensagemPromocaoCentro.Text));
    end;

    procedure TSms.mmMensagemSatisfacaoNotaRuimChange(Sender: TObject);
    begin
      if mmMensagemSatisfacaoNotaRuim.Text <> '' then
        mmFaltaCaracteresSatisfacaoNotaRuim.Caption :=
          'Caracteres Faltantes : ' + IntToStr
          (ContaStringFalta('160', mmMensagemSatisfacaoNotaRuim.Text));
    end;

    procedure TSms.mmMensagemSatisfacaoNotaRuimEnter(Sender: TObject);
    begin
      mmMsgSatisfacao.Text :=
        'Digite uma mensagem para solicitar uma motivo para o voto Ruim';
      mmMensagemSatisfacaoNotaRuim.Color := $00CCFFFF;
    end;

    procedure TSms.mmMensagemSatisfacaoNotaRuimExit(Sender: TObject);
    begin
      mmMsgSatisfacao.Clear;
      mmMensagemSatisfacaoNotaRuim.Color := clWhite;
    end;

    procedure TSms.mmMensagemAvisoEntregaCentroChange(Sender: TObject);
    begin
      if mmMensagemAvisoEntregaCentro.Text <> '' then
        mmFaltaCaracteresAvisoEntregaCentro.Caption :=
          'Caracteres Faltantes : ' + IntToStr
          (ContaStringFalta('160', mmMensagemAvisoEntregaCentro.Text));
    end;

    procedure TSms.mmMensagemAvisoEntregaCentroEnter(Sender: TObject);
    begin
      mmMensagemAvisoEntregaCentro.Color := $00CCFFFF;
      mmMsgEntrega.Text :=
        'Se precisar clique com o bot�o direito na mensagem de Aviso de Entrega e veja exemplos de Sms Aviso de Entrega';
    end;

    procedure TSms.mmMensagemAvisoEntregaCentroExit(Sender: TObject);
    begin
      mmMsgEntrega.Clear;
      mmMensagemAvisoEntregaCentro.Color := clWindow;
    end;

    procedure TSms.edFiliaisEnter(Sender: TObject);
    begin
      mmMsgEntrega.Text := 'Digite as Filiais separados por virgula';
      edFiliais.Color := $00CCFFFF;
    end;

    procedure TSms.edFiliaisExit(Sender: TObject);
    begin
      edFiliais.Color := clWindow;
      mmMsgEntrega.Clear;
    end;

    procedure TSms.edCentroDeDistribicaoEnter(Sender: TObject);
    begin
      mmMsgEntrega.Text :=
        'Digite o numero das Centrais de Distribui��o separadas por virgula';
      edCentroDeDistribicao.Color := $00CCFFFF;
    end;

    procedure TSms.edCentroDeDistribicaoExit(Sender: TObject);
    begin
      edCentroDeDistribicao.Color := clWindow;
      mmMsgEntrega.Clear;
    end;

    procedure TSms.btInsereClienteEntregaCentroClick(Sender: TObject);
    begin
      if pos('[cliente______________________________]',
        mmMensagemAvisoEntregaCentro.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmMensagemAvisoEntregaCentro.SelText :=
          '[cliente______________________________]';
    end;

    procedure TSms.ExitmmMensagemPromocaoEmailGrande(Sender: TObject);
    begin
      mmMensagemPromocaoEmail.Text := TMemo(Sender).Text;
      if Sender <> nil then
        FreeAndNil(Sender);
    end;

    procedure TSms.mmMensagemPromocaoEmailEnter(Sender: TObject);
    begin
      mmMensagemPromocaoEmail.Color := $00CCFFFF;
      if mmMensagemPromocaoEmail.ReadOnly = False then
      begin
        mmMensagemPromocaoEmailGrande := TMemo.create(nil);
        mmMensagemPromocaoEmailGrande.Parent := Sms;
        mmMensagemPromocaoEmailGrande.Show;
        mmMensagemPromocaoEmailGrande.Top := 300;
        mmMensagemPromocaoEmailGrande.Left := 10;
        mmMensagemPromocaoEmailGrande.Width := 800;
        mmMensagemPromocaoEmailGrande.Height := 300;
        mmMensagemPromocaoEmailGrande.ScrollBars := ssVertical;
        mmMensagemPromocaoEmailGrande.Text := mmMensagemPromocaoEmail.Text;
        mmMensagemPromocaoEmailGrande.Color := $00CCFFFF;
        mmMensagemPromocaoEmailGrande.SetFocus;
        mmMensagemPromocaoEmailGrande.OnExit :=
          ExitmmMensagemPromocaoEmailGrande;
        mmMensagemPromocaoEmailGrande.PopupMenu := mnMensagemPromocaoEmail;
        mmMsgMarketing.Text := 'Digite sua Msg de Email de Marketing';
      end;
    end;

    procedure TSms.mmMensagemPromocaoEmailExit(Sender: TObject);
    begin
      mmMsgMarketing.Clear;
      mmMensagemPromocaoEmail.Color := clWhite;
    end;

    procedure TSms.ckEnviaEmailClick(Sender: TObject);
    begin
      if edEmail.Text = '' then
      begin
        ckEnviaEmail.Checked := False;
        mmMsgMarketing.Text :=
          'Preencha as configura��es de email antes de ativar o envio';
      end;
      OpcaoDeEnvioEmail;

    end;

    procedure TSms.rgOpcaoDeEnvioEmailClick(Sender: TObject);
    begin
      case rgOpcaoDeEnvioEmail.ItemIndex of
        0:
          begin
            gbTesteEmail.Show;
            gbTesteEmail.SetFocus;
          end;
        1:
          gbTesteEmail.Hide;
      end;
      SalvarConfiguracao('OpcaoDeEnvio.ini',
        IntToStr(rgOpcaoDeEnvio.ItemIndex),
        IntToStr(rgOpcaoDeEnvioEmail.ItemIndex), '', '', '', '', '');
    end;

    procedure TSms.btIniciarPromocaoEmailClick(Sender: TObject);
    var
      Contador: Integer;
      Mensagem, Email, Comando, ParametroFiltro, ParametroFiltro2,
        ParametroFiltro3: String;
      Texto: PansiChar;
      Arq: TextFile;
      TotalSms: Integer;
      TotalClientes: Integer;
      ContadorClientes: Integer;
      NumeroSmsEnviadosAgora: Integer;
    begin
      NumeroSmsEnviadosAgora := 0;
      TotalClientes := dmuPrincipal.qryRelClientes.RecordCount;
      if rgMaxSmsMarketing.ItemIndex = 0 then
      begin
        TotalSms := TotalClientes;
      end
      else
      begin
        TotalSms := StrToInt(edMaxSmsPromocao.Text);
      end;
      lbEnviadosMarketingEmail.Caption := '0';
      if cbListaFiltrosMarketing.Text = 'Or�amento n�o aprovado em' then
      begin
        ParametroFiltro := edDiasOrcamento.Text;
      end;
      if cbListaFiltrosMarketing.Text = 'Comprou a' then
      begin
        ParametroFiltro := edDiasDeCompra.Text;
      end;
      if cbListaFiltrosMarketing.Text = 'Comprou Produtos da Categoria' then
      begin
        ParametroFiltro := cbListaCategoriasMarketing.Text;
      end;
      if cbListaFiltrosMarketing.Text = 'Possui Produtos em Oferta' then
      begin
        ParametroFiltro := edDiasOrcamento.Text;
      end;
      if cbListaFiltrosMarketing.Text = 'Nota Emitida em' then
      begin
        ParametroFiltro := edDiasOrcamento.Text;
      end;
      if cbListaFiltrosMarketing.Text = 'Indica Categoria  Para' then
      begin
        ParametroFiltro := cbListaCategoriaComprou.Text;
        ParametroFiltro2 := cbListaCategoriaNComprou.Text;
        ParametroFiltro3 := edDiasIndicaCategoria.Text;
      end;
      BuscarClientes(TraduzirNomesck(ckNEnviarNEnviados.Checked),
        TraduzirNomesck(ckFiltrarClientesMarketing.Checked),
        cbListaFiltrosMarketing.Text, ParametroFiltro, ParametroFiltro2,
        ParametroFiltro3);
      ContadorClientes := 0;
      Contador := 0;
      AssignFile(Arq, 'EnviaEmail.txt');
      Try
        Rewrite(Arq);
      Except
      end;
      TotalClientes := dmuPrincipal.qryRelClientes.RecordCount;
      if TotalClientes = 0 then
      begin
        TotalSms := 0;
        if ckEnviaEmail.Checked then
          mmListaEnviados.Lines.Add('Sem Clientes para enviar Email');
      end;
      while Contador <= TotalSms - 1 do
      begin
        Application.ProcessMessages;
        if (not(BuscaEmail(dmuPrincipal.qryRelClientes['Oid'], '32979') = ''))
          or (rgOpcaoDeEnvioEmail.ItemIndex = 0) then
        begin
          case rgOpcaoDeEnvioEmail.ItemIndex of
            1:
              Email := BuscaEmail(dmuPrincipal.qryRelClientes['Oid'], '32979');
            0:
              Email := edEmailEnvio.Text;
          end;
          Mensagem := SubstituirTexto(mmMensagemPromocaoEmail.Text,
            '[cliente______________________________]',
            copy(dmuPrincipal.qryRelClientes['NOME'], 1, 40));
          if (cbListaFiltrosMarketing.Text = 'Possui Produtos em Oferta') and
            (ckFiltrarClientesMarketing.Checked) then
          begin
            BuscaProdutoPedido(dmuPrincipal.qryRelClientes['Oid'],
              edDiasOrcamento.Text);
            Mensagem := SubstituirTexto(Mensagem,
              '[Produto___________________]',
              copy(dmuPrincipal.qryProdutosEmOferta['Descr'], 1, 28));
            Mensagem := SubstituirTexto(Mensagem, '[Pedido]',
              copy(dmuPrincipal.qryProdutosEmOferta['Numped'], 1, 10));
          end;
          if (cbListaFiltrosMarketing.Text = 'Indica Categoria  Para') and
            (ckFiltrarClientesMarketing.Checked) then
          begin
            BuscaProdutoOferta(cbListaCategoriaNComprou.Text);
            if dmuPrincipal.qryCategoriaOferta.RecordCount = 0 then
              Mensagem := SubstituirTexto(Mensagem,
                '[Produto___________________]', '')
            else
              Mensagem := SubstituirTexto(Mensagem,
                '[Produto___________________]',
                copy(dmuPrincipal.qryCategoriaOferta['Descr'], 1, 28));
          end;
          if not EstaNaListaNegra(Email) then
          begin
            Writeln(Arq, 'Email Marketing - ' + EdTitulo.Text);
            Writeln(Arq, Email);
          end;
          if not VerificaInternet then
          begin
            mmListaEnviados.Lines.Add(
              'Computador Sem internet Verifique sua conex�o');
            mmCaixaDeSaida.Lines.Add('Email ' + FormatDateTime('dd/mm/yyyy',
                Date) + '-' + FormatDateTime('hh:mm:ss',
                Time) + '-' + Email + ' ' + 'Email Marketing');
          end
          else
          begin
            if EstaNaListaNegra(Email) then
              mmListaEnviados.Lines.Add(
                'Email Maketing N�o Enviado Lista Negra - ' + FormatDateTime
                  ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                  Time) + '-' + Email + ' ' + 'Email Marketing')
            else
            begin
              // EnviaEmail(Email,mmMensagemPromocaoEmail.Text,EdTitulo.Text);
              mmListaEnviados.Lines.Add('Email Maketing - ' + FormatDateTime
                  ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                  Time) + '-' + Email + ' ' + 'Email Marketing');

            end;
          end;
          Contador := Contador + 1;
          { if ckNEnviarNEnviados.Checked then
            begin
            if dmuPrincipal.qryCelulares['IdCliente'] <>  null then
            CriaListaJaEnviados(dmuPrincipal.qryCelulares['IdCliente'] );
            end; }
          lbEnviadosMarketingEmail.Caption := IntToStr
            (1 + StrToInt(lbEnviadosMarketingEmail.Caption));
          NumeroSmsEnviadosAgora := NumeroSmsEnviadosAgora + 1;
          if not VerificaInternet then
            mmListaEnviados.Lines.Add(
              'Computador Sem internet Verifique sua conex�o');
        end
        else
          mmListaEnviados.Lines.Add(
            'Email n�o enviado o cliente n�o possui um Email valido -' +
              'Email Marketing - ' + copy(dmuPrincipal.qryRelClientes['NOME'],
              1, 40) + ' - ' + FormatDateTime('dd/mm/yyyy',
              Date) + '-' + FormatDateTime('hh:mm:ss', Time));
        dmuPrincipal.qryRelClientes.Next;
        ContadorClientes := ContadorClientes + 1;
        if ContadorClientes = TotalClientes then
          TotalSms := 0;
      end;
      CloseFile(Arq);
      if VerificaInternet then
      Begin
        // EnviaAcrescentaArquivo('EnviaEmail.txt',True);
        if ckPausarAvisoDeEnvio.Checked = False then
          pcListas.Show;
      end
      else
      begin
        tAguardaReconexao.Enabled := true;
        mmCaixaDeSaida.Lines.SaveToFile('NaoEnviadas.txt');
        pcCaixaDeSaida.Show;
        // lbEnviadosMarketingEmail.Caption := IntToStr(StrToInt(lbEnviadosMarketingEmail.Caption) - NumeroSmsEnviadosAgora);
        GravandoNumeroMsgNaoEnviadas(IntToStr(NumeroSmsEnviadosAgora),
          IntToStr(0), IntToStr(0), IntToStr(0));
      end;
    end;

    procedure TSms.ckAtivarOEnviodeSmsVendaEmailClick(Sender: TObject);

      Function VerificaPreenchimentoMsgVendaEmail: Boolean;
      begin
        Result := true;
        if Trim(mmMensagemAvisoVendaEmail.Text) = '' then
        begin
          Result := False;
          ckAtivarOEnviodeSmsVendaEmail.Checked := False;
          mmMsgEntrega.Text :=
            'Preencha uma Mensagem para o Aviso de Venda Email';
        end;
        if Trim(edTituloEmailAvisoVenda.Text) = '' then
        begin
          Result := False;
          ckAtivarOEnviodeSmsVendaEmail.Checked := False;
          mmMsgEntrega.Text :=
            'Preencha um Titulo para os Emails de Aviso de Venda';
        end;
      end;

      function VerificaEnvioSmsVendaAtivo: Boolean;
      begin
        if ckAtivarOEnviodeSmsVendaSms.Checked then
          Result := true
        else
        begin
          Result := False;
          mmMsgEntrega.Text := 'Ative o Envio de Sms Primeiro';
          ckAtivarOEnviodeSmsVendaEmail.Checked := False;
        end;
      end;

      procedure AtivaDesativaEnvioVendaEmail;
      begin
        if (ckAtivarOEnviodeSmsVendaEmail.Checked = true) and
          (VerificaPreenchimentoMsgVendaEmail) and
          (VerificaEnvioSmsVendaAtivo) then
        begin
          mmMensagemAvisoVendaEmail.Enabled := False;
          // btInsereClienteVendaEmail.Enabled := False;
          edTituloEmailAvisoVenda.Enabled := False;
          ckAtivarOEnviodeSmsVendaEmail.Checked := true;
          mmMsgEntrega.Text := 'Aviso de Venda de Email Ativo';
        end
        else
        begin
          mmMensagemAvisoVendaEmail.Enabled := true;
          // btInsereClienteVendaEmail.Enabled := True;
          edTituloEmailAvisoVenda.Enabled := true;
          // mmMsgEntrega.Text := 'Aviso de Venda Email Desativado';
        end;
      end;

    begin
      AtivaDesativaEnvioVendaEmail;
      AbasteceListaAtivados(ckAtivarOEnviodeSmsVendaEmail);
      SalvaEdit(edTituloEmailAvisoVenda);
      SalvaMemo(mmMensagemAvisoVendaEmail);
      SalvaEdit(edCelularTeste);
      SalvaEdit(edEmailEnvio);
    end;

    procedure TSms.btInsereClienteVendaEmailClick(Sender: TObject);
    begin
      if pos('[cliente______________________________]',
        mmMensagemAvisoVendaEmail.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmMensagemAvisoVendaEmail.SelText :=
          '[cliente______________________________]';
    end;

    procedure TSms.btInsereClienteOrcamentoEmailClick(Sender: TObject);
    begin
      if pos('[cliente______________________________]',
        mmMensagemAvisoOrcamentoEmail.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmMensagemAvisoOrcamentoEmail.SelText :=
          '[cliente______________________________]';
    end;

    procedure TSms.ckAtivaAvisoOrcamentoEmailClick(Sender: TObject);

      Function VerificaPreenchimentoMsgOrcamentoEmail: Boolean;
      begin
        Result := true;
        if Trim(mmMensagemAvisoOrcamentoEmail.Text) = '' then
        begin
          Result := False;
          ckAtivaAvisoOrcamentoEmail.Checked := False;
          mmMsgEntrega.Text :=
            'Preencha uma Mensagem para o Aviso de Or�amento Email';
        end;
        if Trim(edTituloEmailAvisoOrcamento.Text) = '' then
        begin
          Result := False;
          ckAtivaAvisoOrcamentoEmail.Checked := False;
          mmMsgEntrega.Text :=
            'Preencha um Titulo para os Emails de Aviso de Or�amento';
        end;
      end;

      function VerificaEnvioSmsOrcamentoAtivo: Boolean;
      begin

        if ckAtivaAvisoOrcamentoSms.Checked then
          Result := true
        else
        begin
          Result := False;
          mmMsgEntrega.Text := 'Ative o Envio de Sms Primeiro';
          ckAtivaAvisoOrcamentoEmail.Checked := False;
        end;
      end;

      procedure AtivaDesativaEnvioOrcamentoEmail;
      begin
        if (ckAtivaAvisoOrcamentoEmail.Checked = true) and
          (VerificaPreenchimentoMsgOrcamentoEmail) and
          (VerificaEnvioSmsOrcamentoAtivo) then
        begin
          mmMensagemAvisoOrcamentoEmail.Enabled := False;
          // btInsereClienteOrcamentoEmail.Enabled := False;
          edTituloEmailAvisoOrcamento.Enabled := False;
          ckAtivaAvisoOrcamentoEmail.Checked := true;
          mmMsgEntrega.Text := 'Aviso de Or�amento de Email Ativo';
        end
        else
        begin
          mmMensagemAvisoOrcamentoEmail.Enabled := true;
          // btInsereClienteOrcamentoEmail.Enabled := True;
          edTituloEmailAvisoOrcamento.Enabled := true;
          // mmMsgEntrega.Text := 'Aviso de Or�amento Email Desativado';
        end;
      end;

    begin
      AtivaDesativaEnvioOrcamentoEmail;
      AbasteceListaAtivados(ckAtivaAvisoOrcamentoEmail);
      SalvaEdit(edTituloEmailAvisoOrcamento);
      SalvaMemo(mmMensagemAvisoOrcamentoEmail);
      SalvaEdit(edCelularTeste);
      SalvaEdit(edEmailEnvio);
    end;

    procedure TSms.mmMensagemAvisoVendaSmsChange(Sender: TObject);
    begin
      if mmMensagemAvisoVendaSms.Text <> '' then
        mmFaltaCaracteresAvisoVenda.Caption :=
          'Caracteres Faltantes : ' + IntToStr(ContaStringFalta('160',
            mmMensagemAvisoVendaSms.Text));
    end;

    procedure TSms.edTituloEmailAvisoOrcamentoEnter(Sender: TObject);
    begin
      edTituloEmailAvisoOrcamento.Color := $00CCFFFF;
      mmMsgEntrega.Text :=
        'Informe o Titulo para o Email de Aviso de Or�amento';
    end;

    procedure TSms.edTituloEmailAvisoOrcamentoExit(Sender: TObject);
    begin
      mmMsgEntrega.Clear;
      edTituloEmailAvisoOrcamento.Color := clWindow;
    end;

    procedure TSms.edTituloEmailAvisoVendaExit(Sender: TObject);
    begin
      mmMsgEntrega.Clear;
      edTituloEmailAvisoVenda.Color := clWindow;
    end;

    procedure TSms.mmMensagemAvisoVendaEmailExit(Sender: TObject);
    begin
      mmMsgEntrega.Clear;
      mmMensagemAvisoVendaEmail.Color := clWindow;
    end;

    procedure TSms.mmMensagemAvisoOrcamentoEmailExit(Sender: TObject);
    begin
      mmMsgEntrega.Clear;
      mmMensagemAvisoOrcamentoEmail.Color := clWindow;
    end;

    procedure TSms.mmMensagemAvisoOrcamentoEmailEnter(Sender: TObject);
    begin
      mmMensagemAvisoOrcamentoEmail.Color := $00CCFFFF;
      if mmMensagemAvisoOrcamentoEmail.ReadOnly = False then
      begin
        mmAvisoOrcamentoGrande := TMemo.create(nil);
        mmAvisoOrcamentoGrande.Parent := Sms;
        mmAvisoOrcamentoGrande.Show;
        mmAvisoOrcamentoGrande.Top := 300;
        mmAvisoOrcamentoGrande.Left := 10;
        mmAvisoOrcamentoGrande.Width := 800;
        mmAvisoOrcamentoGrande.Height := 300;
        mmAvisoOrcamentoGrande.ScrollBars := ssVertical;
        mmAvisoOrcamentoGrande.Text := mmMensagemAvisoOrcamentoEmail.Text;
        mmAvisoOrcamentoGrande.PopupMenu := mmOrcamentoEmail;
        mmAvisoOrcamentoGrande.Color := $00CCFFFF;
        mmAvisoOrcamentoGrande.SetFocus;
        mmAvisoOrcamentoGrande.OnExit := ExitmmAvisoOrcamentoGrande;
        mmMsgEntrega.Text :=
          'Informe uma Msg para o Email de Aviso de Or�amento';
      end;
    end;

    procedure TSms.ExitmmAvisoVendaGrande(Sender: TObject);
    begin
      mmMensagemAvisoVendaEmail.Text := TMemo(Sender).Text;
      if Sender <> nil then
        FreeAndNil(Sender);
    end;

    procedure S(Sender: TObject; CodigoEmail: String);
    begin
      TMemo(Sender).Lines.SaveToFile(CodigoEmail + '.txt');
      if Sender <> nil then
        FreeAndNil(Sender);
    end;

    procedure TSms.ExitmmAvisoOrcamentoGrande(Sender: TObject);
    begin
      mmMensagemAvisoOrcamentoEmail.Text := TMemo(Sender).Text;
      if Sender <> nil then
        FreeAndNil(Sender);
    end;

    procedure TSms.mmMensagemAvisoVendaEmailEnter(Sender: TObject);
    begin
      mmMensagemAvisoVendaEmail.Color := $00CCFFFF;
      if mmMensagemAvisoVendaEmail.ReadOnly = False then
      begin
        mmAvisoVendaGrande := TMemo.create(nil);
        mmAvisoVendaGrande.Parent := Sms;
        mmAvisoVendaGrande.Show;
        mmAvisoVendaGrande.Top := 300;
        mmAvisoVendaGrande.Left := 10;
        mmAvisoVendaGrande.Width := 800;
        mmAvisoVendaGrande.Height := 300;
        mmAvisoVendaGrande.ScrollBars := ssVertical;
        mmAvisoVendaGrande.Text := mmMensagemAvisoVendaEmail.Text;
        mmAvisoVendaGrande.PopupMenu := mmVendaEmail;
        mmAvisoVendaGrande.Color := $00CCFFFF;
        mmAvisoVendaGrande.SetFocus;
        mmAvisoVendaGrande.OnExit := ExitmmAvisoVendaGrande;
        mmMsgEntrega.Text := 'Informe uma Msg para o Email de Aviso de Venda';
      end;
    end;

    procedure TSms.EdTituloEnter(Sender: TObject);
    begin
      mmMsgMarketing.Text := 'Defina um Titulo para o Email de Marketing';
      EdTitulo.Color := $00CCFFFF;
    end;

    procedure TSms.EdTituloExit(Sender: TObject);
    begin
      mmMsgMarketing.Clear;
      EdTitulo.Color := clWhite;
    end;

    procedure TSms.edEmailEnvioEnter(Sender: TObject);
    begin
      edEmailEnvio.Color := $00CCFFFF;
    end;

    procedure TSms.edEmailSatisfacaoEnter(Sender: TObject);
    begin
      mmMsgSatisfacao.Text :=
        'Informe um email para receber atualiza��es da pesquisa de satisfa��o';
      edEmailSatisfacao.Color := $00CCFFFF;
    end;

    procedure TSms.edEmailSatisfacaoExit(Sender: TObject);
    begin
      mmMsgSatisfacao.Clear;
      edEmailSatisfacao.Color := clWhite;
    end;

    procedure TSms.AlterarHorario1Click(Sender: TObject);
    begin
      { BuscaAgendamentoServidor(Sms.sgListaAgendamentosMarketing.Cells[0,LinhaSelecionada],
        Sms.sgListaAgendamentosMarketing.Cells[1,LinhaSelecionada],
        Sms.sgListaAgendamentosMarketing.Cells[2,LinhaSelecionada],
        Sms.sgListaAgendamentosMarketing.Cells[14,LinhaSelecionada],
        edCnpj.Text); }
      if VerificaTravamentoAlteracao = False then
      begin
        Sms.sgListaAgendamentosMarketing.Cells[2, LinhaSelecionada] := Inputbox
          ('Digite o Novo Horario', '00:00',
          Sms.sgListaAgendamentosMarketing.Cells[2, LinhaSelecionada]);
        SalvandoStringGridAgendamentoMarketing;
        { EditarAgendamentoServidor(Sms.sgListaAgendamentosMarketing.Cells[0,LinhaSelecionada],
          Sms.sgListaAgendamentosMarketing.Cells[1,LinhaSelecionada],
          Sms.sgListaAgendamentosMarketing.Cells[2,LinhaSelecionada],
          edCnpj.Text,
          Sms.sgListaAgendamentosMarketing.Cells[14,LinhaSelecionada],
          sgListaAgendamentosMarketing.Cells[12,LinhaSelecionada]); }
      end;
    end;

procedure TSms.apEventsException(Sender: TObject; E: Exception);
begin
  Application.ProcessMessages;
  CriaArquivoTxt('Erro.txt', E.Message);
  // EnviaAcrescentaArquivo('Erro.txt',True,False);
  if btConectaBancoDeDados.Caption = 'Desconectar' then
  begin
    tVerificaAgendamentos.Enabled := true;
    tVerificaVendaOrcamento.Enabled := true;
  end;
end;

procedure TSms.ituloEmail1Click(Sender: TObject);
    begin
      ShowMessage(sgListaAgendamentosMarketing.Cells[0, LinhaSelecionada]);
    end;

    procedure CriaAdicionaListaNegra;
    begin
      with Sms do
      begin
        if FileExists('ListaNegra.txt') then
          DeleteFile('ListaNegra.txt');
        mmListaNegra.Lines.SaveToFile('ListaNegra.txt');
      end;
    end;

    procedure AdicionaListanegra(EmailouCelular: String);

      procedure CriaAdicionaListaNegraEmail(Email: String);
      var
        Arq: TextFile;
        Virgula: String;
      begin
        AssignFile(Arq, 'ListaNegraEmail.txt');
        if FileExists('ListaNegraEmail.txt') then
        begin
          Append(Arq);
          Virgula := ',';
        end
        else
          Rewrite(Arq);
        Writeln(Arq, Virgula + EmailouCelular);
        CloseFile(Arq);
      end;

      procedure CriaAdicionaListaNegraCelular(Celular: String);
      var
        Arq: TextFile;
        Virgula: String;
      begin
        AssignFile(Arq, 'ListaNegraCelular.txt');
        if FileExists('ListaNegraCelular.txt') then
        begin
          Append(Arq);
          Virgula := ',';
        end
        else
          Rewrite(Arq);
        Writeln(Arq, Virgula + EmailouCelular);
        CloseFile(Arq);
      end;

    var
      Virgula: String;
    begin
      with Sms do
      begin
        if mmListaNegra.Text <> '' then
          Virgula := ',';
        mmListaNegra.Lines.Add(Virgula + EmailouCelular);
        CriaAdicionaListaNegra;
        if AnsiContainsStr(EmailouCelular, '@') then
          CriaAdicionaListaNegraEmail(EmailouCelular)
        else
          CriaAdicionaListaNegraCelular(EmailouCelular);
      end;
    end;

    Function SelecionaEmailCelularMemo(EmailCelular: String): Boolean;
    begin
      with Sms do
      begin
        mmListaNegra.SetFocus;
        Result := False;
        mmListaNegra.SelStart := 0;
        mmListaNegra.SelLength := 0;
        if pos(EmailCelular, mmListaNegra.Lines.Text) <> 0 then
        begin
          Result := true;
          mmListaNegra.SelStart := pos(EmailCelular, mmListaNegra.Lines.Text)
            - 1;
          mmListaNegra.SelLength := Length(EmailCelular);
        end;
      end;
    end;

    procedure TSms.btAdicionaListaNegraClick(Sender: TObject);
    var
      CelularEmail: String;
    begin
      CelularEmail := Inputbox('Lista Negra', 'Digite Email ou Celular', '');
      if SelecionaEmailCelularMemo(CelularEmail) then
        ShowMessage('Email ou Celular J� Existe na Lista')
      else
        AdicionaListanegra(CelularEmail);
    end;

    procedure TSms.btListaNegraClick(Sender: TObject);
    begin
      if SelecionaEmailCelularMemo(Inputbox('Pesquisa Lista Negra',
          'Digite Email ou Celular', '')) = False then
        ShowMessage('Email ou Celular N�o Encontrado');

    end;

    procedure TSms.btRemoveListaNegraClick(Sender: TObject);
    begin
      if mmListaNegra.SelText = '' then
        ShowMessage('Selecione um Celular ou Email')
      else
      begin
        if AnsiContainsText(mmListaNegra.SelText, '@') then
          CarregaTxtMemoApagaTexto('ListaNegraEmail.txt', mmListaNegra.SelText)
        else
          CarregaTxtMemoApagaTexto('ListaNegraCelular.txt',
            mmListaNegra.SelText);
        mmListaNegra.SelText := '';
        AjustaMemo(mmListaNegra);
        CriaAdicionaListaNegra;
      end;
    end;

    procedure TSms.mmMensagemPromocao2Enter(Sender: TObject);
    begin
      mmMsgMarketing.Text :=
        'Se precisar clique com o bot�o direito na mensagem de marketing e veja exemplos de Sms Marketing';
      mmMensagemPromocao2.Color := $00CCFFFF;
      UltimoControleOpcaoTextoMarketing := mmMensagemPromocao2;
    end;

    procedure TSms.mmMensagemPromocao3Enter(Sender: TObject);
    begin
      mmMsgMarketing.Text :=
        'Se precisar clique com o bot�o direito na mensagem de marketing e veja exemplos de Sms Marketing';
      mmMensagemPromocao3.Color := $00CCFFFF;
      UltimoControleOpcaoTextoMarketing := mmMensagemPromocao3;
    end;

    procedure TSms.mmMensagemPromocao2Exit(Sender: TObject);
    begin
      mmMsgMarketing.Clear;
      mmMensagemPromocao2.Color := clWhite;
    end;

    procedure TSms.mmMensagemPromocao3Exit(Sender: TObject);
    begin
      mmMsgMarketing.Clear;
      mmMensagemPromocao3.Color := clWhite;
    end;

    procedure TSms.mmMensagemPromocao2Change(Sender: TObject);
    begin
      if mmMensagemPromocao2.Text <> '' then
        mmFaltaCaracteresPromocao2.Caption := IntToStr(ContaStringFalta('160',
            mmMensagemPromocao2.Text));
    end;

    procedure TSms.mmMensagemPromocao3Change(Sender: TObject);
    begin
      if mmMensagemPromocao3.Text <> '' then
        mmFaltaCaracteresPromocao3.Caption := IntToStr(ContaStringFalta('160',
            mmMensagemPromocao3.Text));
    end;

    procedure TSms.ipo1Click(Sender: TObject);
    begin
      ShowMessage(sgListaAgendamentosMarketing.Cells[14, LinhaSelecionada]);
    end;

    procedure TSms.tVerificaRespostasSmsTimer(Sender: TObject);
    var
      dbPrincipal: TZConnection;
      qrySmsRecebidos: TZQuery;
    begin // ShowMessage('Atualizando Recebidas');
      tVerificaRespostasSms.Enabled := False;
      Application.ProcessMessages;
      pnSinalizaVerificaRespondidos.Color := clGreen;
      with dmServidor do
      begin
        Application.ProcessMessages;
        dbPrincipal := TZConnection.create(nil);
        dbPrincipal.HostName :=
          'Cadmustech.cet2loe0ehxw.us-west-2.rds.amazonaws.com';
        dbPrincipal.LibraryLocation := 'libmySQL.dll';
        dbPrincipal.user := 'cadmus182';
        dbPrincipal.Port := 3306;
        dbPrincipal.Password := 'cadmus182';
        dbPrincipal.Database := 'mercurio';
        dbPrincipal.Protocol := 'mysql-5';
        dbPrincipal.Connect;
        qrySmsRecebidos := TZQuery.create(nil);
        qrySmsRecebidos.connection := dbPrincipal;
        qrySmsRecebidos.SQL.Text := 'SELECT  ' + #13 + '  id,     ' + #13 +
          '  Numero,  ' + #13 + '  Mensagem, ' + #13 + '  Data,   ' + #13 +
          '  Hora,   ' + #13 + 'Original ' + #13 + 'FROM  ' + #13 +
          '  Recebidas' + #13 + 'where Destinatario=' + Sms.edCnpj.Text;
        Try
          qrySmsRecebidos.Open;
          Sms.dsSmsRespondidos.DataSet := qrySmsRecebidos;

        Except
          tVerificaRespostasSms.Enabled := true;
        end;
      end;
      pnSinalizaVerificaRespondidos.Color := clRed;
      tVerificaRespostasSms.Enabled := true;
    end;

    procedure TSms.ckReativaAtivadosClick(Sender: TObject);
    begin
      AbasteceListaAtivados(ckReativaAtivados);
      SalvaEdit(edCelularTeste);
      SalvaEdit(edEmailEnvio);
    end;

    procedure TSms.ckIniciarComWindowsClick(Sender: TObject);
    begin
      if ckIniciarComWindows.Checked then
      begin
        // RemovendoAplicacaoInicioAutomatico;
        ColocandoAplicacaoNoInicioAutomatico;
      end
      else
        RemovendoAplicacaoInicioAutomatico;
      AbasteceListaAtivados(ckIniciarComWindows);
    end;

    procedure TSms.CriaArquivoTxt(Arquivo, Texto: String);
    Var
      Arq: TextFile;
    begin
      AssignFile(Arq, Arquivo);
      if FileExists(Arquivo) then
        Append(Arq)
      else
        Rewrite(Arq);
      Writeln(Arq, Texto);
      CloseFile(Arq);
    end;

    procedure TSms.EnviaEmailListaExterna;
    begin
      // gfgfgfgf
    end;

    procedure TSms.EscreveNoArquivoTxt(Arquivo, Texto: String);
    Var
      Arq: TextFile;
    begin
      AssignFile(Arq, Arquivo);
      Append(Arq);
      Writeln(Arq, Texto);
      CloseFile(Arq);
    end;

    procedure TSms.Log(Texto: String);
    begin
      CriaArquivoTxt('Log.txt', Texto);
    end;

    procedure TSms.ApplicationEvents1Exception(Sender: TObject; E: Exception);

    begin
      Application.ProcessMessages;
      CriaArquivoTxt('Erro.txt', E.Message);
      // EnviaAcrescentaArquivo('Erro.txt',True,False);
      if btConectaBancoDeDados.Caption = 'Desconectar' then
      begin
        tVerificaAgendamentos.Enabled := true;
        tVerificaVendaOrcamento.Enabled := true;
      end;
    end;

    procedure TSms.ExitEditEmail(Sender: TObject);
    begin
      TMemo(Sender).Lines.SaveToFile(sgListaAgendamentosMarketing.Cells[13,
        LinhaSelecionada] + '.txt'); ;
      If Application.FindComponent('wbVisualizarEmail') = nil then
        FreeAndNil(Sender);
      // FWebBrowser.Destroy;
      // FWebBrowser.Free;
    end;

    procedure TSms.AlterarEmail1Click(Sender: TObject);
    Var
      CodigoTexto: String;
    begin
      CodigoTexto := sgListaAgendamentosMarketing.Cells[13, LinhaSelecionada];
      EdicaoEmail := TMemo.create(nil);
      EdicaoEmail.Parent := Sms;
      EdicaoEmail.Show;
      EdicaoEmail.Top := 300;
      EdicaoEmail.Left := 10;
      EdicaoEmail.Width := 800;
      EdicaoEmail.Height := 300;
      EdicaoEmail.ScrollBars := ssBoth;
      EdicaoEmail.Lines.LoadFromFile(CodigoTexto + '.txt');
      EdicaoEmail.Color := $00CCFFFF;
      EdicaoEmail.SetFocus;
      EdicaoEmail.PopupMenu := mnEditorEmail;
      EdicaoEmail.OnExit := ExitEditEmail;
    end;

    procedure TSms.InserirVariavelCliente1Click(Sender: TObject);
    begin
      if pos('[cliente______________________________]', EdicaoEmail.Text)
        > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        EdicaoEmail.SelText := '[cliente______________________________]';
    end;

    procedure TSms.InserirVariavelEmail1Click(Sender: TObject);
    begin
      if pos('[Email______________________________]', EdicaoEmail.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        EdicaoEmail.SelText := '[Email______________________________]';
    end;

    procedure WBLoadHTML(WebBrowser: TWebBrowser; HTMLCode: string);
    var
      sl: TStringList;
      ms: TMemoryStream;
    begin
      WebBrowser.Navigate('about:blank');
      while WebBrowser.ReadyState < READYSTATE_INTERACTIVE do
        Application.ProcessMessages;

      if Assigned(WebBrowser.Document) then
      begin
        sl := TStringList.create;
        try
          ms := TMemoryStream.create;
          try
            sl.Text := HTMLCode;
            sl.SaveToStream(ms);
            ms.Seek(0, 0); (WebBrowser.Document as IPersistStreamInit)
            .Load(TStreamAdapter.create(ms));
          finally
            ms.Free;
          end;
        finally
          sl.Free;
        end;
      end;
    end;

    procedure TSms.ExitVisualizaEmail(Sender: TObject);
    begin
      // FreeAndNil(Sender);
      FWebBrowser.Destroy;
    end;

    procedure TSms.Visualizar1Click(Sender: TObject);
    begin
      FWebBrowser := TWebBrowser.create(Nil);
      TWinControl(FWebBrowser).Parent := Sms;
      TWinControl(FWebBrowser).Name := 'wbVisualizarEmail';
      FWebBrowser.Left := 10;
      FWebBrowser.Top := 30;
      FWebBrowser.Width := 700;
      FWebBrowser.Height := 600;
      WBLoadHTML(FWebBrowser, UTF8Decode(EdicaoEmail.Text));
      EdicaoEmail.OnClick := ExitVisualizaEmail;
      EdicaoEmail.OnEnter := ExitVisualizaEmail;
    end;

    procedure TSms.MenuItem1Click(Sender: TObject);
    begin
      FWebBrowser := TWebBrowser.create(Nil);
      TWinControl(FWebBrowser).Parent := Sms;
      TWinControl(FWebBrowser).Name := 'wbVisualizarEmail';
      FWebBrowser.Left := 10;
      FWebBrowser.Top := 30;
      FWebBrowser.Width := 700;
      FWebBrowser.Height := 600;
      WBLoadHTML(FWebBrowser, UTF8Decode(mmAvisoOrcamentoGrande.Text));
      mmAvisoOrcamentoGrande.OnClick := ExitVisualizaEmail;
      mmAvisoOrcamentoGrande.OnEnter := ExitVisualizaEmail;
    end;

    procedure TSms.MenuItem2Click(Sender: TObject);
    begin
      if pos('[Email______________________________]',
        mmAvisoOrcamentoGrande.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmAvisoOrcamentoGrande.SelText :=
          '[Email______________________________]';
    end;

    procedure TSms.MenuItem3Click(Sender: TObject);
    begin
      FWebBrowser := TWebBrowser.create(Nil);
      TWinControl(FWebBrowser).Parent := Sms;
      TWinControl(FWebBrowser).Name := 'wbVisualizarEmail';
      FWebBrowser.Left := 10;
      FWebBrowser.Top := 30;
      FWebBrowser.Width := 700;
      FWebBrowser.Height := 600;
      WBLoadHTML(FWebBrowser, UTF8Decode(mmMensagemPromocaoEmailGrande.Text));
      mmMensagemPromocaoEmailGrande.OnClick := ExitVisualizaEmail;
      mmMensagemPromocaoEmailGrande.OnEnter := ExitVisualizaEmail;
    end;

    procedure TSms.btInsereClienteMensagemSmsVendaClick(Sender: TObject);
    begin
      if pos('[cliente______________________________]',
        mmMensagemAvisoVendaSms.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmMensagemAvisoVendaSms.SelText :=
          '[cliente______________________________]';
    end;

    procedure TSms.ckAvisoFerramentaDesconectadaClick(Sender: TObject);
    begin
      if (ckAvisoFerramentaDesconectada.Checked) and
        ((btConectaBancoDeDados.Caption = 'Desconectar')) then
      begin
        GravaAtividade('Ligar');
        tAvisaQueEstaAtivo.Enabled := true;
        edEmailAviso.Enabled := False;
        edCelularAviso.Enabled := False;
      end
      else
      begin
        tAvisaQueEstaAtivo.Enabled := False;
        GravaAtividade('Desligar');
        edEmailAviso.Enabled := true;
        edCelularAviso.Enabled := true;
      end;
      AbasteceListaAtivados(ckAvisoFerramentaDesconectada);
      SalvaEdit(edEmailAviso);
      SalvaEdit(edCelularAviso);
    end;

    procedure TSms.tAvisaQueEstaAtivoTimer(Sender: TObject);
    begin
      if (btConectaBancoDeDados.Caption = 'Desconectar') then
        GravaAtividade('Ligar');
    end;

    procedure TSms.tVerificaRepostaPesquisaTimer(Sender: TObject);

      function BuscaRespostaSatisfacao(Resposta: String): Integer;
      begin
        dmServidor.qryRespostaSatisfacao.Active := False;
        dmServidor.qryRespostaSatisfacao.Close;
        dmServidor.qryRespostaSatisfacao.ParamByName('Cnpj').Value := Trim
          (edCnpj.Text);
        dmServidor.qryRespostaSatisfacao.ParamByName('Resposta')
          .Value := Resposta;
        Try
          dmServidor.qryRespostaSatisfacao.Active := true;
        Except
          tVerificaRepostaPesquisa.Enabled := true;
        end;
        try
          dmServidor.qryRespostaSatisfacao.Open;
        Except
        end;
        Result := dmServidor.qryRespostaSatisfacao.RecordCount;
        dmServidor.qryRespostaSatisfacao.Active := False;
      end;

      procedure PreencheRespostaSatisfacao(Otimo, Boa, Ruim: Integer);
      begin
        lbTotalOtimoSatisfacao.Caption := IntToStr(Otimo) + ' %';
        lbTotalBomSatisfacao.Caption := IntToStr(Boa) + ' %';
        lbTotalRuimSatisfacao.Caption := IntToStr(Ruim) + ' %';
      end;

      procedure AtualizaRespostasSatisfacao;
      Var
        Otimo, Boa, Ruim, Total: Integer;
      begin
        Otimo := BuscaRespostaSatisfacao('1');
        Boa := BuscaRespostaSatisfacao('2');
        Ruim := BuscaRespostaSatisfacao('3');
        Total := Otimo + Boa + Ruim;
        if Total <> 0 then
        begin
          if Otimo > 0 then
            Otimo := (Otimo * 100) div Total
          else
            Otimo := 0;
          if Boa > 0 then
            Boa := (Boa * 100) div Total
          else
            Boa := 0;
          if Ruim > 0 then
            Ruim := (Ruim * 100) div Total
          else
            Ruim := 0;
          PreencheRespostaSatisfacao(Otimo, Boa, Ruim);
        end
        Else
        begin
          PreencheRespostaSatisfacao(0, 0, 0);
        end;
      end;

      procedure EnviaAtualizacaoPesquisaSatisfaco;
      Var
        IdentificacaoTextoEmailSatisfacao, TextoPosicaoSatisfacao: String;
      begin
        if ckAtualizarCelularEmailSatisfacao.Checked then
        begin
          TextoPosicaoSatisfacao :=
            'A Sua Pesquisa de Satisfacao Simples Sms Atualizou : ' +
            ' Otimo : ' + lbTotalOtimoSatisfacao.Caption + ' Bom : ' +
            lbTotalBomSatisfacao.Caption + ' Ruim : ' +
            lbTotalRuimSatisfacao.Caption;
          IdentificacaoTextoEmailSatisfacao := FormatDateTime('ddmmyy', Date)
            + FormatDateTime('HHMMSS', Time) + IntToStr(RandomRange(1, 30));
          CriaArquivoTxt(IdentificacaoTextoEmailSatisfacao + '.txt',
            TextoPosicaoSatisfacao);
          InsereEmail(edEmail.Text, edEmailSatisfacao.Text,
            'Pesquisa de Satisfa��o Simples Sms - ' + FormatDateTime
              ('dd/mm/yy', Date) + ' - ' + FormatDateTime('HH:MM:SS', Time),
            IdentificacaoTextoEmailSatisfacao);
          DeleteFile(IdentificacaoTextoEmailSatisfacao + '.txt');
          InsereSms(edCelularSatisfacao.Text, TextoPosicaoSatisfacao);
        end;
      end;

    Var
      UltimoCelular: String;
      NumeroDeRepostasSatisfacao: Integer;
    begin
      tVerificaRepostaPesquisa.Enabled := False;
      Application.ProcessMessages;
      NumeroDeRepostasSatisfacao := VerificaNovasRespostaSatisfacao;
      lbtotalsatisfacao.Caption := IntToStr(NumeroDeRepostasSatisfacao);
      if (NumeroDeRepostasSatisfacao > TotalRespostaSatisfacao) or
        (AtualizaSatisfacao = 0) then
      begin
        AtualizaSatisfacao := 1;
        Try
          AtualizaRespostasSatisfacao;
        Except
          tVerificaRepostaPesquisa.Enabled := true;
        end;
        if ckSoliciatarMotivoSatisfacao.Checked then
        begin
          Try
            UltimoCelular := Trim(BuscaCelularUltimaRespostaSatisfacao('3'));
          Except
            tVerificaRepostaPesquisa.Enabled := true;
          end;
          if (Trim(lbUltimoCelular.Caption) <> UltimoCelular) then
          begin
            InsereSms(UltimoCelular, Sms.mmMensagemSatisfacaoNotaRuim.Text);
            Sms.mmListaEnviados.Lines.Add
              (UltimoCelular + ' - ' + Sms.mmMensagemSatisfacaoNotaRuim.Text);
            Sms.lbSmsEnviadosPesquisaSatisfacao.Caption := IntToStr
              (StrToInt(Sms.lbSmsEnviadosPesquisaSatisfacao.Caption) + 1);
            if Sms.ckPausarAvisoDeEnvio.Checked = False then
              Sms.pcListas.Show;
            lbUltimoCelular.Caption := UltimoCelular;
          end;
        end;
        if (NumeroDeRepostasSatisfacao > TotalRespostaSatisfacao) then
          EnviaAtualizacaoPesquisaSatisfaco;
        TotalRespostaSatisfacao := NumeroDeRepostasSatisfacao;
      end;
      tVerificaRepostaPesquisa.Enabled := true;
    end;

    procedure TSms.RemoverUltimaData1Click(Sender: TObject);
    begin
      { BuscaAgendamentoServidor(Sms.sgListaAgendamentosMarketing.Cells[0,LinhaSelecionada],
        Sms.sgListaAgendamentosMarketing.Cells[1,LinhaSelecionada],
        Sms.sgListaAgendamentosMarketing.Cells[2,LinhaSelecionada],
        Sms.sgListaAgendamentosMarketing.Cells[14,LinhaSelecionada],
        edCnpj.Text); }
      sgListaAgendamentosMarketing.Cells[12, LinhaSelecionada] := '';
      { EditarAgendamentoServidor(Sms.sgListaAgendamentosMarketing.Cells[0,LinhaSelecionada],
        Sms.sgListaAgendamentosMarketing.Cells[1,LinhaSelecionada],
        Sms.sgListaAgendamentosMarketing.Cells[2,LinhaSelecionada],
        edCnpj.Text,
        Sms.sgListaAgendamentosMarketing.Cells[14,LinhaSelecionada],
        sgListaAgendamentosMarketing.Cells[12,LinhaSelecionada]); }
    end;

    procedure TSms.InserirEmail1Click(Sender: TObject);
    begin
      if pos('[Email______________________________]', EdicaoEmail.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        EdicaoEmail.SelText := '[Email______________________________]';
    end;

    procedure TSms.MenuItem4Click(Sender: TObject);
    begin
      FWebBrowser := TWebBrowser.create(Nil);
      TWinControl(FWebBrowser).Parent := Sms;
      TWinControl(FWebBrowser).Name := 'wbVisualizarEmail';
      FWebBrowser.Left := 10;
      FWebBrowser.Top := 30;
      FWebBrowser.Width := 700;
      FWebBrowser.Height := 600;
      WBLoadHTML(FWebBrowser, UTF8Decode(mmAvisoVendaGrande.Text));
      mmAvisoVendaGrande.OnClick := ExitVisualizaEmail;
      mmAvisoVendaGrande.OnEnter := ExitVisualizaEmail;
    end;

    procedure TSms.MenuItem5Click(Sender: TObject);
    begin
      if pos('[Email______________________________]', mmAvisoVendaGrande.Text)
        > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmAvisoVendaGrande.SelText := '[Email______________________________]';
    end;

    procedure TSms.InserirEmail2Click(Sender: TObject);
    begin
      if pos('[Email______________________________]',
        mmMensagemPromocaoEmailGrande.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmMensagemPromocaoEmailGrande.SelText :=
          '[Email______________________________]';
    end;

    procedure TSms.InserirDataAtual1Click(Sender: TObject);
    begin
      if pos('[DataAtual__]', mmMensagemPromocaoEmailGrande.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmMensagemPromocaoEmailGrande.SelText := '[DataAtual__]';
    end;

    procedure TSms.InserirDataAtual2Click(Sender: TObject);
    begin
      if pos('[DataAtual__]', mmAvisoOrcamentoGrande.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmAvisoOrcamentoGrande.SelText := '[DataAtual__]';
    end;

    procedure TSms.InserirDataAtual3Click(Sender: TObject);
    begin
      if pos('[DataAtual__]', mmAvisoVendaGrande.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmAvisoVendaGrande.SelText := '[DataAtual__]';
    end;

    procedure TSms.InserirDataAtual4Click(Sender: TObject);
    begin
      if pos('[DataAtual__]', EdicaoEmail.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        EdicaoEmail.SelText := '[DataAtual__]';
    end;

    Function BuscaEnviados(Data, Periodo: String): Boolean;
    Var
      dbPrincipal: TZConnection;
      qryListaSmsEmail: TZQuery;
      SQL, Tipo: String;
    begin
      PeriodoPesquisaEnvios := Periodo;
      Result := False;
      Case Sms.rgTipoListaEmailSms.ItemIndex of
        0:
          Tipo := '''E''';

        1:
          Tipo := '''S''';

        2:
          Tipo := ' ''S'',''E''';

      end;
      if Periodo = 'Mes' then
        SQL :=
          'SELECT Cnpj,celular,Enviado,Mensagem,Remetente,Tipo,CodigoTextoEmail ,data,hora,id FROM `Enviados` ' + #13 + ' where Cnpj=' + '''' + Sms.edCnpj.Text + '''' + #13 + ' and Month(data)=' + 'Month(' + '''' + FormatDateTime('yyyy-mm-dd', StrToDate(Data)) + '''' + ')' + #13 + ' and Year(data)=' + 'Year(' + '''' + FormatDateTime('yyyy-mm-dd', StrToDate(Data)) + '''' + ') and Enviado=1 and Tipo in (' + Tipo + ')';
      if Periodo = 'Periodo' then
        SQL :=
          'SELECT Cnpj,celular,Enviado,Mensagem,Remetente,Tipo,CodigoTextoEmail ,data,hora,id FROM `Enviados` ' + #13 + ' where Cnpj=' + '''' + Sms.edCnpj.Text + '''' + #13 + ' and (data)=' + '(' + '''' + FormatDateTime('yyyy-mm-dd', StrToDate(Data)) + '''' + ')' + #13 + ' and Enviado=1 and Tipo in (' + Tipo + ')';
      // inputquery('','',Sql);
      Application.ProcessMessages;
      if dbPrincipal = nil then
        dbPrincipal.Destroy;
      dbPrincipal := TZConnection.create(nil);
      dbPrincipal.HostName :=
        'Cadmustech.cet2loe0ehxw.us-west-2.rds.amazonaws.com';
      dbPrincipal.LibraryLocation := 'libmySQL.dll';
      dbPrincipal.user := 'cadmus182';
      dbPrincipal.Port := 3306;
      dbPrincipal.Password := 'cadmus182';
      dbPrincipal.Database := 'mercurio';
      dbPrincipal.Protocol := 'mysql-5';
      dbPrincipal.Connect;
      if qryListaSmsEmail = nil then
        qryListaSmsEmail.Destroy;
      qryListaSmsEmail := TZQuery.create(nil);
      qryListaSmsEmail.connection := dbPrincipal;
      qryListaSmsEmail.SQL.Text := SQL;

      if qryListaSmsEmail.RecordCount > 0 then
        Result := true;
      Sms.lbTotalMsg.Caption := IntToStr(qryListaSmsEmail.RecordCount);
      Sms.dsListaEmails.DataSet := qryListaSmsEmail;
    end;

    procedure TSms.clDatasClick(Sender: TObject);
    begin
      BuscaEnviados(DateToStr(clDatas.Date), 'Periodo');
    end;

    function TSms.SqlResultadoPesquisaSatisfacao(DataInicial, DataFinal: String)
      : String;
    Var
      SQL: String;
    begin
      SQL := 'select    ' + #13 + '  Mensagem as Resposta,   ' + #13 +
        '  Count(*) as TotalResposta,     ' + #13 +
        '  (Count(*) /                   ' + #13 +

        '   (select                            ' + #13 +
        '     distinct count(*)                    ' + #13 +
        '   from                                        ' + #13 +
        '     Recebidas TR ' + #13 +
        '   where                                                   ' + #13 +
        '     TR.Data Between '':DataIncial'' and  '':DataFinal''                  ' +
        #13 + '     and Destinatario = '':Cnpj'' ' + #13 +
        '     and Trim(Mensagem) in (''1'',''2'',''3'',''4'',''5'',''6'',''7'',''8'',''9'',''10''))  * 100)  as Percentual ' + #13 +

        '  , (select                            ' + #13 +
        '     distinct count(*)                    ' + #13 +
        '   from                                        ' + #13 +
        '     Recebidas TR ' + #13 +
        '   where                                                   ' + #13 +
        '     TR.Data Between '':DataIncial'' and  '':DataFinal''                  ' +
        #13 + '     and Destinatario = '':Cnpj'' ' + #13 +
        '     and Trim(Mensagem) in (''1'',''2'',''3'',''4'',''5'',''6'',''7'',''8'',''9'',''10''))  as TotalRespostas ' + #13 +

        ' FROM Recebidas R ' + #13 +
        '   where                                                   ' + #13 +
        '     R.Data Between '':DataIncial'' and  '':DataFinal''                  ' +
        #13 + '     and Destinatario = '':Cnpj'' ' + #13 +
        '     and Trim(Mensagem) in (''1'',''2'',''3'',''4'',''5'',''6'',''7'',''8'',''9'',''10'') ' + #13 + '   group by   ' + #13 + '     Mensagem ';

      SQL := StringReplace(StringReplace(StringReplace(SQL, ':DataIncial',
            DataInicial, [rfReplaceAll, rfIgnoreCase]), ':DataFinal',
          DataFinal, [rfReplaceAll, rfIgnoreCase]), ':Cnpj', Sms.edCnpj.Text,
        [rfReplaceAll, rfIgnoreCase]);
      // inputquery('','',Sql);
      Result := SQL;
    end;

    procedure TSms.btBuscarPesquisaSatisfacaoClick(Sender: TObject);

      procedure BuscarResultadoPesquisaSatisfacao(DataInicial,
        DataFinal: String);
      Var
        dbPrincipal: TZConnection;
        qryResultadoPesquisaSatisfacao: TZQuery;
      begin
        Application.ProcessMessages;
        if dbPrincipal = nil then
          dbPrincipal.Destroy;
        dbPrincipal := TZConnection.create(nil);
        dbPrincipal.HostName :=
          'Cadmustech.cet2loe0ehxw.us-west-2.rds.amazonaws.com';
        dbPrincipal.LibraryLocation := 'libmySQL.dll';
        dbPrincipal.user := 'cadmus182';
        dbPrincipal.Port := 3306;
        dbPrincipal.Password := 'cadmus182';
        dbPrincipal.Database := 'mercurio';
        dbPrincipal.Protocol := 'mysql-5';
        dbPrincipal.Connect;
        if qryResultadoPesquisaSatisfacao = nil then
          qryResultadoPesquisaSatisfacao.Destroy;
        qryResultadoPesquisaSatisfacao := TZQuery.create(nil);
        qryResultadoPesquisaSatisfacao.connection := dbPrincipal;
        qryResultadoPesquisaSatisfacao.SQL.Text :=
          SqlResultadoPesquisaSatisfacao(DataInicial, DataFinal);
        qryResultadoPesquisaSatisfacao.Open;
        Sms.dsResultadoPesquisaSatisfacao.DataSet :=
          qryResultadoPesquisaSatisfacao;
        if not(qryResultadoPesquisaSatisfacao['TotalResposta'].Isnull) then
          gbResultadoPesquisaSatisfacao.Caption :=
            'Total de Respostas : ' + IntToStr
            (qryResultadoPesquisaSatisfacao['TotalRespostas'])
        else
          gbResultadoPesquisaSatisfacao.Caption := 'Total de Respostas : 0';
      end;

    begin
      BuscarResultadoPesquisaSatisfacao(FormatDateTime('dd/mm/yyyy',
          Sms.dtpDataInicialPesquisaSatisfacao.Date),
        FormatDateTime('dd/mm/yyyy',
          Sms.dtpDataFinalPesquisaSatisfacao.Date + 1));

    end;

    procedure TSms.btBuscaTodasDoMesClick(Sender: TObject);
    begin
      BuscaEnviados(DateToStr(clDatas.Date), 'Mes');
    end;

    procedure TSms.DesativarAtualizaoAutomatica1Click(Sender: TObject);
    begin
      tVerificaRespostasSms.Enabled := False;
      lbDesativaAtivaAtualizacaoAutomatica.Caption :=
        'Atualiza��o Automatica de Sms Recebidos Desativada';
    end;

    procedure TSms.AtivarAtualizaoAutomatica1Click(Sender: TObject);
    begin
      tVerificaRespostasSms.Enabled := true;
      lbDesativaAtivaAtualizacaoAutomatica.Caption :=
        'Atualiza��o Automatica de Sms Recebidos Ativo';
    end;

    procedure TSms.BitBtn1Click(Sender: TObject);
    begin
      tVerificaAgendamentos.Enabled := true;
    end;

    procedure TSms.btExportarListaSmsEmailClick(Sender: TObject);
    Var
      Texto: TextFile;
      Local: String;
      dbPrincipal: TZConnection;
      qryListaSmsEmail: TZQuery;
      Tipo: String;
      SQL: String;
      Data: String;
    begin
      Data := DateToStr(clDatas.Date);
      ShowMessage('A Exporta��o Ter� Inicio Aguarde a Mensagem de Conclus�o');
      Case Sms.rgTipoListaEmailSms.ItemIndex of
        0:
          Tipo := '''E''';

        1:
          Tipo := '''S''';

        2:
          Tipo := ' ''S'',''E''';

      end;
      if PeriodoPesquisaEnvios = 'Mes' then
        SQL :=
          'SELECT Cnpj,celular,Enviado,Mensagem,Remetente,Tipo,CodigoTextoEmail ,data,hora,id FROM `Enviados` ' + #13 + ' where Cnpj=' + '''' + Sms.edCnpj.Text + '''' + #13 + ' and Month(data)=' + 'Month(' + '''' + FormatDateTime('yyyy-mm-dd', StrToDate(Data)) + '''' + ')' + #13 + ' and Year(data)=' + 'Year(' + '''' + FormatDateTime('yyyy-mm-dd', StrToDate(Data)) + '''' + ') and Enviado=1 and Tipo in (' + Tipo + ')';
      if PeriodoPesquisaEnvios = 'Periodo' then
        SQL :=
          'SELECT Cnpj,celular,Enviado,Mensagem,Remetente,Tipo,CodigoTextoEmail ,data,hora,id FROM `Enviados` ' + #13 + ' where Cnpj=' + '''' + Sms.edCnpj.Text + '''' + #13 + ' and (data)=' + '(' + '''' + FormatDateTime('yyyy-mm-dd', StrToDate(Data)) + '''' + ')' + #13 + ' and Enviado=1 and Tipo in (' + Tipo + ')';
      // inputquery('','',Sql);
      Application.ProcessMessages;
      dbPrincipal := TZConnection.create(nil);
      dbPrincipal.HostName :=
        'Cadmustech.cet2loe0ehxw.us-west-2.rds.amazonaws.com';
      dbPrincipal.LibraryLocation := 'libmySQL.dll';
      dbPrincipal.user := 'cadmus182';
      dbPrincipal.Port := 3306;
      dbPrincipal.Password := 'cadmus182';
      dbPrincipal.Database := 'mercurio';
      dbPrincipal.Protocol := 'mysql-5';
      dbPrincipal.Connect;
      qryListaSmsEmail := TZQuery.create(nil);
      qryListaSmsEmail.connection := dbPrincipal;
      qryListaSmsEmail.SQL.Text := SQL;
      qryListaSmsEmail.Open;
      GerarExcel(qryListaSmsEmail);
    end;

    procedure TSms.btExportarPesquisaSatisfacaoClick(Sender: TObject);
    Var
      Texto: TextFile;
      Local: String;
      dbPrincipal: TZConnection;
      qryResultadoPesquisaSatisfacao: TZQuery;
    begin
      ShowMessage('A Exporta��o Ter� Inicio Aguarde a Mensagem de Conclus�o');
      Application.ProcessMessages;
      dbPrincipal := TZConnection.create(nil);
      dbPrincipal.HostName :=
        'Cadmustech.cet2loe0ehxw.us-west-2.rds.amazonaws.com';
      dbPrincipal.LibraryLocation := 'libmySQL.dll';
      dbPrincipal.user := 'cadmus182';
      dbPrincipal.Port := 3306;
      dbPrincipal.Password := 'cadmus182';
      dbPrincipal.Database := 'mercurio';
      dbPrincipal.Protocol := 'mysql-5';
      dbPrincipal.Connect;
      qryResultadoPesquisaSatisfacao := TZQuery.create(nil);
      qryResultadoPesquisaSatisfacao.connection := dbPrincipal;
      qryResultadoPesquisaSatisfacao.SQL.Text := SqlResultadoPesquisaSatisfacao
        (FormatDateTime('dd/mm/yyyy',
          Sms.dtpDataInicialPesquisaSatisfacao.Date),
        FormatDateTime('dd/mm/yyyy',
          Sms.dtpDataFinalPesquisaSatisfacao.Date + 1));
      qryResultadoPesquisaSatisfacao.Open;
      qryResultadoPesquisaSatisfacao.First;
      sgSalvaTxt.Execute;
      AssignFile(Texto, sgSalvaTxt.FileName + '.txt');
      Rewrite(Texto);
      Writeln(Texto, 'Resposta' + ';' + 'Qtde' + ';' + 'Percentual');
      while not qryResultadoPesquisaSatisfacao.Eof do
      begin
        Writeln(Texto, IntToStr(qryResultadoPesquisaSatisfacao['Resposta'])
            + ';' + IntToStr(qryResultadoPesquisaSatisfacao['TotalResposta'])
            + ';' + FloatToStr(qryResultadoPesquisaSatisfacao['Percentual']));
        qryResultadoPesquisaSatisfacao.Next;
      end;
      Writeln(Texto,
        'Total de Respostas no Periodo ' + ';' + IntToStr
          (qryResultadoPesquisaSatisfacao
            ['TotalRespostas']));
      CloseFile(Texto);
    end;

    procedure TSms.btExportarArquivoTextoClick(Sender: TObject);
    Var
      Texto: TextFile;
      Local: String;
      dbPrincipal: TZConnection;
      qryListaSmsEmail: TZQuery;
      Tipo: String;
      SQL: String;
      Data: String;
    begin
      Data := DateToStr(clDatas.Date);
      ShowMessage('A Exporta��o Ter� Inicio Aguarde a Mensagem de Conclus�o');
      Case Sms.rgTipoListaEmailSms.ItemIndex of
        0:
          Tipo := '''E''';

        1:
          Tipo := '''S''';

        2:
          Tipo := ' ''S'',''E''';

      end;
      if PeriodoPesquisaEnvios = 'Mes' then
        SQL :=
          'SELECT Cnpj,celular,Enviado,Mensagem,Remetente,Tipo,CodigoTextoEmail ,data,hora,id FROM `Enviados` ' + #13 + ' where Cnpj=' + '''' + Sms.edCnpj.Text + '''' + #13 + ' and Month(data)=' + 'Month(' + '''' + FormatDateTime('yyyy-mm-dd', StrToDate(Data)) + '''' + ')' + #13 + ' and Year(data)=' + 'Year(' + '''' + FormatDateTime('yyyy-mm-dd', StrToDate(Data)) + '''' + ') and Enviado=1 and Tipo in (' + Tipo + ')';
      if PeriodoPesquisaEnvios = 'Periodo' then
        SQL :=
          'SELECT Cnpj,celular,Enviado,Mensagem,Remetente,Tipo,CodigoTextoEmail ,data,hora,id FROM `Enviados` ' + #13 + ' where Cnpj=' + '''' + Sms.edCnpj.Text + '''' + #13 + ' and (data)=' + '(' + '''' + FormatDateTime('yyyy-mm-dd', StrToDate(Data)) + '''' + ')' + #13 + ' and Enviado=1 and Tipo in (' + Tipo + ')';
      // inputquery('','',Sql);
      Application.ProcessMessages;
      dbPrincipal := TZConnection.create(nil);
      dbPrincipal.HostName :=
        'Cadmustech.cet2loe0ehxw.us-west-2.rds.amazonaws.com';
      dbPrincipal.LibraryLocation := 'libmySQL.dll';
      dbPrincipal.user := 'cadmus182';
      dbPrincipal.Port := 3306;
      dbPrincipal.Password := 'cadmus182';
      dbPrincipal.Database := 'mercurio';
      dbPrincipal.Protocol := 'mysql-5';
      dbPrincipal.Connect;
      qryListaSmsEmail := TZQuery.create(nil);
      qryListaSmsEmail.connection := dbPrincipal;
      qryListaSmsEmail.SQL.Text := SQL;
      qryListaSmsEmail.Open;
      sgSalvaTxt.Execute;
      AssignFile(Texto, sgSalvaTxt.FileName + '.txt');
      Rewrite(Texto);
      Writeln(Texto, 'Cnpj' + ';' + 'Celular' + ';' + 'Mensagem' + ';' +
          'Remetente' + ';' + 'Tipo' + ';' + 'Data' + ';' + 'Hora');
      qryListaSmsEmail.First;
      while not qryListaSmsEmail.Eof do
      begin
        Writeln(Texto,
          qryListaSmsEmail['Cnpj'] + ';' + (qryListaSmsEmail['Celular'])
            + ';' + (qryListaSmsEmail['Mensagem']) + ';' + VarToStr
            (qryListaSmsEmail['Remetente']) + ';' + qryListaSmsEmail['Tipo']
            + ';' + DateToStr(qryListaSmsEmail['Data']) + ';' + TimeToStr
            (qryListaSmsEmail['Hora']));
        qryListaSmsEmail.Next;
      end;
      CloseFile(Texto);
      dbPrincipal.Destroy;
      qryListaSmsEmail.Destroy;
      ShowMessage('Exporta��o Concluida');
    end;

    procedure TSms.btIniciaInadimplentesEmailClick(Sender: TObject);
    var
      Contador: Integer;
      TextoEmail, Email, Comando, Identificacao: String;
      Texto: PansiChar;
      Arq: TextFile;
      TotalEmail: Integer;
      ContadorCobrancas: Integer;
      TotalInadimplentes: Integer;
      NumeroSmsEnviadosAgora: Integer;

    begin
      BuscarInadimplentes;
      lbEnviadosCobranca.Caption := '0';
      TotalInadimplentes := dmuPrincipal.qryInadimplentes.RecordCount;
      if rgMaxSmsCobranca.ItemIndex = 0 then
        TotalEmail := TotalInadimplentes
      else
        TotalEmail := StrToInt(edMaxSmsInadimpentes.Text);

      Contador := 0;
      ContadorCobrancas := 0;
      if TotalInadimplentes = 0 then
      begin
        mmListaEnviados.Lines.Add('Sem Inadimplentes para enviar Email');
        TotalEmail := 0;
      end;
      while Contador <= TotalEmail - 1 do
      begin
        Identificacao := RemoveCaracteresEspeciais
          (dmuPrincipal.qryInadimplentes['NCLIENTE'] + VarToStr
            (dmuPrincipal.qryInadimplentes['Vencimento']) + VarToStr
            (dmuPrincipal.qryInadimplentes['ValorNaMoeda1']));
        TextoEmail := mmMensagemInadimplenteEmail.Text;
        TextoEmail := SubstituirTexto(TextoEmail,
          '[cliente______________________________]',
          copy(dmuPrincipal.qryInadimplentes['NCLIENTE'], 1, 40));
        TextoEmail := SubstituirTexto(TextoEmail, '[Vencimento]',
          dmuPrincipal.qryInadimplentes['Vencimento']);
        // TextoEmail := SubstituirTexto(TextoEmail,'[Valor]',formatfloat('"R$ ",.00',dmuPrincipal.qryInadimplentes.fieldbyname('ValorNaMoeda1').AsCurrency));
        // TextoEmail := SubstituirTexto(TextoEmail,'[Valor+Juros]',dmuPrincipal.qryInadimplentes['ValorComJuros']);  preciso travar o campo
        TextoEmail := SubstituirTexto(TextoEmail, '[TipoVencimento]',
          dmuPrincipal.qryInadimplentes['Ntipo']);
        TextoEmail := SubstituirTexto(TextoEmail, '[Dias]',
          dmuPrincipal.qryInadimplentes['Dias']);
        TextoEmail := SubstituirTexto(TextoEmail, '[Numero]',
          dmuPrincipal.qryInadimplentes['Codigo']);
        SalvarAquivoTextoEmail(TextoEmail, Identificacao);
        if (not(BuscaEmail(dmuPrincipal.qryInadimplentes['RCLIENTE'],
              '32979') = '')) or (rgOpcaoDeEnvioEmail.ItemIndex = 0) then
        begin
          case rgOpcaoDeEnvioEmail.ItemIndex of
            1:
              Email := BuscaEmail(dmuPrincipal.qryInadimplentes['RCLIENTE'],
                '32979');
            0:
              Email := Sms.edEmailEnvio.Text;
          end;
          if not EstaNaListaNegra(Email) then
          begin
            InsereEmail(edEmail.Text, Email, edTItuloEmailCobranca.Text,
              Identificacao);
          end;
          if not VerificaInternet then
          Begin
            mmListaEnviados.Lines.Add(
              'Computador Sem internet Verifique sua conex�o');
            // mmCaixaDeSaida.Lines.Add('Cobran�a '+FormatDateTime('dd/mm/yyyy',Date)+'-'+FormatDatetime('hh:mm:ss',Time)+'-'+Celular+' '+Mensagem);
          end
          else
          begin
            if EstaNaListaNegra(Email) then
              mmListaEnviados.Lines.Add(
                'Email Cobran�a N�o Enviado Lista Negra - ' + FormatDateTime
                  ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                  Time) + '-' + Email + ' ' + Sms.edTItuloEmailCobranca.Text)
            else
            begin
              mmListaEnviados.Lines.Add('Email Cobran�a -  ' + FormatDateTime
                  ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                  Time) + '-' + Email + ' ' + Sms.edEmail.Text);
            end;
          end;
          Contador := Contador + 1;
          // lbEnviadosCobranca.Caption := IntToStr(StrToInt(lbEnviadosCobranca.Caption)+ 1) ;
          NumeroSmsEnviadosAgora := NumeroSmsEnviadosAgora + 1;
        end
        else
          mmListaEnviados.Lines.Add(
            'Email n�o enviado o cliente n�o possui um Email valido -' +
              'Cobran�a - ' + copy(dmuPrincipal.qryInadimplentes['NCLIENTE'],
              1, 40) + ' - ' + FormatDateTime('dd/mm/yyyy',
              Date) + '-' + FormatDateTime('hh:mm:ss', Time));
        dmuPrincipal.qryInadimplentes.Next;
        ContadorCobrancas := ContadorCobrancas + 1;
        if ContadorCobrancas = TotalInadimplentes then
          TotalEmail := 0;
      end;
      if VerificaInternet = False then
      begin
        // EnviaAcrescentaArquivo('EnviaInadimplentes.txt',True);
      end
      else
      begin
        // tAguardaReconexao.Enabled := True;
        // mmCaixaDeSaida.Lines.SaveToFile('NaoEnviadas.txt');
        // pcCaixaDeSaida.Show;
        if ckPausarAvisoDeEnvio.Checked = False then
          pcListas.Show;
        lbNumerolEmailCobranca.Caption := IntToStr
          (StrToInt(lbNumerolEmailCobranca.Caption) + NumeroSmsEnviadosAgora);
        // GravandoNumeroMsgNaoEnviadas(IntToStr(0),IntToStr(NumeroSmsEnviadosAgora),IntToStr(0),IntToStr(0));
      end;
    end;

    procedure TSms.ckEnviaEmailCobrancaClick(Sender: TObject);
    begin
      if ckEnviaEmailCobranca.Checked then
      begin
        rgEmailDeCobranca.Show;
        AbasteceListaAtivados(ckEnviaEmailCobranca);
      end
      else
      begin
        rgEmailDeCobranca.Hide;
        AbasteceListaAtivados(ckEnviaEmailCobranca);
      end;
    end;

    procedure TSms.ckEnviarMarketingListaExternaClick(Sender: TObject);
    begin
      if not ckEnviarMarketingListaExterna.Checked then
        gbFiltroListaExternaMarketing.Hide
      else
      begin
        CarregaListaCategoriaExternaComboAgendamentos;
        gbFiltroListaExternaMarketing.Show;

      end;
    end;

    procedure TSms.edTItuloEmailCobrancaExit(Sender: TObject);
    begin
      mmMsgCobranca.Clear;
      edTItuloEmailCobranca.Color := clWindow;
      SalvaEdit(edTItuloEmailCobranca);
    end;

    procedure TSms.edTItuloEmailCobrancaEnter(Sender: TObject);
    begin
      edTItuloEmailCobranca.Color := $00CCFFFF;
      mmMsgCobranca.Text := 'Informe o um Texto para o Email';
    end;

    procedure TSms.ExitmmMensagemCobrancaEmailGrande(Sender: TObject);
    begin
      mmMensagemInadimplenteEmail.Text := TMemo(Sender).Text;
      if Sender <> nil then
        FreeAndNil(Sender);
      SalvaMemo(mmMensagemInadimplenteEmail);
    end;

    procedure TSms.mmMensagemInadimplenteEmailEnter(Sender: TObject);
    begin
      mmMensagemInadimplenteEmail.Color := $00CCFFFF;
      if mmMensagemInadimplenteEmail.ReadOnly = False then
      begin
        mmMsgCobranca.Text := 'Digite um Texo para o Email de Cobran�a';
        mmMensagemCobrancaEmailGrande := TMemo.create(nil);
        mmMensagemCobrancaEmailGrande.Parent := Sms;
        mmMensagemCobrancaEmailGrande.Show;
        mmMensagemCobrancaEmailGrande.Top := 300;
        mmMensagemCobrancaEmailGrande.Left := 10;
        mmMensagemCobrancaEmailGrande.Width := 800;
        mmMensagemCobrancaEmailGrande.Height := 300;
        mmMensagemCobrancaEmailGrande.ScrollBars := ssVertical;
        mmMensagemCobrancaEmailGrande.Text := mmMensagemInadimplenteEmail.Text;
        mmMensagemCobrancaEmailGrande.Color := $00CCFFFF;
        mmMensagemCobrancaEmailGrande.SetFocus;
        mmMensagemCobrancaEmailGrande.OnExit :=
          ExitmmMensagemCobrancaEmailGrande;
        mmMensagemCobrancaEmailGrande.PopupMenu := mnMensagemCobrancaEmail;
        mmMsgCobranca.Text := 'Digite sua Msg de Email de Marketing';
      end;
    end;

    procedure TSms.mmMensagemInadimplenteChange(Sender: TObject);
    begin
      if mmMensagemInadimplente.Text <> '' then
        mmFaltaCaracteresIndimplentes.Caption :=
          'Caracteres Faltantes : ' + IntToStr(ContaStringFalta('160',
            mmMensagemInadimplente.Text));
    end;

    procedure TSms.MenuItem6Click(Sender: TObject);
    begin
      FWebBrowser := TWebBrowser.create(Nil);
      TWinControl(FWebBrowser).Parent := Sms;
      TWinControl(FWebBrowser).Name := 'wbVisualizarEmail';
      FWebBrowser.Left := 10;
      FWebBrowser.Top := 30;
      FWebBrowser.Width := 700;
      FWebBrowser.Height := 600;
      WBLoadHTML(FWebBrowser, UTF8Decode(mmMensagemCobrancaEmailGrande.Text));
      mmMensagemCobrancaEmailGrande.OnClick := ExitVisualizaEmail;
      mmMensagemCobrancaEmailGrande.OnEnter := ExitVisualizaEmail;
    end;

    procedure TSms.MenuItem7Click(Sender: TObject);
    begin
      if pos('[Email______________________________]',
        mmMensagemCobrancaEmailGrande.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmMensagemCobrancaEmailGrande.SelText :=
          '[Email______________________________]';
    end;

    procedure TSms.MenuItem8Click(Sender: TObject);
    begin
      if pos('[DataAtual__]', mmMensagemCobrancaEmailGrande.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmMensagemCobrancaEmailGrande.SelText := '[DataAtual__]';
    end;

    procedure TSms.btInsereClienteAvisoVencimentoClick(Sender: TObject);
    begin
      if pos('[cliente______________________________]',
        mmMensagemSmsAvisoVencimento.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmMensagemSmsAvisoVencimento.SelText :=
          '[cliente______________________________]';
    end;

    procedure TSms.btInsereVencimentoAvisoVencimentoClick(Sender: TObject);
    begin
      if pos('[Vencimento]', mmMensagemSmsAvisoVencimento.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmMensagemSmsAvisoVencimento.SelText := '[Vencimento]';
    end;

    procedure TSms.btInsereValorAvisoVencimentoClick(Sender: TObject);
    begin
      if pos('[Valor]', mmMensagemSmsAvisoVencimento.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmMensagemSmsAvisoVencimento.SelText := '[Valor]';
    end;

    procedure TSms.btInsereDocumentoAvisoVencimentoClick(Sender: TObject);
    begin
      if pos('[TipoVencimento]', mmMensagemSmsAvisoVencimento.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmMensagemSmsAvisoVencimento.SelText := '[TipoVencimento]';
    end;

    procedure TSms.btInsereNumeroAvisoVencimentoClick(Sender: TObject);
    begin
      if pos('[Numero]', mmMensagemSmsAvisoVencimento.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmMensagemSmsAvisoVencimento.SelText := '[Numero]';
    end;

    procedure TSms.mmMensagemSatisfacaoChange(Sender: TObject);
    begin
      if mmMensagemSatisfacao.Text <> '' then
        mmFaltaCaracteresSatisfacao.Caption :=
          'Caracteres Faltantes : ' + IntToStr(ContaStringFalta('100',
            mmMensagemSatisfacao.Text));
    end;

    procedure TSms.mmMensagemSatisfacaoEnter(Sender: TObject);
    begin
      mmMsgSatisfacao.Text :=
        'Se precisar clique com o bot�o direito na mensagem de Pesquisa de Satisfa��o e veja exemplos de Sms Pesquisa';
      mmMensagemSatisfacao.Color := $00CCFFFF;
    end;

    procedure TSms.mmMensagemSatisfacaoExit(Sender: TObject);
    begin
      mmMsgSatisfacao.Clear;
      mmMensagemSatisfacao.Color := clWhite;
    end;

    procedure TSms.mmMensagemSmsAvisoVencimentoChange(Sender: TObject);
    begin
      if mmMensagemSmsAvisoVencimento.Text <> '' then
        mmFaltaCaracteresSmsAvisoVencimento.Caption :=
          'Caracteres Faltantes : ' + IntToStr
          (ContaStringFalta('160', mmMensagemSmsAvisoVencimento.Text));
    end;

    procedure TSms.mmMensagemSmsAvisoVencimentoEnter(Sender: TObject);
    begin
      mmMsgAvisoVencimento.Text :=
        'Se precisar clique com o bot�o direito na mensagem de Aviso de Cobran�a e veja exemplos de Sms Aviso de Vencimento';
      mmMensagemSmsAvisoVencimento.Color := $00CCFFFF;
    end;

    procedure TSms.mmMensagemSmsAvisoVencimentoExit(Sender: TObject);
    begin
      mmMsgAvisoVencimento.Clear;
      mmMensagemSmsAvisoVencimento.Color := clWindow;
      SalvaMemo(mmMensagemSmsAvisoVencimento);
    end;

    procedure TSms.ckEnviaEmailAvisoVencimentoClick(Sender: TObject);
    begin
      if ckEnviaEmailAvisoVencimento.Checked then
      begin
        rgEmailAvisoVencimento.Show;
        AbasteceListaAtivados(ckEnviaEmailAvisoVencimento);
      end
      else
      begin
        rgEmailAvisoVencimento.Hide;
        AbasteceListaAtivados(ckEnviaEmailAvisoVencimento);
      end;
    end;

    procedure TSms.edTituloEmailAvisoVencimentoEnter(Sender: TObject);
    begin
      edTituloEmailAvisoVencimento.Color := $00CCFFFF;
      mmMsgAvisoVencimento.Text := 'Informe o um Texto de Titulo para o Email';
    end;

    procedure TSms.edTituloEmailAvisoVencimentoExit(Sender: TObject);
    begin
      mmMsgAvisoVencimento.Clear;
      edTituloEmailAvisoVencimento.Color := clWindow;
      SalvaEdit(edTituloEmailAvisoVencimento);
    end;

    procedure TSms.ExitmmMensagemEmailAvisoVencimentoGrande(Sender: TObject);
    begin
      mmMensagemEmailAvisoVencimento.Text := TMemo(Sender).Text;
      if Sender <> nil then
        FreeAndNil(Sender);
    end;

    procedure TSms.mmMensagemEmailAvisoVencimentoEnter(Sender: TObject);
    begin
      mmMensagemEmailAvisoVencimento.Color := $00CCFFFF;
      if mmMensagemEmailAvisoVencimento.ReadOnly = False Then
      begin
        mmMsgAvisoVencimento.Text :=
          'Digite um Texo para o Email de Aviso de Vencimento';
        mmMensagemEmailAvisoVencimentoGrande := TMemo.create(nil);
        mmMensagemEmailAvisoVencimentoGrande.Parent := Sms;
        mmMensagemEmailAvisoVencimentoGrande.Show;
        mmMensagemEmailAvisoVencimentoGrande.Top := 300;
        mmMensagemEmailAvisoVencimentoGrande.Left := 10;
        mmMensagemEmailAvisoVencimentoGrande.Width := 800;
        mmMensagemEmailAvisoVencimentoGrande.Height := 300;
        mmMensagemEmailAvisoVencimentoGrande.ScrollBars := ssVertical;
        mmMensagemEmailAvisoVencimentoGrande.Text :=
          mmMensagemEmailAvisoVencimento.Text;
        mmMensagemEmailAvisoVencimentoGrande.Color := $00CCFFFF;
        mmMensagemEmailAvisoVencimentoGrande.SetFocus;
        mmMensagemEmailAvisoVencimentoGrande.OnExit :=
          ExitmmMensagemEmailAvisoVencimentoGrande;
        mmMensagemEmailAvisoVencimentoGrande.PopupMenu :=
          mnMensagemAvisoVencimento;
        mmMsgAvisoVencimento.Text :=
          'Digite sua Msg de Email de Aviso de Vencimento';
      end;
    end;

    procedure TSms.mmMensagemEmailAvisoVencimentoExit(Sender: TObject);
    begin
      mmMsgAvisoVencimento.Clear;
      mmMensagemEmailAvisoVencimento.Color := clWindow;
      SalvaMemo(mmMensagemEmailAvisoVencimento);
    end;

    procedure TSms.btInsereTipoDocumentoAvisoVencimentoClick(Sender: TObject);
    begin
      if cbTiposDocumentoAvisoVencimento.Text = '' then
        ShowMessage('Selecione um Tipo')
      else
      begin
        if Trim(mmListaTipoDocumentoAvisoVencimento.Text) = '' then
          mmListaTipoDocumentoAvisoVencimento.Lines.Add
            ('''' + cbTiposDocumentoAvisoVencimento.Text + '''')
        else
          mmListaTipoDocumentoAvisoVencimento.Lines.Add
            (',' + '''' + cbTiposDocumentoAvisoVencimento.Text + '''');
      end;
    end;

    procedure TSms.btIRetiraTipoDocumentoAvisoVencimentoClick(Sender: TObject);
    begin
      mmListaTipoDocumentoAvisoVencimento.SelText := '';
    end;

    procedure TSms.btInsereListaNegraAvisoVencimentoClick(Sender: TObject);
    begin
      if cbListaNegraAvisoVencimento.Text = '' then
        ShowMessage('Selecione um Cliente')
      else
      begin
        if Trim(cbListaNegraAvisoVencimento.Text) = '' then
          mmListaNegraAvisoVencimento.Lines.Add
            ('''' + cbListaNegraAvisoVencimento.Text + '''')
        else
          mmListaNegraAvisoVencimento.Lines.Add
            (',' + '''' + cbListaNegraAvisoVencimento.Text + '''');
      end;
    end;

    procedure TSms.btRetiraListaNegraAvisoVencimentoClick(Sender: TObject);
    begin
      mmListaNegraAvisoVencimento.SelText := '';
    end;

    procedure TSms.btSalvarAvisoVencimentoClick(Sender: TObject);
    begin
      SalvarTela('AvisoVencimento.txt',
        Trim(mmMensagemSmsAvisoVencimento.Text),
        edMinDiasAvisoVencimento.Text, edMaxDiasAvisoVencimento.Text,
        edValorAvisoVencimento.Text, Trim(mmListaNegraAvisoVencimento.Text),
        IntToStr(rgOpcaodeEnvioAvisoVencimento.ItemIndex),
        edMaxSmsAvisoVencimento.Text,
        Trim(mmListaTipoDocumentoAvisoVencimento.Text),
        edHoraAvisoVencimento.Text);
      mmMsgAvisoVencimento.Lines.Text :=
        'Configura��o de Aviso de Vencimento Salvas com Sucesso';
    end;

    procedure TSms.btAtivarAvisoVencimentoClick(Sender: TObject);
      procedure DesativaAtivarControles(Comando: String);
      begin
        if Comando = 'Desativar' then
        Begin
          btInsereClienteAvisoVencimento.Enabled := False;
          btInsereVencimentoAvisoVencimento.Enabled := False;
          btInsereValorAvisoVencimento.Enabled := False;
          btInsereTipoDocumentoAvisoVencimento.Enabled := False;
          btInsereNumeroAvisoVencimento.Enabled := False;
          mmMensagemSmsAvisoVencimento.Enabled := False;
          edMinDiasAvisoVencimento.Enabled := False;
          edMaxDiasAvisoVencimento.Enabled := False;
          edValorAvisoVencimento.Enabled := False;
          edMaxSmsAvisoVencimento.Enabled := False;
          edHoraAvisoVencimento.Enabled := False;
          cbListaNegraAvisoVencimento.Enabled := False;
          btInsereListaNegraAvisoVencimento.Enabled := False;
          btRetiraListaNegraAvisoVencimento.Enabled := False;
          btSalvarAvisoVencimento.Enabled := False;
          cbTiposDocumentoAvisoVencimento.Enabled := False;
          btInsereTipoDocumentoAvisoVencimento.Enabled := False;
          btRetiraListaNegraAvisoVencimento.Enabled := False;
          rgOpcaodeEnvioAvisoVencimento.Enabled := False;
          ckEnviaEmailAvisoVencimento.Enabled := False;
          if ckEnviaEmailAvisoVencimento.Checked then
            rgEmailAvisoVencimento.Enabled := False;
        end;
        if Comando = 'Ativar' then
        Begin
          btInsereClienteAvisoVencimento.Enabled := true;
          btInsereVencimentoAvisoVencimento.Enabled := true;
          btInsereValorAvisoVencimento.Enabled := true;
          btInsereTipoDocumentoAvisoVencimento.Enabled := true;
          btInsereNumeroAvisoVencimento.Enabled := true;
          mmMensagemSmsAvisoVencimento.Enabled := true;
          edMinDiasAvisoVencimento.Enabled := true;
          edMaxDiasAvisoVencimento.Enabled := true;
          edValorAvisoVencimento.Enabled := true;
          edMaxSmsAvisoVencimento.Enabled := true;
          edHoraAvisoVencimento.Enabled := true;
          cbListaNegraAvisoVencimento.Enabled := true;
          btInsereListaNegraAvisoVencimento.Enabled := true;
          btRetiraListaNegraAvisoVencimento.Enabled := true;
          btSalvarAvisoVencimento.Enabled := true;
          cbTiposDocumentoAvisoVencimento.Enabled := true;
          btInsereTipoDocumentoAvisoVencimento.Enabled := true;
          btRetiraListaNegraAvisoVencimento.Enabled := true;
          rgOpcaodeEnvioAvisoVencimento.Enabled := true;
          ckEnviaEmailAvisoVencimento.Enabled := true;
          if ckEnviaEmailAvisoVencimento.Checked then
            rgEmailAvisoVencimento.Enabled := true;
        end;
      end;
      Function VerificaPreenchimento: Boolean;
      begin
        Result := False;
        if mmMensagemSmsAvisoVencimento.Text = '' then
        begin
          ShowMessage('Preencha uma mensagem para envio');
          Result := true;
          mmMensagemSmsAvisoVencimento.SetFocus;
        end;
        if edHoraAvisoVencimento.Text = '  :  ' then
        begin
          ShowMessage('Preencha uma hora para programa��o');
          edHoraAvisoVencimento.SetFocus;
          Result := true;
        end;
        if (edMaxSmsAvisoVencimento.Text = '') and
          (rgOpcaodeEnvioAvisoVencimento.ItemIndex = 1) then
        begin
          ShowMessage('Preencha um valor de Sms para serem enviados');
          edMaxSmsAvisoVencimento.SetFocus;
          Result := true;
        end;
        if edMinDiasAvisoVencimento.Text = '' then
        begin
          ShowMessage('Preencha um valor para minimo de dias vencidos');
          edMinDiasAvisoVencimento.SetFocus;
          Result := true;
        end;
        if edMaxDiasAvisoVencimento.Text = '' then
        begin
          ShowMessage('Preencha um valor para maximo de dias vencidos');
          edMaxDiasAvisoVencimento.SetFocus;
          Result := true;
        end;
        if edValorAvisoVencimento.Text = '' then
        begin
          ShowMessage('Preencha um valor para minimo valor vencido');
          edValorAvisoVencimento.SetFocus;
          Result := true;
        end;
        if mmListaTipoDocumentoAvisoVencimento.Text = '' then
        begin
          ShowMessage('Adicione pelo menos um tipo de documento');
          mmListaTipoDocumentoAvisoVencimento.SetFocus;
          Result := true;
        end;
        if (rgOpcaoDeEnvio.ItemIndex = 0) and
          ((Trim(edCelularTeste.Text) = '') or
            (Length(Trim(edCelularTeste.Text)) < 10)) then
        begin
          ShowMessage('Preencha um celular valido pra teste');
          Result := true;
          edCelularTeste.SetFocus;
        end;
        if (ckEnviaEmailAvisoVencimento.Checked) and
          (edTituloEmailAvisoVencimento.Text = '') then
        begin
          ShowMessage('Preencha um Titulo para o Email de Aviso de Vencimento');
          Result := true;
          edTituloEmailAvisoVencimento.SetFocus;
        end;
        if (ckEnviaEmailAvisoVencimento.Checked) and
          (mmMensagemEmailAvisoVencimento.Text = '') then
        begin
          ShowMessage('Preencha um Texto para o Email de Aviso de Vencimento');
          Result := true;
          mmMensagemEmailAvisoVencimento.SetFocus;
        end;
      end;

    begin
      if VerificaPreenchimento = False then
      Begin
        if btConectaBancoDeDados.Caption = 'Desconectar' then
        begin
          if btAtivarAvisoVencimento.Caption = 'Ativar' then
          Begin
            btAtivarAvisoVencimento.Caption := 'Desativar';
            btAtivarAvisoVencimento.Font.Color := clRed;
            DesativaAtivarControles('Desativar');
            mmMsgAvisoVencimento.Lines.Text :=
              'Ativo o Envio de Sms de Aviso de Vencimento para inicio as ' +
              edHoraAvisoVencimento.Text + ' dos Proximos dias';
          end
          else
          Begin
            btAtivarAvisoVencimento.Caption := 'Ativar';
            btAtivarAvisoVencimento.Font.Color := clGreen;
            DesativaAtivarControles('Ativar');
            mmMsgAvisoVencimento.Clear;
          end;
        end
        else
        begin
          ShowMessage(
            '� Necess�rio se conectar no banco de dados antes Enviar SMS');
          tsConfiguracao.Show;
        end;
        if not VerificaInternet then
          ShowMessage('Computador Sem internet Verifique sua conex�o');
      end;
      SalvarStatusBotao(btAtivarAvisoVencimento);
    end;

    procedure TSms.rgOpcaodeEnvioAvisoVencimentoEnter(Sender: TObject);
    begin
      mmMsgCobranca.Text :=
        'Informe se as msgs ser�o envias para todos do filtro ou somente para o numero definido';
    end;

    procedure TSms.rgOpcaodeEnvioAvisoVencimentoExit(Sender: TObject);
    begin
      mmMsgAvisoVencimento.Clear;
    end;

    procedure TSms.rgOpcaodeEnvioAvisoVencimentoClick(Sender: TObject);
    begin
      case rgOpcaodeEnvioAvisoVencimento.ItemIndex of
        0:
          begin
            edMaxSmsAvisoVencimento.Hide;
            mmMsgAvisoVencimento.Text :=
              'Os Sms de Aviso de Vencimento ser�o enviados a todos do filtro';
          end;
        1:
          begin
            edMaxSmsAvisoVencimento.Show;
            mmMsgAvisoVencimento.Text :=
              'Os Sms de Aviso de Vencimento ser�o enviados no Numero definido';
          end;
      end;
    end;

    procedure TSms.btIniciaAvisoVencimentoSmsClick(Sender: TObject);
    var
      Contador: Integer;
      Mensagem, Celular, Comando: String;
      Texto: PansiChar;
      Arq: TextFile;
      TotalSms: Integer;
      ContadorAvisosVencimento: Integer;
      TotalParcelas: Integer;
      NumeroSmsEnviadosAgora: Integer;
    begin
      BuscarParcelasProximasVencimento;
      lbNumeroEnviosSmsAvisoVencimento.Caption := '0';
      TotalParcelas := dmuPrincipal.qryParcelasVencer.RecordCount;
      if rgOpcaodeEnvioAvisoVencimento.ItemIndex = 0 then
        TotalSms := TotalParcelas
      else
        TotalSms := StrToInt(edMaxSmsAvisoVencimento.Text);

      Contador := 0;
      ContadorAvisosVencimento := 0;
      if TotalParcelas = 0 then
      begin
        mmListaEnviados.Lines.Add('Sem Parcelas para enviar sms');
        TotalSms := 0;
      end;
      while Contador <= TotalSms - 1 do
      begin
        Mensagem := mmMensagemSmsAvisoVencimento.Text;
        Mensagem := SubstituirTexto(Mensagem,
          '[cliente______________________________]',
          copy(dmuPrincipal.qryParcelasVencer['NCLIENTE'], 1, 40));
        if dmuPrincipal.qryParcelasVencer['Vencimento'] <> null then
          Mensagem := SubstituirTexto(Mensagem, '[Vencimento]',
            dmuPrincipal.qryParcelasVencer['Vencimento'])
        else
          Mensagem := SubstituirTexto(Mensagem, '[Vencimento]', '');
        if dmuPrincipal.qryParcelasVencer.FieldByName('ValorNaMoeda1')
          .AsCurrency <> null then
          Mensagem := SubstituirTexto(Mensagem, '[Valor]',
            formatfloat('"R$ ",.00',
              dmuPrincipal.qryParcelasVencer.FieldByName
                ('ValorNaMoeda1').AsCurrency))
        else
          Mensagem := SubstituirTexto(Mensagem, '[Valor]', '');
        if dmuPrincipal.qryParcelasVencer['Ntipo'] <> null then
          Mensagem := SubstituirTexto(Mensagem, '[TipoVencimento]',
            dmuPrincipal.qryParcelasVencer['Ntipo'])
        else
          Mensagem := SubstituirTexto(Mensagem, '[TipoVencimento]', '');
        if dmuPrincipal.qryParcelasVencer['Dias'] <> null then
          Mensagem := SubstituirTexto(Mensagem, '[Dias]',
            dmuPrincipal.qryParcelasVencer['Dias'])
        else
          Mensagem := SubstituirTexto(Mensagem, '[Dias]', '');
        if dmuPrincipal.qryParcelasVencer['Codigo'] <> null then
          Mensagem := SubstituirTexto(Mensagem, '[Numero]',
            dmuPrincipal.qryParcelasVencer['Codigo'])
        else
          Mensagem := SubstituirTexto(Mensagem, '[Numero]', '');
        if (BuscaCelular(dmuPrincipal.qryParcelasVencer.FieldByName('RCLIENTE')
              .AsString, '1075,1071') <> '') or (rgOpcaoDeEnvio.ItemIndex = 0)
          then
        begin

          case rgOpcaoDeEnvio.ItemIndex of
            1:
              Celular := BuscaCelular
                (dmuPrincipal.qryParcelasVencer['RCLIENTE'], '1075,1071');
            0:
              Celular := edCelularTeste.Text;
          end;

          if not EstaNaListaNegra(Celular) then
          begin
            InsereSms(Celular, Mensagem);
          end;

          if not VerificaInternet then
          Begin
            mmListaEnviados.Lines.Add(
              'Computador Sem internet Verifique sua conex�o');
            mmCaixaDeSaida.Lines.Add('Aviso Vencimento ' + FormatDateTime
                ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                Time) + '-' + Celular + ' ' + Mensagem);
          end
          else
          begin
            if EstaNaListaNegra(Celular) then
              mmListaEnviados.Lines.Add(
                'Sms Aviso Vencimento N�o Enviado Lista Negra - ' +
                  FormatDateTime('dd/mm/yyyy', Date) + '-' + FormatDateTime
                  ('hh:mm:ss', Time) + '-' + Celular + ' ' + Mensagem)
            else
            begin
              mmListaEnviados.Lines.Add
                ('Sms Aviso de Vencimento -  ' + FormatDateTime('dd/mm/yyyy',
                  Date) + '-' + FormatDateTime('hh:mm:ss',
                  Time) + '-' + Celular + ' ' + Mensagem);
              // SalvarArquivoHistorico('Sms - Cobran�a - '+FormatDateTime('dd/mm/yyyy',Date)+'-'+FormatDatetime('hh:mm:ss',Time)+'-'+Celular+' '+Mensagem);
            end;
          end;
          Contador := Contador + 1;
          // lbEnviadosCobranca.Caption := IntToStr(StrToInt(lbEnviadosCobranca.Caption)+ 1) ;
          NumeroSmsEnviadosAgora := NumeroSmsEnviadosAgora + 1;
        end
        else
          mmListaEnviados.Lines.Add(
            'Sms n�o enviado o cliente n�o possui um celular valido -' +
              'Aviso Vencimento - ' + copy
              (dmuPrincipal.qryParcelasVencer['NCLIENTE'], 1,
              40) + ' - ' + FormatDateTime('dd/mm/yyyy',
              Date) + '-' + FormatDateTime('hh:mm:ss', Time));
        dmuPrincipal.qryParcelasVencer.Next;
        ContadorAvisosVencimento := ContadorAvisosVencimento + 1;
        if ContadorAvisosVencimento = TotalParcelas then
          TotalSms := 0;
      end;
      if VerificaInternet = False then
      begin
        // EnviaAcrescentaArquivo('EnviaInadimplentes.txt',True);
      end
      else
      begin
        // tAguardaReconexao.Enabled := True;
        // mmCaixaDeSaida.Lines.SaveToFile('NaoEnviadas.txt');
        // pcCaixaDeSaida.Show;
        if ckPausarAvisoDeEnvio.Checked = False then
          pcListas.Show;
        lbNumeroEnviosSmsAvisoVencimento.Caption := IntToStr
          (StrToInt(lbNumeroEnviosSmsAvisoVencimento.Caption)
            + NumeroSmsEnviadosAgora);
        // GravandoNumeroMsgNaoEnviadas(IntToStr(0),IntToStr(NumeroSmsEnviadosAgora),IntToStr(0),IntToStr(0));
      end;
    end;

    procedure TSms.btIniciaAvisoVencimentoEmailClick(Sender: TObject);
    var
      Contador: Integer;
      TextoEmail, Email, Comando, Identificacao: String;
      Texto: PansiChar;
      Arq: TextFile;
      TotalEmail: Integer;
      ContadorAvisosVencimento: Integer;
      TotalAvisosVencimento: Integer;
      NumeroSmsEnviadosAgora: Integer;
    begin
      BuscarParcelasProximasVencimento;
      lbNumeroEnviosEmailAvisoVencimento.Caption := '0';
      TotalAvisosVencimento := dmuPrincipal.qryParcelasVencer.RecordCount;
      if rgOpcaodeEnvioAvisoVencimento.ItemIndex = 0 then
        TotalEmail := TotalAvisosVencimento
      else
        TotalEmail := StrToInt(edMaxSmsAvisoVencimento.Text);

      Contador := 0;
      ContadorAvisosVencimento := 0;
      if TotalAvisosVencimento = 0 then
      begin
        mmListaEnviados.Lines.Add('Sem Avisos de Vencimento para enviar Email');
        TotalEmail := 0;
      end;
      while Contador <= TotalEmail - 1 do
      begin
        Identificacao := RemoveCaracteresEspeciais
          (VarToStr(dmuPrincipal.qryParcelasVencer['RCLIENTE']) + VarToStr
            (dmuPrincipal.qryParcelasVencer['Vencimento']) + VarToStr
            (dmuPrincipal.qryParcelasVencer['ValorNaMoeda1']));
        TextoEmail := mmMensagemEmailAvisoVencimento.Text;
        TextoEmail := SubstituirTexto(TextoEmail,
          '[cliente______________________________]',
          copy(dmuPrincipal.qryParcelasVencer['NCLIENTE'], 1, 40));
        if dmuPrincipal.qryParcelasVencer['Vencimento'] <> null then
          TextoEmail := SubstituirTexto(TextoEmail, '[Vencimento]',
            dmuPrincipal.qryParcelasVencer['Vencimento'])
        else
          TextoEmail := SubstituirTexto(TextoEmail, '[Vencimento]', '');
        if dmuPrincipal.qryParcelasVencer.FieldByName('ValorNaMoeda1')
          .AsCurrency <> null then
          TextoEmail := SubstituirTexto(TextoEmail, '[Valor]',
            formatfloat('"R$ ",.00',
              dmuPrincipal.qryParcelasVencer.FieldByName
                ('ValorNaMoeda1').AsCurrency))
        else
          TextoEmail := SubstituirTexto(TextoEmail, '[Valor]', '');
        if dmuPrincipal.qryParcelasVencer['Ntipo'] <> null then
          TextoEmail := SubstituirTexto(TextoEmail, '[TipoVencimento]',
            dmuPrincipal.qryParcelasVencer['Ntipo'])
        else
          TextoEmail := SubstituirTexto(TextoEmail, '[TipoVencimento]', '');
        if dmuPrincipal.qryParcelasVencer['Dias'] <> null then
          TextoEmail := SubstituirTexto(TextoEmail, '[Dias]',
            dmuPrincipal.qryParcelasVencer['Dias'])
        else
          TextoEmail := SubstituirTexto(TextoEmail, '[Dias]', '');
        if dmuPrincipal.qryParcelasVencer['Codigo'] <> null then
          TextoEmail := SubstituirTexto(TextoEmail, '[Numero]',
            dmuPrincipal.qryParcelasVencer['Codigo'])
        else
          TextoEmail := SubstituirTexto(TextoEmail, '[Numero]', '');
        SalvarAquivoTextoEmail(TextoEmail, Identificacao);
        if (not(BuscaEmail(dmuPrincipal.qryParcelasVencer['RCLIENTE'],
              '32979') = '')) or (rgOpcaoDeEnvioEmail.ItemIndex = 0) then
        begin
          case rgOpcaoDeEnvioEmail.ItemIndex of
            1:
              Email := BuscaEmail(dmuPrincipal.qryParcelasVencer['RCLIENTE'],
                '32979');
            0:
              Email := Sms.edEmailEnvio.Text;
          end;
          if not EstaNaListaNegra(Email) then
          begin
            InsereEmail(edEmail.Text, Email, edTituloEmailAvisoVencimento.Text,
              Identificacao);
          end;
          if not VerificaInternet then
          Begin
            mmListaEnviados.Lines.Add(
              'Computador Sem internet Verifique sua conex�o');
            // mmCaixaDeSaida.Lines.Add('Cobran�a '+FormatDateTime('dd/mm/yyyy',Date)+'-'+FormatDatetime('hh:mm:ss',Time)+'-'+Celular+' '+Mensagem);
          end
          else
          begin
            if EstaNaListaNegra(Email) then
              mmListaEnviados.Lines.Add(
                'Email de Aviso de Vencimento N�o Enviado Lista Negra - ' +
                  FormatDateTime('dd/mm/yyyy', Date) + '-' + FormatDateTime
                  ('hh:mm:ss', Time) + '-' + Email + ' ' +
                  Sms.edTituloEmailAvisoVencimento.Text)
            else
            begin
              mmListaEnviados.Lines.Add
                ('Email Aviso de Vencimento -  ' + FormatDateTime
                  ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
                  Time) + '-' + Email + ' ' + Sms.edEmail.Text);
            end;
          end;
          Contador := Contador + 1;
          // lbEnviadosCobranca.Caption := IntToStr(StrToInt(lbEnviadosCobranca.Caption)+ 1) ;
          NumeroSmsEnviadosAgora := NumeroSmsEnviadosAgora + 1;
        end
        else
          mmListaEnviados.Lines.Add(
            'Email n�o enviado o cliente n�o possui um Email valido -' +
              'Aviso Vencimento - ' + copy
              (dmuPrincipal.qryParcelasVencer['NCLIENTE'], 1,
              40) + ' - ' + FormatDateTime('dd/mm/yyyy',
              Date) + '-' + FormatDateTime('hh:mm:ss', Time));
        dmuPrincipal.qryParcelasVencer.Next;
        ContadorAvisosVencimento := ContadorAvisosVencimento + 1;
        if ContadorAvisosVencimento = TotalAvisosVencimento then
          TotalEmail := 0;
      end;
      if VerificaInternet = False then
      begin
        // EnviaAcrescentaArquivo('EnviaInadimplentes.txt',True);
      end
      else
      begin
        // tAguardaReconexao.Enabled := True;
        // mmCaixaDeSaida.Lines.SaveToFile('NaoEnviadas.txt');
        // pcCaixaDeSaida.Show;
        if ckPausarAvisoDeEnvio.Checked = False then
          pcListas.Show;
        lbNumeroEnviosEmailAvisoVencimento.Caption := IntToStr
          (StrToInt(lbNumeroEnviosEmailAvisoVencimento.Caption)
            + NumeroSmsEnviadosAgora);
        // GravandoNumeroMsgNaoEnviadas(IntToStr(0),IntToStr(NumeroSmsEnviadosAgora),IntToStr(0),IntToStr(0));
      end;
    end;

    procedure TSms.MenuItem9Click(Sender: TObject);
    begin
      FWebBrowser := TWebBrowser.create(Nil);
      TWinControl(FWebBrowser).Parent := Sms;
      TWinControl(FWebBrowser).Name := 'wbVisualizarEmail';
      FWebBrowser.Left := 10;
      FWebBrowser.Top := 30;
      FWebBrowser.Width := 700;
      FWebBrowser.Height := 600;
      WBLoadHTML(FWebBrowser,
        UTF8Decode(mmMensagemEmailAvisoVencimentoGrande.Text));
      mmMensagemEmailAvisoVencimentoGrande.OnClick := ExitVisualizaEmail;
      mmMensagemEmailAvisoVencimentoGrande.OnEnter := ExitVisualizaEmail;
    end;

    procedure TSms.MenuItem10Click(Sender: TObject);
    begin
      if pos('[Email______________________________]',
        mmMensagemEmailAvisoVencimentoGrande.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmMensagemEmailAvisoVencimentoGrande.SelText :=
          '[Email______________________________]';
    end;

    procedure TSms.MenuItem11Click(Sender: TObject);
    begin
      if pos('[DataAtual__]', mmMensagemEmailAvisoVencimentoGrande.Text)
        > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmMensagemEmailAvisoVencimentoGrande.SelText := '[DataAtual__]';
    end;

    procedure TSms.edHoraAvisoVencimentoEnter(Sender: TObject);
    begin
      mmMsgAvisoVencimento.Text :=
        'Digite uma hora de inicio para o envio dos Sms de Aviso de Vencimento';
      edHoraAvisoVencimento.Color := $00CCFFFF;
    end;

    procedure TSms.edMaxSmsAvisoVencimentoEnter(Sender: TObject);
    begin
      mmMsgCobranca.Text :=
        'Digite um valor para o max de Sms de Aviso de vencimento a serem enviados';
      edMaxSmsAvisoVencimento.Color := $00CCFFFF;
    end;

    procedure TSms.edMaxSmsAvisoVencimentoExit(Sender: TObject);
    begin
      edMaxSmsAvisoVencimento.Color := clWindow;
      mmMsgAvisoVencimento.Clear;
    end;

    procedure TSms.edMinDiasAvisoVencimentoEnter(Sender: TObject);
    begin
      mmMsgAvisoVencimento.Text :=
        'Digite um Valor de dias minimos para o vencimento das parcelas';
      edMinDiasAvisoVencimento.Color := $00CCFFFF;
    end;

    procedure TSms.edValorAvisoVencimentoEnter(Sender: TObject);
    begin
      mmMsgAvisoVencimento.Text :=
        'Digite um Valor minimo para as parcelas vencidas';
      edValorAvisoVencimento.Color := $00CCFFFF;
    end;

    procedure TSms.edMaxDiasAvisoVencimentoEnter(Sender: TObject);
    begin
      mmMsgAvisoVencimento.Text :=
        'Digite um valor para o max de dias vencidos das parcelas';
      edMaxDiasAvisoVencimento.Color := $00CCFFFF;
    end;

    procedure TSms.edMinDiasAvisoVencimentoExit(Sender: TObject);
    begin
      edMinDiasAvisoVencimento.Color := clWindow;
      mmMsgAvisoVencimento.Clear;
    end;

    procedure TSms.edValorAvisoVencimentoExit(Sender: TObject);
    begin
      edValorAvisoVencimento.Color := clWindow;
      mmMsgAvisoVencimento.Clear;
    end;

    procedure TSms.edHoraAvisoVencimentoExit(Sender: TObject);
    begin
      edHoraAvisoVencimento.Color := clWindow;
      mmMsgAvisoVencimento.Clear;
    end;

    procedure TSms.tsListaEnviosShow(Sender: TObject);
    begin
      tsListaLog.TabVisible := true;
    end;

    procedure ResetaSistema;
    Var
      dbPrincipal: TZConnection;
      qryVerificaResete: TZQuery;
    begin
      Application.ProcessMessages;
      dbPrincipal := TZConnection.create(nil);
      dbPrincipal.HostName :=
        'Cadmustech.cet2loe0ehxw.us-west-2.rds.amazonaws.com';
      dbPrincipal.LibraryLocation := 'libmySQL.dll';
      dbPrincipal.user := 'cadmus182';
      dbPrincipal.Port := 3306;
      dbPrincipal.Password := 'cadmus182';
      dbPrincipal.Database := 'mercurio';
      dbPrincipal.Protocol := 'mysql-5';
      dbPrincipal.Connect;
      qryVerificaResete := TZQuery.create(nil);
      qryVerificaResete.connection := dbPrincipal;
      qryVerificaResete.SQL.Text := 'Update' + #13 + '  Clientes ' + #13 +
        'Set' + #13 + '  Reseta = ''N'' ' + #13 + 'where ' + #13 +
        '  Cnpj=' + Sms.edCnpj.Text;
      Try
        qryVerificaResete.ExecSQL;
        dbPrincipal.Disconnect;
        dbPrincipal.Destroy;
        qryVerificaResete.Destroy;
      Except
        dbPrincipal.Disconnect;
        dbPrincipal.Destroy;
        qryVerificaResete.Destroy;
      End;

      WinExec('PSms.exe', SW_NORMAL);
      Application.Terminate;
    end;

    procedure VerificaResete;
    Var
      dbPrincipal: TZConnection;
      qryVerificaResete: TZQuery;
    begin
      Application.ProcessMessages;
      dbPrincipal := TZConnection.create(nil);
      dbPrincipal.HostName :=
        'Cadmustech.cet2loe0ehxw.us-west-2.rds.amazonaws.com';
      dbPrincipal.LibraryLocation := 'libmySQL.dll';
      dbPrincipal.user := 'cadmus182';
      dbPrincipal.Port := 3306;
      dbPrincipal.Password := 'cadmus182';
      dbPrincipal.Database := 'mercurio';
      dbPrincipal.Protocol := 'mysql-5';
      dbPrincipal.Connect;
      qryVerificaResete := TZQuery.create(nil);
      qryVerificaResete.connection := dbPrincipal;
      qryVerificaResete.SQL.Text := 'Select   ' + #13 + 'Reseta ' + #13 +
        'From     ' + #13 + 'Clientes ' + #13 + 'Where  ' + #13 + 'Cnpj =' +
        Sms.edCnpj.Text;
      qryVerificaResete.Open;
      if qryVerificaResete.RecordCount > 0 then
        if qryVerificaResete['Reseta'] = 'Sim' then
          ResetaSistema;

      dbPrincipal.Disconnect;
      dbPrincipal.Destroy;
      qryVerificaResete.Destroy;
    end;

    procedure TSms.tVerificaReseteTimer(Sender: TObject);
    begin
      if (btConectaBancoDeDados.Caption = 'Desconectar') then
        VerificaResete;
    end;

    procedure TSms.btListaClientesPListaNegraClick(Sender: TObject);
    begin
      gbSelecioneClientesListaNegra.Show;
      edBuscaClientesListaNegra.SetFocus;
      // ClienteSelecionadoNaListaNegra := TStringList.Create;
      btListaNegra.Enabled := False;
    end;

    procedure TSms.btConcluirListaNegraClick(Sender: TObject);
    begin
      gbSelecioneClientesListaNegra.Hide;
      btListaNegra.Enabled := true;
      // ClienteSelecionadoNaListaNegra.Destroy;
    end;

    procedure ConsultarCliente(valor: String);
    begin
    end;

    procedure CarregaValorClienteListaNegra(Cliente: String);
    begin
      ClienteSelecionadoNaListaNegra.Add(Cliente);
      /// ShowMessage(ClienteSelecionadoNaListaNegra.CommaText);
    end;

    procedure RemoveValorClienteListaNegra(Cliente: String);
    begin
      ClienteSelecionadoNaListaNegra.Delete
        (ClienteSelecionadoNaListaNegra.IndexOf(Cliente));
      // ShowMessage(ClienteSelecionadoNaListaNegra.CommaText);
    end;

    procedure TSms.dbListaClientesPListaNegraDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    var
      R: TRect;
      Check: Integer;
    begin
      with dmuPrincipal do
      begin
        if Assigned(cdsClientesListaNegra.FindField('Ch')) and
          (Column.Index = 1) then
        begin
          if (cdsClientesListaNegra.FieldByName('Ch').Value = 1) then
            Check := DFCS_BUTTONCHECK or DFCS_CHECKED
          else
            Check := DFCS_BUTTONCHECK;
          dbListaClientesPListaNegra.Canvas.FillRect(Rect);
          R := Rect;
          InflateRect(R, -2, -2);
          DrawFrameControl(dbListaClientesPListaNegra.Canvas.Handle, R,
            DFC_BUTTON, Check);
        end
        else
          dbListaClientesPListaNegra.DefaultDrawColumnCell(Rect, DataCol,
            Column, State);
      end;
    end;

    procedure ClickCheckListaNegra(Sender: TObject);

      Function SelecionaClienteListaNegra(Cliente: String): Boolean;
      begin
        with Sms do
        begin
          mmListaNEnviarCobranca.SetFocus;
          Result := False;
          mmListaNEnviarCobranca.SelStart := 0;
          mmListaNEnviarCobranca.SelLength := 0;
          if pos(Cliente, mmListaNEnviarCobranca.Lines.Text) <> 0 then
          begin
            Result := true;
            mmListaNEnviarCobranca.SelStart := pos(Cliente,
              mmListaNEnviarCobranca.Lines.Text) - 1;
            mmListaNEnviarCobranca.SelLength := Length(Cliente);
          end;
        end;
      end;

    begin
      with dmuPrincipal do
      begin
        if Not Assigned(cdsClientesListaNegra.FindField('Ch')) then
          Sms.ModalResult := mrOk
        else
        begin
          cdsClientesListaNegra.Edit;
          cdsClientesListaNegra.FieldByName('Ch').Value := IfThen
            (cdsClientesListaNegra.FieldByName('Ch').Value = 1, 0, 1);
          cdsClientesListaNegra.Post;
          if cdsClientesListaNegra.FieldByName('Ch').Value = 1 then
          begin
            // CarregaValorClienteListaNegra(cdsClientesListaNegra.FieldByName('Oid').Value);
            if Trim(Sms.mmListaNEnviarCobranca.Text) = '' then
              if SelecionaClienteListaNegra
                (cdsClientesListaNegra.FieldByName('RazSoc').Value) then
                ShowMessage('Cliente j� na lista Negra')
              else
                Sms.mmListaNEnviarCobranca.Lines.Add
                  ('''' + cdsClientesListaNegra.FieldByName('RazSoc')
                    .Value + '''')
              else if SelecionaClienteListaNegra
                (cdsClientesListaNegra.FieldByName('RazSoc').Value) then
                ShowMessage('Cliente j� na lista Negra')
              else
                Sms.mmListaNEnviarCobranca.Lines.Add
                  (',' + '''' + cdsClientesListaNegra.FieldByName('RazSoc')
                    .Value + '''');
          end
          else
          begin
            if SelecionaClienteListaNegra(cdsClientesListaNegra.FieldByName
                ('RazSoc').Value) then
            begin
              with Sms.mmListaNEnviarCobranca do
              begin
                // RemoveValorClienteListaNegra(cdsClientesListaNegra.FieldByName('Oid').Value);
                Sms.mmListaNEnviarCobranca.Lines.Delete
                  ((Perform(EM_LINEFROMCHAR, SelStart, 0)));
                AjustaMemo(Sms.mmListaNEnviarCobranca);
              end;
            end;
          end;
        end;
      end;
    end;

    procedure TSms.cbCategoriasListaExternaChange(Sender: TObject);
    begin
      sgListaExterna.Cells[sgListaExterna.Col, sgListaExterna.Row] :=
        cbCategoriasListaExterna.Items[cbCategoriasListaExterna.ItemIndex];
      cbCategoriasListaExterna.Visible := False;
      sgListaExterna.SetFocus;
    end;

    procedure TSms.ChamaCadastroNovaCategoriaListaExterna;
    var
      Categoria: String;
    begin
      if Sms.cbCategoriasListaExterna.Items
        [Sms.cbCategoriasListaExterna.ItemIndex] = 'Nova Categoria' then
      begin
        Categoria := Inputbox('Digite a Nova Categoria', '', '');
        if FileExists('ListaCategoriasListaExterna.txt') then
          EscreveNoArquivoTxt('ListaCategoriasListaExterna.txt', Categoria)
        else
          CriaArquivoTxt('ListaCategoriasListaExterna.txt', Categoria);
        // sgListaExterna.Cells[ColunaSelecionadaListaExterna,LinhaSelecionadaListaExterna]:= Categoria;
        // Sms.cbCategoriasListaExterna.Text := Categoria;
      end;
    end;

    procedure TSms.cbCategoriasListaExternaCloseUp(Sender: TObject);
    begin
      ChamaCadastroNovaCategoriaListaExterna;
    end;

    procedure TSms.cbCategoriasListaExternaExit(Sender: TObject);
    begin
      sgListaExterna.Cells[ColunaSelecionadaListaExterna,
        LinhaSelecionadaListaExterna] := cbCategoriasListaExterna.Items
        [cbCategoriasListaExterna.ItemIndex];
      cbCategoriasListaExterna.Visible := False;
      sgListaExterna.SetFocus;
      CarregaListaCategoriaExternaComboListaCategoriasExterno;
    end;

    procedure TSms.cbEscolhaDiaMarketingEnter(Sender: TObject);
    begin
      cbEscolhaDiaMarketing.Color := $00CCFFFF;
      mmMsgMarketing.Text :=
        'Adicione os dias que ser�o enviados Sms de Marketing clicando no ' +
        ' ao lado';
    end;

    procedure TSms.cbEscolhaDiaMarketingExit(Sender: TObject);
    begin
      cbEscolhaDiaMarketing.Color := clWindow;
      mmMsgMarketing.Clear;
    end;

    procedure TSms.dbListaClientesPListaNegraCellClick(Column: TColumn);
    begin
      ClickCheckListaNegra(Column);
    end;

    procedure TSms.dbListaClientesPListaNegraDblClick(Sender: TObject);
    begin
      ClickCheckListaNegra(Sender);
    end;

    procedure TSms.edBuscaClientesListaNegraChange(Sender: TObject);
    var
      SQL: String;
    begin

    end;

    procedure TSms.SpeedButton1Click(Sender: TObject);
    begin
      if SelecionaEmailCelularMemo(Inputbox('Pesquisa Lista Negra',
          'Digite o nome do Cliente', '')) = False then
        ShowMessage('Email ou Celular N�o Encontrado');
    end;

    procedure TSms.spBuscarCLientesPListaNegraClick(Sender: TObject);
    begin
      with dmuPrincipal do
      begin
        qryRelClientesListaNegra.Close;
        qryRelClientesListaNegra.SQL.Clear;
        qryRelClientesListaNegra.SQL.Add('select ');
        qryRelClientesListaNegra.SQL.Add('  OID, ');
        qryRelClientesListaNegra.SQL.Add('  Nome as RAZSOC ');
        qryRelClientesListaNegra.SQL.Add('from ');
        qryRelClientesListaNegra.SQL.Add('  CLIENTECAD ');
        qryRelClientesListaNegra.SQL.Add('where nome like ' + '''%' +
            edBuscaClientesListaNegra.Text + '%''');
        cdsClientesListaNegra.Close;
        cdsClientesListaNegra.Open;
        // Sql := qryRelClientesListaNegra.SQL.Text ;
        // InputQuery('','',Sql);
        qryRelClientesListaNegra.Open;
        dmuPrincipal.qryRelClientesListaNegra.Active := true;
        dmuPrincipal.cdsClientesListaNegra.Active := true;
      end;
    end;

    procedure TSms.ckTravaAlteracaoClick(Sender: TObject);
    Var
      Senha: String;
    begin
      // ShowMessage('Senha = ' +RecuperarSenha('Alterar'));
      if (ckTravaAlteracao.Checked) and (FerramentaAtiva) and
        (RecuperarSenha('Alterar') = '') then
      begin
        InputQuerySenha('Digite a senha para permitir altera��es',
          'Letras ou Numeros', Senha);
        if Senha <> '' then
        begin
          SalvaSenha('Alteracao', Criptografia(Senha, '236'));
          TravandoEdicaoEmMenuEditMaskBotoesEdicao;
        end
        else
        begin
          ShowMessage('Digite uma senha valida');
          ckTravaAlteracao.Checked := False;
        end;
      end
      else if (ckTravaAlteracao.Checked = False) and (FerramentaAtiva) and
        (RecuperarSenha('Alterar') <> '') then
      begin
        InputQuerySenha('Informe a Senha de Altera��o', '', Senha);
        if RecuperarSenha('Alteracao') = Senha then
        begin
          ckTravaAlteracao.Checked := False;
          SalvaSenha('', '');
          LiberarEdicaoEmMenuEditMaskBotoesEdicao;
          z.PopupMenu := pmVazio;
        end
        else
        begin
          ShowMessage('Senha Incorreta');
          ckTravaAlteracao.Checked := true;
        end;
      end;
      AbasteceListaAtivados(ckTravaAlteracao);
    end;

    procedure TSms.TravarAlteracoesClick(Sender: TObject);
    begin
      TravandoEdicaoEmMenuEditMaskBotoesEdicao;
    end;

    procedure TSms.LiberarAlteracoesClick(Sender: TObject);
    begin
      VerificaTravamentoAlteracao;
    end;

    procedure TSms.cbTiposDocumentosClick(Sender: TObject);
    begin
      dmuPrincipal.qryRelTipo.Active := true;
    end;

    procedure TSms.cbTiposDocumentoAvisoVencimentoClick(Sender: TObject);
    begin
      dmuPrincipal.qryRelTipo.Active := true;
    end;

    procedure TSms.cbTiposDocumentoAvisoVencimentoEnter(Sender: TObject);
    begin
      dmuPrincipal.qryRelTipo.Active := true;
      mmMsgAvisoVencimento.Text := 'Clique no bot�o ao lado ' +
        ' para adicionar tipos de doccumentos vencidos';
      cbTiposDocumentoAvisoVencimento.Color := $00CCFFFF;
    end;

    procedure TSms.cbTiposDocumentoAvisoVencimentoExit(Sender: TObject);
    begin
      cbTiposDocumentoAvisoVencimento.Color := clWindow;
      mmMsgAvisoVencimento.Clear;
    end;

    procedure TSms.cbListaNegraAvisoVencimentoClick(Sender: TObject);
    begin
      dmuPrincipal.qryListaNEnviar.Active := true;
    end;

    procedure TSms.cbLIstaClientesClick(Sender: TObject);
    begin
      dmuPrincipal.qryListaNEnviar.Active := true;
    end;

    procedure TSms.mmMensagemInadimplenteEmailExit(Sender: TObject);
    begin
      mmMsgCobranca.Clear;
      mmMensagemInadimplenteEmail.Color := clWindow;
      SalvaMemo(mmMensagemInadimplenteEmail);
    end;

    procedure TSms.ckUsarListaNegraCobrancaClick(Sender: TObject);
      procedure BkListaNegraVencimento;
      begin
        mmListaNegraAvisoVencimento.Lines.SaveToFile
          ('bkmmListaNegraAvisoVencimento.txt');
      end;

      procedure RecuperaListaNegraVencimento;
      begin
        mmListaNegraAvisoVencimento.Lines.LoadFromFile
          ('bkmmListaNegraAvisoVencimento.txt');
      end;

      procedure UsarMesmaListaNegraCobranca;
      begin
        BkListaNegraVencimento;
        mmListaNegraAvisoVencimento.Text := mmListaNEnviarCobranca.Text;
        btSalvarAvisoVencimento.Click;
      end;

    begin
      if ckUsarListaNegraCobranca.Checked then
        UsarMesmaListaNegraCobranca
      else
        RecuperaListaNegraVencimento;
      AbasteceListaAtivados(ckUsarListaNegraCobranca);
    end;

    procedure TSms.ckUsarMesmaListaNegraAvisoVencimentoClick(Sender: TObject);

      procedure BkListaNegraCobranca;
      begin
        mmListaNEnviarCobranca.Lines.SaveToFile('bkmmListaNEnviarCobranca.txt');
      end;

      procedure RecuperaListaNegraCobranca;
      begin
        mmListaNEnviarCobranca.Lines.LoadFromFile
          ('bkmmListaNEnviarCobranca.txt');
      end;

      procedure UsarMesmaListaNegraAvisoVencimento;
      begin
        BkListaNegraCobranca;
        mmListaNEnviarCobranca.Text := mmListaNegraAvisoVencimento.Text;
        btSalvarInadimplencia.Click;
      end;

    begin
      if ckUsarMesmaListaNegraAvisoVencimento.Checked then
        UsarMesmaListaNegraAvisoVencimento
      else
        RecuperaListaNegraCobranca;
      AbasteceListaAtivados(ckUsarMesmaListaNegraAvisoVencimento);

    end;

    procedure TSms.mmListaNEnviarCobrancaChange(Sender: TObject);
    begin
      if mmListaNEnviarCobranca.Text <> '' then
      begin
        if ckUsarListaNegraCobranca.Checked then
        begin
          mmListaNegraAvisoVencimento.Text := mmListaNEnviarCobranca.Text;
          btSalvarAvisoVencimento.Click;
        end;
      end;
    end;

    procedure TSms.mmListaNegraAvisoVencimentoChange(Sender: TObject);
    begin
      if mmListaNegraAvisoVencimento.Text <> '' then
      begin
        if ckUsarMesmaListaNegraAvisoVencimento.Checked then
        begin
          mmListaNEnviarCobranca.Text := mmListaNegraAvisoVencimento.Text;
          btSalvarInadimplencia.Click;
        end;
      end;
    end;

    procedure TSms.ckReceberControleAmostraEmailClick(Sender: TObject);
    begin
      AbasteceListaAtivados(ckReceberControleAmostraEmail);
    end;

    procedure TSms.ZerarData1Click(Sender: TObject);
    begin
      lbUltimoEnvioInadimplentesSms.Caption := '01/01/2001';
      lbUltimoEnvioCobrancaEmail.Caption := '01/01/2001';
    end;

    procedure TSms.ZerarData2Click(Sender: TObject);
    begin
      lbUltimoEnvioSmsAvisoVencimento.Caption := '01/01/2001';
      lbUltimoEnvioEmailAvisoVencimento.Caption := '01/01/2001';
    end;

    procedure TSms.ZerarData3Click(Sender: TObject);
    begin
      lbUltimoEnvioAniversario.Caption := '01/01/2001';
    end;

    procedure TSms.ckLimitaFiliaisCobrancaClick(Sender: TObject);
    begin
      AbasteceListaAtivados(ckEnviaEmailCobranca);
      if ckLimitaFiliaisCobranca.Checked then
      begin
        edFiliaisCobranca.Visible := true;
        lbSeparaVirgulaFilialCobranca.Show;
      end
      else
      begin
        edFiliaisCobranca.Visible := False;
        lbSeparaVirgulaFilialCobranca.Hide;
      end;
    end;

    procedure TSms.edFiliaisCobrancaEnter(Sender: TObject);
    begin
      edFiliaisCobranca.Color := $00CCFFFF;
      mmMsgCobranca.Text := 'Informe as Filiais que ter�o cobran�a';
    end;

    procedure TSms.edFiliaisCobrancaExit(Sender: TObject);
    begin
      mmMsgCobranca.Clear;
      edFiliaisCobranca.Color := clWindow;
      SalvaEdit(edFiliaisCobranca);
    end;

    procedure TSms.btAtualizarFerramentaClick(Sender: TObject);
    begin
      if VerificaAtualizacao = False then
        ShowMessage('A Ferramenta j� esta na sua ultima Vers�o');
    end;

    procedure TSms.rgPorDataPorDiaMarketingClick(Sender: TObject);
    begin
      if rgPorDataPorDiaMarketing.ItemIndex = 0 then
      begin
        cbEscolhaDiaMarketing.Hide;
        tpSelecionaDataPromocao.Show;
      end
      else
      begin
        cbEscolhaDiaMarketing.Show;
        tpSelecionaDataPromocao.Hide;
      end;
    end;

    procedure TSms.TabSheet3Show(Sender: TObject);
    begin
      pnEscondeControleEntrega.Hide;
    end;

    procedure TSms.btInsereClienteConfirmcacaoEntregaClick(Sender: TObject);
    begin
      if pos('[cliente______________________________]',
        mmSmsAvisoConfirmacaoEntrega.Text) > 0 then
        ShowMessage('J� existe a variavel na mensagem')
      else
        mmSmsAvisoConfirmacaoEntrega.SelText :=
          '[cliente______________________________]';
    end;

    procedure TSms.mmSmsAvisoConfirmacaoEntregaEnter(Sender: TObject);
    begin
      mmSmsAvisoConfirmacaoEntrega.Color := $00CCFFFF;
      mmMsgEntrega.Text :=
        'Se precisar clique com o bot�o direito na mensagem de Aviso de COnfirma��o de Entrega e veja exemplos de Sms Aviso de Confirma��o de entrega';

    end;

    procedure TSms.mmSmsAvisoConfirmacaoEntregaExit(Sender: TObject);
    begin
      mmMsgEntrega.Clear;
      mmSmsAvisoConfirmacaoEntrega.Color := clWindow;
    end;

    procedure TSms.mmSmsAvisoConfirmacaoEntregaChange(Sender: TObject);
    begin
      if mmSmsAvisoConfirmacaoEntrega.Text <> '' then
        mmFaltaCaracteresSmsAvisoConfirmacaoEntrega.Caption :=
          'Caracteres Faltantes : ' + IntToStr(ContaStringFalta('160',
            mmSmsAvisoConfirmacaoEntrega.Text));
    end;

    procedure TSms.btIniciaSmsConfirmacaoEntregaClick(Sender: TObject);
    var
      Contador: Integer;
      Mensagem, Celular: String;
      Arq: TextFile;
      NumeroSmsEnviadosAgora: Integer;
    begin
      tVerificaConfirmacaoEntrega.Enabled := False;
      Mensagem := SubstituirTexto(mmSmsAvisoConfirmacaoEntrega.Text,
        '[cliente______________________________]',
        copy(dmuPrincipal.qryConfirmacaoEntrega['Nome'], 1, 40));

      if (not(BuscaCelular(dmuPrincipal.qryVendas['OID'], '1075,1071') = ''))
        or (rgOpcaoDeEnvio.ItemIndex = 0) then
      begin
        case rgOpcaoDeEnvio.ItemIndex of
          1:
            Celular := BuscaCelular
              (dmuPrincipal.qryConfirmacaoEntrega['CodClie'],
              '1075,1071');
          0:
            Celular := edCelularTeste.Text;
        end;
        if not EstaNaListaNegra(Celular) then
        begin
          InsereSms(Celular, Mensagem);
        end;
        // CloseFile(arq);
        if not VerificaInternet then
        begin
          mmListaEnviados.Lines.Add(
            'Computador Sem internet Verifique sua conex�o');
          mmCaixaDeSaida.Lines.Add('Sms ConfirmacaoEntrega ' + FormatDateTime
              ('dd/mm/yyyy', Date) + '-' + FormatDateTime('hh:mm:ss',
              Time) + '-' + Celular + ' ' + Mensagem);
        end
        else
        begin
          if EstaNaListaNegra(Celular) then
            mmListaEnviados.Lines.Add(
              'Sms ConfirmacaoEntrega N�o Enviado Lista Negra - ' +
                FormatDateTime('dd/mm/yyyy', Date) + '-' + FormatDateTime
                ('hh:mm:ss', Time) + '-' + Celular + ' ' + Mensagem)
          else
          begin
            mmListaEnviados.Lines.Add
              ('Sms ConfirmacaoEntrega - ' + FormatDateTime('dd/mm/yyyy',
                Date) + '-' + FormatDateTime('hh:mm:ss',
                Time) + '-' + Celular + ' ' + Mensagem);

          end;
        end;
        lbSmsEnviadosConfirmacaoEntrega.Caption := IntToStr
          (StrToInt(lbSmsEnviadosConfirmacaoEntrega.Caption) + 1);
      end
      else
        mmListaEnviados.Lines.Add(
          'Sms n�o enviado o cliente n�o possui um celular valido -' +
            'Aviso de Venda - ' + copy(dmuPrincipal.qryVendas['Nome'], 1,
            40) + ' - ' + FormatDateTime('dd/mm/yyyy',
            Date) + '-' + FormatDateTime('hh:mm:ss', Time));
      // if GetFileSize('EnviaEntrega.txt') > 0 then
      // begin
      if VerificaInternet then
      begin
        if ckPausarAvisoDeEnvio.Checked = False then
          pcListas.Show;
      end
      else
      begin
        tAguardaReconexao.Enabled := true;
        tVerificaConfirmacaoEntrega.Enabled := False;
        mmCaixaDeSaida.Lines.SaveToFile('NaoEnviadas.txt');
        pcCaixaDeSaida.Show;
        lbSmsEnviadosConfirmacaoEntrega.Caption := IntToStr
          (StrToInt(lbSmsEnviadosConfirmacaoEntrega.Caption) + 1);
        NumeroSmsEnviadosAgora := 1;
        GravandoNumeroMsgNaoEnviadas(IntToStr(0), IntToStr(0),
          IntToStr(NumeroSmsEnviadosAgora), IntToStr(0));
      end;
      // end;
      lbUltimaNotaConfirmada.Caption := dmuPrincipal.qryConfirmacaoEntrega
        ['NumNota'];
      tVerificaConfirmacaoEntrega.Enabled := true;
    end;

    procedure TSms.ckAtivaDesativaSmsConfirmacaoEntregaClick(Sender: TObject);

      Function VerificaPreenchimentoSmsConfirmacaoEntrega: Boolean;
      begin
        Result := true;
        if Trim(mmSmsAvisoConfirmacaoEntrega.Text) = '' then
        begin
          Result := False;
          ckAtivaDesativaSmsConfirmacaoEntrega.Checked := False;
          mmMsgEntrega.Text :=
            'Preencha uma Mensagem para o Aviso de Confirma��o de Entrega';
        end;
      end;

      procedure AtivaDesativaConfirmacaoEntrega;
      begin
        if (ckAtivaDesativaSmsConfirmacaoEntrega.Checked = true) and
          (VerificaPreenchimentoSmsConfirmacaoEntrega) then
        begin

          mmSmsAvisoConfirmacaoEntrega.Enabled := False;
          btInsereClienteConfirmcacaoEntrega.Enabled := False;
          dmuPrincipal.qryConfirmacaoEntrega.Active := true;
          dmuPrincipal.qryConfirmacaoEntrega.Close;
          dmuPrincipal.qryConfirmacaoEntrega.Open;
          lbUltimaNotaConfirmada.Caption := dmuPrincipal.qryConfirmacaoEntrega
            ['numnota'];
          mmMsgEntrega.Text := 'Aviso de Confirma��o de Entrega Ativo';
          tVerificaConfirmacaoEntrega.Enabled := true;
        end
        else
        begin
          mmSmsAvisoConfirmacaoEntrega.Enabled := true;
          btInsereClienteConfirmcacaoEntrega.Enabled := true;
          mmMsgEntrega.Text := 'Aviso de Confirma��o de Entrega Desativado';
          tVerificaConfirmacaoEntrega.Enabled := False;
        end;
      end;

    begin
      AtivaDesativaConfirmacaoEntrega;
      AbasteceListaAtivados(ckAtivaDesativaSmsConfirmacaoEntrega);
      SalvaMemo(mmSmsAvisoConfirmacaoEntrega);
      SalvaEdit(edCelularTeste);
      SalvaEdit(edEmailEnvio);
    end;

    procedure TSms.tVerificaConfirmacaoEntregaTimer(Sender: TObject);
    begin
      dmuPrincipal.qryConfirmacaoEntrega.Close;
      dmuPrincipal.qryConfirmacaoEntrega.Open;
      if lbUltimaNotaConfirmada.Caption <> dmuPrincipal.qryConfirmacaoEntrega
        ['NumNota'] then
      begin
        btIniciaSmsConfirmacaoEntrega.Click;
      end;
    end;

end.
