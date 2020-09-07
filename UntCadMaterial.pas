unit UntCadMaterial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList;

type
  TFrmCadMaterial = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    btn_salvar: TToolButton;
    btn_cancelar: TToolButton;
    ToolButton3: TToolButton;
    Pn1ficha: TPanel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBCheckBox1: TDBCheckBox;
    btn_sair: TToolButton;
    dis: TImageList;
    hot: TImageList;
    Normal: TImageList;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    Label2: TLabel;
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
  FrmCadMaterial: TFrmCadMaterial;

implementation

{$R *.dfm}

uses UntPesqMaterial, UntDM;

procedure TFrmCadMaterial.btn_cancelarClick(Sender: TObject);
begin
 DM.ADODSMaterial.Cancel;

Application.MessageBox(' A inclusão ou alteração deste registro foi abortada.',
'Atenção', MB_OK+MB_ICONERROR);

 btn_salvar.Enabled:= false;
 btn_cancelar.Enabled:= false;
 btn_sair.Enabled:=true;
 Pn1Ficha.Enabled:= false;
end;

procedure TFrmCadMaterial.btn_sairClick(Sender: TObject);
begin
close;
end;

procedure TFrmCadMaterial.btn_salvarClick(Sender: TObject);
begin
  DM.ADODSMaterial.Post;

Application.MessageBox(' O registro foi incluído ou alterado com sucesso.',
'Informação', MB_OK+MB_ICONINFORMATION);

 btn_salvar.Enabled:= false;
 btn_cancelar.Enabled:= false;
 btn_sair.Enabled:=true;
 Pn1Ficha.Enabled:= false;
end;

procedure TFrmCadMaterial.FormCreate(Sender: TObject);
begin
  DM.ADODSAssunto.Close;
  DM.ADODSAssunto.CommandText := 'select * from assunto';
  DM.ADODSAssunto.Open;

  DM.ADODSAutor.Close;
  DM.ADODSAutor.CommandText := 'select * from autor';
  DM.ADODSAutor.Open;

  DM.ADODSEditora.Close;
  DM.ADODSEditora.CommandText := 'select * from editora';
  DM.ADODSEditora.Open;
end;

end.
