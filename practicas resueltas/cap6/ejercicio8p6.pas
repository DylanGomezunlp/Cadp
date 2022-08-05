program eje9;
type
	lista=^nodo;
	nodo=record
		dato:integer;
		sig:lista;
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

procedure imprimirLista (L:Lista);
begin
	while(L<>nil) do begin
		write('->',L^.dato);
		L:=L^.sig;
		end;
end;

procedure aumentarEn1 (L:lista); //NO ES NECESARIO PASAR POR REFERENCIA CUANDO SE CAMBIAN LOS DATOS DE LA LISTA
begin
	while(L<>nil) do begin
		L^.dato:=L^.dato+1;
		L:=L^.sig;
	end;
end;
		
var
	pri:lista;
	valor:Integer;

begin
	pri:=nil; //inicializacion de lista
	writeln('ingrese un numero: ');
	readln(valor);
	while (valor<>0) do begin
		InsertarOrdenado(pri,valor);
		writeln('ingrese un numero: ');
		readln(valor);
	end;
	
	aumentarEn1(pri);
	imprimirLista(pri);
end.

