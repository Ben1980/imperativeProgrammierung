{$R+} 
{$B+} 

program kiste(input, output);
{baut eine Liste von Stapeln}
  type	
  tRefKiste = ^tKiste;
  tKiste = record
             zahl:integer;
             name:string; 
             up:tRefKiste;             
             next:tRefKiste
           end;
           
  var
  bestanden:boolean;

  
  {---------------- hier beginnt Ihre Prozedur! ----------------}
  procedure remove(inName:String; var ioKiste:tRefKiste);
  {...} 
  
  begin
   
  end; 
  {---------------- hier endet Ihre Prozedur  ----------------}
  
  
  procedure print(inKiste:tRefKiste);
  {schreibt alle Kisten auf die Standardausgabe} 
      
  begin
    if (inKiste <> nil) then
    begin
      write('[');
      write(inKiste^.zahl);
      write(',');
      write(inKiste^.name);
      write(']');
      if (inKiste^.up <> nil) then 
        write('');
      print(inKiste^.up);
      if (inKiste^.up = nil) then 
        write(' ');
      print(inKiste^.next);
    end
    else
  end;
  
  function stringToStapelliste(inS:string):tRefKiste;
  {baut eine Stapelliste aus einem String}
    var
    stapelliste,lauf1,lauf2:tRefKiste;
    r,i:integer;
    c,c2:char;
    s:string;
 
  begin
    stapelliste := nil;
    i := 1;
    r := 0;
    c := 'a';
    s := '';
    while (i <= Length(inS)) do
    begin
      c2 := c;
      c := inS[i];
      if (c <> ']') then s := s + c;
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
      if (c = ',') then s := '';
      if ((c = '[') and (stapelliste = nil)) then 
      begin
        new(stapelliste);
        lauf1 := stapelliste;
        lauf2 := stapelliste;
        stapelliste^.up := nil;
        stapelliste^.next := nil
      end;
      if (c = '[') and (c2 = ']') then 
      begin
        new(lauf2^.up);
        lauf2 := lauf2^.up;
        lauf2^.up := nil;
        lauf2^.next := nil
      end;
      if (c = ' ') then 
      begin
        new(lauf1^.next);
        lauf1 := lauf1^.next;
        lauf2 := lauf1;
        lauf2^.up := nil;
        lauf2^.next := nil
      end; 
      if (c = ']') then
      begin
        lauf2^.zahl := r;
        lauf2^.name := s; 
        r := 0 
      end; 
      i := i + 1;
    end;
    stringToStapelliste := stapelliste;
  end;
  
  function compare(inKisteA:tRefKiste; inKisteB:tRefKiste):boolean;
  {vergleicht zwei Listen von Stapelen}
  
  begin
   if (inKisteA = nil) or (inKisteB = nil) then 
     compare := (inKisteA = inKisteB)
   else 
     compare := (inKisteA^.zahl = inKisteB^.zahl) and (inKisteA^.name = inKisteB^.name) and compare(inKisteA^.up, inKisteB^.up) and compare(inKisteA^.next, inKisteB^.next);
  end;
   
  function printTestDatum(inKiste:string; inName:String; inErwartet:string):boolean;
  {testet ein Testdatum und gibt das Ergebniss zurück}
    var
    kisteA,kisteB:tRefKiste;
    ok:boolean;
  
  begin
    kisteA := stringToStapelliste(inKiste);
    remove(inName,kisteA);
    kisteB := stringToStapelliste(inErwartet);
    ok := compare(kisteA,kisteB);
    if (not ok) then 
    begin 
      writeln('Test (');
      write(inKiste);
      writeln(',');
      write(inName);
      writeln(',');
      writeln(inErwartet);
      writeln(')');
      writeln('ist fehlgeschlagen!');
      writeln('Die Funktion liefert ');
      print(kisteA);
      writeln;
      writeln('und nicht ');
      print(kisteB);
      writeln;
      writeln;
    end;
    printTestDatum := ok;
  end;
    
begin
  writeln('**** testen ****');
  bestanden := printTestDatum('','Ingwer','')
    AND printTestDatum('[3,Ingwer] [2,Minze][7,Minze][3,Minze] [3,Salbei][2,Salbei]','Ingwer','[2,Minze][7,Minze][3,Minze] [3,Salbei][2,Salbei]')
    AND printTestDatum('[3,Ingwer][3,Ingwer][1,Ingwer] [2,Minze][7,Minze][3,Minze] [3,Salbei][2,Salbei]','Ingwer','[3,Ingwer][3,Ingwer] [2,Minze][7,Minze][3,Minze] [3,Salbei][2,Salbei]')
    AND printTestDatum('[3,Ingwer] [2,Minze] [3,Salbei]','Minze','[3,Ingwer] [3,Salbei]')
    AND printTestDatum('[3,Ingwer] [2,Minze][7,Minze] [3,Salbei][5,Salbei][4,Salbei]','Salbei','[3,Ingwer] [2,Minze][7,Minze] [3,Salbei][5,Salbei]')
    AND printTestDatum('[3,Ingwer] [2,Minze][7,Minze][3,Minze] [3,Salbei][2,Salbei]','Toast','[3,Ingwer] [2,Minze][7,Minze][3,Minze] [3,Salbei][2,Salbei]');
  if bestanden then 
  begin 
    writeln('Alle Tests erfolgreich!');
  end;
end.
