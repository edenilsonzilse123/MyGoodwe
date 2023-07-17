unit uDados;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Dialogs;

type
  TDados = class(TDataModule)
    conDados: TZConnection;
    procedure SqlInsere(pTabela,pCampos,pValores:String);
    procedure SqlAtualiza(pTabela,pValores,pCondicao:String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dados: TDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDados.SqlAtualiza(pTabela, pValores, pCondicao: String);
var
  zqLista:TZQuery;
begin
  try
    zqLista :=  TZQuery.Create(nil);
    with zqLista do
    begin
      Connection  :=  Dados.conDados;
      if Active then
        Close;
      SQL.Clear;
      SQL.Add('UPDATE '  + pTabela + ' SET '  + pValores  + ' WHERE 1=1 ' +
              pCondicao);
      ExecSQL;
    end;
  except
    on E:Exception do
      ShowMessage('N�o foi poss�vel inserir este registro.' + E.Message);
  end;
  FreeAndNil(zqLista);
end;

procedure TDados.SqlInsere(pTabela, pCampos, pValores: String);
var
  zqLista:TZQuery;
begin
  try
    zqLista :=  TZQuery.Create(nil);
    with zqLista do
    begin
      Connection  :=  Dados.conDados;
      if Active then
        Close;
      SQL.Clear;
      SQL.Add('INSERT INTO '  + pTabela + ' ('  + pCampos + ') VALUES ('  +
              pValores  + ')');
      ExecSQL;
    end;
  except
    on E:Exception do
      ShowMessage('N�o foi poss�vel inserir este registro.' + E.Message);
  end;
  FreeAndNil(zqLista);
end;

end.
