program seminarverwaltung (input, output);

	const
	NUMBEROFSTUDENTS = 12;
	
	type
	tNumber = 1..maxint;
	tStatus = (activ, passiv);
	tStudent = record
			     Status : tStatus;
			     MatrikelNr : tNumber;
               end;
	tIndex = 1..NUMBEROFSTUDENTS;
	tStudents = array [tIndex] of tStudent;
	
	var
	i : tIndex;
	Students : tStudents;
	Status : char;
	
begin
	writeln('Bitte geben Sie die Daten der ', NUMBEROFSTUDENTS, ' teilnehmenden Studenten an:');
	for i := 1 to NUMBEROFSTUDENTS do
	begin
		write('Matrikel-Nummer: ');
		readln(Students[i].MatrikelNr);
		write('Teilnahme a=aktiv, p=passiv: ');
		readln(Status);
		if Status = 'a' then
			Students[i].Status := activ
		else
			Students[i].Status := passiv;	
	end;
	
	writeln('List of Students who passed:');
	for i := 1 to NUMBEROFSTUDENTS do
	begin
		if Students[i].Status = activ then
			writeln('    - ', Students[i].MatrikelNr);
	end;
	
	writeln('List of whom was active, whom was passiv:');
	for i := 1 to NUMBEROFSTUDENTS do
	begin
		writeln('    - ', Students[i].MatrikelNr, ' : ', Students[i].Status);
	end
end.
