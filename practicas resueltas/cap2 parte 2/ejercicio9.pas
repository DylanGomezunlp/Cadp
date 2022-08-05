program ejercicio9;
procedure descomponerYsuma (numA:integer; var numB:integer; var cantDig:integer);
	var
		dig:integer;
	begin
		while (numA<>0) do begin
			dig:= numA mod 10;
			cantDig:=cantDig+1;
			numB:= numB+dig;
			numA:= numA div 10;
		end;
	end;
var
	numA,numB,cantDig:integer;
begin
	repeat
		numB:=0;
		cantDig:=0;
		writeln('Ingrese una secuencia de numeros: ');
		readln(numA);
		descomponerYsuma (numA,numB,cantDig);
		writeln('la cantidad de sus digitos es: ', cantDig);
		writeln('La suma de sus digitos es: ', numB);
	until (numB=10);
end.
	
