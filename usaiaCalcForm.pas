unit usaiaCalcForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfrmsaiaCalc = class(TForm)
    GroupBox1: TGroupBox;
    fldTireSA: TEdit;
    fldTireIA: TEdit;
    btnClose: TButton;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    rbLeft: TRadioButton;
    rbRight: TRadioButton;
    btnDecouple: TButton;
    GroupBox3: TGroupBox;
    fldMachineSA: TEdit;
    fldMachineIA: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure btnDecoupleClick(Sender: TObject);
    procedure fldTireSAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmsaiaCalc: TfrmsaiaCalc;

implementation
uses usaiaCalc;

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.SmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TfrmsaiaCalc.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmsaiaCalc.btnDecoupleClick(Sender: TObject);
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

procedure TfrmsaiaCalc.fldTireSAClick(Sender: TObject);
begin
  (Sender as TEdit).SelectAll;
end;

end.
