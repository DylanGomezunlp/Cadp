program eje9p6;
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
function EstaOrdenada (L:lista):boolean;
var
	ant:lista;
begin
    ant:=L;
    if (L=nil) then
        EstaOrdenada:=false;
    while (L<>nil) and (ant^.dato<=L^.dato) do begin
        ant:=L;
        L:=L^.sig;
    end;
    EstaOrdenada:= (L=nil);
end;
    
procedure aumentarEn1 (L:lista); //NO ES NECESARIO PASAR POR REFERENCIA CUANDO SE CAMBIAN LOS DATOS DE LA LISTA
begin
	while(L<>nil) do begin
		L^.dato:=L^.dato+1;
		L:=L^.sig;
	end;
end;

procedure eliminar (var L:lista; v:integer);
var
    act,ant:lista;
begin
    act:=L;
    while (act<>nil) and (act^.dato<>v) do begin
        ant:=act; act:=act^.sig;
    end;
    if (act<>nil) then 
        if (act=L) then begin
            L:=L^.sig; dispose(act);
        end
        else begin
            ant^.sig:=act^.sig;
            dispose(act);
        end;
    end;
    
procedure sublista (L:lista; a,b:integer; var Lp:lista);
begin
    while (L<>nil) do begin
        if ((l^.dato>=a)and(l^.dato<=b)) then begin
            InsertarOrdenado(Lp,L^.dato)
        end;
        L:=L^.sig;
    end;
end;




procedure sublistaAscendente (L:lista; a,b:integer; var Lp:lista);
begin
    while ((L<>nil)and(l^.dato<=b)) do begin
      if (l^.dato>=a) then begin
            InsertarOrdenado(Lp,L^.dato)
        end;
        L:=L^.sig;
    end;
end;

procedure sublistaDESCENDENTE (L:lista; a,b:integer; var Lp:lista);
begin
    while ((L<>nil)and(l^.dato>=a)) do begin
      if (l^.dato<=b) then begin
            InsertarOrdenado(Lp,L^.dato)
        end;
        L:=L^.sig;
    end;
end;













var
	pri,Lp:lista;
	valor,v,a,b:Integer;

begin
	pri:=nil; //inicializacion de lista
	Lp:=nil;
	writeln('ingrese un numero: ');
	readln(valor);
	while (valor<>0) do begin
		InsertarOrdenado(pri,valor);
		writeln('ingrese un numero: ');
		readln(valor);
	end;
	
	aumentarEn1(pri);
	imprimirLista(pri);
	writeln(EstaOrdenada(pri)); //si siempre hago insertar ordenado mas vale xd
    //writeln('ingrese un numero a eliminar: ');
   // readln(v);
   // eliminar(pri,v);
    //imprimirLista(pri);
    writeln('ingrese el rango para crear una sublista: ');
    readln(a);
    writeln('hasta: ');
    readln(b);
    sublista(pri,a,b,Lp);
    imprimirLista(Lp);
end.
