program NaeherungWurzel2 (input, output);
{ Berechnet die näherung n-ten grades zu Wurzel(2) }

    type
    tBruch = record
                First : integer;
                Second : integer;
            end;
            
    var
    Grad : integer;
    NaherungsBruch : tBruch;

    function NaehereWurzel2(inGrad : integer) : tBruch;
    { Berechnet den n-ten Grad der naeherung zu Wurzel(2) }
        var
        Temp : integer;
        i : integer;
        Naeherung : tBruch;
        
    begin
        Naeherung.First := 1;
        Naeherung.Second := 1;
        
        for i := 2 to inGrad do
        begin
            Temp := Naeherung.First;
            Naeherung.First := Naeherung.First + Naeherung.Second;
            Naeherung.Second := Naeherung.First + Temp;
        end;
     
        NaehereWurzel2 := Naeherung;
    end;
    
begin
    write('Gib den Grad der Naeherung zu Wurzel(2) ein: ');
    readln(Grad);
    
    NaherungsBruch := NaehereWurzel2 (Grad);
    
    write('Die Naeherung zu Wurzel(2) mit dem Grad ', Grad, ' ist (', NaherungsBruch.First, ', ', NaherungsBruch.Second, ') -> ', NaherungsBruch.Second / NaherungsBruch.First);
end.
