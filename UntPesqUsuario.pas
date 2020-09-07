unit UntPesqUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, DB, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, frxClass, frxDBSet;

type
  TFrmUsuario = class(TForm)
    Dis: TImageList;
    Hot: TImageList;
    Normal: TImageList;
    Panel1: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    btn_inserir: TToolButton;
    btn_alterar: TToolButton;
    btn_excluir: TToolButton;
    ToolButton4: TToolButton;
    btn_Imprimir: TToolButton;
    ToolButton6: TToolButton;
    btn_Sair: TToolButton;
    Label2: TLabel;
    edtPesq: TEdit;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    procedure edtPesqChange(Sender: TObject);
    procedure btn_inserirClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUsuario: TFrmUsuario;

implementation

{$R *.dfm}

uses UntDM, UntCadUsuario1;

procedure TFrmUsuario.btn_alterarClick(Sender: TObject);
begin
  DM.ADODSUsuario.Edit;
  DM.ADODSUsuariodata_alt.Value      := Now;

  Application.CreateForm(TFrmCadUsuario, FrmCadUsuario);

  FrmCadUsuario.btn_salvar.Enabled:= True;
  FrmCadUsuario.btn_cancelar.Enabled:=true;
  FrmCadUsuario.btn_sair.Enabled:=False;
  FrmCadUsuario.Pn1Ficha.Enabled:=True;

  FrmCadUsuario.ShowModal;
  FrmCadUsuario.Free;
end;

procedure TFrmUsuario.btn_excluirClick(Sender: TObject);
var confExcl: integer;
begin
  confExcl:= Application.MessageBox('Confirma a exclusão deste registro?',
  'Atenção', MB_YESNO+MB_DEFBUTTON2+MB_ICONQUESTION);

  if confExcl= IDYes then
  begin
    DM.ADODSUsuario.Delete;
    Application.MessageBox('O registro foi excluído com sucesso.', 'Informação',
    MB_OK+MB_ICONINFORMATION);
  end
  else
    Application.MessageBox('A exclusão do registro foi abortada.', 'Informação',
    MB_OK+MB_ICONINFORMATION);
end;

procedure TFrmUsuario.btn_ImprimirClick(Sender: TObject);
begin
  frxReport1.ShowReport(True);
end;

procedure TFrmUsuario.btn_inserirClick(Sender: TObject);
begin
  DM.ADODSUsuario.Append;
  DM.ADODSUsuariostatus.Value         := 'L';
  DM.ADODSUsuariodata_incl.Value      := Now;

  Application.CreateForm(TFrmCadUsuario, FrmCadUsuario);

  FrmCadUsuario.btn_salvar.Enabled    := True;
  FrmCadUsuario.btn_cancelar.Enabled  := true;
  FrmCadUsuario.btn_sair.Enabled      := False;
  FrmCadUsuario.Pn1Ficha.Enabled      := True;

  FrmCadUsuario.ShowModal;
  FrmCadUsuario.Free;
end;

procedure TFrmUsuario.btn_SairClick(Sender: TObject);
begin
close;
end;

procedure TFrmUsuario.edtPesqChange(Sender: TObject);
begin
//DM.ADODSUsuario.Locate('Nome',Edit1.Text,[loCaseInsensitive, loPartialKey]);
  if edtPesq.Text <> '' then
    begin
      DM.ADODSUsuario.Filtered := False;
      DM.ADODSUsuario.Filter   := 'nome like ' + QuotedStr('%' + edtPesq.Text + '%');
      DM.ADODSUsuario.Filtered := True;
    end
  else
    begin
      DM.ADODSUsuario.Filtered := False;
    end;
end;

procedure TFrmUsuario.FormCreate(Sender: TObject);
begin
  DM.ADODSUsuario.Close;
  DM.ADODSUsuario.CommandText := 'select * from usuario';
  DM.ADODSUsuario.Open;
end;

end.
