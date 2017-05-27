object dmServidor: TdmServidor
  OldCreateOrder = False
  Height = 872
  Width = 1299
  object dbPrincipalu: TZConnection
    ControlsCodePage = cGET_ACP
    Properties.Strings = (
      'AutoEncodeStrings=ON')
    Connected = True
    HostName = 'Cadmustech.cet2loe0ehxw.us-west-2.rds.amazonaws.com'
    Port = 3306
    Database = 'mercurio'
    User = 'cadmus182'
    Password = 'cadmus182'
    Protocol = 'mysql-5'
    LibraryLocation = 'libmySQL.dll'
    Left = 58
    Top = 10
  end
  object qrySmsRecebidos: TZQuery
    Connection = dbPrincipalu
    UpdateObject = upSmsRecebidos
    SQL.Strings = (
      'SELECT id,Numero,Mensagem,Data,Hora,Original FROM `Recebidas` '
      'where Destinatario=:Cnpj'
      ''
      ''
      ''
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'Cnpj'
        ParamType = ptUnknown
      end>
    Left = 186
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Cnpj'
        ParamType = ptUnknown
      end>
    object qrySmsRecebidosid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object qrySmsRecebidosNumero: TWideStringField
      FieldName = 'Numero'
      Size = 12
    end
    object qrySmsRecebidosMensagem: TWideStringField
      FieldName = 'Mensagem'
      Size = 1000
    end
    object qrySmsRecebidosData: TWideStringField
      FieldName = 'Data'
      Size = 12
    end
    object qrySmsRecebidosHora: TWideStringField
      FieldName = 'Hora'
      Size = 8
    end
    object qrySmsRecebidosOriginal: TWideStringField
      FieldName = 'Original'
      Size = 180
    end
  end
  object upSmsRecebidos: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM `Recebidas`'
      'WHERE'
      '  `Recebidas`.id = :OLD_id')
    InsertSQL.Strings = (
      'INSERT INTO `Recebidas`'
      '  (id, Numero, Mensagem, Data, Hora, Original)'
      'VALUES'
      '  (:id, :Numero, :Mensagem, :Data, :Hora, :Original)')
    ModifySQL.Strings = (
      'UPDATE `Recebidas` SET'
      '  id = :id,'
      '  Numero = :Numero,'
      '  Mensagem = :Mensagem,'
      '  Data = :Data,'
      '  Hora = :Hora,'
      '  Original = :Original'
      'WHERE'
      '  `Recebidas`.id = :OLD_id')
    UseSequenceFieldForRefreshSQL = False
    Left = 290
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Mensagem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Data'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Hora'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Original'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_id'
        ParamType = ptUnknown
      end>
  end
  object qryListaSmsEmail: TZQuery
    Connection = dbPrincipalu
    UpdateObject = upListaSmsEmail
    SQL.Strings = (
      
        'SELECT Cnpj,celular,Enviado,Mensagem,Remetente,Tipo,CodigoTextoE' +
        'mail ,data,hora,id FROM Enviados'
      'where  1<>1'
      ''
      ''
      ''
      ''
      ''
      '')
    Params = <>
    Left = 186
    Top = 64
    object qryListaSmsEmailCnpj: TWideStringField
      FieldName = 'Cnpj'
      Size = 40
    end
    object qryListaSmsEmailcelular: TWideStringField
      FieldName = 'celular'
      Size = 80
    end
    object qryListaSmsEmailEnviado: TIntegerField
      FieldName = 'Enviado'
    end
    object qryListaSmsEmailMensagem: TWideStringField
      FieldName = 'Mensagem'
      Size = 180
    end
    object qryListaSmsEmailRemetente: TWideStringField
      FieldName = 'Remetente'
      Size = 80
    end
    object qryListaSmsEmailTipo: TWideStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object qryListaSmsEmailCodigoTextoEmail: TWideStringField
      FieldName = 'CodigoTextoEmail'
      Required = True
      Size = 30
    end
    object qryListaSmsEmaildata: TDateField
      FieldName = 'data'
    end
    object qryListaSmsEmailhora: TTimeField
      FieldName = 'hora'
    end
    object qryListaSmsEmailid: TIntegerField
      FieldName = 'id'
      Required = True
    end
  end
  object upListaSmsEmail: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM Enviados'
      'WHERE'
      '  Enviados.id = :OLD_id')
    InsertSQL.Strings = (
      'INSERT INTO Enviados'
      
        '  (Cnpj, celular, Enviado, Mensagem, Remetente, Tipo, CodigoText' +
        'oEmail, '
      '   data, hora, id)'
      'VALUES'
      
        '  (:Cnpj, :celular, :Enviado, :Mensagem, :Remetente, :Tipo, :Cod' +
        'igoTextoEmail, '
      '   :data, :hora, :id)')
    ModifySQL.Strings = (
      'UPDATE Enviados SET'
      '  Cnpj = :Cnpj,'
      '  celular = :celular,'
      '  Enviado = :Enviado,'
      '  Mensagem = :Mensagem,'
      '  Remetente = :Remetente,'
      '  Tipo = :Tipo,'
      '  CodigoTextoEmail = :CodigoTextoEmail,'
      '  data = :data,'
      '  hora = :hora,'
      '  id = :id'
      'WHERE'
      '  Enviados.id = :OLD_id')
    UseSequenceFieldForRefreshSQL = False
    Left = 290
    Top = 65
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
        Name = 'data'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'hora'
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
  object qryAgendamentoSms: TZQuery
    Connection = dbPrincipalu
    UpdateObject = upAgendamentoSms
    SQL.Strings = (
      'SELECT Cnpj,celular,Enviado,Mensagem,Tipo,id FROM `Enviados`'
      'where 1=2 '
      '')
    Params = <>
    Left = 186
    Top = 120
    object qryAgendamentoSmsCnpj: TWideStringField
      FieldName = 'Cnpj'
      Size = 40
    end
    object qryAgendamentoSmscelular: TWideStringField
      FieldName = 'celular'
      Size = 80
    end
    object qryAgendamentoSmsEnviado: TIntegerField
      FieldName = 'Enviado'
    end
    object qryAgendamentoSmsMensagem: TWideStringField
      FieldName = 'Mensagem'
      Size = 180
    end
    object qryAgendamentoSmsTipo: TWideStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object qryAgendamentoSmsid: TIntegerField
      FieldName = 'id'
      Required = True
    end
  end
  object upAgendamentoSms: TZUpdateSQL
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
    Left = 290
    Top = 123
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
  object qryOrcamentoSms: TZQuery
    Connection = dbPrincipalu
    UpdateObject = upOrcamentoSms
    SQL.Strings = (
      'SELECT Cnpj,celular,Enviado,Mensagem,Tipo,id FROM `Enviados`'
      'where 1=2 '
      '')
    Params = <>
    Left = 191
    Top = 176
    object qryOrcamentoSmsCnpj: TWideStringField
      FieldName = 'Cnpj'
      Size = 40
    end
    object qryOrcamentoSmscelular: TWideStringField
      FieldName = 'celular'
      Size = 80
    end
    object qryOrcamentoSmsEnviado: TIntegerField
      FieldName = 'Enviado'
    end
    object qryOrcamentoSmsMensagem: TWideStringField
      FieldName = 'Mensagem'
      Size = 180
    end
    object qryOrcamentoSmsTipo: TWideStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object qryOrcamentoSmsid: TIntegerField
      FieldName = 'id'
      Required = True
    end
  end
  object upOrcamentoSms: TZUpdateSQL
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
    Left = 295
    Top = 177
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
  object qryVendaSms: TZQuery
    Connection = dbPrincipalu
    UpdateObject = upVendaSms
    SQL.Strings = (
      'SELECT Cnpj,celular,Enviado,Mensagem,Tipo,id FROM `Enviados`'
      'where 1=2 '
      '')
    Params = <>
    Left = 194
    Top = 224
    object qryVendaSmsCnpj: TWideStringField
      FieldName = 'Cnpj'
      Size = 40
    end
    object qryVendaSmscelular: TWideStringField
      FieldName = 'celular'
      Size = 80
    end
    object qryVendaSmsEnviado: TIntegerField
      FieldName = 'Enviado'
    end
    object qryVendaSmsMensagem: TWideStringField
      FieldName = 'Mensagem'
      Size = 180
    end
    object qryVendaSmsTipo: TWideStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object qryVendaSmsid: TIntegerField
      FieldName = 'id'
      Required = True
    end
  end
  object upVendaSms: TZUpdateSQL
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
    Left = 298
    Top = 225
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
  object qryAvisoOrcamentoEmail: TZQuery
    Connection = dbPrincipalu
    UpdateObject = upAvisoOrcamentoEmail
    SQL.Strings = (
      
        'SELECT Cnpj,celular,Enviado,Mensagem,Remetente,Tipo,CodigoTextoE' +
        'mail,id FROM `Enviados`'
      'where 1=2 '
      '')
    Params = <>
    Left = 194
    Top = 288
    object qryAvisoOrcamentoEmailCnpj: TWideStringField
      FieldName = 'Cnpj'
      Size = 40
    end
    object qryAvisoOrcamentoEmailcelular: TWideStringField
      FieldName = 'celular'
      Size = 80
    end
    object qryAvisoOrcamentoEmailEnviado: TIntegerField
      FieldName = 'Enviado'
    end
    object qryAvisoOrcamentoEmailMensagem: TWideStringField
      FieldName = 'Mensagem'
      Size = 180
    end
    object qryAvisoOrcamentoEmailRemetente: TWideStringField
      FieldName = 'Remetente'
      Size = 80
    end
    object qryAvisoOrcamentoEmailTipo: TWideStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object qryAvisoOrcamentoEmailCodigoTextoEmail: TWideStringField
      FieldName = 'CodigoTextoEmail'
      Required = True
      Size = 30
    end
    object qryAvisoOrcamentoEmailid: TIntegerField
      FieldName = 'id'
      Required = True
    end
  end
  object upAvisoOrcamentoEmail: TZUpdateSQL
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
    Left = 330
    Top = 289
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
  object qryAvisoVendaEmail: TZQuery
    Connection = dbPrincipalu
    UpdateObject = upAvisoVendaEmail
    SQL.Strings = (
      
        'SELECT Cnpj,celular,Enviado,Mensagem,Remetente,Tipo,CodigoTextoE' +
        'mail,id FROM `Enviados`'
      'where 1=2 '
      '')
    Params = <>
    Left = 194
    Top = 352
    object qryAvisoVendaEmailCnpj: TWideStringField
      FieldName = 'Cnpj'
      Size = 40
    end
    object qryAvisoVendaEmailcelular: TWideStringField
      FieldName = 'celular'
      Size = 80
    end
    object qryAvisoVendaEmailEnviado: TIntegerField
      FieldName = 'Enviado'
    end
    object qryAvisoVendaEmailMensagem: TWideStringField
      FieldName = 'Mensagem'
      Size = 180
    end
    object qryAvisoVendaEmailRemetente: TWideStringField
      FieldName = 'Remetente'
      Size = 80
    end
    object qryAvisoVendaEmailTipo: TWideStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object qryAvisoVendaEmailCodigoTextoEmail: TWideStringField
      FieldName = 'CodigoTextoEmail'
      Required = True
      Size = 30
    end
    object qryAvisoVendaEmailid: TIntegerField
      FieldName = 'id'
      Required = True
    end
  end
  object upAvisoVendaEmail: TZUpdateSQL
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
    Left = 338
    Top = 353
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
  object qryTextoEmail: TZQuery
    Connection = dbPrincipalu
    UpdateObject = upTextoEmail
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
    Left = 194
    Top = 400
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
    object qryTextoEmailCodigoTextoEmail: TWideStringField
      FieldName = 'CodigoTextoEmail'
      Size = 30
    end
    object qryTextoEmailTexto: TWideMemoField
      FieldName = 'Texto'
      Required = True
      BlobType = ftWideMemo
    end
    object qryTextoEmailCnpj: TWideStringField
      FieldName = 'Cnpj'
      Required = True
      Size = 30
    end
  end
  object upTextoEmail: TZUpdateSQL
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
    Left = 338
    Top = 401
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
  object qryAgendamentoEmail: TZQuery
    Connection = dbPrincipalu
    UpdateObject = upAgendamentoEmail
    SQL.Strings = (
      
        'SELECT Cnpj,celular,Enviado,Mensagem,Remetente,Tipo,CodigoTextoE' +
        'mail,id FROM `Enviados`'
      'where 1=2 '
      '')
    Params = <>
    Left = 194
    Top = 448
    object qryAgendamentoEmailCnpj: TWideStringField
      FieldName = 'Cnpj'
      Size = 40
    end
    object qryAgendamentoEmailcelular: TWideStringField
      FieldName = 'celular'
      Size = 80
    end
    object qryAgendamentoEmailEnviado: TIntegerField
      FieldName = 'Enviado'
    end
    object qryAgendamentoEmailMensagem: TWideStringField
      FieldName = 'Mensagem'
      Size = 180
    end
    object qryAgendamentoEmailRemetente: TWideStringField
      FieldName = 'Remetente'
      Size = 80
    end
    object qryAgendamentoEmailTipo: TWideStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object qryAgendamentoEmailCodigoTextoEmail: TWideStringField
      FieldName = 'CodigoTextoEmail'
      Required = True
      Size = 30
    end
    object qryAgendamentoEmailid: TIntegerField
      FieldName = 'id'
      Required = True
    end
  end
  object upAgendamentoEmail: TZUpdateSQL
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
    Left = 338
    Top = 449
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
  object qryTextoAgendamentoEmail: TZQuery
    Connection = dbPrincipalu
    UpdateObject = upTextoAgendamentoEmail
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
    Left = 194
    Top = 504
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
    object qryTextoAgendamentoEmailCodigoTextoEmail: TWideStringField
      FieldName = 'CodigoTextoEmail'
      Size = 30
    end
    object qryTextoAgendamentoEmailCnpj: TWideStringField
      FieldName = 'Cnpj'
      Required = True
      Size = 30
    end
    object qryTextoAgendamentoEmailTexto: TWideMemoField
      FieldName = 'Texto'
      Required = True
      BlobType = ftWideMemo
    end
  end
  object upTextoAgendamentoEmail: TZUpdateSQL
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
    Left = 338
    Top = 505
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
  object qryAgendados: TZQuery
    Connection = dbPrincipalu
    UpdateObject = upAgendados
    SQL.Strings = (
      'SELECT * FROM Agendamentos'
      ''
      
        'where CNPJ=:CNPJ and Titulo=:Titulo and Data=:Data and Hora=:Hor' +
        'a and Tipo=:Tipo')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CNPJ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Titulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Data'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Hora'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Tipo'
        ParamType = ptUnknown
      end>
    Left = 490
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CNPJ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Titulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Data'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Hora'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Tipo'
        ParamType = ptUnknown
      end>
    object qryAgendadosid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object qryAgendadosData: TStringField
      FieldName = 'Data'
      Size = 16
    end
    object qryAgendadosHora: TStringField
      FieldName = 'Hora'
      Size = 6
    end
    object qryAgendadosTitulo: TStringField
      FieldName = 'Titulo'
      Size = 400
    end
    object qryAgendadosUltimaExecucao: TStringField
      FieldName = 'UltimaExecucao'
    end
    object qryAgendadosTipo: TStringField
      FieldName = 'Tipo'
      Size = 6
    end
    object qryAgendadosCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 30
    end
  end
  object upAgendados: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM Agendamentos'
      'WHERE'
      '  Agendamentos.id = :OLD_id')
    InsertSQL.Strings = (
      'INSERT INTO Agendamentos'
      '  (id, Data, Hora, Titulo, UltimaExecucao, Tipo, CNPJ)'
      'VALUES'
      '  (:id, :Data, :Hora, :Titulo, :UltimaExecucao, :Tipo, :CNPJ)')
    ModifySQL.Strings = (
      'UPDATE Agendamentos SET'
      '  id = :id,'
      '  Data = :Data,'
      '  Hora = :Hora,'
      '  Titulo = :Titulo,'
      '  UltimaExecucao = :UltimaExecucao,'
      '  Tipo = :Tipo,'
      '  CNPJ = :CNPJ'
      'WHERE'
      '  Agendamentos.id = :OLD_id')
    UseSequenceFieldForRefreshSQL = False
    Left = 656
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Data'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Hora'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Titulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UltimaExecucao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CNPJ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_id'
        ParamType = ptUnknown
      end>
  end
  object qryEntregaSms: TZQuery
    Connection = dbPrincipalu
    UpdateObject = upEntregaSms
    SQL.Strings = (
      'SELECT Cnpj,celular,Enviado,Mensagem,Tipo,id FROM `Enviados`'
      'where 1=2 '
      '')
    Params = <>
    Left = 503
    Top = 80
    object qryEntregaSmsCnpj: TWideStringField
      FieldName = 'Cnpj'
      Size = 40
    end
    object qryEntregaSmscelular: TWideStringField
      FieldName = 'celular'
      Size = 80
    end
    object qryEntregaSmsEnviado: TIntegerField
      FieldName = 'Enviado'
    end
    object qryEntregaSmsMensagem: TWideStringField
      FieldName = 'Mensagem'
      Size = 180
    end
    object qryEntregaSmsTipo: TWideStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object qryEntregaSmsid: TIntegerField
      FieldName = 'id'
      Required = True
    end
  end
  object upEntregaSms: TZUpdateSQL
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
    Left = 655
    Top = 81
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
  object qryCargaSms: TZQuery
    Connection = dbPrincipalu
    UpdateObject = upCargaSms
    SQL.Strings = (
      'SELECT Cnpj,celular,Enviado,Mensagem,Tipo,id FROM `Enviados`'
      'where 1=2 '
      '')
    Params = <>
    Left = 503
    Top = 128
    object qryCargaSmsCnpj: TStringField
      FieldName = 'Cnpj'
      Size = 40
    end
    object qryCargaSmscelular: TStringField
      FieldName = 'celular'
      Size = 80
    end
    object qryCargaSmsEnviado: TIntegerField
      FieldName = 'Enviado'
    end
    object qryCargaSmsMensagem: TStringField
      FieldName = 'Mensagem'
      Size = 180
    end
    object qryCargaSmsTipo: TStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object qryCargaSmsid: TIntegerField
      FieldName = 'id'
      Required = True
    end
  end
  object upCargaSms: TZUpdateSQL
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
    Left = 663
    Top = 129
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
  object qryCobrancaSms: TZQuery
    Connection = dbPrincipalu
    UpdateObject = upCobrancaSms
    SQL.Strings = (
      'SELECT Cnpj,celular,Enviado,Mensagem,Tipo,id FROM `Enviados`'
      'where 1=2 '
      '')
    Params = <>
    Left = 511
    Top = 184
    object qryCobrancaSmsCnpj: TWideStringField
      FieldName = 'Cnpj'
      Size = 40
    end
    object qryCobrancaSmscelular: TWideStringField
      FieldName = 'celular'
      Size = 80
    end
    object qryCobrancaSmsEnviado: TIntegerField
      FieldName = 'Enviado'
    end
    object qryCobrancaSmsMensagem: TWideStringField
      FieldName = 'Mensagem'
      Size = 180
    end
    object qryCobrancaSmsTipo: TWideStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object qryCobrancaSmsid: TIntegerField
      FieldName = 'id'
      Required = True
    end
  end
  object upCobrancaSms: TZUpdateSQL
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
    Left = 663
    Top = 177
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
  object qryAniversarioSms: TZQuery
    Connection = dbPrincipalu
    UpdateObject = upAniversarioSms
    SQL.Strings = (
      'SELECT Cnpj,celular,Enviado,Mensagem,Tipo,id FROM `Enviados`'
      'where 1=2 '
      '')
    Params = <>
    Left = 511
    Top = 240
    object qryAniversarioSmsCnpj: TWideStringField
      FieldName = 'Cnpj'
      Size = 40
    end
    object qryAniversarioSmscelular: TWideStringField
      FieldName = 'celular'
      Size = 80
    end
    object qryAniversarioSmsEnviado: TIntegerField
      FieldName = 'Enviado'
    end
    object qryAniversarioSmsMensagem: TWideStringField
      FieldName = 'Mensagem'
      Size = 180
    end
    object qryAniversarioSmsTipo: TWideStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object qryAniversarioSmsid: TIntegerField
      FieldName = 'id'
      Required = True
    end
  end
  object upAniversarioSms: TZUpdateSQL
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
    Left = 663
    Top = 241
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
  object qryCobrancaEmail: TZQuery
    Connection = dbPrincipalu
    UpdateObject = upCobrancaEmail
    SQL.Strings = (
      
        'SELECT Cnpj,celular,Enviado,Mensagem,Remetente,Tipo,CodigoTextoE' +
        'mail,id FROM `Enviados`'
      'where 1=2 '
      '')
    Params = <>
    Left = 191
    Top = 608
    object qryCobrancaEmailCnpj: TStringField
      FieldName = 'Cnpj'
      Size = 40
    end
    object qryCobrancaEmailcelular: TStringField
      FieldName = 'celular'
      Size = 80
    end
    object qryCobrancaEmailEnviado: TIntegerField
      FieldName = 'Enviado'
    end
    object qryCobrancaEmailMensagem: TStringField
      FieldName = 'Mensagem'
      Size = 180
    end
    object qryCobrancaEmailRemetente: TStringField
      FieldName = 'Remetente'
      Size = 80
    end
    object qryCobrancaEmailTipo: TStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object qryCobrancaEmailCodigoTextoEmail: TStringField
      FieldName = 'CodigoTextoEmail'
      Required = True
      Size = 30
    end
    object qryCobrancaEmailid: TIntegerField
      FieldName = 'id'
      Required = True
    end
  end
  object upCobrancaEmail: TZUpdateSQL
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
    Left = 343
    Top = 609
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
  object qryAvisoVencimentoEmail: TZQuery
    Connection = dbPrincipalu
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
  object qryAvisoVencimentoSms: TZQuery
    Connection = dbPrincipalu
    UpdateObject = upAvisoVencimentoSms
    SQL.Strings = (
      'SELECT Cnpj,celular,Enviado,Mensagem,Tipo,id FROM `Enviados`'
      'where 1=2 '
      '')
    Params = <>
    Left = 511
    Top = 296
    object qryAvisoVencimentoSmsCnpj: TWideStringField
      FieldName = 'Cnpj'
      Size = 40
    end
    object qryAvisoVencimentoSmscelular: TWideStringField
      FieldName = 'celular'
      Size = 80
    end
    object qryAvisoVencimentoSmsEnviado: TIntegerField
      FieldName = 'Enviado'
    end
    object qryAvisoVencimentoSmsMensagem: TWideStringField
      FieldName = 'Mensagem'
      Size = 180
    end
    object qryAvisoVencimentoSmsTipo: TWideStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object qryAvisoVencimentoSmsid: TIntegerField
      FieldName = 'id'
      Required = True
    end
  end
  object upAvisoVencimentoSms: TZUpdateSQL
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
    Left = 695
    Top = 297
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
  object qryVerificaResete: TZQuery
    Connection = dbPrincipalu
    SQL.Strings = (
      'Select '
      '  Reseta'
      'From '
      '  Clientes'
      'Where '
      '  Cnpj =:Cnpj'
      ''
      ''
      ''
      ' ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'Cnpj'
        ParamType = ptUnknown
      end>
    Left = 514
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Cnpj'
        ParamType = ptUnknown
      end>
    object qryVerificaReseteReseta: TWideStringField
      FieldName = 'Reseta'
      Size = 3
    end
  end
  object tPingServer: TTimer
    Interval = 9000
    OnTimer = tPingServerTimer
    Left = 960
    Top = 456
  end
  object qrySenha: TZQuery
    Connection = dbPrincipalu
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
    Left = 514
    Top = 423
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Cnpj'
        ParamType = ptUnknown
      end>
    object qrySenhaSenhaAlteracao: TWideStringField
      FieldName = 'SenhaAlteracao'
    end
  end
  object ZQuery1: TZQuery
    Connection = dbPrincipalu
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
    Connection = dbPrincipalu
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
    Connection = dbPrincipalu
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
    Connection = dbPrincipalu
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
    Connection = dbPrincipalu
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
    Connection = dbPrincipalu
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
    Connection = dbPrincipalu
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
    Connection = dbPrincipalu
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
  object qryResultadoPesquisaSatisfacao: TZQuery
    Connection = dbPrincipalu
    SQL.Strings = (
      'select'
      '  Mensagem as Resposta,'
      '  Count(*) as TotalResposta,'
      '  (Count(*) / ((select '
      '     distinct count(*) '
      '   from '
      '     Recebidas TR '
      '   where '
      '     R.Data Between :DataIncial and  :DataFinal'
      '    and Destinatario = :Cnpj '
      
        '    and Trim(Mensagem) in ('#39'1'#39','#39'2'#39','#39'3'#39','#39'4'#39','#39'5'#39','#39'6'#39','#39'7'#39','#39'8'#39','#39'9'#39','#39 +
        '10'#39'))  ) * 100)  as Percentual'
      '    ,'
      '   (select '
      '     distinct count(*) '
      '   from '
      '     Recebidas TR '
      '   where '
      '     R.Data Between :DataIncial and  :DataFinal'
      '    and Destinatario = :Cnpj'
      
        '    and Trim(Mensagem) in ('#39'1'#39','#39'2'#39','#39'3'#39','#39'4'#39','#39'5'#39','#39'6'#39','#39'7'#39','#39'8'#39','#39'9'#39','#39 +
        '10'#39')) as TotalRespostas'
      'from'
      '  Recebidas R'
      'where'
      '  R.Data Between :DataIncial and  :DataFinal'
      '  and Destinatario = :Cnpj'
      
        '  and Trim(Mensagem) in ('#39'1'#39','#39'2'#39','#39'3'#39','#39'4'#39','#39'5'#39','#39'6'#39','#39'7'#39','#39'8'#39','#39'9'#39','#39'10' +
        #39')'
      'Group by'
      '  Mensagem')
    Params = <
      item
        DataType = ftUnknown
        Name = 'DataIncial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataFinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cnpj'
        ParamType = ptUnknown
      end>
    Left = 866
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DataIncial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataFinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cnpj'
        ParamType = ptUnknown
      end>
    object qryResultadoPesquisaSatisfacaoResposta: TWideStringField
      FieldName = 'Resposta'
      Size = 1000
    end
    object qryResultadoPesquisaSatisfacaoTotalResposta: TLargeintField
      FieldName = 'TotalResposta'
      ReadOnly = True
    end
    object qryResultadoPesquisaSatisfacaoPercentual: TFloatField
      FieldName = 'Percentual'
      ReadOnly = True
    end
    object qryResultadoPesquisaSatisfacaoTotalRespostas: TLargeintField
      FieldName = 'TotalRespostas'
      ReadOnly = True
    end
  end
end
