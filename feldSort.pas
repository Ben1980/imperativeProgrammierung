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
    MinWert : integer;
    
    procedure FeldMinimumPosUndWert (
                            Feld : tFeld;
                            von, bis : tIndex;
                            var pos : tIndex;
                            var value : integer);
        var
        j : tIndex;
        
    begin
        pos := von;
        value := Feld[von];
        for j := von + 1 to bis do
            if Feld[j] < Feld[pos] then
            begin
                value := Feld[j];
                pos := j
            end
    end;

begin
    writeln ('Geben Sie ', FELDGROESSE, ' Werte ein: ');
    for i := 1 to FELDGROESSE do
        readln (EingabeFeld[i]);
    
    for i:= 1 to FELDGROESSE - 1 do
    begin
        MinPos := 1;
        MinWert := 0;
        FeldMinimumPosUndWert (EingabeFeld, i, FELDGROESSE, MinPos, MinWert);
        Tausch := EingabeFeld[MinPos];
        EingabeFeld[MinPos] := EingabeFeld[i];
        EingabeFeld[i] := Tausch;
    end;
    
    for i := 1 to FELDGROESSE do
        write (EingabeFeld[i]:6);
    writeln
end.
