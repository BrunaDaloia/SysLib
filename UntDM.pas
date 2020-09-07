unit UntDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Dialogs;

type
  TDM = class(TDataModule)
    ConectBiblio: TADOConnection;
    ADODSUsuario: TADODataSet;
    ADODSUsuariocodigo: TAutoIncField;
    ADODSUsuarionome: TStringField;
    ADODSUsuarioendereco: TStringField;
    ADODSUsuariobairro: TStringField;
    ADODSUsuariocidade: TStringField;
    ADODSUsuarioestado: TStringField;
    ADODSUsuariotelefone: TStringField;
    ADODSUsuarioemail: TStringField;
    DSUsuario: TDataSource;
    ADODSMaterial: TADODataSet;
    DSMaterial: TDataSource;
    ADODSMaterialcodigo: TAutoIncField;
    ADODSMaterialtitulo: TStringField;
    ADODSMaterialcod_autor: TIntegerField;
    ADODSMaterialcod_editora: TIntegerField;
    ADODSMaterialcodAssunto: TIntegerField;
    ADODSEmpr_item: TADODataSet;
    ADODSEmprest: TADODataSet;
    ADODSEditora: TADODataSet;
    ADODSAutor: TADODataSet;
    ADODSAssunto: TADODataSet;
    ADODSAcervo: TADODataSet;
    DSEmpr_item: TDataSource;
    DSEmprest: TDataSource;
    DSEditora: TDataSource;
    DSAutor: TDataSource;
    DSAssunto: TDataSource;
    DSAcervo: TDataSource;
    ADODSEmpr_itemcod_emprestimo: TIntegerField;
    ADODSEmpr_itemcod_material: TIntegerField;
    ADODSEmprestcodigo: TAutoIncField;
    ADODSEmprestcod_usuario: TIntegerField;
    ADODSEmprestdata_emprestimo: TDateTimeField;
    ADODSEmprestdata_devolucao: TDateTimeField;
    ADODSEditoracodigo: TAutoIncField;
    ADODSEditoranome: TStringField;
    ADODSAutorcodigo: TAutoIncField;
    ADODSAutornome: TStringField;
    ADODSAssuntocodigoAssunto: TIntegerField;
    ADODSAcervocod_material: TIntegerField;
    ADODSAcervoprateleira: TStringField;
    ADODSAcervosessao: TStringField;
    ADODSAcervocorredor: TStringField;
    ADODSAcervoquantidade: TIntegerField;
    ADODSMaterialestado: TStringField;
    ADODSEmprestdata_entrega: TDateTimeField;
    ADODSEmprestMulta: TBCDField;
    ADODSEmpr_itemtitulo: TStringField;
    ADODSUsuariostatus: TStringField;
    ADODSUsuariodata_incl: TDateTimeField;
    ADODSUsuariodata_alt: TDateTimeField;
    DSItens: TDataSource;
    ADODSAssuntodescricao: TStringField;
    ADODSMaterialautor: TStringField;
    ADODSMaterialassunto: TStringField;
    ADODSMaterialeditora: TStringField;
    ADODSAcervomaterial: TStringField;
    procedure ADODSEmprestcod_usuarioValidate(Sender: TField);
    procedure ADODSEmpr_itemcod_materialValidate(Sender: TField);
    procedure ADODSEmpr_itemNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UntEmprestimo;

{$R *.dfm}

procedure TDM.ADODSEmprestcod_usuarioValidate(Sender: TField);
begin
  if not FrmEmprestimo.ADOQryUsuario.Locate('codigo',ADODSEmprestcod_usuario.AsInteger,[]) then
    begin
      MessageDlg('Usuário não encontrado', mtError, [mbok], 0);
      Abort;
    end;
end;

procedure TDM.ADODSEmpr_itemcod_materialValidate(Sender: TField);
begin
   MessageDlg(' Produto não encontrado', mtError, [mbOk], 0);
   abort;
end;

procedure TDM.ADODSEmpr_itemNewRecord(DataSet: TDataSet);
begin
	ADODSEmpr_itemcod_emprestimo.value:= ADODSEmprestcodigo.AsInteger;
end;

end.
