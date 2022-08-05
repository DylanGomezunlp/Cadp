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

procedure maximoYminimo (L:lista); //no hace falta el notion de mierda ahhhhhhhhhhhhhhhhhhh, max en un valor chiquitoooooooo
var
	max,min:integer;
begin
	max:=-32767;
	min:=32767;
	while (L<>nil) do begin
		if (L^.dato>max) then begin
			max:=L^.dato;	
		end;
		if (L^.dato<min) then begin
			min:=L^.dato;
		end;
		L:=L^.sig;
	end;
	writeln('el numero minimo de la lista es: ',min, ' y el maximo fue: ', max); //esta bien pero no me gusta
end;

function multiplo (L:lista; x:integer): integer;
var
	cant:integer;
begin
	cant:=0;
	while(L<>nil) do begin
		if ((L^.dato mod x)=0) then begin
			cant:=cant+1;
	 	end;
		L:=L^.sig;
	end;
	multiplo:=cant;
end;		
var
	pri,ult:lista;
	valor,num:Integer;

begin
	pri:=nil; //inicializacion de lista
	writeln('ingrese un numero: ');
	readln(valor);
	while (valor<>0) do begin
		agregarAtras(pri,ult,valor);
		writeln('ingrese un numero: ');
		readln(valor);
	end;
	maximoYminimo(pri);
	writeln('ingrese un numero a verificar: ');
	readln(num);
	writeln('la cantidad de multiplos de: ', num,' es de: ',multiplo(pri,num));
	imprimirLista(pri);
end.
