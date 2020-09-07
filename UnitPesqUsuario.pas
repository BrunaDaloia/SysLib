unit UnitPesqUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, DB, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids;

type
  TFrmUsuario = class(TForm)
    Dis: TImageList;
    Hot: TImageList;
    Normal: TImageList;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    btn_inserir: TToolButton;
    btn_alterar: TToolButton;
    btn_excluir: TToolButton;
    ToolButton4: TToolButton;
    btn_Imprimir: TToolButton;
    ToolButton6: TToolButton;
    btn_Sair: TToolButton;
    Label2: TLabel;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUsuario: TFrmUsuario;

implementation

{$R *.dfm}

uses UntDM;

procedure TFrmUsuario.Edit1Change(Sender: TObject);
begin
DM.ADODSUsuario.Locate('Nome',Edit1.Text,[loCaseInsensitive, loPartialKey]);
end;

end.
