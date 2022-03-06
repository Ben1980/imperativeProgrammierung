program maximum (input, output);
{ Gibt das maximum einer reihe von integer zahlen aus }

    var
    Zahl,
    max : integer;
    
begin
    Zahl := -maxint;
    max := -maxint;
    
    writeln('Geben Sie eine Reihe von Zahlen ein. 0 beendet die eingabe.');
    repeat
        readln(Zahl);
        
        if (max = -maxint) and (Zahl = 0) then
        begin
            writeln ('Leere Eingabefolge!');
            break;
        end;
        
        if Zahl > max then
            max := Zahl;
        
    until (Zahl = 0);
    
    if max > -maxint then
        writeln('Das maximum ist: ', max);
end.
