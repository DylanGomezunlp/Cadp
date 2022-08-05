program test6;
const
	DIMF=4;
type
	subrango=1..DIMF;
	inmueble=record
		tipo:subrango;
		//dniC:integer;
		dniD:integer;
		precio:real;
		//codigo:integer;
	end;
	lista=^nodo;
	nodo=record
		dato:inmueble;
		sig:lista;
	end;
	
procedure leerInmueble (var i:inmueble);
begin
	writeln('dni: ');
	readln(i.dniD);
	if i.dniD<>999 then begin
		writeln('detalles y presio: ');
		readln(i.precio);
		writeln('tipo: ');
		readln(i.tipo);
	end;
end;

procedure insertarOrdenado(var l:lista; i:inmueble);
var
	ant,act,nue:lista;
begin
	new(nue);
	nue^.dato:=i;
	ant:=l; 
	act:=l;
	while (act<>nil) and (i.dniD>act^.dato.dniD) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if act=ant then begin
		l:=nue
	end else
		ant^.sig:=nue;
	nue^.sig:=act;
end;
		

procedure cargarLista (var l:lista);
var
i:inmueble;
begin
	leerInmueble(i);
	while (i.dniD<>999) do begin
		insertarOrdenado(l,i);
		leerInmueble(i);
	end;
end;

procedure procesar (l:lista);
var
	dniAct,cant,tot:integer;
	promedio:real;
begin
	promedio:=0;
	tot:=0;//tot es para hacer la division con el promedio
	while l<>nil do begin
		dniAct:=l^.dato.dniD;
		cant:=0;
		while ((l<>nil) and (dniAct=l^.dato.dniD)) do begin
			if (l^.dato.precio>=5000) then
				cant:=cant+1;
			if l^.dato.tipo=2 then
				tot:=tot+1;
				promedio:=promedio+l^.dato.precio;
			l:=l^.sig;
		end;
		writeln('la cantidad de inmuebles mayores a 5luquitas para: ', dniAct, ' fue de: ', cant);
	end;
	writeln('el promedio de los tipo 2 fue: ', promedio/tot:10:2);
end;

var
	l:lista;
begin
	l:=nil;
	cargarLista(l);
	procesar(l);
end.
	
	
	
	
	
	



