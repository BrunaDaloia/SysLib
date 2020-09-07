unit UnitPesqEditora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TFrmMnEditora = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    btn_Inserir: TToolButton;
    btn_alterar: TToolButton;
    btn_excluir: TToolButton;
    ToolButton4: TToolButton;
    btn_imprimir: TToolButton;
    ToolButton6: TToolButton;
    btn_sair: TToolButton;
    Dis: TImageList;
    Hot: TImageList;
    Normal: TImageList;
    procedure btn_InserirClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMnEditora: TFrmMnEditora;

implementation

{$R *.dfm}

uses UntCadEditora, UntDM;

procedure TFrmMnEditora.btn_alterarClick(Sender: TObject);
begin
  DM.ADODSEditora.Edit;

  Application.CreateForm(TFrmCadEditora, FrmCadEditora);

  FrmCadEditora.btn_salvar.Enabled:= True;
  FrmCadEditora.btn_cancelar.Enabled:=true;
  FrmCadEditora.btn_sair.Enabled:=False;
  FrmCadEditora.Pn1Ficha.Enabled:=True;

  FrmCadEditora.ShowModal;
  FrmCadEditora.Free;
end;

procedure TFrmMnEditora.btn_excluirClick(Sender: TObject);
var confExcl: integer;
begin
confExcl:= Application.MessageBox('Confirma a exclusão deste registro?',
'Atenção', MB_YESNO+MB_DEFBUTTON2+MB_ICONQUESTION);

if confExcl= IDYes then
begin
  DM.ADODSEditora.Delete;
  Application.MessageBox('O registro foi excluído com sucesso.', 'Informação',
  MB_OK+MB_ICONINFORMATION);
end
else
  Application.MessageBox('A exclusão do registro foi abortada.', 'Informação',
  MB_OK+MB_ICONINFORMATION);
end;

procedure TFrmMnEditora.btn_InserirClick(Sender: TObject);
begin
  DM.ADODSEditora.Append;

  Application.CreateForm(TFrmCadEditora, FrmCadEditora);

  FrmCadEditora.btn_salvar.Enabled:= True;
  FrmCadEditora.btn_cancelar.Enabled:=true;
  FrmCadEditora.btn_sair.Enabled:=False;
  FrmCadEditora.Pn1Ficha.Enabled:=True;

  FrmCadEditora.ShowModal;
  FrmCadEditora.Free;
end;

procedure TFrmMnEditora.btn_sairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmMnEditora.Edit1Change(Sender: TObject);
begin
  if Edit1.Text <> '' then
    begin
      DM.ADODSEditora.Filtered := False;
      DM.ADODSEditora.Filter   := 'nome like ' + QuotedStr('%' + Edit1.Text + '%');
      DM.ADODSEditora.Filtered := True;
    end
  else
    begin
      DM.ADODSEditora.Filtered := False;
    end;
end;

procedure TFrmMnEditora.FormCreate(Sender: TObject);
begin
  DM.ADODSEditora.Close;
  DM.ADODSEditora.CommandText := 'select * from editora';
  DM.ADODSEditora.Open;
end;

end.
