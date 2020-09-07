unit UntCadEditora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList;

type
  TFrmCadEditora = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    btn_salvar: TToolButton;
    btn_cancelar: TToolButton;
    ToolButton3: TToolButton;
    btn_sair: TToolButton;
    Pn1ficha: TPanel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    dis: TImageList;
    hot: TImageList;
    Normal: TImageList;
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadEditora: TFrmCadEditora;

implementation

{$R *.dfm}

uses UnitPesqEditora, UntDM;

procedure TFrmCadEditora.btn_cancelarClick(Sender: TObject);
begin
 DM.ADODSEditora.Cancel;

Application.MessageBox(' A inclusão ou alteração deste registro foi abortada.',
'Atenção', MB_OK+MB_ICONERROR);

 btn_salvar.Enabled:= false;
 btn_cancelar.Enabled:= false;
 btn_sair.Enabled:=true;
 Pn1Ficha.Enabled:= false;
end;

procedure TFrmCadEditora.btn_sairClick(Sender: TObject);
begin
close;
end;

procedure TFrmCadEditora.btn_salvarClick(Sender: TObject);
begin
  DM.ADODSEditora.Post;

Application.MessageBox(' O registro foi incluído ou alterado com sucesso.',
'Informação', MB_OK+MB_ICONINFORMATION);

 btn_salvar.Enabled:= false;
 btn_cancelar.Enabled:= false;
 btn_sair.Enabled:=true;
 Pn1Ficha.Enabled:= false;
end;

end.
