unit uFrameInversor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFramePlanta, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TfrmInversorFrame = class(TFrame)
    frmPlantasInv: TfrmPlantas;
    grpInversor: TGroupBox;
    edtNomePlanta: TEdit;
    lbledtCodPlanta: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
