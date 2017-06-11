unit usaiaCalcFormP;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls, FMX.EditBox, FMX.NumberBox;

type
  TfrmsaiaCalcP = class(TForm)
    GroupBox1: TGroupBox;
    btnClose: TButton;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox3: TGroupBox;
    ToolBar1: TToolBar;
    Label5: TLabel;
    ToolBar2: TToolBar;
    btnTireToMachine: TButton;
    ToolBar3: TToolBar;
    swchTireLocation: TSwitch;
    lblTireLocation: TLabel;
    fldTireSA: TNumberBox;
    fldTireIA: TNumberBox;
    btnMachineToTire: TButton;
    Label3: TLabel;
    fldMachineSA: TNumberBox;
    Label4: TLabel;
    fldMachineIA: TNumberBox;
    ImageControl1: TImageControl;
    procedure btnCloseClick(Sender: TObject);
    procedure btnTireToMachineClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure swchTireLocationSwitch(Sender: TObject);
    procedure fldTireSAClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnMachineToTireClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmsaiaCalcP: TfrmsaiaCalcP;

implementation
uses usaiaCalc;

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.Windows.fmx MSWINDOWS}

procedure TfrmsaiaCalcP.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmsaiaCalcP.btnMachineToTireClick(Sender: TObject);
var tmpRes: TTuple<double, double>;
    aSA: double;
    aIA: double;
    lIA: double;
begin
  aSA := fldMachineSA.Value;
  aIA := fldMachineIA.Value;
  if not aSA.IsNan and not aIA.IsNan then
  begin
    tmpRes := Determine_dSA_dIA(aSA, aIA);
    lIA := tmpRes.IAval;
    fldTireSA.Value := tmpRes.SAval;
    if not swchTireLocation.IsChecked then
      lIA := -lIA;
    fldTireIA.Value := lIA;
  end;
end;

procedure TfrmsaiaCalcP.btnTireToMachineClick(Sender: TObject);
var tmpRes: TTuple<double, double>;
    dSA: double;
    dIA: double;
    lIA: double;
begin
  dSA := fldTireSA.Value;
  dIA := fldTireIA.Value;
  if not dSA.IsNan and not dIA.IsNan then
  begin
    tmpRes := Determine_SAo_IAo(dSA, dIA);
    lIA := tmpRes.IAval;
    fldMachineSA.Value := tmpRes.SAval;
    if not swchTireLocation.IsChecked then
      lIA := -lIA;
    fldMachineIA.Value := lIA;
  end;
end;

procedure TfrmsaiaCalcP.fldTireSAClick(Sender: TObject);
begin
  (Sender as TNumberBox).SelectAll;
end;

procedure TfrmsaiaCalcP.FormCreate(Sender: TObject);
begin
  fldTireSA.Value := 0;
  fldTireIA.Value := 0;
  fldMachineSA.Value := 0;
  fldMachineIA.Value := 0;
end;

procedure TfrmsaiaCalcP.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
{$ifdef ANDROID}
  if Key = vkHardwareBack then
    Key := 0; // avoid the default back action.
{$endif}
end;

procedure TfrmsaiaCalcP.swchTireLocationSwitch(Sender: TObject);
begin
  if (sender as TSwitch).IsChecked then
    lblTireLocation.Text := 'Tire Location: Right Front'
  else
    lblTireLocation.Text := 'Tire Location: Left Front';
end;

end.
