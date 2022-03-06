program SucheMaxElementPos (input, output);
{ Sucht die pasition des groessten elements eines feldes
* Brute force ansatz }

    const
    FELDGROESSE = 10;
    
    type
    tIndex = 1..FELDGROESSE;
    tFeld = array [tIndex] of integer;
    
    var
    i,
    maxPos : tIndex;
    Feld : tFeld;
    
    function rekFeldMax (
                        inMaxPos : tIndex;
                        var inFeld : tFeld) : tIndex;
    { Sucht die position des groessten elements rekursiv }
        var
        temp : tIndex;
    begin
        //temp := rekFeldMax()
    
    end;

begin
    writeln('Geben Sie eine Reihe von Zahlen ein.');
    for i:= 1 to FELDGROESSE do
        readln(Feld[i]);
    
    maxPos := rekFeldMax(1, Feld);
    writeln('Position des groessten elements ist: ', maxPos);
end.
