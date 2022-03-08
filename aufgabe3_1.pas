program WertePolynomAus (input, output);
{ Wertet ein Polynom aus das aus einer verketteten Liste von Monomen besteht }
    
    Uses Math;

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
        var
        monom : tRefPolynom;
        start : tRefPolynom;
        
    begin 
        start := ioPolynom;
        
        New (monom);
        monom^.koeffizient := inKoeffizient;
        monom^.grad := inGrad;
        monom^.next := nil;
        
        while ioPolynom <> nil do
        begin
            ioPolynom := ioPolynom^.next;
        end;
        
        ioPolynom^.next := monom;
        ioPolynom := start;
    end;
    
    function PolynomAuswerten (var ioPolynom : tRefPolynom;
                            inI : integer) : integer;
    { Wertet das Polynom mit x=i aus }

        var
        pow,
        result : integer;
        i : tZahl;
        
    begin
        result := 0;
        while ioPolynom^.next <> nil do
        begin
            pow := inI;
            
            for i := 1 to ioPolynom^.grad do
                pow := pow + inI;
            
            writeln(ioPolynom^.koeffizient,'*',inI,'^',ioPolynom^.grad);
        
            result := result + ioPolynom^.koeffizient*pow;
            ioPolynom := ioPolynom^.next;
        end;
        
        PolynomAuswerten := result;
    end;

begin
    New (polynom);
    Anfuegen(polynom, 17, 0);
    Anfuegen(polynom, 7, 5);
    Anfuegen(polynom, 3, 2);
    
    //writeln(polynom^.koeffizient);
    
    ergebniss := PolynomAuswerten(polynom, 2);
    writeln('Das Ergebniss des Polynoms ist: ', ergebniss);
end.
