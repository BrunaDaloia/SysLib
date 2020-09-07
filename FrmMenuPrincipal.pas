unit FrmMenuPrincipal;

interface

uses WinApi.Windows, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    OKButton: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.dfm}

procedure TAboutBox.FormCreate(Sender: TObject);
const
  Infostr: array[1..5] of string =
     ('ProductName', 'FileVersion', 'LegalCopyright', 'Comments', 'Website');
     var
     TamVer: Integer;
     Dummy: DWord;
     Tam: UINT;
     VerInfo: PChar;
     Translation : Pointer;
     VerBegin : String;
     PosAtu : integer;
     Comment: String;
     Valor: Pointer;
begin
  TamVer := getFileVersionInfoSize (Pchar (ParamStr(0)), Dummy);
  if TamVer > 0  then
  begin
    GetMem(VerInfo, TamVer);
    GetFileVersionInfo (Pchar(ParamStr(0)), 0, TamVer, VerInfo);
    VerQueryValue(VerInfo, '\\VarFileInfo\\Translaction', Translation, Tam);
    VerBegin := '\\StringFileInfo\\' +
    IntToHex(LoWord(LongInt(Translation^)), 4) +
    IntToHex(HiWord(LongInt(Translation^)), 4) + '\\';

    if VerQueryValue (VerInfo, PChar(VerBegin + InfoStr[1]), Valor, Tam) then
    ProductName.Caption:= String (PChar(Valor));
    if VerQueryValue (VerInfo, PChar (VerBegin+InfoStr[2]), Valor, Tam) then
    version.Caption := 'Versão' + String(PChar(Valor));
    if VerQueryValue (VerInfo, PChar(VerBegin + InfoStr[3]), Valor, Tam) then
    Copyright.Caption:= String (PChar(Valor));
    if VerQueryValue (VerInfo, PChar(VerBegin + InfoStr[4]), Valor, Tam) then
    Comment:= String (PChar(Valor));
    PosAtu:= Pos('#', Comment);
    Delete (Comment, PosAtu, 1);
    Insert(#13, Comment, PosAtu);
    Comments.Caption:= Comment;
  end;
  FreeMem(VerInfo, TamVer);


end;

end.
 
