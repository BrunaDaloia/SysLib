program Biblioteca;

uses
  Vcl.Forms,
  UntMenuPrincipal in 'UntMenuPrincipal.pas' {menuPrincipal},
  UntDM in 'UntDM.pas' {DM: TDataModule},
  UntPesqAutor in 'UntPesqAutor.pas' {FrmManAutor},
  UntPesqUsuario in 'UntPesqUsuario.pas' {FrmUsuario},
  UntPesqMaterial in 'UntPesqMaterial.pas' {FrmManMaterial},
  UntPesqAcervo in 'UntPesqAcervo.pas' {FrmPesqAcervo},
  UntPesqAssunto in 'UntPesqAssunto.pas' {FrmManAssunto},
  UntCadUsuario1 in 'UntCadUsuario1.pas' {FrmCadUsuario},
  UnitPesqEditora in 'UnitPesqEditora.pas' {FrmMnEditora},
  UntCadAcervo in 'UntCadAcervo.pas' {FrmCadAcervo},
  UntCadAutor in 'UntCadAutor.pas' {FrmCadAutor},
  UntCadAssunto in 'UntCadAssunto.pas' {FrmCadAssunto},
  UntCadEditora in 'UntCadEditora.pas' {FrmCadEditora},
  UntCadMaterial in 'UntCadMaterial.pas' {FrmCadMaterial},
  UntEmprestimo in 'UntEmprestimo.pas' {FrmEmprestimo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TmenuPrincipal, menuPrincipal);
  Application.Run;
end.
