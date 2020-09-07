unit UntPesqAssunto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ToolWin;

type
  TFrmManAssunto = class(TForm)
    Panel1: TPanel;
    Dis: TImageList;
    Hot: TImageList;
    Normal: TImageList;
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
  FrmManAssunto: TFrmManAssunto;

implementation

{$R *.dfm}

uses UntDM, UntCadAssunto;

procedure TFrmManAssunto.btn_alterarClick(Sender: TObject);
begin
  DM.ADODSAssunto.Edit;

  Application.CreateForm(TFrmCadAssunto, FrmCadAssunto);

  FrmCadAssunto.btn_salvar.Enabled:= True;
  FrmCadAssunto.btn_cancelar.Enabled:=true;
  FrmCadAssunto.btn_sair.Enabled:=false;
  FrmCadAssunto.Pn1Ficha.Enabled:=True;

  FrmCadAssunto.ShowModal;
  FrmCadAssunto.Free;
end;

procedure TFrmManAssunto.btn_excluirClick(Sender: TObject);
var confExcl: integer;
begin
confExcl:= Application.MessageBox('Confirma a exclusão deste registro?',
'Atenção', MB_YESNO+MB_DEFBUTTON2+MB_ICONQUESTION);

if confExcl= IDYes then
begin
  DM.ADODSAssunto.Delete;
  Application.MessageBox('O registro foi excluído com sucesso.', 'Informação',
  MB_OK+MB_ICONINFORMATION);
end
else
  Application.MessageBox('A exclusão do registro foi abortada.', 'Informação',
  MB_OK+MB_ICONINFORMATION);

end;

procedure TFrmManAssunto.btn_inserirClick(Sender: TObject);
begin
  DM.ADODSAssunto.Append;

  Application.CreateForm(TFrmCadAssunto, FrmCadAssunto);

  FrmCadAssunto.btn_salvar.Enabled:= True;
  FrmCadAssunto.btn_cancelar.Enabled:=true;
  FrmCadAssunto.btn_sair.Enabled:=False;
  FrmCadAssunto.Pn1Ficha.Enabled:=True;

  FrmCadAssunto.ShowModal;
  FrmCadAssunto.Free;
end;

procedure TFrmManAssunto.btn_sairClick(Sender: TObject);
begin
close;
end;

procedure TFrmManAssunto.Edit1Change(Sender: TObject);
begin
//DM.ADODSAssunto.Locate('CodigoAssunto', Edit1.Text,[loCaseInsensitive,loPartialKey]);

  if Edit1.Text <> '' then
    begin
      DM.ADODSAssunto.Filtered := False;
      DM.ADODSAssunto.Filter   := 'descricao like ' + QuotedStr('%' + Edit1.Text + '%');
      DM.ADODSAssunto.Filtered := True;
    end
  else
    begin
      DM.ADODSAssunto.Filtered := False;
    end;
end;

procedure TFrmManAssunto.FormCreate(Sender: TObject);
begin
  DM.ADODSAssunto.Close;
  DM.ADODSAssunto.CommandText := 'select * from assunto';
  DM.ADODSAssunto.Open;
end;

end.
