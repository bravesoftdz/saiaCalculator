unit usaiaCalcFormL;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.Ani;

type
  TfrmsaiaCalcL = class(TForm)
    ToolBar1: TToolBar;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    fldTireSA: TEdit;
    fldTireIA: TEdit;
    GroupBox3: TGroupBox;
    fldMachineSA: TEdit;
    fldMachineIA: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    btnClose: TButton;
    Label1: TLabel;
    Label2: TLabel;
    ToolBar2: TToolBar;
    GroupBox2: TGroupBox;
    rbLeft: TRadioButton;
    rbRight: TRadioButton;
    btnDecouple: TButton;
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure fldTireSAClick(Sender: TObject);
    procedure btnDecoupleClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmsaiaCalcL: TfrmsaiaCalcL;

implementation
uses usaiaCalcFormP, usaiaCalc;
{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.Windows.fmx MSWINDOWS}

procedure TfrmsaiaCalcL.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmsaiaCalcL.btnDecoupleClick(Sender: TObject);
var tmpRes: TTuple<double, double>;
    dSA,
    dIA: string;
    lIA: double;
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
  end;
end;

procedure TfrmsaiaCalcL.fldTireSAClick(Sender: TObject);
begin
  (Sender as TEdit).SelectAll;
end;

procedure TfrmsaiaCalcL.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
{$ifdef ANDROID}
  if Key = vkHardwareBack then
    Key := 0; // avoid the default back action.
{$endif}
end;

procedure TfrmsaiaCalcL.FormResize(Sender: TObject);
begin
{$ifdef ANDROID}
  if (Height > Width) and (Visible) and Assigned(frmsaiaCalcP) then
  begin
    frmsaiaCalcP.fldTireSA.Text := fldTireSA.Text;
    frmsaiaCalcP.fldTireIA.Text := fldTireIA.Text;
    frmsaiaCalcP.rbLeft.IsChecked := rbLeft.IsChecked;
    frmsaiaCalcP.rbRight.IsChecked := rbRight.IsChecked;
    frmsaiaCalcP.fldMachineSA.Text := fldMachineSA.Text;
    frmsaiaCalcP.fldMachineIA.Text := fldMachineIA.Text;
    frmsaiaCalcP.Show;
//    Hide;
  end;
{$endif}
end;

end.
