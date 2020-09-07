unit UntPesqAcervo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.StdCtrls, System.ImageList, Vcl.ImgList, Data.DB, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids;

type
  TFrmPesqAcervo = class(TForm)
    Dis: TImageList;
    Hot: TImageList;
    Normal: TImageList;
    ToolBar1: TToolBar;
    btn_inserir: TToolButton;
    btn_alterar: TToolButton;
    btn_excluir: TToolButton;
    ToolButton4: TToolButton;
    btn_imprimir: TToolButton;
    ToolButton6: TToolButton;
    btn_sair: TToolButton;
    Label2: TLabel;
    edtPesq: TEdit;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    Painel1: TPanel;
    Painel2: TPanel;
    procedure edtPesqChange(Sender: TObject);
    procedure btn_inserirClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPesqAcervo: TFrmPesqAcervo;

implementation

{$R *.dfm}

uses UntDM, UntCadAcervo;

procedure TFrmPesqAcervo.btn_alterarClick(Sender: TObject);
begin
  DM.ADODSAcervo.Edit;

  Application.CreateForm(TFrmCadAcervo, FrmCadAcervo);

  FrmCadAcervo.btn_salvar.Enabled:= True;
  FrmCadAcervo.btn_cancelar.Enabled:=true;
  FrmCadAcervo.btn_sair.Enabled:=false;
  FrmCadAcervo.Pn1Ficha.Enabled:=True;
  FrmCadAcervo.ShowModal;

  FrmCadAcervo.ShowModal;
  FrmCadAcervo.Free;
end;

procedure TFrmPesqAcervo.btn_excluirClick(Sender: TObject);
var confExcl: integer;
begin
confExcl:= Application.MessageBox('Confirma a exclusão deste registro?',
'Atenção', MB_YESNO+MB_DEFBUTTON2+MB_ICONQUESTION);

if confExcl= IDYes then
begin
  DM.ADODSAcervo.Delete;
  Application.MessageBox('O registro foi excluído com sucesso.', 'Informação',
  MB_OK+MB_ICONINFORMATION);
end
else
  Application.MessageBox('A exclusão do registro foi abortada.', 'Informação',
  MB_OK+MB_ICONINFORMATION);

end;

procedure TFrmPesqAcervo.btn_inserirClick(Sender: TObject);
begin
  DM.ADODSAcervo.Append;

  Application.CreateForm(TFrmCadAcervo, FrmCadAcervo);

  FrmCadAcervo.btn_salvar.Enabled:= True;
  FrmCadAcervo.btn_cancelar.Enabled:=true;
  FrmCadAcervo.btn_sair.Enabled:=False;
  FrmCadAcervo.Pn1Ficha.Enabled:=True;

  FrmCadAcervo.ShowModal;
  FrmCadAcervo.Free;
end;

procedure TFrmPesqAcervo.btn_sairClick(Sender: TObject);
begin
close;
end;

procedure TFrmPesqAcervo.edtPesqChange(Sender: TObject);
begin
// DM.ADODSAcervo.Locate('Codigo', Edit1.Text, [loCaseInsensitive, loPartialKey]);
  if edtPesq.Text <> '' then
    begin
      DM.ADODSAcervo.Filtered := False;
      DM.ADODSAcervo.Filter   := 'codigo = ' + edtPesq.Text;
      DM.ADODSAcervo.Filtered := True;
    end
  else
    begin
      DM.ADODSAcervo.Filtered := False;
    end;
end;

procedure TFrmPesqAcervo.FormCreate(Sender: TObject);
begin
  DM.ADODSAcervo.Close;
  DM.ADODSAcervo.CommandText := 'select * from acervo';
  DM.ADODSAcervo.Open;
end;

end.
