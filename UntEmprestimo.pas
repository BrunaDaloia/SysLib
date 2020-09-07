unit UntEmprestimo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ComCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Data.DB, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB;

type
  TFrmEmprestimo = class(TForm)
    dis: TImageList;
    hot: TImageList;
    normal: TImageList;
    Panel1: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    btn_primeiro: TToolButton;
    btn_anterior: TToolButton;
    btn_proximo: TToolButton;
    btn_ultimo: TToolButton;
    ToolButton5: TToolButton;
    btn_inserir: TToolButton;
    btn_alterar: TToolButton;
    btn_excluir: TToolButton;
    ToolButton9: TToolButton;
    btn_salvar: TToolButton;
    btn_cancelar: TToolButton;
    ToolButton12: TToolButton;
    btn_imprimir: TToolButton;
    btn_sair: TToolButton;
    Pn1ficha: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    ADOQryUsuario: TADOQuery;
    DsUsuario: TDataSource;
    ADOQryMaterial: TADOQuery;
    DsMaterial: TDataSource;
    ADOQryMaterialcodigo: TAutoIncField;
    ADOQryMaterialtitulo: TStringField;
    ADOQryMaterialcod_autor: TIntegerField;
    ADOQryMaterialcod_editora: TIntegerField;
    ADOQryMaterialcodAssunto: TIntegerField;
    ADOQryMaterialestado: TStringField;
    ADOQryUsuariocodigo: TAutoIncField;
    Panel3: TPanel;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    DBEdit7: TDBEdit;
     procedure btn_primeiroClick(Sender: TObject);
     procedure btn_anteriorClick(Sender: TObject);
    procedure btn_proximoClick(Sender: TObject);
    procedure btn_inserirClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_ultimoClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure Botoes(Ativa: Boolean);
  public
    { Public declarations }
  end;

var
  FrmEmprestimo: TFrmEmprestimo;
    operacao: integer;
implementation

{$R *.dfm}

uses UntDM, UntCadUsuario1, UntCadMaterial;

procedure TFrmEmprestimo.Botoes(Ativa: Boolean);
begin
if operacao = 1 then
  begin
    if DM.ADODSEmprest.Eof = true then
    begin
      btn_proximo.Enabled:= false;
      btn_ultimo.Enabled:= false;
    end
    else
    begin
      btn_proximo.Enabled:= true;
      btn_ultimo.Enabled:= true;
    end;

    if DM.ADODSEmprest.Bof = true then
    begin
      btn_primeiro.Enabled:= false;
      btn_anterior.Enabled:= false;
    end
    else
    begin
      btn_primeiro.Enabled:= true;
      btn_anterior.Enabled:= true;
   end;
  end
  else
  begin
    btn_primeiro.Enabled:= false;
    btn_anterior.Enabled:= false;
    btn_proximo.Enabled:= false;
    btn_ultimo.Enabled:= false;
  end;
  btn_inserir.Enabled:= Ativa;
  btn_sair.Enabled:= Ativa;
  btn_imprimir.Enabled:= Ativa;
  if DM.ADODSEmprest.RecordCount > 0 then
  begin
    btn_alterar.Enabled:= Ativa;
    btn_excluir.Enabled:= Ativa;
  end;
  btn_salvar.Enabled:= not Ativa;
  btn_cancelar.Enabled:= not Ativa;
  Panel2.Enabled:= not Ativa;
end;


procedure TFrmEmprestimo.btn_alterarClick(Sender: TObject);
begin
    DM.ADODSEmprest.Edit;
  DM.ADODSEmprestdata_emprestimo.AsDateTime:= date;

        operacao:= 0;
  Botoes(false);
end;

procedure TFrmEmprestimo.btn_anteriorClick(Sender: TObject);
begin
     DM.ADODSEmprest.Prior;
     Botoes(true);
end;

procedure TFrmEmprestimo.btn_cancelarClick(Sender: TObject);
begin
     DM.ADODSEmprest.Cancel;

  Application.MessageBox(
  'Registro cancelado com sucesso.',
  'Aviso',MB_OK+MB_DEFBUTTON1+MB_ICONERROR);

  operacao:= 1;
  Botoes(True);
end;

procedure TFrmEmprestimo.btn_excluirClick(Sender: TObject);
var confExclusao: integer;
begin
    confExclusao:= Application.MessageBox(
  'Tem certeza que deseja excluir o registro?',
  'Atenção',MB_YESNO+MB_DEFBUTTON2+MB_ICONQUESTION);

  if confExclusao = IDYES then
  begin
    ShowMessage('Registro nº ' +
    DM.ADODSEmprestcodigo.AsString + ' com sucesso.');
    DM.ADODSEmprest.Delete;
  end;
end;

procedure TFrmEmprestimo.btn_inserirClick(Sender: TObject);
begin
    DM.ADODSEmprest.Insert;
  DM.ADODSEmprestdata_emprestimo.AsDateTime:= Date;
  DM.ADODSEmprestdata_devolucao.AsDateTime:= Date;
  DM.ADODSEmprest.Post;
  //StatusBar1.Panels[0].Text:= 'Empréstimo nº ' + DM.ADODSEmprestcodigo.AsString;

  DM.ADODSEmprest.Edit;

  operacao:= 0;
  Botoes(false);
end;

procedure TFrmEmprestimo.btn_primeiroClick(Sender: TObject);
begin
  DM.ADODSEmprest.First;
  Botoes(true);
end;

procedure TFrmEmprestimo.btn_proximoClick(Sender: TObject);
begin
  DM.ADODSEmprest.Next;
  Botoes(true);
end;

procedure TFrmEmprestimo.btn_sairClick(Sender: TObject);
begin
close;
end;

procedure TFrmEmprestimo.btn_salvarClick(Sender: TObject);
begin
   DM.ADODSEmprest.Post;

  Application.MessageBox(
  'O Registro foi salvo com sucesso.',
  'Informação',MB_OK+
  MB_DEFBUTTON1+MB_ICONINFORMATION);

  operacao:= 1;
  Botoes(True);
end;

procedure TFrmEmprestimo.btn_ultimoClick(Sender: TObject);
begin
DM.ADODSEmprest.Last;
Botoes(true);
end;

procedure TFrmEmprestimo.FormActivate(Sender: TObject);
begin
     DM.ADODSEmprest.Open;
  DM.ADODSEmpr_Item.Open;

  operacao:= 1;
  Botoes(true);

  ADOQryUsuario.Open;
  ADOQryUsuario.ExecSQL;

  ADOQryMaterial.Open;
  ADOQryMaterial.ExecSQL;

  dbedit6.Text:= DateToStr(Date);

end;

procedure TFrmEmprestimo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      DM.ADODSEmprest.Close;
  DM.ADODSEmpr_Item.Close;

  ADOQryMaterial.Close;
  ADOQryUsuario.Close;

end;

end.


