program FeldSort3 (input, output);
{ Soritert eine unsortierte Liste und gibt die sortierte Liste aus
* 1. Fall: Die liste ist bereits Sortiert
* 2. Fall: Die liste is nicht Sortiert
* 3. Fall: Die Liste ist umgekehrt Sortiert, z.B. 3,2,1}

    const
    FELDGROESSE = 5;
    
    type
    tIndex = 1..FELDGROESSE;
    tFeld = array [tIndex] of integer;
    
    var
    EingabeFeld : tFeld;
    i : tIndex;
    fieldsize : integer;
    
    procedure FeldSortieren (var SortFeld : tFeld);
    { Sortiert die gegebene Liste }
        var
        MinPos,
        i : tIndex;
        
        function FeldMinimumPos (Feld : tFeld;
                                von, bis : tIndex) : tIndex;
        { Gibt die position des kleinsten elements }
            var
            MinimumPos,
            j : tIndex;
            minVal : integer;
            
        begin
            minVal := maxint;
            for j := von to bis do
            begin
                if Feld[j] < minVal then
                begin
                    minVal := Feld[j];
                    MinimumPos := j;
                end;
            end;
            FeldMinimumPos := MinimumPos;
        end;
        
        procedure vertuschen (var hin, her : integer);
        { Vertauscht zwei Werte }
            var
            Tausch: integer;
        begin
            Tausch := hin;
            hin := her;
            her := Tausch;
        end;
    
    begin
        for i := 1 to fieldsize do
        begin
            MinPos := FeldMinimumPos (SortFeld, i, fieldsize);
            vertuschen(SortFeld[i], SortFeld[MinPos]);
        end;
    end;
    
    procedure printListe ();
    { Gibt die Liste aus }
    begin
        for i := 1 to fieldsize do
            write (EingabeFeld[i]:6);
        writeln;
    end;

begin
    repeat
        write ('Geben Sie die Feldgroesse an. Maximale Feldgroesse ist ', FELDGROESSE, ': ');
        readln(fieldsize);
    until (1 <= fieldsize) and (fieldsize <= FELDGROESSE);
    
    writeln ('Geben Sie ', fieldsize, ' Werte ein: ');
    for i := 1 to fieldsize do
        readln (EingabeFeld[i]);
    
    writeln ('Unsortierte List: ');
    printListe;
        
    FeldSortieren(EingabeFeld);
    
    writeln ('Sortierte List: ');
    printListe;
end.
