program eje5;
type
	producto=record
		codigo:integer;
		stock:integer;
		stockMin:integer;
		precio:real;
	end;
	lista=^nodo;
	nodo= record
		dato:producto;
		sig:lista;
	end;
procedure cargarRegistro (var v:producto);
begin
	writeln('cod');
	readln(v.codigo);
	writeln('stock');
	readln(v.stock);
	writeln('stock min');
	readln(v.stockMin);
	writeln('precio');
	readln(v.precio);
end;
procedure imprimirRegistro (v:producto);
begin
	writeln(v.codigo);
	writeln(v.stock);
	writeln(v.stockMin);
	writeln(v.precio:2:2);
end;
procedure armarNodo (var L:lista; v:producto);
var
	aux:lista;
begin
	new(aux);	aux^.dato:=v;	aux^.sig:=L;
	L:=aux;
	
end;
procedure imprimirLista (L:Lista);
begin
	while(L<>nil) do begin
		imprimirRegistro(L^.dato);
		L:=L^.sig;
		end;
end;

var
	pri:lista;
	z:producto;
begin
	pri:=nil;
	cargarRegistro(z);
	armarNodo(pri,z);
	imprimirLista(pri);
end.
	
