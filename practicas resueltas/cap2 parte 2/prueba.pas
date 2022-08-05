program prueba;
	var i,a, suma, b: integer;
begin
	writeln('ingrese dos numeros: ');
	readln(a);
	readln(b);
	for i:=a to b do begin
	suma:= suma + i
	end;
	writeln('El resultado de la suma fue ', suma);
end.
	
