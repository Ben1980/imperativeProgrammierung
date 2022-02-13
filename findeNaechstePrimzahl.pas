program FindeNaechstePrimzahl (input, output);

    type
    tNatZahlPlus = 1..maxint;
    
    var
    EinZahl,
    d : tNatZahlPlus;
    gefunden : boolean;
    
    function istPrimzahl (p : tNatZahlPlus) : boolean;
    
        var
        q : tNatZahlPlus;
    
    begin
        if p < 2 then
            istPrimzahl := false
        else
        begin
            istPrimzahl := true;
            for q := 2 to p-1 do
                if p mod q = 0 then
                    istPrimzahl := false
        end;
    end;

begin
    writeln ('Zahl eingeben: ');
    readln (EinZahl);
    write ('Naechste Primzahl zu ', EinZahl, ' ist ');
    if istPrimzahl (EinZahl) then
        writeln (EinZahl)
    else
    begin
        if EinZahl = 1 then
            writeln ('2':5)
        else
        begin
            gefunden := false;
            if odd (EinZahl) then
                d := 2
            else
                d := 1;
            repeat
                if istPrimzahl (EinZahl + d) then
                begin
                    gefunden := true;
                    write (EinZahl + d : 5)
                end;
                if istPrimzahl (EinZahl - d) then
                begin
                    gefunden := true;
                    write (EinZahl -d : 5)
                end;
                d := d+2
            until gefunden;
            writeln
        end;
    end;
end.

