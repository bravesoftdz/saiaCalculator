unit usaiaCalcFormP;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfrmsaiaCalcP = class(TForm)
    GroupBox1: TGroupBox;
    fldTireSA: TEdit;
    fldTireIA: TEdit;
    btnClose: TButton;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox3: TGroupBox;
    fldMachineSA: TEdit;
    fldMachineIA: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    ToolBar1: TToolBar;
    Label5: TLabel;
    ToolBar2: TToolBar;
    btnDecouple: TButton;
    ToolBar3: TToolBar;
    GroupBox2: TGroupBox;
    rbLeft: TRadioButton;
    rbRight: TRadioButton;
    GroupBox4: TGroupBox;
    fldTireSAdbg: TEdit;
    fldTireIAdbg: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure btnDecoupleClick(Sender: TObject);
    procedure fldTireSAClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmsaiaCalcP: TfrmsaiaCalcP;

implementation
uses usaiaCalcFormL, usaiaCalc;

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.Windows.fmx MSWINDOWS}

procedure TfrmsaiaCalcP.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmsaiaCalcP.btnDecoupleClick(Sender: TObject);
var tmpRes: TTuple<double, double>;
    dSA,
    dIA: string;
    lIA: double;
    tmpDebug: TTuple<double, double>;
begin
  dSA := fldTireSA.Text;
  dIA := fldTireIA.Text;
  if not dSA.IsEmpty and not dIA.IsEmpty then
  begin
    tmpRes := Determine_SAo_IAo(dSA.ToDouble, dIA.ToDouble);
    lIA := tmpRes.IAval;
    fldMachineSA.Text := format('%0.5f',[tmpRes.SAval]);
    if rbLeft.IsChecked then
      lIA := -lIA;
    fldMachineIA.Text := format('%0.5f',[lIA]);
    tmpDebug := Determine_dSA_dIA(tmpRes);
    fldTireSAdbg.Text := format('%0.5f',[tmpDebug.SAval]);
    fldTireIAdbg.Text := format('%0.5f',[tmpDebug.IAval]);
  end;
end;

procedure TfrmsaiaCalcP.fldTireSAClick(Sender: TObject);
begin
  (Sender as TEdit).SelectAll;
end;

procedure TfrmsaiaCalcP.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
{$ifdef ANDROID}
  if Key = vkHardwareBack then
    Key := 0; // avoid the default back action.
{$endif}
end;

end.
