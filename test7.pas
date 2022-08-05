program test7;
const
	dimF=200;
type
	subrango=100..dimF;
	venta=record
		codV:integer;
		codP:subrango;
		cant:integer;
	end;
	lista=^nodo;
	nodo=record
		dato:venta;
		sig:lista;
	end;
procedure leerVenta (var v:venta);
begin
	writeln('cod venta: ');
	readln(v.codV);
	if v.codV<>-1 then begin
		writeln('cod producto 100..200: ');
		readln(v.codP);
		writeln('cant: ');
		writeln(v.cant);
	end;
end;

procedure insertarOrdenado (var l:lista; v:venta);
var
	nue,ant,act:lista;
begin
	new(nue); nue^.dato:=v;
	ant:=l; act:=l;
	while ((act<>nil) and (v.codV>act^.dato.codV)) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if act=ant then begin
		l:=nue;
	end else
		ant^.sig:=nue;
	ant^.sig:=act;
end;
	
procedure procesar (l:lista; vector:vec);
var
tot:real;
producAct:integer;
begin
	while l<>nil do begin
		producAct:=l^.dato.codV;
		tot:=0;
		while ((l<>nil) and (l^.dato.codv=producAct)) do begin
			tot:=tot+v[l^.dato.codP];
			l:=l^.sig;
		end;
		writeln('el monto total del producto: ', producAct, ' es de: ', tot);
	end;
end;
		
		
		
		
		
		
		
		
		
