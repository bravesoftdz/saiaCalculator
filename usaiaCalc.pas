unit usaiaCalc;

interface

type
  TTuple<T1, T2> = record
    SAval: T1;
    IAval: T2;
    constructor create(aSAval: T1; aIAval: T2);
  end;

 function Determine_SAo_IAo(dSA, dIA: Double): TTuple<Double, Double>;
 function Determine_dSA_dIA(aMachine: TTuple<double, double>): TTuple<double, double>;


implementation
uses System.Math;

constructor TTuple<T1, T2>.Create(aSAval: T1; aIAval: T2);
begin
  SAval := aSAval;
  IAval := aIAval;
end;

function Determine_SAo_IAo(dSA, dIA: Double): TTuple<Double, Double>;
var i : integer;
    dSArad,
    dIArad,
    aSArad,
    aIArad: Double;
    aSA, aIA: Double;
begin
  dSArad := dSA * pi / 180;
  dIArad := dIA * pi / 180;
  aSArad := dSArad;
  aIArad := dIArad;
  for i := 1 to 10 do        // Iterative calculation
  begin
    aIArad := ArcTan(Tan(dIArad) / Cos(aSArad));
    aSArad := ArcTan(Tan(dSArad) * Cos(aIArad));
  end;
  aSA := aSArad * 180 / pi;
  aIA := aIArad * 180 / pi;
  result := TTuple<double, double>.Create(aSA, aIA);
end;

function Determine_dSA_dIA(aMachine: TTuple<double, double>): TTuple<double, double>;
var dSA,
    dIA: double;

    aSA,
    aIA: double;

    aSArad,
    aIArad,
    dSArad,
    dIArad: double;
begin
  aSA := aMachine.SAval;
  aIA := aMachine.IAval;
  aSArad := aSA * pi / 180;
  aIArad := aIA * pi / 180;

  dSArad := ArcTan(Tan(aSArad) / Cos(aIArad));
  dIArad := ArcTan(Tan(aIArad) * Cos(aSArad));

  dSA := dSArad * 180 / pi;
  dIA := dIArad * 180 / pi;

  result := TTuple<double, double>.Create(dSA, dIA);
end;

end.
