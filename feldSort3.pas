program FeldSort3 (input output);

    const
    FELDGROESSE = 5;
    
    type
    tIndex = 1..FELDGROESSE;
    tFeld = array [tIndex] of integer;
    
    var
    EingabeFeld : tFeld;
    idx : tIndex;
    
    procedure FeldSortieren (var SortFeld : tFeld);
        var
        MinPos,
        i : tIndex;
        
        function FeldMinimumPos (Feld : tFeld;
                                von, bis : tIndex) : tIndex;
            var
            MinimumPos,
            j : tIndex;
        begin
        end;
        
        procedure vertuschen (var hin, her : integer);
            var
            Tausch: integer;
        begin
        end;
    
    begin
    end;

begin

end.
