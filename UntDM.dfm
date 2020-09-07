object DM: TDM
  OldCreateOrder = False
  Height = 392
  Width = 526
  object ConectBiblio: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=biblioteca;Data Source=BRUNA'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 16
  end
  object ADODSUsuario: TADODataSet
    Connection = ConectBiblio
    CursorType = ctStatic
    CommandText = 'select * from usuario'
    Parameters = <>
    Left = 112
    Top = 16
    object ADODSUsuariocodigo: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      ReadOnly = True
      DisplayFormat = '#0,'
      EditFormat = '#0,'
    end
    object ADODSUsuarionome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 50
    end
    object ADODSUsuarioendereco: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'endereco'
      Size = 50
    end
    object ADODSUsuariobairro: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Size = 50
    end
    object ADODSUsuariocidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
      Size = 50
    end
    object ADODSUsuarioestado: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'estado'
      Size = 2
    end
    object ADODSUsuariotelefone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefone'
    end
    object ADODSUsuarioemail: TStringField
      DisplayLabel = 'Email'
      FieldName = 'email'
      Size = 50
    end
    object ADODSUsuariostatus: TStringField
      DisplayLabel = 'Status'
      FieldName = 'status'
      FixedChar = True
      Size = 1
    end
    object ADODSUsuariodata_incl: TDateTimeField
      DisplayLabel = 'Data de Inclus'#227'o'
      FieldName = 'data_incl'
    end
    object ADODSUsuariodata_alt: TDateTimeField
      DisplayLabel = 'Data de Altera'#231#227'o'
      FieldName = 'data_alt'
    end
  end
  object DSUsuario: TDataSource
    DataSet = ADODSUsuario
    Left = 176
    Top = 16
  end
  object ADODSMaterial: TADODataSet
    Connection = ConectBiblio
    CursorType = ctStatic
    CommandText = 'select * from material'
    Parameters = <>
    Left = 352
    Top = 200
    object ADODSMaterialcodigo: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      ReadOnly = True
      DisplayFormat = '#0,'
    end
    object ADODSMaterialtitulo: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'titulo'
      Size = 50
    end
    object ADODSMaterialcod_autor: TIntegerField
      FieldName = 'cod_autor'
    end
    object ADODSMaterialcod_editora: TIntegerField
      FieldName = 'cod_editora'
    end
    object ADODSMaterialcodAssunto: TIntegerField
      FieldName = 'codAssunto'
    end
    object ADODSMaterialestado: TStringField
      DisplayLabel = 'Status'
      FieldName = 'estado'
      FixedChar = True
      Size = 1
    end
    object ADODSMaterialautor: TStringField
      DisplayLabel = 'Autor'
      FieldKind = fkLookup
      FieldName = 'autor'
      LookupDataSet = ADODSAutor
      LookupKeyFields = 'codigo'
      LookupResultField = 'nome'
      KeyFields = 'cod_autor'
      Size = 50
      Lookup = True
    end
    object ADODSMaterialassunto: TStringField
      DisplayLabel = 'Assunto'
      FieldKind = fkLookup
      FieldName = 'assunto'
      LookupDataSet = ADODSAssunto
      LookupKeyFields = 'codigoAssunto'
      LookupResultField = 'descricao'
      KeyFields = 'codAssunto'
      Size = 50
      Lookup = True
    end
    object ADODSMaterialeditora: TStringField
      DisplayLabel = 'Editora'
      FieldKind = fkLookup
      FieldName = 'editora'
      LookupDataSet = ADODSEditora
      LookupKeyFields = 'codigo'
      LookupResultField = 'nome'
      KeyFields = 'cod_editora'
      Size = 30
      Lookup = True
    end
  end
  object DSMaterial: TDataSource
    DataSet = ADODSMaterial
    Left = 424
    Top = 200
  end
  object ADODSEmpr_item: TADODataSet
    Connection = ConectBiblio
    CursorType = ctStatic
    OnNewRecord = ADODSEmpr_itemNewRecord
    CommandText = 'select * from emprestimo_item'#13#10'WHERE cod_emprestimo = codigo'
    DataSource = DSEmprest
    Parameters = <>
    Left = 32
    Top = 184
    object ADODSEmpr_itemcod_emprestimo: TIntegerField
      FieldName = 'cod_emprestimo'
    end
    object ADODSEmpr_itemcod_material: TIntegerField
      FieldName = 'cod_material'
      OnValidate = ADODSEmpr_itemcod_materialValidate
    end
    object ADODSEmpr_itemtitulo: TStringField
      FieldKind = fkLookup
      FieldName = 'titulo'
      LookupDataSet = ADODSMaterial
      LookupKeyFields = 'titulo'
      LookupResultField = 'codigo'
      KeyFields = 'cod_material'
      Size = 100
      Lookup = True
    end
  end
  object ADODSEmprest: TADODataSet
    Connection = ConectBiblio
    CursorType = ctStatic
    CommandText = 'select * from emprestimo'
    Parameters = <>
    Left = 32
    Top = 248
    object ADODSEmprestcodigo: TAutoIncField
      FieldName = 'codigo'
      ReadOnly = True
    end
    object ADODSEmprestcod_usuario: TIntegerField
      FieldName = 'cod_usuario'
      OnValidate = ADODSEmprestcod_usuarioValidate
    end
    object ADODSEmprestdata_emprestimo: TDateTimeField
      FieldName = 'data_emprestimo'
    end
    object ADODSEmprestdata_devolucao: TDateTimeField
      FieldName = 'data_devolucao'
    end
    object ADODSEmprestdata_entrega: TDateTimeField
      FieldName = 'data_entrega'
    end
    object ADODSEmprestMulta: TBCDField
      FieldName = 'Multa'
      Precision = 18
      Size = 2
    end
  end
  object ADODSEditora: TADODataSet
    Connection = ConectBiblio
    CursorType = ctStatic
    CommandText = 'select * from editora'
    Parameters = <>
    Left = 352
    Top = 72
    object ADODSEditoracodigo: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      ReadOnly = True
      DisplayFormat = '#0,'
      EditFormat = '#0,'
    end
    object ADODSEditoranome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 30
    end
  end
  object ADODSAutor: TADODataSet
    Connection = ConectBiblio
    CursorType = ctStatic
    CommandText = 'select * from autor'
    Parameters = <>
    Left = 352
    Top = 16
    object ADODSAutorcodigo: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      ReadOnly = True
      DisplayFormat = '#0,'
      EditFormat = '#0,'
    end
    object ADODSAutornome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 50
    end
  end
  object ADODSAssunto: TADODataSet
    Connection = ConectBiblio
    CursorType = ctStatic
    CommandText = 'select * from Assunto'
    Parameters = <>
    Left = 352
    Top = 136
    object ADODSAssuntocodigoAssunto: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigoAssunto'
      DisplayFormat = '#0,'
      EditFormat = '#0,'
    end
    object ADODSAssuntodescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 50
    end
  end
  object ADODSAcervo: TADODataSet
    Connection = ConectBiblio
    CursorType = ctStatic
    CommandText = 'select * from acervo'
    Parameters = <>
    Left = 352
    Top = 256
    object ADODSAcervocod_material: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'cod_material'
      DisplayFormat = '#0,'
      EditFormat = '#0,'
    end
    object ADODSAcervoprateleira: TStringField
      DisplayLabel = 'Prateleira'
      FieldName = 'prateleira'
      Size = 10
    end
    object ADODSAcervosessao: TStringField
      DisplayLabel = 'Sess'#227'o'
      FieldName = 'sessao'
      Size = 10
    end
    object ADODSAcervocorredor: TStringField
      DisplayLabel = 'Corredor'
      FieldName = 'corredor'
      Size = 10
    end
    object ADODSAcervoquantidade: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
      DisplayFormat = '#0,'
      EditFormat = '#0,'
    end
    object ADODSAcervomaterial: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldKind = fkLookup
      FieldName = 'material'
      LookupDataSet = ADODSMaterial
      LookupKeyFields = 'codigo'
      LookupResultField = 'titulo'
      KeyFields = 'cod_material'
      Size = 50
      Lookup = True
    end
  end
  object DSEmpr_item: TDataSource
    DataSet = ADODSEmpr_item
    Left = 120
    Top = 176
  end
  object DSEmprest: TDataSource
    DataSet = ADODSEmprest
    Left = 120
    Top = 248
  end
  object DSEditora: TDataSource
    DataSet = ADODSEditora
    Left = 432
    Top = 72
  end
  object DSAutor: TDataSource
    DataSet = ADODSAutor
    Left = 432
    Top = 16
  end
  object DSAssunto: TDataSource
    DataSet = ADODSAssunto
    Left = 432
    Top = 136
  end
  object DSAcervo: TDataSource
    DataSet = ADODSAcervo
    Left = 432
    Top = 256
  end
  object DSItens: TDataSource
    DataSet = ADODSEmpr_item
    Left = 176
    Top = 176
  end
end
