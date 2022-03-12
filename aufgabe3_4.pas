program aufgabe3_4 (input, output);
{ Füge einer nach indizes geordneten Liste ien weiteres element hinzu }
	type
	tRefIndexListe = ^tIndexListe;
	tIndexListe = record
					index : integer;
					wort : string;
					next : tRefIndexListe;
				end;
				
	procedure einfuegen(var liste : tRefIndexListe;
						index : integer;
						wort : string);
	begin
	end;

begin

end.
