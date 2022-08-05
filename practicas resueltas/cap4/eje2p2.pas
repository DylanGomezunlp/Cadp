
program ejercicio2p2;
const
	dimF=10;
type
	vAlumnos=array [1..dimF] of string;
procedure leerAlumnos (var v:vAlumnos; var dimL:integer);
var
	nombre:string;
begin	
	dimL:=0;
	writeln('ingrese un nombre de alumno: ');
	readln(nombre);
	while ((dimL<=dimF) and (nombre<>'zzz')) do begin
		dimL := dimL+1;
		v[dimL]:=nombre;
		writeln('ingrese un nombre de alumno: ');
		readln(nombre);
	end;
	{for i:=1 to 5 do begin
		writeln(v[i]); //comprobacion
	end;}
end;
procedure eliminarOcurrencia (var v:vAlumnos; var dimL:integer);
var
	i,j:integer;
	ok:boolean;
	nombre:string;
begin
	j:=1;
	ok:=false;
	writeln('ingrese el nombre a eliminar: ');
	readln(nombre);
	while ((j<=dimL) and (not ok)) do begin
		if (v[j] = nombre) then begin
			for i:=1 to (dimL-1) do begin
				v[i]:= v[i+1];
				end;
		end
		else begin
			 j+=1; 
			 end;
		ok:=true;
		dimL:=dimL-1;
	end;
	write(ok);
end;
procedure AgregarEnPos (var v:vAlumnos; pos:integer; var dimL:integer; nombre:string);
var
	i:integer;
begin
	if(dimL<dimF) and (pos>=1) and (pos<=dimL) then begin
		for i:=dimL downto pos do begin
			v[i+1]:=v[i];
		end;
		dimL:=dimL+1;
		v[pos]:=nombre;
	end;
end;
procedure AgregarAlFinal (var v:vAlumnos; var dimL:integer; nombre:string);
begin
	if (dimL<dimF) then begin
		dimL:=dimL+1;
		v[dimL]:=nombre;
	end else begin
		writeln('no se pudo agregar el nombre al vector correctamente');
	end;
end;
var
	v:vAlumnos;
	dimL, pos,i:integer;
	nombre,nombre1:string;
begin
	leerAlumnos(v,dimL);
	eliminarOcurrencia(v,dimL);
	writeln('ingrese el nombre que quiera agregar');
	readln(nombre);
	writeln('ingrese en que posicion quiere agregarlo:');
	readln(pos);
	AgregarEnPos(v,pos,dimL,nombre);
	writeln('ingrese el nombre que quiera agregar al final');
	readln(nombre1);
	agregarAlFinal(v,dimL,nombre1);
		for i:=1 to 7 do begin
		writeln(v[i]); //comprobacion
	end;
end.
	
