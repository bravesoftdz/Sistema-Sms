object dmServidor: TdmServidor
  OldCreateOrder = False
  Height = 872
  Width = 1299
  object qryAvisoVencimentoEmail: TZQuery
    UpdateObject = upAvisoVencimentoEmail
    SQL.Strings = (
      
        'SELECT Cnpj,celular,Enviado,Mensagem,Remetente,Tipo,CodigoTextoE' +
        'mail,id FROM `Enviados`'
      'where 1=2 '
      '')
    Params = <>
    Left = 519
    Top = 544
    object qryAvisoVencimentoEmailCnpj: TStringField
      FieldName = 'Cnpj'
      Size = 40
    end
    object qryAvisoVencimentoEmailcelular: TStringField
      FieldName = 'celular'
      Size = 80
    end
    object qryAvisoVencimentoEmailEnviado: TIntegerField
      FieldName = 'Enviado'
    end
    object qryAvisoVencimentoEmailMensagem: TStringField
      FieldName = 'Mensagem'
      Size = 180
    end
    object qryAvisoVencimentoEmailRemetente: TStringField
      FieldName = 'Remetente'
      Size = 80
    end
    object qryAvisoVencimentoEmailTipo: TStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object qryAvisoVencimentoEmailCodigoTextoEmail: TStringField
      FieldName = 'CodigoTextoEmail'
      Required = True
      Size = 30
    end
    object qryAvisoVencimentoEmailid: TIntegerField
      FieldName = 'id'
      Required = True
    end
  end
  object upAvisoVencimentoEmail: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM `Enviados`'
      'WHERE'
      '  `Enviados`.id = :OLD_id')
    InsertSQL.Strings = (
      'INSERT INTO `Enviados`'
      
        '  (Cnpj, celular, Enviado, Mensagem, Remetente, Tipo, CodigoText' +
        'oEmail, '
      '   id)'
      'VALUES'
      
        '  (:Cnpj, :celular, :Enviado, :Mensagem, :Remetente, :Tipo, :Cod' +
        'igoTextoEmail, '
      '   :id)')
    ModifySQL.Strings = (
      'UPDATE `Enviados` SET'
      '  Cnpj = :Cnpj,'
      '  celular = :celular,'
      '  Enviado = :Enviado,'
      '  Mensagem = :Mensagem,'
      '  Remetente = :Remetente,'
      '  Tipo = :Tipo,'
      '  CodigoTextoEmail = :CodigoTextoEmail,'
      '  id = :id'
      'WHERE'
      '  `Enviados`.id = :OLD_id')
    UseSequenceFieldForRefreshSQL = False
    Left = 783
    Top = 544
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Cnpj'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'celular'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enviado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Mensagem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Remetente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CodigoTextoEmail'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_id'
        ParamType = ptUnknown
      end>
  end
  object ZQuery1: TZQuery
    SQL.Strings = (
      'select SenhaAlteracao from Clientes'
      'where Cnpj=:Cnpj'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'Cnpj'
        ParamType = ptUnknown
      end>
    Left = 418
    Top = 791
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Cnpj'
        ParamType = ptUnknown
      end>
    object StringField27: TStringField
      FieldName = 'SenhaAlteracao'
    end
  end
  object qryNaoRepetirSms: TZQuery
    SQL.Strings = (
      'SELECT '
      '  count(*) '
      'FROM '
      '  `Enviados` '
      'WHERE '
      '  ((Data and'
      '  (Enviado=1 or Enviado=3 or Enviado=2)) or'
      '  Enviado = 0 )and '
      '  Mensagem=:Mensagem    and'
      '  Celular=:Celular     and'
      '  tipo='#39'S'#39'    and'
      '  Cnpj=:Cnpj')
    Params = <
      item
        DataType = ftUnknown
        Name = 'Mensagem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Celular'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cnpj'
        ParamType = ptUnknown
      end>
    Left = 514
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Mensagem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Celular'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cnpj'
        ParamType = ptUnknown
      end>
    object StringField28: TStringField
      FieldName = 'Numero'
      Size = 12
    end
    object StringField29: TStringField
      FieldName = 'Mensagem'
      Size = 160
    end
    object StringField30: TStringField
      FieldName = 'Data'
      Size = 12
    end
    object StringField31: TStringField
      FieldName = 'Hora'
      Size = 8
    end
    object StringField32: TStringField
      FieldName = 'Original'
      Size = 180
    end
  end
  object qryConfirmacaoEntregaSms: TZQuery
    UpdateObject = upConfirmacaoEntregaSms
    SQL.Strings = (
      'SELECT Cnpj,celular,Enviado,Mensagem,Tipo,id FROM `Enviados`'
      'where 1=2 '
      '')
    Params = <>
    Left = 530
    Top = 604
    object qryConfirmacaoEntregaSmsCnpj: TWideStringField
      FieldName = 'Cnpj'
      Size = 40
    end
    object qryConfirmacaoEntregaSmscelular: TWideStringField
      FieldName = 'celular'
      Size = 80
    end
    object qryConfirmacaoEntregaSmsEnviado: TIntegerField
      FieldName = 'Enviado'
    end
    object qryConfirmacaoEntregaSmsMensagem: TWideStringField
      FieldName = 'Mensagem'
      Size = 180
    end
    object qryConfirmacaoEntregaSmsTipo: TWideStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object qryConfirmacaoEntregaSmsid: TIntegerField
      FieldName = 'id'
      Required = True
    end
  end
  object upConfirmacaoEntregaSms: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM `Enviados`'
      'WHERE'
      '  `Enviados`.id = :OLD_id')
    InsertSQL.Strings = (
      'INSERT INTO `Enviados`'
      '  (Cnpj, celular, Enviado, Mensagem, Tipo, id)'
      'VALUES'
      '  (:Cnpj, :celular, :Enviado, :Mensagem, :Tipo, :id)')
    ModifySQL.Strings = (
      'UPDATE `Enviados` SET'
      '  Cnpj = :Cnpj,'
      '  celular = :celular,'
      '  Enviado = :Enviado,'
      '  Mensagem = :Mensagem,'
      '  Tipo = :Tipo,'
      '  id = :id'
      'WHERE'
      '  `Enviados`.id = :OLD_id')
    UseSequenceFieldForRefreshSQL = False
    Left = 778
    Top = 613
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Cnpj'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'celular'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enviado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Mensagem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_id'
        ParamType = ptUnknown
      end>
  end
  object qryPesquisaSatisfacao: TZQuery
    UpdateObject = upPesquisaSatisfacao
    SQL.Strings = (
      'SELECT Cnpj,celular,Enviado,Mensagem,Tipo,id FROM `Enviados`'
      'where 1=2 '
      '')
    Params = <>
    Left = 535
    Top = 664
    object StringField37: TStringField
      FieldName = 'Cnpj'
      Size = 40
    end
    object StringField38: TStringField
      FieldName = 'celular'
      Size = 80
    end
    object IntegerField15: TIntegerField
      FieldName = 'Enviado'
    end
    object StringField39: TStringField
      FieldName = 'Mensagem'
      Size = 180
    end
    object StringField40: TStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object IntegerField16: TIntegerField
      FieldName = 'id'
      Required = True
    end
  end
  object upPesquisaSatisfacao: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM `Enviados`'
      'WHERE'
      '  `Enviados`.id = :OLD_id')
    InsertSQL.Strings = (
      'INSERT INTO `Enviados`'
      '  (Cnpj, celular, Enviado, Mensagem, Tipo, id)'
      'VALUES'
      '  (:Cnpj, :celular, :Enviado, :Mensagem, :Tipo, :id)')
    ModifySQL.Strings = (
      'UPDATE `Enviados` SET'
      '  Cnpj = :Cnpj,'
      '  celular = :celular,'
      '  Enviado = :Enviado,'
      '  Mensagem = :Mensagem,'
      '  Tipo = :Tipo,'
      '  id = :id'
      'WHERE'
      '  `Enviados`.id = :OLD_id')
    UseSequenceFieldForRefreshSQL = False
    Left = 767
    Top = 657
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Cnpj'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'celular'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enviado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Mensagem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_id'
        ParamType = ptUnknown
      end>
  end
  object qryRespostaSatisfacao: TZQuery
    SQL.Strings = (
      'select '
      '  *'
      'from '
      ' PesquisaSatisfacao '
      'where '
      '  Cnpj=:Cnpj and'
      '  Resposta =:Resposta'
      'order by'
      '  id'
      ''
      ''
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'Cnpj'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Resposta'
        ParamType = ptUnknown
      end>
    Left = 530
    Top = 768
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Cnpj'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Resposta'
        ParamType = ptUnknown
      end>
    object qryRespostaSatisfacaoId: TIntegerField
      FieldName = 'Id'
      Required = True
    end
    object qryRespostaSatisfacaoResposta: TIntegerField
      FieldName = 'Resposta'
    end
    object qryRespostaSatisfacaoCNPJ: TWideStringField
      FieldName = 'CNPJ'
      Size = 15
    end
    object qryRespostaSatisfacaoDATA: TWideStringField
      FieldName = 'DATA'
      Size = 12
    end
    object qryRespostaSatisfacaoNumero: TWideStringField
      FieldName = 'Numero'
      Size = 12
    end
  end
  object qryTotalRespostaSatisfacao: TZQuery
    SQL.Strings = (
      'select '
      '  count(*) as Total'
      'from '
      ' PesquisaSatisfacao '
      'where '
      '  Cnpj=:Cnpj'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'Cnpj'
        ParamType = ptUnknown
      end>
    Left = 538
    Top = 824
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Cnpj'
        ParamType = ptUnknown
      end>
    object qryTotalRespostaSatisfacaoTotal: TLargeintField
      FieldName = 'Total'
      ReadOnly = True
    end
  end
  object qryTextoEmailAtualizaSatisfacao: TZQuery
    UpdateObject = upTextoEmailAtualizaSatisfacao
    SQL.Strings = (
      'SELECT CodigoTextoEmail,Texto,Cnpj FROM TextoEmail'
      'where Cnpj=:Cnpj and CodigoTextoEmail=:CodigoTexto'
      ''
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'Cnpj'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CodigoTexto'
        ParamType = ptUnknown
      end>
    Left = 191
    Top = 656
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Cnpj'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CodigoTexto'
        ParamType = ptUnknown
      end>
    object qryTextoEmailAtualizaSatisfacaoCodigoTextoEmail: TWideStringField
      FieldName = 'CodigoTextoEmail'
      Size = 30
    end
    object qryTextoEmailAtualizaSatisfacaoTexto: TWideMemoField
      FieldName = 'Texto'
      Required = True
      BlobType = ftWideMemo
    end
    object qryTextoEmailAtualizaSatisfacaoCnpj: TWideStringField
      FieldName = 'Cnpj'
      Required = True
      Size = 30
    end
  end
  object upTextoEmailAtualizaSatisfacao: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM TextoEmail'
      'WHERE'
      
        '  ((TextoEmail.CodigoTextoEmail IS NULL AND :OLD_CodigoTextoEmai' +
        'l IS NULL) OR (TextoEmail.CodigoTextoEmail = :OLD_CodigoTextoEma' +
        'il)) AND'
      '  TextoEmail.Cnpj = :OLD_Cnpj')
    InsertSQL.Strings = (
      'INSERT INTO TextoEmail'
      '  (CodigoTextoEmail, Texto, Cnpj)'
      'VALUES'
      '  (:CodigoTextoEmail, :Texto, :Cnpj)')
    ModifySQL.Strings = (
      'UPDATE TextoEmail SET'
      '  CodigoTextoEmail = :CodigoTextoEmail,'
      '  Texto = :Texto,'
      '  Cnpj = :Cnpj'
      'WHERE'
      
        '  ((TextoEmail.CodigoTextoEmail IS NULL AND :OLD_CodigoTextoEmai' +
        'l IS NULL) OR (TextoEmail.CodigoTextoEmail = :OLD_CodigoTextoEma' +
        'il)) AND'
      '  TextoEmail.Cnpj = :OLD_Cnpj')
    UseSequenceFieldForRefreshSQL = False
    Left = 346
    Top = 665
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CodigoTextoEmail'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Texto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cnpj'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_CodigoTextoEmail'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_Cnpj'
        ParamType = ptUnknown
      end>
  end
  object qryPesquisaSatisfacaoEmail: TZQuery
    UpdateObject = upPesquisaSatisfacaoEmail
    SQL.Strings = (
      
        'SELECT Cnpj,celular,Enviado,Mensagem,Remetente,Tipo,CodigoTextoE' +
        'mail,id FROM `Enviados`'
      'where 1=2 '
      '')
    Params = <>
    Left = 532
    Top = 720
    object qryPesquisaSatisfacaoEmailCnpj: TStringField
      FieldName = 'Cnpj'
      Size = 40
    end
    object qryPesquisaSatisfacaoEmailcelular: TStringField
      FieldName = 'celular'
      Size = 80
    end
    object qryPesquisaSatisfacaoEmailEnviado: TIntegerField
      FieldName = 'Enviado'
    end
    object qryPesquisaSatisfacaoEmailMensagem: TStringField
      FieldName = 'Mensagem'
      Size = 180
    end
    object qryPesquisaSatisfacaoEmailRemetente: TStringField
      FieldName = 'Remetente'
      Size = 80
    end
    object qryPesquisaSatisfacaoEmailTipo: TStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object qryPesquisaSatisfacaoEmailCodigoTextoEmail: TStringField
      FieldName = 'CodigoTextoEmail'
      Required = True
      Size = 30
    end
    object qryPesquisaSatisfacaoEmailid: TIntegerField
      FieldName = 'id'
      Required = True
    end
  end
  object upPesquisaSatisfacaoEmail: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM `Enviados`'
      'WHERE'
      '  `Enviados`.id = :OLD_id')
    InsertSQL.Strings = (
      'INSERT INTO `Enviados`'
      
        '  (Cnpj, celular, Enviado, Mensagem, Remetente, Tipo, CodigoText' +
        'oEmail, '
      '   id)'
      'VALUES'
      
        '  (:Cnpj, :celular, :Enviado, :Mensagem, :Remetente, :Tipo, :Cod' +
        'igoTextoEmail, '
      '   :id)')
    ModifySQL.Strings = (
      'UPDATE `Enviados` SET'
      '  Cnpj = :Cnpj,'
      '  celular = :celular,'
      '  Enviado = :Enviado,'
      '  Mensagem = :Mensagem,'
      '  Remetente = :Remetente,'
      '  Tipo = :Tipo,'
      '  CodigoTextoEmail = :CodigoTextoEmail,'
      '  id = :id'
      'WHERE'
      '  `Enviados`.id = :OLD_id')
    UseSequenceFieldForRefreshSQL = False
    Left = 743
    Top = 719
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Cnpj'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'celular'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enviado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Mensagem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Remetente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CodigoTextoEmail'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_id'
        ParamType = ptUnknown
      end>
  end
end
