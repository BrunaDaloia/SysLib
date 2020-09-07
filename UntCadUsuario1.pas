unit UntCadUsuario1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ExtCtrls;

type
  TFrmCadUsuario = class(TForm)
    Panel1: TPanel;
    Pn1ficha: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Panel2: TPanel;
    dis: TImageList;
    hot: TImageList;
    Normal: TImageList;
    ToolBar1: TToolBar;
    btn_salvar: TToolButton;
    btn_cancelar: TToolButton;
    ToolButton3: TToolButton;
    btn_sair: TToolButton;
    DBCheckBox1: TDBCheckBox;
    Label11: TLabel;
    Label12: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadUsuario: TFrmCadUsuario;

implementation

{$R *.dfm}

uses UntDM, UntPesqUsuario;

procedure TFrmCadUsuario.btn_cancelarClick(Sender: TObject);
begin
 DM.ADODSUsuario.Cancel;

Application.MessageBox(' A inclusão ou alteração deste registro foi abortada.',
'Atenção', MB_OK+MB_ICONERROR);

 btn_salvar.Enabled:= false;
 btn_cancelar.Enabled:= false;
 btn_sair.Enabled:=true;
 Pn1Ficha.Enabled:= false;
end;

procedure TFrmCadUsuario.btn_sairClick(Sender: TObject);
begin
close;
end;

procedure TFrmCadUsuario.btn_salvarClick(Sender: TObject);
begin
  DM.ADODSUsuario.Post;

Application.MessageBox(' O registro foi incluído ou alterado com sucesso.',
'Informação', MB_OK+MB_ICONINFORMATION);

 btn_salvar.Enabled:= false;
 btn_cancelar.Enabled:= false;
 btn_sair.Enabled:=true;
 Pn1Ficha.Enabled:= false;
end;

end.
