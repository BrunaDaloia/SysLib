unit UntCadAssunto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList;

type
  TFrmCadAssunto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    btn_salvar: TToolButton;
    btn_cancelar: TToolButton;
    btn_sair: TToolButton;
    Pn1Ficha: TPanel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    ToolButton1: TToolButton;
    dis: TImageList;
    hot: TImageList;
    Normal: TImageList;
    DBEdit2: TDBEdit;
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadAssunto: TFrmCadAssunto;

implementation

{$R *.dfm}

uses UntPesqAssunto, UntDM;

procedure TFrmCadAssunto.btn_cancelarClick(Sender: TObject);
begin
  DM.ADODSAssunto.Cancel;

Application.MessageBox(' A inclusão ou alteração deste registro foi abortada.',
'Atenção', MB_OK+MB_ICONERROR);

 btn_salvar.Enabled:= false;
 btn_cancelar.Enabled:= false;
 btn_sair.Enabled:=true;
 Pn1Ficha.Enabled:= false;
end;


procedure TFrmCadAssunto.btn_sairClick(Sender: TObject);
begin
close;
end;

procedure TFrmCadAssunto.btn_salvarClick(Sender: TObject);
begin
  DM.ADODSAssunto.Post;

Application.MessageBox(' O registro foi incluído ou alterado com sucesso.',
'Informação', MB_OK+MB_ICONINFORMATION);

 btn_salvar.Enabled:= false;
 btn_cancelar.Enabled:= false;
 btn_sair.Enabled:=true;
 Pn1Ficha.Enabled:= false;
end;

end.
