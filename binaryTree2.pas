program BinaryTree (input, output);
{ Baut einen binaeren baum basierend auf benutzereingabe auf und gibt diesen dann aus. }
    
    type
    tRefBinBaum = ^tBinBaum;
    tBinBaum = record
                info : integer;
                links : tRefBinBaum;
                rechts : tRefBinBaum;
            end;

    var
    input : integer;
    wurzel,
    blattVonLinks : tRefBinBaum;
    
    procedure KnotenEinfuegen (Zahl : integer;
                            var ioRefWurzel : tRefBinBaum);
    { Fuegt einen neuen Knoten in den Suchbaum ein }
        
        var
        RefSohn,
        RefVater : tRefBinBaum;
        gefunden : boolean;
    
    begin
        RefSohn := ioRefWurzel;
        gefunden := false;
        
        while (RefSohn <> nil) and (not gefunden) do
        { Traversiere den Baum bis zum letzten Knoten }
        begin
            if RefSohn ^.info = Zahl then
                gefunden := true
            else
            begin
                RefVater := RefSohn;
                if Zahl < RefSohn^.info then
                    RefSohn := RefSohn^.links
                else
                    RefSohn := RefSohn^.rechts;
            end;
        end;
        
        if not gefunden then
        { Neuer Knoten anfuegen }
        begin
            New (RefSohn);
            RefSohn^.info := Zahl;
            RefSohn^.links := nil;
            RefSohn^.rechts := nil;
            
            if ioRefWurzel = nil then
                { Baum war ler }
                ioRefWurzel := RefSohn
            else
                if Zahl < RefVater^.info then
                    RefVater^.links := RefSohn
                else
                    RefVater^.rechts := RefSohn;
        end;
    end;
    
    procedure InOrderTraversal (ioRefWurzel : tRefBinBaum);
    { Traversing the binary tree and printing the results in order }
    begin
        if ioRefWurzel <> nil then
        begin
            InOrderTraversal(ioRefWurzel^.links);
            
            write(ioRefWurzel^.info:6);
            
            InOrderTraversal(ioRefWurzel^.rechts);
        end;
    end;
    
    function BlattSuchenRek (ioRefWurzel : tRefBinBaum) : tRefBinBaum;
    { Gibt Zeiger auf erstes Blatt von links zur??ck }
        var
        temp : tRefBinBaum;
        
    begin
        if ioRefWurzel <> nil then
            temp := BlattSuchenRek(ioRefWurzel^.links);
            
        if ioRefWurzel <> nil then
            temp := ioRefWurzel;
            
        BlattSuchenRek := temp;
    end;
    
    function BlattSuchenIt (ioRefWurzel : tRefBinBaum) : tRefBinBaum;
    { Gibt Zeiger auf erstes Blatt von links zur??ck }
        var
        temp : tRefBinBaum;
        
    begin
        temp := ioRefWurzel;
        
        while (temp^.links <> nil) do
        begin
            temp := temp^.links;
        end;
        
        BlattSuchenIt := temp;
    end;
    
begin
    wurzel := nil;
    
    writeln('Geben Sie eine Reihe von Zahlen fuer eine neue binaeren suchbaum ein. 0 beendet die eingabe.');
    repeat
        readln(input);
        if input <> 0 then
            KnotenEinfuegen (input, wurzel);

    until (input = 0);
    
    writeln('Binary search tree output in order:');
    InOrderTraversal(wurzel);
    
    writeln('');
    writeln('Erstes Blatt von Links, Rekursiv:');
    blattVonLinks := BlattSuchenRek(wurzel);
    write(blattVonLinks^.info:6);
    
    writeln('');
    writeln('Erstes Blatt von Links, Rekursiv:');
    blattVonLinks := BlattSuchenIt(wurzel);
    write(blattVonLinks^.info:6);
end.
