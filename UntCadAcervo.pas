unit UntCadAcervo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, System.ImageList, Vcl.ImgList;

type
  TFrmCadAcervo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    btn_salvar: TToolButton;
    btn_cancelar: TToolButton;
    ToolButton3: TToolButton;
    btn_sair: TToolButton;
    Pn1Ficha: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    dis: TImageList;
    hot: TImageList;
    Normal: TImageList;
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadAcervo: TFrmCadAcervo;

implementation

{$R *.dfm}

uses UntPesqAcervo, UntDM;

procedure TFrmCadAcervo.btn_cancelarClick(Sender: TObject);
begin
 DM.ADODSAcervo.Cancel;

Application.MessageBox(' A inclusão ou alteração deste registro foi abortada.',
'Atenção', MB_OK+MB_ICONERROR);

 btn_salvar.Enabled:= false;
 btn_cancelar.Enabled:= false;
 btn_sair.Enabled:=true;
 Pn1Ficha.Enabled:= false;
end;

procedure TFrmCadAcervo.btn_sairClick(Sender: TObject);
begin
close;
end;

procedure TFrmCadAcervo.btn_salvarClick(Sender: TObject);
begin
DM.ADODSAcervo.Post;

Application.MessageBox(' O registro foi incluído ou alterado com sucesso.',
'Informação', MB_OK+MB_ICONINFORMATION);

 btn_salvar.Enabled:= false;
 btn_cancelar.Enabled:= false;
 btn_sair.Enabled:=true;
 Pn1Ficha.Enabled:= false;
end;

procedure TFrmCadAcervo.FormCreate(Sender: TObject);
begin
  DM.ADODSMaterial.Close;
  DM.ADODSMaterial.CommandText := 'select * from material';
  DM.ADODSMaterial.Open;
end;

end.
