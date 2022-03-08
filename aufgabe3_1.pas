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

begin

end.
