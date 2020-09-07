unit UntCadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ComCtrls, System.ImageList, Vcl.ImgList, Vcl.ToolWin, Vcl.ExtCtrls;

type
  TFrmCadUsuario = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    dis: TImageList;
    hot: TImageList;
    normal: TImageList;
    btn_salvar: TToolButton;
    btn_cancelar: TToolButton;
    ToolButton1: TToolButton;
    btn_sair: TToolButton;
    StatusBar1: TStatusBar;
    Pn1ficha: TPanel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
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

uses UntPesqUsuario, UntDM;

procedure TFrmCadUsuario.btn_cancelarClick(Sender: TObject);
begin
    DM.ADODSUsuario.Cancel;
    Application.MessageBox('A alteração deste registro foi abortada', 'Atenção',
    MB_OK+MB_ICONERROR);

     btn_salvar.Enabled:= false;
   btn_cancelar.Enabled:= False;
    btn_sair.Enabled:= True;
   Pn1ficha.Enabled:= false;
end;

procedure TFrmCadUsuario.btn_sairClick(Sender: TObject);
begin
 Close;
end;

procedure TFrmCadUsuario.btn_salvarClick(Sender: TObject);
begin
   DM.ADODSUsuario.Post;

   Application.MessageBox('O registro foi alterado com sucesso.', 'Informação',
   MB_OK+MB_ICONINFORMATION);

   btn_salvar.Enabled:= false;
   btn_cancelar.Enabled:= False;
   btn_sair.Enabled:= True;
   Pn1ficha.Enabled:= false;
end;

end.
