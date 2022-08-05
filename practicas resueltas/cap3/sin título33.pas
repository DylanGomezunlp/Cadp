program arreglos;

const
	dimf=50;
	
type
	vReales = array [1..dimf] of real;
	procedure cargarVerctor (var v: vReales; var dimL: integer);
	var
		i:integer;
		num:real;
	begin
		dimL:=0;
		writeln('ingrese un numero para el vector');
		readln(num);
		while (num<>-1) and (dimL<dimf) do begin
			dimL:= dimL+1;
			v[dimL]:= num;
			writeln('ingrese otro numero para el vector');
			readln(num);
		end;
	end;
var

	v: vReales;
	i:integer;
	dimL:integer;
begin
	cargarVerctor(v, diml);
	for i:=1 to dimL do begin
		writeln(v[i]:2:2);
	end;
end.
