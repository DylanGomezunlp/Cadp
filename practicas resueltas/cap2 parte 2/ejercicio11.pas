program ejercicio11;
function promedio (cantAlumnos:integer; numeroPar:integer ): real;
	begin
		promedio:= numeroPar/cantAlumnos*100;
	end;
function esPar (nInscripcion:integer) : boolean;
	begin
		esPar:=(nInscripcion mod 2 = 0);
	end;
procedure masChico (nInscripcion:integer; var min1,min2: integer; var apeMin1,apeMin2, apellido: string);
begin
	if (nInscripcion<min1) then begin
		min2:=min1;
		min1:=nInscripcion;
		apeMin2:=apeMin1;
		apeMin1:=apellido;
	end
	else 
		if (nInscripcion<min2) then begin
		min2:=nInscripcion;
		apeMin2:=apellido;
		end;
end;
procedure masGrande (nInscripcion:integer; var max1,max2: integer; var apeMax1,apeMax2, nombre: string);
begin
	if (nInscripcion>max1) then begin
		max2:=max1;
		apeMax2:=apeMax1;
		max1:=nInscripcion;
		apeMax1:=nombre;
	end
	else 
		if (nInscripcion>max2) then begin
		max2:=nInscripcion;
		apeMax2:=apeMax1;
		end;
end;
var
	nInscripcion, min1,min2,max1,max2, numeroPar: integer;
	apeMin1,apeMin2,apeMax1,apeMax2:string;
	cantAlumnos:integer;
	apellido, nombre:string;
begin
	cantAlumnos:=0;
	numeroPar:=0;
	min1:=32767;
	max1:=-32767;
	repeat
	writeln('Ingrese un numero de inscripcion: ');
	readln(nInscripcion);
	writeln('Ingrese el nombre del alumno: ');
	readln(nombre);
	writeln('ingrese el apellido del alumno ');
	readln(apellido);
	cantAlumnos:= cantAlumnos+1;
	if esPar (nInscripcion) then
		numeroPar:= numeroPar + 1;
	masChico(nInscripcion,min1,min2,apeMin1,apeMin2, apellido);
	masGrande(nInscripcion,max1,max2,apeMax1,apeMax2, nombre);
	until (nInscripcion=1200);
	writeln('el nombre del numero de inscripcion mas grande es: ', apeMax1, ' seguido de: ', apeMax2);
	writeln('el apellido del numero de inscripcion mas chicos es: ', apeMin1, ' seguido de: ', apeMin2); //puse nombre y apellido al reves XDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
	writeln('el porcentaje de alumnos con inscripcion par es de: ', promedio(cantAlumnos,numeroPar ):1:2, '%');
end.
