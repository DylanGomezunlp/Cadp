program eje1;
type
	lista=^nodo;
	nodo=record
		dato:integer;
		sig:lista;
	end;

procedure agregarAtras (var L:lista; var ult:lista; v:integer);
var
	aux:lista;
begin
	new(aux); 
	aux^.dato:=v;
	aux^.sig:=nil;
	
	if (L=nil) then begin
		L:=aux;
	end else begin
		ULT^.sig:=aux;
	end;
	ULT:=aux;
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
	pri,ult:lista;
	valor:Integer;

begin
	pri:=nil; //inicializacion de lita
	writeln('ingrese un numero: ');
	readln(valor);
	while (valor<>0) do begin
		agregarAtras(pri,ult,valor);
		writeln('ingrese un numero: ');
		readln(valor);
	end;
	
	//aumentarEn1(pri);
	imprimirLista(pri);
end.

