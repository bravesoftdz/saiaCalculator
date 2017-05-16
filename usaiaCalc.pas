unit usaiaCalc;

interface

type
  TTuple<T1, T2> = record
    Value1: T1;
    Value2: T2;
    constructor create(aValue1: T1; aValue2: T2);
  end;

 function Determine_SAo_IAo(dSA, dIA: Double): TTuple<Double, Double>;


implementation
uses System.Math;

constructor TTuple<T1, T2>.Create(aValue1: T1; aValue2: T2);
begin
  Value1 := aValue1;
  Value2 := aValue2;
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
    aSArad := ArcTan(Tan(dSArad) / Cos(aIArad));
  end;
  aSA := aSArad * 180 / pi;
  aIA := aIArad * 180 / pi;
  result := TTuple<double, double>.Create(aSA, aIA);
end;


end.
