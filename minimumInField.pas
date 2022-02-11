Program minimumInField (input, output);

	const
	FIELDSIZE = 20;

	type
	tIndex = 1..FIELDSIZE;
	tField = array [tIndex] of integer;
	
	var
	Field : tField;
	Minimum : integer;
	i : tIndex;

begin
	writeln('Geben Sie ', FIELDSIZE:2, ' Werte ein:');
	for i := 1 to FIELDSIZE do
		readln(Field[i]);
		
	Minimum := Field[1];
	for i := 2 to FIELDSIZE do
		if Field[i] < Minimum then
			Minimum := Field[i];
			
	writeln('Die kleinste Zahl ist ', Minimum)
end.
