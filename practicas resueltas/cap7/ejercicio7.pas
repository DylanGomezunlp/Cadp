program ejercicio7;
const
	dimF=3;
	aplazo=4;
type
	cadena=string[50];
	
	rango=1..dimF;
	
	vnotas=array [rango] of integer;
	
	alumno=record
		num:integer;
		apellido:cadena;
		nombre:cadena;
		email:cadena;
		anioI:integer;
		anioE:integer;
		notas:vnotas;
	end;
	lista=^nodo;
	
	nodo=record
	
		dato:alumno;
		sig:lista;
	end;
procedure imprimirVector (v:vnotas);
var
	i:integer;
begin
	for i:=1 to 3 do begin
		writeln(v[i]);
	end;
end;

procedure InicializarVec (var v:vnotas);
var
	i:integer;
begin
	for i:=1 to dimF do begin
		v[i]:=0;
	end;
end;

procedure leerNotas (var v:vnotas);
var
	i,aux:integer;
begin
	for i:=1 to dimF do begin
		writeln('ingrese la nota de la materia: ',i,': ');
		readln(aux);
		if (aux>=aplazo) then begin
			v[i]:=aux;
		end;	
	end;
end;
	
procedure cargarAlumno (var v:alumno);
begin
	writeln('ingrese el numero del alumno:');
	readln(v.num);
	if (v.num<>-1) then begin
		writeln('ingrese el apellido del alumno: ');
		readln(v.apellido);
		writeln('ingrese el nombre del alumno: ');
		readln(v.nombre);
		writeln('ingrese el direccion de correo electronico del alumno: ');
		readln(v.email);
		writeln('ingrese el anio de ingreso del alumno: ');
		readln(v.anioI);
		writeln('ingrese el anio de egreso del alumno: ');
		readln(v.anioE);
		leerNotas(v.notas);
	end;
end;

procedure agregarAdelante (var L:lista; o:alumno);
var
	aux:lista;
begin
	new(aux); aux^.dato:=o; aux^.sig:=L;
	L:=aux;
end;

function promedioAlumno (v:vnotas):real;
var
	total:integer;
	i:integer;
begin
	total:=0;
	for i:=1 to dimF do begin
		total:= total+v[i];
	end;
	promedioAlumno:=total/dimF;
end;

function todosIMPARES (num:integer):boolean;
var
	aux:integer;
begin
	aux:=0;
	while (num<>0) do begin
		if ((num mod 2) <> 0) then begin
			num:= num div 10;
		end
		else begin
			aux:=aux+1;
			num:=0;
		end;
	end;
	todosIMPARES:= (aux=0);
end;

procedure cantAluDigPar (var c:integer; num,anio:integer);
begin
	if ((anio=2012) and (todosIMPARES(num))) then begin
		c:=c+1;
	end;
end;

procedure minimos (nom,ape,email:cadena;anio:integer; var nomMin,nomMin2,apeMin,apeMin2,emailMin,emailMin2:cadena; var min,min2:integer);
begin
	if (anio<min) then begin
		nomMin2:=nomMin;
		apeMin2:=apeMin;
		emailMin2:=emailMin;
		min2:=min;
		min:=anio;
		nomMin:=nom;
		apeMin:=ape;
		emailMin:=email;
	end
	else if (anio<min2) then begin
		min2:=anio;
		nomMin2:=nom;
		apeMin:=ape;
		emailMin2:=email;
		end;
end;


procedure ordenarVector (var v:vnotas);
var
	i,j,p,item:integer;
begin
	for i:=1 to dimF-1 do begin
		p:=i;
		for j:=i+1 to dimF do
			if (v[j] > v[p]) then
				p:=j; //intercambiar v[i] y v[p]
		item:=v[p];
		v[p]:=v[i];
		v[i]:=item;
end;
end;

procedure CargarListaYprocesar (var L:lista);
var
	v:alumno;
	cantAlu,min1,min2:integer;
	nomMin,nomMin2,apeMin,apeMin2,emailMin,emailMin2:cadena;
begin
	min1:=9999;
	min2:=9999;
	cantAlu:=0;
	inicializarVec(v.notas);
	cargarAlumno(v);
	if (v.num<>-1) then begin	
		writeln('el promedio del alumno: ',v.nombre,' es de: ',promedioAlumno(v.notas):1:2);
		ordenarVector(v.notas);
		while (v.num<>-1) do begin
		minimos(v.nombre,v.apellido,v.email,v.anioI-v.anioE,nomMin,nomMin2,apeMin,apeMin2,emailMin,emailMin2,min1,min2);
		cantAluDigPar(cantAlu,v.num,v.anioI);
		agregarAdelante(L,v);
		cargarAlumno(v);
		writeln('el promedio del alumno: ',v.nombre,' es de: ',promedioAlumno(v.notas):2:2);
		//imprimirVector(v.notas);
		inicializarVec(v.notas);
		end;
		writeln('la cantidad de alumnos ingresados luego del 2012 y que su numero solo tiene digitos impares es de: ', cantAlu); 
		writeln('Los datos del alumno que menos tardo en recibirse fue: ', nomMin,' ',apeMin,' y su email es: ', emailMin,' seguido de: ', nomMin2,' ', apeMin2, ' y su mail es: ', emailMin2);
	end;
end;

    
procedure eliminarUnAlumno (var L:lista);
var
	act,ant:lista;
	v:integer;
begin
	writeln('ingrese el numero del alumno a eliminar: ');
	readln(v); 
	act:=L;
	while ((act<>nil) and (act^.dato.num<>v)) do begin
		ant:=act; act:=act^.sig;
	end;
	if (act<>nil) then
		if (act=L) then begin
			L:=L^.sig; dispose(act);
		end
		else begin
			ant^.sig:=act^.sig;
			dispose(act);
		end;
	end;
	
procedure insertarOrdenado(var l:LISTA; d:dato);
var
	nue,act,ant:lista;
begin
	new(nue); nue^.dato:d; act:=L; ant:=L; //aca no tengo que hacer nada con el nue^.sig
	while (act<>nil) and d.datoquenecesite>act^.datoquenecesite do begin
		ant:=act;
		act:=act^.sig;
	end;
	if	act=ant then
		L:=nue;
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure imprimirLista (L:lista);
begin
	while (L<>nil) do begin
		writeln('->',L^.dato.num);
		L:=L^.sig;
	end;
end;

var
	L:Lista;
begin
	L:=nil;
	CargarListaYprocesar(L); //habia que cargar y procesar aparte//
	eliminarUnAlumno(L);
	imprimirLista(L);
end.

	
