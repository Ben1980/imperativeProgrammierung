program NaeherungWurzel2 (input, output);
{ Berechnet die näherung n-ten grades zu Wurzel(2) }

    type
    tBruch = record
                Zaehler : Double;
                Nenner : Double;
            end;
            
    var
    Grad : integer;
    NaherungsBruch : tBruch;

    function NaehereWurzel2(inGrad : integer) : tBruch;
    { Berechnet den n-ten Grad der naeherung zu Wurzel(2) }
        var
        Naeherung : tBruch;
        
    begin
        Naeherung.Zaehler := 0;
        Naeherung.Nenner := 0;
    
        NaehereWurzel2 := Naeherung;
    end;
    
begin
    write('Gib den Grad der Näherung zu Wurzel(2) ein: ');
    readln(Grad);
    
    NaherungsBruch := NaehereWurzel2 (Grad);
    
    write('Die Näherung zu Wurzel(2) mit dem Grad ', Grad, ' ist (', NaherungsBruch.Nenner, ', ', NaherungsBruch.Zaehler, ') -> ', NaherungsBruch.Zaehler / NaherungsBruch.Nenner);
end.
