unit UntPesqEditora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, DB, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids;

type
  TFrmManEditora = class(TForm)
    Dis: TImageList;
    Hot: TImageList;
    Normal: TImageList;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    btn_Inserir: TToolButton;
    btn_alterar: TToolButton;
    btn_excluir: TToolButton;
    ToolButton4: TToolButton;
    btn_imprimir: TToolButton;
    ToolButton6: TToolButton;
    btn_sair: TToolButton;
    Label2: TLabel;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    procedure Edit1Change(Sender: TObject);
    procedure btn_InserirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmManEditora: TFrmManEditora;

implementation

{$R *.dfm}

uses UntDM;

procedure TFrmManEditora.btn_InserirClick(Sender: TObject);
begin
DM.ADODSEditora.Insert;
FrmManEditora.btn_alterar.Enabled:= True;

end;

procedure TFrmManEditora.Edit1Change(Sender: TObject);
begin
DM.ADODSEditora.Locate('Nome', Edit1.Text, [loCaseInsensitive, loPartialKey]);
end;

end.
