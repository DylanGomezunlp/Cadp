program exament1;
CONST
	pasajeros=50;
type
	subrango=1..1200;
	cadena=string[50];
	ticket=record
		codVue:subrango;
		DNI:integer;
		paisO:cadena;
		paisD:cadena;
		valor:real;
	end;
	lista=^nodo;
	nodo=record
		dato:ticket;
		sig:lista;
	end;
	vectorCont=array [subrango] of integer;

procedure inicializarVector (var v:vectorCont);
var
	i:integer;
begin
	for i:=1 to 1200 do begin
		v[i]:=0;
	end;
end;
procedure recorrerVectorEinformar (v:vectorCont);
var
	i,cantVuelos:integer;
begin
	cantVuelos:=0;
	for i:=1 to 1200 do begin 
		if (v[i]>=pasajeros) then begin
			cantVuelos:=cantVuelos+1;
		end;
	end;
	writeln('la cantidad de vuelos dentro de un mismo pais que hayan tenido mas de 50 pasajeros son: ', cantVuelos);
end;
			

procedure CargarTickets (var L:lista; var T:ticket) //se dispone

procedure maximoDni (var max:real; var maxdni:integer; dni:integer; precio:real);
begin
	if (precio>max) then begin
		max:=precio;
		maxDni:=dni;
	end;
end;
function terminaEn0O5 (dni:integer):boolean;
var
	ok:boolean
begin
	if ((dni div 10) = 5) or ((dni div 10)=0) then
		ok:=true;
	end else
		ok:=false;
	terminaEn0O5:=ok;
end;

procedure procesarTickets (L:Lista);
var
	dniAct,maxdni,cantDnien5o0:integer;
	max:real;
	cantTickets:integer;
	v:vectorCont;
	totalGastado:real;
begin
	inicializarVector(v);
	cantDnien5o0:=0;
	max:=-1;
	while L<>nil do begin
		totalGastado:=0;
		dniAct:=L^.dato.dni;
		while ((L<>nil) and (dniAct=L^.dato.dni)) do begin
			if L^.dato.paisO=L^.dato.paisD do begin
				v[L^.dato.codVuelo]:=v[L^.dato.codVuelo]+1;
			end;
			if terminaEn0O5(L^.dato.dni) then begin
				cantDnien5o0:=cantDnien5o0+1;
			end;
			totalGastado:=totalGastado+L^.dato.valor;
			L:=L^.sig;
		end;
		maximoDni(max,maxdni,dniAct,totalGastado);
	end;
end;

var
	L:lista;
	v:vectorCont;
	T:ticket;
begin
	L:=nil;
	cargarLista(L,T);
	procesarTickets(L);
	recorrerVectorEinformar(v);
end.
	

	
