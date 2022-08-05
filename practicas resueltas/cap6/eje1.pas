program eje1;
type
	lista=^nodo;
	nodo=record
		dato:integer;
		sig:lista;
	end;

procedure armarNodo (var L:lista; v:integer);
var
	aux:lista;
begin
	new(aux);
	aux^.dato:=v;
	aux^.sig:=L;
	L:=aux;
end;

procedure imprimirLista (L:Lista);
begin
	while(L<>nil) do begin
		writeln(L^.dato);
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
	pri:=nil; //inicializacion de lita
	writeln('ingrese un numero: ');
	readln(valor);
	while (valor<>0) do begin
		armarNodo(pri,valor);
		writeln('ingrese un numero: ');
		readln(valor);
	end;
	
	aumentarEn1(pri);
	imprimirLista(pri);
end.

