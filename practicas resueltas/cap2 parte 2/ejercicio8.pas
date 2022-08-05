program practica2p2_8;
procedure secuencia (numero:integer);
var
	suma: integer;
	impares:integer;
	pares:integer;
begin
	impares:=0;
	pares:=0;
	suma:=0;
	while(numero>0) do
	begin
		if (numero mod 2 = 0) then
		suma:= suma+ numero mod 10
		else
			impares:=impares+1;
		numero:= numero div 10;
	end;
	writeln('la suma de sus numeros pares es de: ', suma);
	writeln('la cantidad de numeros impares de: ', impares);
end;
var
	numero: integer;
begin
	writeln('escribe un numero: ');
	readln(numero);
	while (numero <> 12345) do
	begin
		secuencia(numero);
		writeln('escribe un numero: ');
		readln(numero);
	end;
end.

