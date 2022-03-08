{$R+}
{$B+}

program mastermind{input,output};
{implementiert das bekannte Spiel}
  
  const
  ANZSTELLEN  = 4;
  MAXVERSUCHE = 12;
  ERSTEFARBE  = 'A';
  LETZTEFARBE = 'F';
  
  type
  tFarben = ERSTEFARBE..LETZTEFARBE;
  tFarbPos = 1..ANZSTELLEN;
  tFarbfolge = array[tFarbPos] of tFarben;
  tConfirmed = array[tFarbPos] of boolean;
  
  var
  code, versuch: tFarbfolge;
  codeConfirmed,
  verConfirmed : tConfirmed;
  schwarze, weisse: integer;
  versuchNr: integer;
  erraten: boolean;
  i: integer;
  k, m : tFarbPos;

  procedure einlesen(var outFarbkombi: tFarbfolge);
  {Farbfolge einlesen}
    
    var
    pos: tFarbPos;
    f: char;
    {char statt tFarben, da der fpc (zumindest v. 3.2.2) sonst eine Warnung ausgibt}
  
  begin
    write(ANZSTELLEN, ' Farben aus ');
    for f := ERSTEFARBE to LETZTEFARBE do
    begin
      write(f);
    end;
    write(' z.B. ');
    f := ersteFarbe;
    for pos := 1 to ANZSTELLEN do
    begin
      write(f);
      f := succ(f);
    end;
    writeln('):');
    for pos := 1 to ANZSTELLEN do
    begin
      read(outFarbkombi[pos]);
    end;
    readln;
  end;

begin
  write('bitte den geheimen Code eingeben (');
  einlesen(code);
  {Die Variable code enthaelt jetzt die eingelesene Farbfolge als Wert.}
  
  for i:=1 to 240 do
    writeln;
  
  versuchNr := 1;
  erraten := false;
  
    
  while (versuchNr <= MAXVERSUCHE) and not erraten do
  begin
    write('dein ', versuchNr, '. Rateversuch (');
    einlesen(versuch);
    {Die Variable versuch enthaelt jetzt die eingelesene Farbfolge als Wert.}
    
    schwarze := 0;
    weisse := 0;
  
    for k := 1 to ANZSTELLEN do
    begin
        codeConfirmed[k] := false;
        verConfirmed[k] := false;
    end;
    
    for k := 1 to ANZSTELLEN do
    begin
        if (not codeConfirmed[k]) and (not verConfirmed[k]) and (CompareChar(code[k],versuch[k],1) = 0) then
        begin
            schwarze := schwarze + 1;
            codeConfirmed[k] := true;
            verConfirmed[k] := true;
        end;
    end;
        
    for k := 1 to ANZSTELLEN do
    begin
        for m := 1 to ANZSTELLEN do
        begin
            if (not codeConfirmed[k]) and (not verConfirmed[m]) and (CompareChar(code[k],versuch[m],1) = 0) then
            begin
                weisse := weisse + 1;
                codeConfirmed[k] := true;
                verConfirmed[m] := true;
            end;
        end;
    end;
    
    erraten := schwarze = ANZSTELLEN;
    if not erraten then
    begin
      writeln(schwarze, ' Schwarze und ', weisse, ' Weisse');
      versuchNr := versuchNr + 1;
    end;
    writeln;
  end;
  if erraten then
  begin
    writeln('gewonnen :)');
  end
  else
  begin
    writeln('verloren :(');
  end;
end.
