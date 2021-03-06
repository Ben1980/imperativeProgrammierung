{$R+} 
{$B+} 

program liste(input, output);
{editiert eine Liste natürlicher Zahlen}
  type	
  tRefListe = ^tListe;
  tListe = record
             zahl:integer;
             next:tRefListe;
             prev:tRefListe;
           end;
           
  var
  position:integer;
  zahl:integer;
  befehl:string;
  eingabeListe:tRefListe;

  procedure add(inIndex:integer; inZahl:integer; var ioListe:tRefListe);
  {fügt eine Zahl inZahl an Position inIndex hinzu}
    var
    i:integer;
    akt:tRefListe;
    neu:tRefListe;
    
  begin 
    if (ioListe = nil) then
    begin
      new(ioListe);
      ioListe^.zahl := inZahl;
      ioListe^.next := nil;
      ioListe^.prev := nil;
    end  
    else 
    begin  
      new(neu); 
      neu^.zahl := inZahl;
      neu^.next := nil;
      if inIndex = 1 then
      begin
		neu^.prev := nil;
        neu^.next := ioListe;
        ioListe^.prev := neu;
        ioListe := neu  
      end
      else
      begin
        i := 1;
        akt := ioListe;
        while (i < inIndex - 1) and (akt^.next <> nil) do
        begin
          akt := akt^.next;
          i := i + 1  
        end;
        neu^.prev := akt;
        neu^.next := akt^.next;
        akt^.next := neu;
      end
    end
  end;
  
  procedure remove(inIndex:integer; var ioListe:tRefListe);
  {entfernt die Zahl an Position inIndex}
    var
    i:integer;
    akt:tRefListe;
    trash:tRefListe;
    
  begin 
    if (ioListe <> nil) then
    begin
      if inIndex = 1 then
      begin
        trash := ioListe;
        
        if ioListe^.next <> nil then
        begin
			ioListe := ioListe^.next;
			ioListe^.prev := nil;
		end
		else
			ioListe := nil;
        
        dispose(trash);
      end
      else
      begin
        i := 1;
        akt := ioListe;
        while (i < inIndex - 1) and (akt^.next <> nil) do
        begin
          akt := akt^.next;
          i := i + 1 
        end;
        if akt^.next <> nil then
        begin
          trash := akt^.next;
          
          if akt^.next^.next <> nil then
			akt^.next := akt^.next^.next
		  else
		    akt^.next := nil;
          
          if akt^.next <> nil then
			akt^.next^.prev := akt;
			
          dispose(trash)
        end
      end
    end
  end; 

  function wert(inListe:tRefListe; inIndex:integer):integer;
  {liefert die Zahl an Position inIndex}
    var
    i:integer;
    lauf:tRefListe;
    
  begin 
    i := 1;
    lauf := inListe;
    while (i <> inIndex) and (lauf <> nil) do
    begin
      lauf := lauf^.next;
      i := i + 1  
    end;
	if lauf <> nil then
	  wert := lauf^.zahl
	else
	  wert := 0;
  end; 

  procedure print(inListe:tRefListe);
  {schreibt die Liste auf die Standardausgabe}  
    var
    lauf:tRefListe;
    
  begin
    lauf := inListe;
    while lauf <> nil do
    begin 
      write(lauf^.zahl);
      write(' ');
      lauf := lauf^.next;
    end;
    writeln('');
  end;
  
  function minpos(inListe:tRefListe):integer;
  {liefert die Position einer kleinsten Zahl der Liste}
    var
    i:integer;
    min:integer; 
    index:integer;
    lauf:tRefListe;
    
  begin
    lauf := inListe;
    index := 0;
    if lauf <> nil then
    begin
      index := 1;
      i:= 1;
      min := lauf^.zahl
    end;
    while lauf <> nil do
    begin
      if lauf^.zahl < min then
      begin
        min := lauf^.zahl;
        index := i;
      end;
      i := i + 1;
      lauf := lauf^.next;
    end;
    minpos := index
  end;
  
  procedure sort(var ioListe:tRefListe);
  {liefert eine sortierte Liste mit den gleichen Zahlen}
    var
    liste:tRefListe;
    i:integer;
    lange:integer;
  
  begin
    liste := nil;
    lange :=1; 
    while ioListe <> nil do
    begin
      i:= minpos(ioListe);
      add(lange,wert(ioListe,i),liste);
      remove(i,ioListe);
      lange := lange + 1 
    end;
    ioListe := liste
  end;
  
  procedure turn(var ioListe:tRefListe);
  {dreht eine Liste um}
	var
	tmp:tRefListe;
	
  begin
	if ioListe <> nil then
	begin
		while ioListe <> nil do
		begin
			tmp := ioListe^.next;
			ioListe^.next := ioListe^.prev;
			ioListe^.prev := tmp;
			
			if ioListe^.prev = nil then
				tmp := ioListe;
			
			ioListe := ioListe^.prev;
		end;	
		
		ioListe := tmp;
	end;
  end;
  
  procedure turnRek(var ioListe:tRefListe);
  { dreht eine Liste, rekursive loesung }
	var
	tmp:tRefListe;
	
  begin
	// Abbruchkriterium
	if ioListe^.next <> nil then
		turnRek(ioListe^.next);
	
	tmp := ioListe^.next;
	ioListe^.next := ioListe^.prev;
	ioListe^.prev := tmp;
  end;
  
begin
  eingabeListe := nil;
  write('(add,remove,print,minpos,wert,sort,turn,turnRek,x,q) -> ');
  readln(befehl);
  while (befehl <> 'q') do
  begin
    if (befehl = 'add') then
    begin
      write('Add an Position ');
      readln(position);
      write('Die Zahl ');
      readln(zahl);
      add(position,zahl,eingabeListe);
    end;    
    if (befehl = 'remove') then
    begin
      write('Remove Position ');
      readln(position);
      remove(position,eingabeListe);
    end;
    if (befehl = 'print') then
    begin
      writeln('Liste ');
      print(eingabeListe)
    end;
    if (befehl = 'minpos') then
    begin
      write('Minimum an Position ');
      writeln(minpos(eingabeListe))
    end;
    if (befehl = 'wert') then
    begin
      write('Wert an Position ');
      readln(position);
      writeln(wert(eingabeListe,position))
    end;
    if (befehl = 'sort') then
      sort(eingabeListe);
    if (befehl = 'turn') then
      turn(eingabeListe);  
    if (befehl = 'turnRek') then
    begin
      turnRek(eingabeListe);
      while eingabeListe^.prev <> nil do
		eingabeListe := eingabeListe^.prev;
    end;
    if (befehl = 'x') then
      while eingabeListe <> nil do
        remove(1,eingabeListe); 
    write('(add,remove,print,minpos,wert,sort,turn,turnRek,x,q) -> ');
    readln(befehl)
  end
end.
