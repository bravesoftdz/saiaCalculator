program saiaCalculator;

uses
  System.StartUpCopy,
  FMX.Forms,
  usaiaCalcFormP in 'usaiaCalcFormP.pas' {frmsaiaCalcP},
  usaiaCalc in 'usaiaCalc.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(TfrmsaiaCalcP, frmsaiaCalcP);
  Application.Run;
end.
