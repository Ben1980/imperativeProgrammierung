program FeldSort (input, output);

    const
    FELDGROESSE = 5;
    
    type
    tIndex = 1..FELDGROESSE;
    tFeld = array [tIndex] of integer;
    
    var
    EingabeFeld : tFeld;
    MinPos,
    i : tIndex;
    Tausch : integer;
    
    function FeldMinimumPos (Feld : tFeld;
                            von, bis : tIndex) : tIndex;
    
        var
        MinimumPos,
        j : tIndex;
        
    begin
        MinimumPos := von;
        for j := von + 1 to bis do
            if Feld[j] < Feld[MinimumPos] then
                MinimumPos := j;
        FeldMinimumPos := MinimumPos
    end;

begin
    writeln ('Geben Sie ', FELDGROESSE, ' Werte ein: ');
    for i := 1 to FELDGROESSE do
        readln (EingabeFeld[i]);
    
    for i:= 1 to FELDGROESSE - 1 do
    begin
        MinPos := FeldMinimumPos (EingabeFeld, i, FELDGROESSE);
        Tausch := EingabeFeld[MinPos];
        EingabeFeld[MinPos] := EingabeFeld[i];
        EingabeFeld[i] := Tausch;
    end;
    
    for i := 1 to FELDGROESSE do
        write (EingabeFeld[i]:6);
    writeln
end.
