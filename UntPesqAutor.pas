unit UntPesqAutor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, DB, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids;

type
  TFrmManAutor = class(TForm)
    dis: TImageList;
    hot: TImageList;
    normal: TImageList;
    Panel1: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    btn_inserir: TToolButton;
    btn_alterar: TToolButton;
    btn_excluir: TToolButton;
    ToolButton4: TToolButton;
    btn_imprimir: TToolButton;
    ToolButton6: TToolButton;
    btn_sair: TToolButton;
    Label2: TLabel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    DBGrid1: TDBGrid;
    procedure Edit1Change(Sender: TObject);
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
  FrmManAutor: TFrmManAutor;

implementation

{$R *.dfm}

uses UntDM, UntCadAutor;

procedure TFrmManAutor.btn_alterarClick(Sender: TObject);
begin
  DM.ADODSAutor.Edit;

  Application.CreateForm(TFrmCadAutor, FrmCadAutor);

  FrmCadAutor.btn_salvar.Enabled:= True;
  FrmCadAutor.btn_cancelar.Enabled:=true;
  FrmCadAutor.btn_sair.Enabled:=False;
  FrmCadAutor.Pn1Ficha.Enabled:=True;

  FrmCadAutor.ShowModal;
  FrmCadAutor.Free;
end;

procedure TFrmManAutor.btn_excluirClick(Sender: TObject);
var confExcl: integer;
begin
confExcl:= Application.MessageBox('Confirma a exclus�o deste registro?',
'Aten��o', MB_YESNO+MB_DEFBUTTON2+MB_ICONQUESTION);

if confExcl= IDYes then
begin
  DM.ADODSAutor.Delete;
  Application.MessageBox('O registro foi exclu�do com sucesso.', 'Informa��o',
  MB_OK+MB_ICONINFORMATION);
end
else
  Application.MessageBox('A exclus�o do registro foi abortada.', 'Informa��o',
  MB_OK+MB_ICONINFORMATION);

end;


procedure TFrmManAutor.btn_inserirClick(Sender: TObject);
begin
  DM.ADODSAutor.Append;

  Application.CreateForm(TFrmCadAutor, FrmCadAutor);

  FrmCadAutor.btn_salvar.Enabled        := True;
  FrmCadAutor.btn_cancelar.Enabled      :=true;
  FrmCadAutor.btn_sair.Enabled          :=False;
  FrmCadAutor.Pn1Ficha.Enabled          :=True;

  FrmCadAutor.ShowModal;
  FrmCadAutor.Free;
end;

procedure TFrmManAutor.btn_sairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmManAutor.Edit1Change(Sender: TObject);
begin
//DM.ADODSAutor.Locate('Nome',Edit1.Text,[loCaseInsensitive, loPartialKey]);

  if Edit1.Text <> '' then
    begin
      DM.ADODSAutor.Filtered := False;
      DM.ADODSAutor.Filter   := 'nome like ' + QuotedStr('%' + Edit1.Text + '%');
      DM.ADODSAutor.Filtered := True;
    end
  else
    begin
      DM.ADODSAutor.Filtered := False;
    end;
end;

procedure TFrmManAutor.FormCreate(Sender: TObject);
begin
  DM.ADODSAutor.Close;
  DM.ADODSAutor.CommandText := 'select * from autor';
  DM.ADODSAutor.Open;
end;

end.
