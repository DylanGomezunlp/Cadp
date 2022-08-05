program examen2;
const
	modelos=130;
	paro=1111;
type
	subrango:1..modelos;
	tPago:1..6;
	cadena:string[50];
	venta=record
		codC:integer;
		codT:subrango;
		marca:cadena;
		medioDpago:tpago;
	end;
	tabla=array[tPago] of integer; //se dispone el precio en esta tabla
	Lista=^nodo;
	nodo=record
		dato:venta;
		sig:lista;
	end;
	
procedure agregarAtras (var L,ult:lista; venta:ventas);
var
	nue:lista;
begin
	new(nue); nue^.dato:=ventas; nue^.sig:=nil;
	if (L=nil) then begin
		L:=nue;
	end
	else begin
		ult^.sig:=nue;
		end;
	ult:=nue;
end;

procedure LeerVenta (var ve:ventas);
begin
	readln(ve.codC);
	readln(ve.codT);
	readln(ve.marca);
	readln(ve.medioPago);
END;
procedure inicializarVec (var v:contador);
var
	i:integer;
begin
	for i:=1 to 6 do begin
		v[i]:=0;
	end;
end;

procedure cargarLista (var L:lista);
var
	ve:ventas;
begin
	repeat
	LeerVenta(v);
	agregarAtras(L,v);
	until v.codC=paro;
end;

procedure ProcesarLista (L:lista);
var
	max,max2,total:real;
	medioMax,medioMax2:tpago;
	v2:tabla;
	v:contador;
begin
	max:=-1;
	max2:=-1;
	inicializarVec(V);
	while (L<>nil) do begin
		v[L^.dato.medioPago]:= v[L^.dato.medioPago]+ v2[L^.dato.medioPago];
		L:=L^.sig;
	end;
end;

procedure 	ordenarVector (var v:contador);
si, lo que estoy haceindo esta bien, no se como hacerlo solo nada mas.
	ordenarVector(v);!!
	informarMaximos(v);
	
		
		
		
	

	
	
	
	
	
	
