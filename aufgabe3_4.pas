{$R+} 
{$B+} 

program listeMitWorten(input, output);
{testet die Prozedur add}
  var
  bestanden:boolean;

  type	
  tRefIndexListe = ^tIndexListe;
  tIndexListe = record
                     index:integer;
                     wort:string;
                     next:tRefIndexListe
                   end;

{----------- hier fügen Sie bitte Ihre Prozedur ein --------------------------}
  procedure add(var ioListe:tRefIndexListe; inIndex:integer; inWort:String);
  {fügt in die sortierte Liste ioListe ein neues Element mit dem Index
   inIndex und dem Wort inWort ein und erhöht ggf. gleiche Indizes}
	var
	element : tRefIndexListe;
	liste : tRefIndexListe;
	
  begin
	liste := ioListe;
	// Erzeuge element
	New (element);
	element^.index := inIndex;
	element^.wort := inWort;
	element^.next := nil;
	
	// 1. Fall, erstes element einfuegen
	if liste = nil then
		liste := element
	else // 2. Fall, element vorne einfuegen
	if inIndex < liste^.index then 
	begin
		element^.next := liste;
		liste := element;
	end
	else // 3 - n. Fall,
	begin
		while liste <> nil do
		begin
			//temp := ioListe;
			
			// 3. Fall element index > als letzter eintrag
			if (inIndex > liste^.index) and (liste^.next = nil) then
			begin
				write(liste^.index, ':', element^.index);
				liste^.next := element;
				break;
			end;
			
			liste := liste^.next;
		end;
	end;
	
	ioListe := liste;
	
  end;
{----------- hier endet Ihre Prozedur ----------------------------------------}

  function stringToListe(inS:string):tRefIndexListe;
  {baut eine Liste aus einem String}
    var
    liste,lauf:tRefIndexListe;
    i:integer;
    c:char;
    modus:integer;
    r:integer;
    w:string;

  begin
    liste := nil;
    lauf := nil;
    i := 1;
    modus := 0;
    r := 0;
    w := '';
    while (i <= Length(inS)) do
    begin
      c := inS[i];
      if ((c = '[') and (liste <> nil)) then 
      begin
        new(lauf^.next);
        lauf := lauf^.next;
        lauf^.next := nil
      end;
      if ((c = '[') and (liste = nil)) then 
      begin
        new(liste);
        lauf := liste;
        lauf^.next := nil
      end;
      if (c = '[') then modus := 1;
      if (c = ',') then modus := 2;
      if (c = ']') then modus := 0;
      if (c = '0') then r := r * 10;
      if (c = '1') then r := r * 10 + 1;
      if (c = '2') then r := r * 10 + 2;
      if (c = '3') then r := r * 10 + 3;
      if (c = '4') then r := r * 10 + 4;
      if (c = '5') then r := r * 10 + 5;
      if (c = '6') then r := r * 10 + 6;
      if (c = '7') then r := r * 10 + 7;
      if (c = '8') then r := r * 10 + 8;
      if (c = '9') then r := r * 10 + 9;
      if ((modus = 2) and not (c = ',')) then w := w + c;
      if (c = ']') then 
      begin 
        lauf^.index := r; 
        lauf^.wort := w; 
        r := 0;
        w := ''
      end;
      i := i + 1;
    end;
    lauf := nil;
    stringToListe := liste;
  end;

  function compare(inListeA:tRefIndexListe; inListeB:tRefIndexListe):boolean;
  {Vergleicht zwei Listen}
  
  begin
   if (inListeA = nil) or (inListeB = nil) then 
     compare := (inListeA = inListeB)
   else 
     compare := (inListeA^.index = inListeB^.index) and (inListeA^.wort = inListeB^.wort) 
                and compare(inListeA^.next, inListeB^.next);
  end;
  
  function toString(inListe:tRefIndexListe):string;
  {baut einen String aus einer Liste}  
    var
    s:string;
    x:string;
    lauf:tRefIndexListe;
    
  begin
    lauf := inListe;
    s := '';
    x := '';
    while lauf <> nil do
    begin 
      Str(lauf^.index,x);
      s := s + '[' + x + ',' + lauf^.wort + ']';
      lauf := lauf^.next 
    end;
    toString := s
  end;

  function printTestDatum(inListe:string; inIndex:integer; inWort:string; inErwartet:string):boolean;
  {testet ein Testdatum und gibt das Ergebniss zurück}
    var
    liste:tRefIndexListe;
    ok:boolean;
  
  begin
    liste := stringToListe(inListe);
    add(liste,inIndex,inWort);
    ok := compare(liste,stringToListe(inErwartet));
    if (not ok) then 
    begin 
      write('Test (');
      write(inListe + ', ');
      write(inIndex);
      write(', ');
      write(inWort);
      write(') ist fehlgeschlagen. Die Funktion liefert ');
      write(toString(liste));
      write(' und nicht ');
      writeln(inErwartet)
    end;
    printTestDatum:=ok;
  end;
 
begin
  writeln('**** Funktion testen ****');
  bestanden := printTestDatum('',2,'Elch','[2,Elch]')
    AND printTestDatum('[13,Fuchs]',2,'Elch','[2,Elch][13,Fuchs]')
    AND printTestDatum('[3,Fuchs]',3,'Elch','[3,Elch][4,Fuchs]')
    AND printTestDatum('[2,Fuchs]',4,'Dachs','[2,Fuchs][4,Dachs]')
    AND printTestDatum('[31,Fuchs][42,Floh][55,Huhn]',2,'Elch','[2,Elch][31,Fuchs][42,Floh][55,Huhn]')
    AND printTestDatum('[2,Fuchs][3,Tiger]',2,'Elch','[2,Elch][3,Fuchs][4,Tiger]')
    AND printTestDatum('[2,Fuchs][3,Tiger][7,Maus]',2,'Elch','[2,Elch][3,Fuchs][4,Tiger][7,Maus]')
    AND printTestDatum('[20,Fuchs][31,Tiger][32,Floh]',42,'Dachs','[20,Fuchs][31,Tiger][32,Floh][42,Dachs]')
    AND printTestDatum('[1,Hund][3,Aal][4,Katze][5,Maus]',3,'Tiger','[1,Hund][3,Tiger][4,Aal][5,Katze][6,Maus]')
    AND printTestDatum('[1,Hund][3,Aal][4,Katze][7,Maus]',3,'Tiger','[1,Hund][3,Tiger][4,Aal][5,Katze][7,Maus]')
    AND printTestDatum('[1,Hund][4,Aal][7,Katze][9,Maus][13,Floh][18,Huhn]',11,'Tiger','[1,Hund][4,Aal][7,Katze][9,Maus][11,Tiger][13,Floh][18,Huhn]')
    AND printTestDatum('[1,Hund][4,Aal][7,Katze][9,Maus][13,Floh][18,Huhn]',15,'Tiger','[1,Hund][4,Aal][7,Katze][9,Maus][13,Floh][15,Tiger][18,Huhn]')
    AND printTestDatum('[1,Hund][4,Aal][7,Katze][9,Maus][13,Floh][18,Huhn]',18,'Tiger','[1,Hund][4,Aal][7,Katze][9,Maus][13,Floh][18,Tiger][19,Huhn]');      
  if bestanden then 
  begin 
    writeln('Alle Tests erfolgreich!');
  end;
end.
