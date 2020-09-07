unit UntPesqMaterial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList;

type
  TFrmManMaterial = class(TForm)
    hot: TImageList;
    dis: TImageList;
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
  FrmManMaterial: TFrmManMaterial;

implementation

{$R *.dfm}

uses UntDM, UntCadMaterial;

procedure TFrmManMaterial.Edit1Change(Sender: TObject);
begin
//  DM.ADODSMaterial.Locate('titulo',Edit1.Text, [locaseInsensitive, loPartialKey]);

  if Edit1.Text <> '' then
    begin
      DM.ADODSMaterial.Filtered := False;
      DM.ADODSMaterial.Filter   := 'titulo like ' + QuotedStr('%' + Edit1.Text + '%');
      DM.ADODSMaterial.Filtered := True;
    end
  else
    begin
      DM.ADODSMaterial.Filtered := False;
    end;
end;

procedure TFrmManMaterial.FormCreate(Sender: TObject);
begin
  DM.ADODSMaterial.Close;
  DM.ADODSMaterial.CommandText := 'select * from material';
  DM.ADODSMaterial.Open;
end;

procedure TFrmManMaterial.btn_excluirClick(Sender: TObject);
var confExcl: integer;
begin
  confExcl:= Application.MessageBox('Confirma a exclusão deste registro?',
  'Atenção', MB_YESNO+MB_DEFBUTTON2+MB_ICONQUESTION);

  if confExcl= IDYes then
    begin
      DM.ADODSMaterial.Delete;
      Application.MessageBox('O registro foi excluído com sucesso.', 'Informação',
      MB_OK+MB_ICONINFORMATION);
    end
  else
    Application.MessageBox('A exclusão do registro foi abortada.', 'Informação',MB_OK+MB_ICONINFORMATION);
end;

procedure TFrmManMaterial.btn_inserirClick(Sender: TObject);
begin
  Application.CreateForm(TFrmCadMaterial, FrmCadMaterial);

  DM.ADODSMaterial.Append;
  DM.ADODSMaterialestado.Value := 'L';

  FrmCadMaterial.btn_salvar.Enabled:= True;
  FrmCadMaterial.btn_cancelar.Enabled:=true;
  FrmCadMaterial.btn_sair.Enabled:=False;
  FrmCadMaterial.Pn1Ficha.Enabled:=True;

  FrmCadMaterial.ShowModal;
  FrmCadMaterial.Free;
end;

procedure TFrmManMaterial.btn_sairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmManMaterial.btn_alterarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmCadMaterial, FrmCadMaterial);

  DM.ADODSMaterial.Edit;

  FrmCadMaterial.btn_salvar.Enabled:= True;
  FrmCadMaterial.btn_cancelar.Enabled:=true;
  FrmCadMaterial.btn_sair.Enabled:=False;
  FrmCadMaterial.Pn1Ficha.Enabled:=True;

  FrmCadMaterial.ShowModal;
  FrmCadMaterial.Free;
end;

end.
