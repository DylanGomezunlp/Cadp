program test5;
type
	lista=^nodo;
	nodo=record
		dato:integer;
		sig:lista;
	end;
	rep=record
		num:integer;
		cant:integer;
	end;
	lista2=^nodo2;
	nodo2=record
		dato:rep;
		sig:lista2;
	end;

	
procedure InsertarOrdenado (var L:lista; v:integer);
var
	nuevo,actual,ant:lista;
begin
    new(nuevo); nuevo^.dato:=v;
    actual:=L;
    ant:=L;
    while (actual<>nil) and (v>actual^.dato) do begin
        ant:=actual;
        actual:=actual^.sig;
    end;
    if (actual=ant)then begin
        L:=nuevo;
    end else
        ant^.sig:=nuevo;
    nuevo^.sig:=actual;
end;

procedure imprimirLista (l:lista);
begin
	while l<>nil do begin
		writeln('->', l^.dato);
		l:=l^.sig;
	end;
end;

procedure imprimirLista2 (l:lista2);
begin
	while l<>nil do begin
		writeln('->', l^.dato.cant);
		l:=l^.sig;
	end;
end;


procedure cargarLista (var l:lista);
var
	n:integer;
begin
	writeln('numero: ');
	read(n);
	while n<>0 do begin
		InsertarOrdenado(l, n);
		writeln('numero: ');
		read(n);
	end;
end;

procedure agregarAdelante (var L:lista2; reg:rep);
var
	aux:lista2;
begin
	new(aux); 
	aux^.dato:=reg;
	aux^.sig:=l;
	L:=aux;
end;

procedure nuevaLista (l:lista; var l2:lista2);
var
reg:rep; //registro de tipo repeticiones.
numAct:integer;
begin
	while (l<>nil) do begin
		numAct:=l^.dato;
		reg.num:=numAct;
		reg.cant:=0;
		while ((l<>nil) and (numAct=l^.dato)) do begin
			reg.cant:=reg.cant+1;
			writeln('---conto uno-----');
			l:=l^.sig;
		end;
		agregarAdelante(l2,reg);
	end;
end;
var
	l:lista;
	l2:lista2;
begin
	l:=nil;
	l2:=nil;
	cargarLista(l);
	//imprimirLista(l);
	nuevaLista(l,l2);
	//writeln('--------');
	imprimirLista2(l2);
end.

