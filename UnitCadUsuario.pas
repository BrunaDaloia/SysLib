unit UnitCadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList;

type
  TFrmUsuario = class(TForm)
    Dis: TImageList;
    Hot: TImageList;
    Normal: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUsuario: TFrmUsuario;

implementation

{$R *.dfm}

end.
