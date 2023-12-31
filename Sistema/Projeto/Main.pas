unit MAIN;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.Menus, Vcl.StdCtrls, Vcl.Dialogs, Vcl.Buttons, Winapi.Messages,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdActns, Vcl.ActnList, Vcl.ToolWin,
  Vcl.ImgList, System.ImageList, System.Actions;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    FileNewItem: TMenuItem;
    OpenDialog: TOpenDialog;
    StatusBar: TStatusBar;
    ActionList1: TActionList;
    NovaPlanta: TEditPaste;
    ToolBar2: TToolBar;
    ImageList1: TImageList;
    actNovoInversor: TAction;
    Novoinversor1: TMenuItem;
    actDadosInversor: TAction;
    Inserirdadosdeinversores1: TMenuItem;
    procedure NovaPlantaExecute(Sender: TObject);
    procedure actNovoInversorExecute(Sender: TObject);
    procedure actDadosInversorExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

const
  cTitulos:Array [0..2] of String = ('Nova planta de gera��o',
    'Novo inversor na planta','Dados do inversor');

implementation

uses
  uNovaPlanta, uFormularios, uNovoInversor, uDadosInversor;

{$R *.dfm}

procedure TMainForm.actDadosInversorExecute(Sender: TObject);
begin
  CriaForm(TfrmDadosInversor,frmDadosInversor,cTitulos[2]);
end;

procedure TMainForm.actNovoInversorExecute(Sender: TObject);
begin
  CriaForm(TfrmInversor,frmInversor,cTitulos[1]);
end;

procedure TMainForm.NovaPlantaExecute(Sender: TObject);
begin
  CriaForm(TfrmNovaPlanta,frmNovaPlanta,cTitulos[0]);
end;

end.
