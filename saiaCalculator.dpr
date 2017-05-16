program saiaCalculator;

uses
  System.StartUpCopy,
  FMX.Forms,
  usaiaCalcForm in 'usaiaCalcForm.pas' {frmsaiaCalc},
  usaiaCalc in 'usaiaCalc.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmsaiaCalc, frmsaiaCalc);
  Application.Run;
end.
