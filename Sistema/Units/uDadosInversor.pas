unit uDadosInversor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, uFrameInversor, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Vcl.StdCtrls, System.Win.ComObj;

type
  TfrmDadosInversor = class(TForm)
    pnlInversor: TPanel;
    dbgrdListaDadosInversor: TDBGrid;
    cdsListaDadosInversor: TClientDataSet;
    dsListaDadosInversor: TDataSource;
    cdsListaDadosInversorDataHoraLeitura: TDateTimeField;
    cdsListaDadosInversorModoOperacao: TStringField;
    cdsListaDadosInversorvmppt1v: TFloatField;
    cdsListaDadosInversorimppt1a: TFloatField;
    cdsListaDadosInversorUAV: TFloatField;
    cdsListaDadosInversoriac1a: TFloatField;
    cdsListaDadosInversorfac1hz: TFloatField;
    cdsListaDadosInversorpotencia: TFloatField;
    cdsListaDadosInversortemperatura: TFloatField;
    cdsListaDadosInversorproducao_dia: TFloatField;
    cdsListaDadosInversorgeracao_total: TFloatField;
    cdsListaDadosInversorh_total: TIntegerField;
    cdsListaDadosInversorrssi: TIntegerField;
    cdsListaDadosInversorpf: TFloatField;
    cdsListaDadosInversorreactive_power: TFloatField;
    cdsListaDadosInversorleakageCurrentMA: TIntegerField;
    cdsListaDadosInversorisolimit: TIntegerField;
    btnCarregarArquivo: TButton;
    dlgOpenXls: TOpenDialog;
    strngrd1: TStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CarregarDadosInversor(uFrameInversor,Planta:Integer);
    procedure FormActivate(Sender: TObject);
    procedure CarregarDadosLeitura(pDataLeitura:TDateTime;pModoOperacao:String;
                                   vMppt,iMppt,vUav,vIac,vFac1hz,vPotencia,
                                   vTemperatura,vProducaoDia,
                                   vGeracaoTotal,vPF,vReactivePower:Double;
                                   vHTotal,vRSSI,vCorrenteFuga,vISO:Integer);
    procedure btnCarregarArquivoClick(Sender: TObject);
    procedure CarregarArquivo(AGrid: TStringGrid; AXLSFile: string; WorkSheet: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDadosInversor: TfrmDadosInversor;

implementation

uses
  uDados, uFormularios;

{$R *.dfm}

procedure TfrmDadosInversor.btnCarregarArquivoClick(Sender: TObject);
begin
  if (dlgOpenXls.Execute) then
    CarregarArquivo(strngrd1,dlgOpenXls.FileName,1);
end;

procedure TfrmDadosInversor.CarregarArquivo(AGrid: TStringGrid; AXLSFile: string; WorkSheet: Integer);
const
	xlCellTypeLastCell = $0000000B;
var
	XLApp, Sheet: OLEVariant;
	RangeMatrix: Variant;
	x, y, k, r: Integer;
begin
  XLApp  := CreateOleObject('Excel.Application');
  try
    XLApp.Visible   :=  False;
    XLApp.Workbooks.Open(AXLSFile);
    XLApp.Workbooks[ExtractFileName(AXLSFile)].WorkSheets[WorkSheet].Activate;
    Sheet           :=  XLApp.Workbooks[ExtractFileName(AXLSFile)].WorkSheets[WorkSheet];
    Sheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Select;
    x               :=  XLApp.ActiveCell.Row;
    y               :=  XLApp.ActiveCell.Column;
    AGrid.RowCount  :=  x;
    AGrid.ColCount  :=  y;
    RangeMatrix     :=  XLApp.Range['A1', XLApp.Cells.Item[X, Y]].Value;
    k:=1;
    repeat
      for r:=1 to y do
      begin
        AGrid.Cells[(r - 1),(k - 1)] := RangeMatrix[K, R];
        If (AGrid.ColWidths[r-1] < (Length(AGrid.Cells[(r - 1),(k - 1)]) * 8)) then
          AGrid.ColWidths[r-1] := Length(AGrid.Cells[(r - 1),(k - 1)]) * 8;
      end;
      Inc(k,1);
    until k > x;
    RangeMatrix := Unassigned;
  finally
    if not VarIsEmpty(XLApp) then
    begin
      XLApp.Quit;
      XLAPP:=Unassigned;
      Sheet:=Unassigned;
    end;
  end;
end;


procedure TfrmDadosInversor.CarregarDadosInversor(uFrameInversor,
  Planta: Integer);
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
    SQL.Add('SELECT * FROM DADOS_INVERSOR');
    Open;
    First;
    FetchAll;
    CriaDataSet(cdsListaDadosInversor);
    while not Eof do
    begin
      CarregarDadosLeitura(
        FieldByName('DATA_HORA_LEITURA').AsDateTime,
        FieldByName('MODO_OPERACAO').AsString,
        FieldByName('V_MPPT_1(V)').AsFloat,
        FieldByName('I_MPPT_1(A)').AsFloat,
        FieldByName('UAV').AsFloat,
        FieldByName('I_AC_1(A)').AsFloat,
        FieldByName('F_AC_1(HZ)').AsFloat,
        FieldByName('POTENCIA').AsFloat,
        FieldByName('TEMPERATURA').AsFloat,
        FieldByName('PRODUCAO_DIA').AsFloat,
        FieldByName('GERACAO_TOTAL').AsFloat,
        FieldByName('PF').AsFloat,
        FieldByName('REACTIVE_POWER').AsFloat,
        FieldByName('H_TOTAL').AsInteger,
        FieldByName('RSSI').AsInteger,
        FieldByName('LEAKAGE_CURRENT(MA)').AsInteger,
        FieldByName('ISO_LIMIT').AsInteger
      );
      Next;
    end;
  end;
  FreeAndNil(zqLista);
end;

procedure TfrmDadosInversor.CarregarDadosLeitura(pDataLeitura: TDateTime;
  pModoOperacao: String; vMppt,iMppt,vUav,vIac,vFac1hz,vPotencia,vTemperatura,
  vProducaoDia,vGeracaoTotal,vPF,vReactivePower: Double;vHTotal,vRSSI,
  vCorrenteFuga,vISO:Integer);
begin
  cdsListaDadosInversor.Append;
  cdsListaDadosInversorDataHoraLeitura.AsDateTime :=  pDataLeitura;
  cdsListaDadosInversorModoOperacao.AsString      :=  pModoOperacao;
  cdsListaDadosInversorvmppt1v.AsFloat            :=  vMppt;
  cdsListaDadosInversorimppt1a.AsFloat            :=  iMppt;
  cdsListaDadosInversorUAV.AsFloat                :=  vUav;
  cdsListaDadosInversoriac1a.AsFloat              :=  vIac;
  cdsListaDadosInversorfac1hz.AsFloat             :=  vFac1hz;
  cdsListaDadosInversorpotencia.AsFloat           :=  vPotencia;
  cdsListaDadosInversortemperatura.AsFloat        :=  vTemperatura;
  cdsListaDadosInversorproducao_dia.AsFloat       :=  vProducaoDia;
  cdsListaDadosInversorgeracao_total.AsFloat      :=  vGeracaoTotal;
  cdsListaDadosInversorh_total.AsInteger          :=  vHTotal;
  cdsListaDadosInversorrssi.AsInteger             :=  vRSSI;
  cdsListaDadosInversorpf.AsFloat                 :=  vPF;
  cdsListaDadosInversorreactive_power.AsFloat     :=  vReactivePower;
  cdsListaDadosInversorleakageCurrentMA.AsInteger :=  vCorrenteFuga;
  cdsListaDadosInversorisolimit.AsInteger         :=  vISO;
  cdsListaDadosInversor.Post;
end;

procedure TfrmDadosInversor.FormActivate(Sender: TObject);
begin
  CarregarDadosInversor(0,0);
end;

procedure TfrmDadosInversor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action            :=  TCloseAction.caFree;
  frmDadosInversor  :=  nil;
end;

end.
