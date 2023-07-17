
unit uFramePlanta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfrmPlantas = class(TFrame)
    lbledtCodPlanta: TLabeledEdit;
    grpPlantas: TGroupBox;
    edtNomePlanta: TEdit;
    procedure SetCodigo(pCodigo:Integer);

    function  GetCodigo:Integer;
    function  GetNomePlanta:String; overload;
    procedure lbledtCodPlantaExit(Sender: TObject);
    procedure lbledtCodPlantaKeyPress(Sender: TObject; var Key: Char);
  private
    function  GetNomePlanta(pCodigo:Integer):String; overload;
  public
    { Public declarations }
  end;

implementation

uses
  uDados;

{$R *.dfm}

function TfrmPlantas.GetCodigo: Integer;
begin
  Result  :=  StrToIntDef(lbledtCodPlanta.Text,0);
end;

function TfrmPlantas.GetNomePlanta(pCodigo: Integer): String;
var
  zqNome:TZQuery;
begin
  zqNome        :=  TZQuery.Create(nil);
  with zqNome do
  begin
    Connection  :=  Dados.conDados;
    if Active then
      Close;
    SQL.Clear;
    SQL.Add(' SELECT NOME_PLANTA FROM PLANTAS WHERE ID = :ID ');
    ParamByName('ID').AsInteger :=  pCodigo;
    Open;
    First;
    FetchAll;
    Result      :=  Fields[0].AsString;
  end;
  FreeAndNil(zqNome);
end;

function TfrmPlantas.GetNomePlanta: String;
begin
  Result  :=  edtNomePlanta.Text;
end;

procedure TfrmPlantas.lbledtCodPlantaExit(Sender: TObject);
begin
  SetCodigo(StrToIntDef(lbledtCodPlanta.Text,0));
end;

procedure TfrmPlantas.lbledtCodPlantaKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    SetCodigo(StrToIntDef(lbledtCodPlanta.Text,0));
end;

procedure TfrmPlantas.SetCodigo(pCodigo: Integer);
begin
  lbledtCodPlanta.Text  :=  IntToStr(pCodigo);
  edtNomePlanta.Text    :=  GetNomePlanta(pCodigo);
end;

end.
