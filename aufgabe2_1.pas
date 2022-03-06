program AlternierendeQuersummeIstNull (input, output);
{  r ist genau dann true, wenn die alternierende Quersumme von x gleich 0 ist }
    var
    Zahl,
    Quersumme : integer;
    
    function alternierendeQuersumme (Zahl : integer) : integer;
    { Berechnet die alternierende Quersumme }
        var
        x,
        i,
        res : integer;
    begin
        res := 0;
        i := 1;
        while Zahl > 0 do
        begin
            x := Zahl mod 10;
            Zahl := Zahl div 10;
            res := res + i*x;
            i := -1*i;
        end;
        
        alternierendeQuersumme := res;
    end;
    
begin
    write('Bitte eine Zahl eingeben: ');
    readln(Zahl);
    
    Quersumme := alternierendeQuersumme(Zahl);
    
    if Quersumme = 0 then
        write('Die alternierende Quersumme ist 0.')
    else
        write('Die alternierende Quersumme ist nicht 0.');
end.
