program practica2;
type
	venta=record
		codV:integer;
		codP:integer;
		cant:integer;
	end;
	lista=^nodo;
	nodo=record
		dato:venta;
		sig:lista;
	end;

procedure leerVenta (var v:venta);
begin
	writeln('ingrese el codigo de venta');
	readln(v.codV);
	if (v.codV<>999) then begin
		WriteLn('ingrese el codigo del producto  ');
		ReadLn(v.codP);
		WriteLn('ingrese la cantidad vendida');
		ReadLn(v.cant);
	end;
end;


procedure InsertarOrdenado (var L:lista; v:venta);
var
	nuevo,actual,ant:lista;
begin
    new(nuevo); nuevo^.dato:=v;
    actual:=L;
    ant:=L;
    while (actual<>nil) and (v.codP>actual^.dato.codP) do begin
        ant:=actual;
        actual:=actual^.sig;
    end;
    if (actual=ant)then begin
        L:=nuevo;
    end else
        ant^.sig:=nuevo;
    nuevo^.sig:=actual;
end;

procedure buscarEnLista (L:lista; cod:integer; var cant:integer);
begin
	while ((l<>nil) and (l^.dato.codP<cod)) do begin
		writeln('-----');
		l:=l^.sig;
	end;
	if ((l<>nil) and (l^.dato.codP=cod)) then begin cant:=l^.dato.cant; writeln('--funciono en teoria---'); end;
end;

procedure cargarLista (var L:lista);
var
	v:venta;
begin
	leerVenta(v);
	while v.codV<>999 do begin
		InsertarOrdenado(l,v);
		leerVenta(v);
	end;
end;
procedure imprimirLista (l:lista);
begin
	while l<>nil do begin
		write('->', l^.dato.codP);
		l:=l^.sig;
	end;
end;

var
	l:lista;
	cant:integer;
	cod:integer;
begin
	l:=nil;
	cant:=0;
	cargarLista(l);
	imprimirLista(l);
	writeln('ingrese un codigo a buscar para la cantidad: ');
	readln(cod);
	buscarEnLista(l, cod, cant);
	writeln('la cantidad de productos vendidos de ese codigo de producto es de: ', cant);
end.
