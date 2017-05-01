object SmsResposta: TSmsResposta
  Left = 1187
  Top = 434
  Width = 140
  Height = 39
  Caption = 'Sms Repostas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object IdFTP2: TIdFTP
    MaxLineAction = maException
    ReadTimeout = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
  end
  object Eventos: TApplicationEvents
    OnException = EventosException
    Top = 32
  end
end
