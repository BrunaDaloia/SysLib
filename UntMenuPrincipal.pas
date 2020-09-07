unit UntMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.ActnMenus, System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TmenuPrincipal = class(TForm)
    ActionManager1: TActionManager;
    ImageList1: TImageList;
    ActionMainMenuBar1: TActionMainMenuBar;
    ActionToolBar1: TActionToolBar;
    Usuário: TAction;
    Material: TAction;
    Empréstimo: TAction;
    Sair: TAction;
    Action1: TAction;
    Ajuda: TAction;
    Image1: TImage;
    Acervo: TAction;
    Editora: TAction;
    Autor: TAction;
    Assunto: TAction;
    procedure UsuárioExecute(Sender: TObject);
    procedure MaterialExecute(Sender: TObject);
    procedure SairExecute(Sender: TObject);
    procedure EmpréstimoExecute(Sender: TObject);
    procedure AcervoExecute(Sender: TObject);
    procedure AutorExecute(Sender: TObject);
    procedure EditoraExecute(Sender: TObject);
    procedure AssuntoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  menuPrincipal: TmenuPrincipal;

implementation

{$R *.dfm}

uses UntPesqUsuario, UntCadMaterial, UntEmprestimo, UntDM, UnitPesqEditora,
  UntCadAcervo, UntCadAssunto, UntCadAutor, UntCadEditora, UntCadUsuario1,
  UntPesqAcervo, UntPesqAssunto, UntPesqAutor, UntPesqMaterial;

procedure TmenuPrincipal.AcervoExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmPesqAcervo, FrmPesqAcervo);
  FrmPesqAcervo.ShowModal;
  FrmPesqAcervo.Free;
end;

procedure TmenuPrincipal.AssuntoExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmManAssunto, FrmManAssunto);
  FrmManAssunto.ShowModal;
  FrmManAssunto.Free;
end;

procedure TmenuPrincipal.AutorExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmManAutor, FrmManAutor);
  FrmManAutor.ShowModal;
  FrmManAutor.Free;
end;

procedure TmenuPrincipal.EditoraExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmMnEditora, FrmMnEditora);
  FrmMnEditora.ShowModal;
  FrmMnEditora.Free;
end;

procedure TmenuPrincipal.EmpréstimoExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmEmprestimo, FrmEmprestimo);
  FrmEmprestimo.ShowModal;
  FrmEmprestimo.Free;
end;

procedure TmenuPrincipal.MaterialExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmManMaterial, FrmManMaterial);
  FrmManMaterial.ShowModal;
  FrmManMaterial.Free;
end;

procedure TmenuPrincipal.SairExecute(Sender: TObject);
begin
	Close;
end;

procedure TmenuPrincipal.UsuárioExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmUsuario, FrmUsuario);
  FrmUsuario.ShowModal;
  FrmUsuario.Free;
end;

end.
