program ejercicio5;
procedure EsDoble (numA: integer; numB: integer; var ok:boolean; var ContDoble: integer);
	begin
	ok:= (numA*2=numB);
	if ok then begin
			ContDoble:= ContDoble+1;
		end;
		
	end;
procedure EsPar (numA,numB:integer; var ContPares:Integer);
	begin
		if (numA mod 2=0) then begin
			ContPares:=ContPares+1;
			end;
		if (numB mod 2=0) then begin
			contPares:=ContPares+1;
		end;
	end;
var
	ok: boolean;
	numA, numB, ContDoble, ContPares, ContParDeNumeros: integer;
begin
	ContDoble:=0;
	ContPares:=0;
	ContParDeNumeros:=0;
	Writeln('Ingrese dos numeros: ');
	readln(numA);
	readln(numB);
	while (numA<>0) and (numB<>0) do begin
		ContParDeNumeros:= ContParDeNumeros + 1;
		EsDoble(numA,numB,ok,ContDoble);
		EsPar (numA,NumB, ContPares);
		Writeln('Ingrese dos numeros: ');
		readln(numA);
		readln(numB);
	end;
	writeln('la cantidad de numeros pares fue: ', ContPares);
	writeln('La cantidad de pares de numeros fue: ', ContParDeNumeros);
	writeln('La cantidad de numeros dobles fue:', ContDoble);
end.
