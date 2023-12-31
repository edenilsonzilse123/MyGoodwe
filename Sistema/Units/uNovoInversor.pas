unit uNovoInversor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFramePlanta, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TfrmInversor = class(TForm)
    frmPlanta: TfrmPlantas;
    pnlCadInversor: TPanel;
    dbgrdListaInversor: TDBGrid;
    lbledtNomeInversor: TLabeledEdit;
    cdsListaInversores: TClientDataSet;
    dsListaInversores: TDataSource;
    cdsListaInversoresId: TIntegerField;
    cdsListaInversoresNomePlanta: TStringField;
    cdsListaInversoresNomeInversor: TStringField;
    cdsListaInversoresIdPlanta: TIntegerField;
    btnAdicionar: TButton;
    btnNovo: TButton;
    btnEditar: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListarInversores;
    procedure FormActivate(Sender: TObject);
    procedure dbgrdListaInversorDblClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInversor: TfrmInversor;
  vCodigoInversor:Integer = 0;

implementation

uses
  uDados, uFormularios;

{$R *.dfm}

procedure TfrmInversor.btnAdicionarClick(Sender: TObject);
var
  vCampos,vValores,vTabela,vCondicao:String;
const
  cMensagens:Array[0..1] of String = (
    'Voc� deve selecionar uma planta de produ��o.',
    'Voc� deve digitar um nome para o inversor.');
begin
  if (frmPlanta.GetCodigo = 0) then
  begin
    Mensagem(cMensagens[0],1);
    Abort;
  end;
  if (lbledtNomeInversor.Text = '') then
  begin
    Mensagem(cMensagens[1],1);
    Abort;
  end;
  vCampos     :=  EmptyStr;
  vValores    :=  EmptyStr;
  vCondicao   :=  EmptyStr;
  vTabela     :=  'INVERSORES';
  if (vCodigoInversor = 0) then
  begin
    vCampos   :=  'PLANTA,NOME_INVERSOR';
    vValores  :=  IntToStr(frmPlanta.GetCodigo)       + ',' +
                  StringSql(lbledtNomeInversor.Text)  ;
    Dados.SqlInsere(vTabela,vCampos,vValores);
  end
  else
  begin
    vValores  :=  'PLANTA = '         + IntToStr(frmPlanta.GetCodigo) + ',' +
                  'NOME_INVERSOR = '  + StringSql(lbledtNomeInversor.Text);
    vCondicao :=  ' AND ID = '        + IntToStr(vCodigoInversor);
    Dados.SqlAtualiza(vTabela,vValores,vCondicao);
  end;
  ListarInversores;
end;

procedure TfrmInversor.dbgrdListaInversorDblClick(Sender: TObject);
begin
  frmPlanta.SetCodigo(cdsListaInversoresIdPlanta.AsInteger);
  lbledtNomeInversor.Text :=  cdsListaInversoresNomeInversor.AsString;
  vCodigoInversor         :=  cdsListaInversoresId.AsInteger;
end;

procedure TfrmInversor.FormActivate(Sender: TObject);
begin
  ListarInversores;
end;

procedure TfrmInversor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action      :=  TCloseAction.caFree;
  frmInversor :=  nil;
end;

procedure TfrmInversor.ListarInversores;
var
  zqLista:TZQuery;
begin
  zqLista :=  TZQuery.Create(nil);
  with zqLista do
  begin
    Connection  :=  Dados.conDados;
    if Active then
      Close;
    SQL.Clear;
    SQL.Add('SELECT I.*,P.ID AS IDP,P.NOME_PLANTA FROM INVERSORES AS I');
    SQL.Add('INNER JOIN PLANTAS P ON I.PLANTA = P.ID');
    Open;
    First;
    FetchAll;
    CriaDataSet(cdsListaInversores);
    while not Eof do
    begin
      cdsListaInversores.Append;
      cdsListaInversoresId.AsInteger          :=  FieldByName('ID').AsInteger;
      cdsListaInversoresNomePlanta.AsString   :=
                                            FieldByName('NOME_PLANTA').AsString;
      cdsListaInversoresNomeInversor.AsString :=
                                          FieldByName('NOME_INVERSOR').AsString;
      cdsListaInversoresIdPlanta.AsInteger    :=  FieldByName('IDP').AsInteger;
      cdsListaInversores.Post;
      Next;
    end;
  end;
  FreeAndNil(zqLista);
end;

end.
