unit uFormularios;

interface

uses
  Vcl.Forms, Vcl.Dialogs, System.Classes, Datasnap.DBClient, System.SysUtils,
  Winapi.Windows;

procedure CriaForm(InstanceClass: TComponentClass; var Reference; pCaption:String);
procedure CriaDataSet(pDataSet:TClientDataSet);
procedure Mensagem(pTexto:String;pTipoMensagem:Integer);

function  StringSql(pTexto:String;pMaiuscula:Boolean=True):String;

implementation

procedure CriaForm(InstanceClass: TComponentClass; var Reference; pCaption:String);
begin
  Application.CreateForm(InstanceClass,Reference);
  TForm(Reference).Caption  :=  pCaption;
  TForm(Reference).Show;
end;

procedure CriaDataSet(pDataSet:TClientDataSet);
begin
  pDataSet.Close;
  pDataSet.CreateDataSet;
  pDataSet.Open;
end;

function  StringSql(pTexto:String;pMaiuscula:Boolean=True):String;
begin
  if (pTexto = '') then
    Result  :=  'NULL'
  else
    Result  :=  Chr(39) + pTexto  + Chr(39);
  if pMaiuscula then
    Result  :=  AnsiUpperCase(Result);
end;

procedure Mensagem(pTexto:String;pTipoMensagem:Integer);
begin
  case pTipoMensagem of
    1:Application.MessageBox(PChar(pTexto), 'Warning', MB_OK + MB_ICONWARNING);
  end;
end;

end.
