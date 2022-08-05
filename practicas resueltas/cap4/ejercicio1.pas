program uno;

type
	vnums = array [1..10] of integer;

var 
	numeros: vnums;
	i:integer;
begin
	for i:=1 to 10 do begin
		numeros[i] := i;
		writeln(numeros[i]);
	end;
		
	for i:=1 to 9 do
		numeros[i+1] := numeros [i];
	writeln(numeros[10]);
end.
