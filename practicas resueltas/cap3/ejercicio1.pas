program Registros;
	type
		str20 = string[20];
			alumno = record
			codigo : integer;
			nombre : str20;
			promedio : real;
		end;
procedure masGrande (cod:real; var max1,max2: real; var nomMax1, nomMax2, nombre: string);
begin
	if (cod>max1) then begin
		max2:=max1;
		nomMax2:=nomMax1;
		max1:=cod;
		nomMax1:=nombre;
	end
	else 
		if (cod>max2) then begin
		max2:=cod;
		nomMax2:=nomMax1;
		end;
end;
procedure leer(var alu : alumno; var cantAlu:integer; var nomMax1, nomMax2: string);
	var
		max1:real;
		max2:real;
	begin
		writeln('Ingrese el codigo del alumno');
		readln(alu.codigo);
		while (alu.codigo <> 0) do begin
			writeln('Ingrese el nombre del alumno'); 
			readln(alu.nombre);
			writeln('Ingrese el promedio del alumno'); 
			readln(alu.promedio);
			masGrande(alu.promedio, max1,max2,nomMax1,nomMax2,alu.nombre);
			cantAlu:= cantAlu + 1;
			writeln('Ingrese el codigo del alumno');
			readln(alu.codigo);
		end;
		writeln('Los nombres de los alumnos con el codigo mas grande fueron: ', nomMax1, ' seguido por: ', nomMax2);
	end;

var
a : alumno;
cantAlu: integer;
nomMax1,nomMax2:string;
begin
	cantAlu:=0;
	leer(a,cantAlu,nomMax1,nomMax2);
	writeln('La cantidad de alumnos leida fue: ', cantAlu);
end.
