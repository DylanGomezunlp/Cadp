program ejercicio6;
type
	rango=1..7;
	
	cadena=string[50];
	
	vtipo=array [rango] of integer;
	
	objeto=record
		cod:integer;
		dis:real;
		nombre:cadena;
		anio:integer;
		tipo:vtipo;
	end;
	
	lista=^nodo;
	                        
	nodo=record
		dato:objeto;
		sig:lista;
	
	end;

procedure inicializarVec (var v:vtipo);
var
	i:integer;
begin
	for i:=1 to 7 do begin
		v[i]:=0;
	end;
end;


procedure leerObjeto (var o:objeto);
begin
	writeln('ingrese el codigo del objeto: ');
	readln(o.cod);
	if (o.cod<>-1) then begin
		writeln('ingrese la distancia a la tierra del objeto: ');
		readln(o.dis);
		writeln('ingrese el nombre del descubridor del objeto: ');
		readln(o.nombre);
		writeln('ingrese el anio del descubrimiento: ');
		readln(o.anio);
	end;
end;
procedure agregarAtras (var L,ult:lista; o:objeto);
var
	nue:lista;
begin
	new(nue); nue^.dato:=o; nue^.sig:=nil;
	if (L=nil) then begin
		L:=nue;
	end
	else begin
		ult^.sig:=nue;
		end;
	ult:=nue;
end;

procedure DosMaximos (v:real; z:integer;var max1,max2:real; var codMax1,codMax2:integer);
begin
	if (v>max1) then begin
		max2:=max1;
		codMax2:=codMax1;
		max1:=v;
		codMax1:=z;
	end
	else if (v>max2) then begin
		max2:=v;
		codMax2:=z;
	end;
end;
procedure imprimirVector (v:vtipo);
var
	i:integer;
begin
	for i:=1 to 7 do begin
		writeln('la cantidad de objetos de la categoria', i, 'es de: ', v[i]);
	end;
end;

procedure categoria (var v:vtipo);
var
	i:integer;
begin
	writeln('ingrese el tipo del objeto: ');
	readln(i);
	if i<=7 then begin
		v[i]:= v[i]+1;
	end else
		writeln('ERROR');
	end;
function tieneMasPar (o:integer):boolean;
var
	cont,contIm:integer;
begin
	cont:=0;
	contIm:=0;
	while (o<>0) do begin
		if ((o mod 2) = 0) then begin
			cont:=cont+1;
		end 
		else begin
			contIm:=contIm+1;
		end;
		o:=o div 10;
	end;
	tieneMasPar:=cont>contIm;
end;
	
procedure masDigitosPares (var v:string; o:integer);
begin
	if (tieneMasPar(o)) then begin
		writeln(v,' tiene mas digitos pares que impares');
	end 
	else begin
		writeln(v,' no tine mas digitos pares que impares');
	end;
	
end;
	
function fueGalileo (v:string;o:integer):boolean;
begin
	fueGalileo:= ((v='Galileo Galilei') and (o<=1600));
end;

procedure CargarYprocesarLista(var L:lista);
var
	o:objeto;
	ult:lista;
	max1,max2:real;
	codMax,codMax2:integer;
	contG:integer;
	tipo:vtipo;
begin
	inicializarVec(tipo);
	max1:=-1;
	max2:=-1;
	codMax:=-1;
	codMax2:=-1;
	contG:=0;
	leerObjeto(o);
	while (o.cod<>-1) do begin
		categoria(tipo);
		agregarAtras(L,ult,o);
		DosMaximos(o.dis,o.cod,max1,max2,codMax,codMax2);
		if (fueGalileo(o.nombre,o.anio)) then begin
			contG:=contG+1;
		end;
		masDigitosPares(o.nombre,o.cod);
		leerObjeto(O);
	end;
	//writeln(contG);
	//writeln(codMax,' ',codMax2);
	imprimirVector(tipo);
end;

procedure imprimirLista (L:lista);
begin
	while (L<>nil) do begin
		write('->',L^.dato.cod);
		L:=L^.sig;
	end;
end;

var
	L:lista;
begin
	L:=nil;
	CargarYprocesarLista(L); //procesar y cargar van aparte
	imprimirLista(L);
end.
