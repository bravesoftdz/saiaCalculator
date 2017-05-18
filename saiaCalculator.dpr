program saiaCalculator;

uses
  System.StartUpCopy,
  FMX.Forms,
  usaiaCalcFormP in 'usaiaCalcFormP.pas' {frmsaiaCalcP},
  usaiaCalc in 'usaiaCalc.pas',
  usaiaCalcFormL in 'usaiaCalcFormL.pas' {frmsaiaCalcL};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmsaiaCalcP, frmsaiaCalcP);
  Application.CreateForm(TfrmsaiaCalcL, frmsaiaCalcL);
  Application.Run;
end.
