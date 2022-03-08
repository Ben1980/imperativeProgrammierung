program WertePolynomAus (input, output);
{ Wertet ein Polynom aus das aus einer verketteten Liste von Monomen besteht }
    type
    tZahl = 0..maxint;
    tRefPolynom = ^tPolynom;
    tPolynom = record
                koeffizient: integer;
                grad: tZahl;
                next: tRefPolynom;
            end;
            
    var
    polynom : tRefPolynom;
    ergebniss : integer;

    procedure Anfuegen (var ioPolynom : tRefPolynom;
                        inKoeffizient : integer;
                        inGrad: tZahl);
    { Fügt ein Monom an ein Polynom an }
    begin
    end;
    
    function PolynomAuswerten (var ioPolynom : tRefPolynom;
                            inI : integer) : integer;
    { Wertet das Polynom mit x=i aus }
    begin
    end;

begin
    New (polynom);
    Anfuegen(polynom, 17, 0);
    Anfuegen(polynom, 7, 5);
    Anfuegen(polynom, 3, 2);
    
    ergebniss := PolynomAuswerten(polynom, 2);
    writeln('Das Ergebniss des Polynoms ist: ', ergebniss);
end.
