program ZahlenlisteEinAus (input, output);
{ Liest eine Zahlenliste ein und gibt diese im anschluss aus. 
* 0 schliesst die benutzereingabe ab. }

    type
    tRefListe = ^tListe;
    tListe = record
                info : integer;
                next : tRefListe;
            end;
            
    var
    input : integer;
    RefAnfang,
    RefEnde,
    z: tRefListe;

    procedure ElementAnhaengen (input : integer;
                            var RefAnfang : tRefListe;
                            var RefEnde : tRefListe);
    { Haengt ein element an das ende der bestehenden Liste an. 
    * 1. Fall: Liste ist leer, RefAnfang = nil
    * 2. Fall: RefAnfang <> nil}
        var
        Zeiger : tRefListe;
        
    begin
        new (Zeiger);
        Zeiger^.info := input;
        Zeiger^.next := nil;
        
        // 1. Fall
        if RefAnfang = nil then
        begin
            RefAnfang := Zeiger;
            RefEnde := Zeiger;
        end
        else
        begin
            RefEnde^.next := Zeiger;
            RefEnde := Zeiger;
        end;
    end;

begin
    RefAnfang := nil;
    RefEnde := nil;
    
    writeln('Geben Sie eine Reihe von Zahlen fuer eine neue verkettete Liste ein. 0 beendet die eingabe.');
    repeat
        readln(input);
        if input <> 0 then
            ElementAnhaengen (input, RefAnfang, RefEnde);

    until (input = 0);
    
    if RefAnfang <> nil then
    begin
        writeln('Liste:');
        z := RefAnfang;
        repeat
            write(z^.info:6);
            z := z^.next;
        until z = nil;
    end;
end.
