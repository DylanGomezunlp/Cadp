program pactica3;
type
	cadena=string[20];
	subrango=1..12;
	publi=record
		titulo:cadena; (21)
		nombre:cadena; (21)
		dni:integer;(4)
		tipo:subrango; (4)
	end;
	lista=^nodo;
	nodo=record
		dato:publi;
		sig:lista;
	end;
	vCont=array[subrango] of integer;


procedure inicializarVec (var v:vCont);
var
i:integer; (4)
begin
	for i:=1 to 12 do begin//(3*dimF)+2+(dimF)*(lo de dentro)
		v[i]:=0;
	end;
end;


procedure leerPubli (var p:publi);
begin
	writeln('ingrese el dni del autor: ');
	readln(p.dni);
	if p.dni<>0 then begin
		writeln('ingrese el nombre del autor: ');
		readln(p.nombre);
		writeln('ingrese el titulo de la publicacion: ');
		readln(p.titulo);
		writeln('ingrese el tipo de la publicacion: ');
		readln(p.tipo);
	end;
end;

procedure InsertarOrdenado (var L:lista; v:publi);
var
	nuevo,actual,ant:lista; (3*4)
begin
    new(nuevo); nuevo^.dato:=v;
    actual:=L;
    ant:=L;
    while (actual<>nil) and (v.dni>actual^.dato.dni) do begin
        ant:=actual;
        actual:=actual^.sig;
    end;
    if (actual=ant)then begin
        L:=nuevo;
    end else
        ant^.sig:=nuevo;
    nuevo^.sig:=actual;
end;
procedure cargarLista (var l:lista; var v:vCont);
var
p:publi; (
begin
	leerPubli(p);
	while p.dni<>0 do begin
		insertarOrdenado(l,p);
		v[p.tipo]:=v[p.tipo]+1;
		leerPubli(p);
	end;
end;

procedure maximo (var max:integer; cant:integer; tipo:integer; var tipoMax:integer);
begin
	if cant>max then begin
		max:=cant;
		tipoMax:=tipo;
	end;
end;

procedure encontrarMax (v:vCont);
var
	i:integer; (4bytes)
	max:integer; (4bytes)
	tipoMax:integer; (4 bytes)
begin
	max:=-999;
	tipoMax:=0;
	for i:=1 to 12 do begin
		maximo(max,v[i],i,tipoMax);
	end;
	writeln('El tipo con mas publicaciones es: ', tipoMax);
end;

procedure informarAutor (l:lista);
var
 autorAct:cadena; (21 bytes)
 cont:integer; (4 bytes)
begin
	while (l<>nil) do begin
		autorAct:=l^.dato.nombre;
		cont:=0;
		while ((l<>nil) and (l^.dato.nombre=autorAct)) do begin
			cont:=cont+1;
			l:=l^.sig;
		end;
		writeln('el autor: ', autorAct, ' tiene: ', cont, ' de publicaciones');
	end;
end;

var
l:lista; (4bytes)
v:vCont; (12*21) 
begin
	l:=nil;
	inicializarVec(v);
	cargarLista(l, v);
	encontrarMax(v);
	informarAutor(l);
end.
	
	
	
	
	
	
	
	
