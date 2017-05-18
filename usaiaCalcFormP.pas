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
    procedure btnCloseClick(Sender: TObject);
    procedure btnDecoupleClick(Sender: TObject);
    procedure fldTireSAClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
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
begin
  dSA := fldTireSA.Text;
  dIA := fldTireIA.Text;
  if not dSA.IsEmpty and not dIA.IsEmpty then
  begin
    tmpRes := Determine_SAo_IAo(dSA.ToDouble, dIA.ToDouble);
    lIA := tmpRes.Value2;
    fldMachineSA.Text := format('%0.5f',[tmpRes.Value1]);
    if rbLeft.IsChecked then
      lIA := -lIA;
    fldMachineIA.Text := format('%0.5f',[lIA]);
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

procedure TfrmsaiaCalcP.FormResize(Sender: TObject);
begin
{$ifdef ANDROID}
  if (Height < Width) and (Visible) and Assigned(frmsaiaCalcL) then
  begin
    frmsaiaCalcL.fldTireSA.Text := fldTireSA.Text;
    frmsaiaCalcL.fldTireIA.Text := fldTireIA.Text;
    frmsaiaCalcL.rbLeft.IsChecked := rbLeft.IsChecked;
    frmsaiaCalcL.rbRight.IsChecked := rbRight.IsChecked;
    frmsaiaCalcL.fldMachineSA.Text := fldMachineSA.Text;
    frmsaiaCalcL.fldMachineIA.Text := fldMachineIA.Text;
    frmsaiaCalcL.Show;
//    Hide;
  end;
{$endif}
end;

end.
