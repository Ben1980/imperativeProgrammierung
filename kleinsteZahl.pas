program kleinsteZahl (input, output);

	var
	Zahl,
	Minimum : integer;

begin
	writeln ('Geben Sie eine Zahl ein. ', '0 beendet die Eingabe');
	readln (Zahl);
	
	Minimum := Zahl;
	while Zahl <> 0 do
	begin
		if Zahl < Minimum then
			Minimum := Zahl;
		readln (Zahl)
	end;
	
	if Minimum <> 0 then
		writeln ('Die kleinste Zahl lautet ', Minimum, '.')
	else
		writeln ('Es wurde keine Zahl <> 0 eingegeben.')
end.
