program Fibonacci (input, output);
{ Calculates the n'th fibonacci number }

    var
    Zahl,
    fib : integer;

    function CalculateFibonacci (Zahl : integer) : integer;
    { Berechnet die n'the Fibonacci Zahl.
    * 1. Fall: Zahl = 0 -> 0
    * 2. Fall: Zahl = 1 -> 1
    * 3. Fall: Zahl > 1 -> f(n-1)+f(n-2) }
        var
        temp : integer;
    
    begin
        if Zahl = 0 then
            temp := 0
        else
        if Zahl = 1 then
            temp := 1
            
        else
            temp := CalculateFibonacci(Zahl-1) + CalculateFibonacci(Zahl-2);
        
        CalculateFibonacci := temp;
    end;
begin
    write('Geben Sie eine Integer Zahl ein für die die Fibonacci Zahl berechnet werden soll: ');
    readln(Zahl);
    fib := CalculateFibonacci(Zahl);
    writeln('Die ', Zahl, '. Fibonacci Zahl lautet: ', fib);
end.
