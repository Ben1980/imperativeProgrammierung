program DreieckHatRechtenWinkel (input, output);
{ Gibt true aus wenn ein Dreieck ein Rechtwinkliges Dreieck ist. }
    
    var
    x,
    y,
    z: integer;
    rechtwinklig : boolean;
    
begin
    writeln('Geben Sie die Seitenlängen x, y, z ein');
    write('x: ');
    Readln(x);
    write('y: ');
    Readln(y);
    write('z: ');
    Readln(z);

    rechtwinklig := (x*x + y*y = z*z) or (x*x + z*z = y*y) or (z*z + y*y = x*x);
    if rechtwinklig then
        writeln('Dreieck ist Rechtwinklig')
    else
        writeln('Dreieck ist nicht Rechtwinklig')

end.
