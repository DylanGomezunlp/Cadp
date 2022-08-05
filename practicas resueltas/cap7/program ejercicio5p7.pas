program ejercicio5p7
const
	dimf=100;
	corte=-1;
	antiguedad:5;
	capacidadmin:30,5;
type
	cadena=string[50];
	subrango=1..100;
	subrango2=2000...2021;
	camion=record
		patente=integer;
		año=subrango2;
		capacidad=integer;
	end;
	viaje=record
		cod:integer;
		codCamion:subrango;
		dni:integer;
		distancia:real;
		añorealizacion:subrango2;
		ciudadD:cadena;
	end;
	vectorCont=array[subrango] of integer;
	vCamion=array[subrango] of camion;//se disponen los datos cargados

procedure LeerCamion(var v:camion); //se dispone
procedure cargarvCamion(var v:vCamion); //se dispone

procedure inicializarVector(var v:vectorCont);
var
	i:integer;
begin
	for i:=1 to dimf do begin
		v[i]:=0;
	end;
end;

procedure maximosYminimos (patente:integer; kilometros:real ;var max:real; var patenteMax:integer; var min:real; var patenteMin:integer);
begin
	if (kilometros>max) then begin
		max:=kilometros;
		patenteMax:=patente;
	end;
	if (kilometros<min) then begin
		min:=kilometros;
		patenteMin:=patente;
	end;
end;


procedure leerViaje(var v:viaje);
var
	c:camion;
begin
	writeln('ingrese el codigo del viaje: ');
	readln(v.cod);
	if (v.cod<>-1) then begin
	writeln('ingrese el codigo del camion: ');
	readln(v.codCamion);
	writeln('ingrese el dni del chofer: ');
	readln(v.dni);
	writeln('ingrese la distancia recorrida: ');
	readln(v.distancia);
	writeln('ingrese el año de la realizacion del viaje: ');
	readln(v.añorealizacion);
	writeln('ingrese la ciudad de destino: ');
	readln(v.ciudadD);
	end;
end;

procedure agregarAdelante (var L:lista; o:viaje);
var
	aux:lista;
begin
	new(aux); aux^.dato:=o; aux^.sig:=L;
	L:=aux;
end;

procedure cargarLista (var L:lista);
var
	v:viaje;
begin
	leerViaje(v);
	while (v.cod<>corte) do begin
		agregarAdelante(L,v);
		leerViaje(v);
	end;
end;
procedure recorrerEinformar (v:vectorCont; c:vCamion);
var
	i:integer;
	max,min:real;
	patenteMax,patenteMin:integer;
begin
	max:=-1;
	min:=101;
	for i:=1 to dimF do begin
		maximosYminimos(c[i].patente,v[i],max,patenteMax,min,patenteMin);
	end;
	writeln('el auto con el codigo ', patenteMax,' fue el que mas km recorrio en total con: ', max,' y el que menos recorio fue el
		auto', patenteMin, 'con el total de: ', min); //preguntar si o si sobre esto
end;

function cumpleDNI (dni:integer):boolean;
var
	cantPar:integer;
begin
	cantPar:=0;
	while ((dni<>0) and (cantPar=0)) do begin
		if ((dig mod 2)=0) then
			cantPar:=cantPar+1;
		else
			dni:= dni div 10;
		end;
	end;
	cumpleDNI:=(cantPar=0);
end;

procedure recorrerLista (L:lista; camion:vCamion);
var
	v:vectorCont;
	cantViajes:integer;
begin
	cantCamiones:=0;
	while (L<>nil) do begin
		v[L^.dato.cod]:=v[L^.dato.cod]+L^.dato.distancia;
		if ((camion[L^.dato.cod].capacidad>=capacidadmin) and ((camion[L^.dato.cod].año-camion[L^.dato.cod].añorealizacion)>antiguedad))
			cantViajes:= cantViajes+1;
		if cumpleDNI(L^.dato.dni) then begin
			writeln(L^.dato.cod, ' es un viaje cuyo chofer tuvo un dni con solo digitos impares');
		end;
		L:=L^.sig;
	end;
	recorrerEinformar(v);
	writeln('La cantidad de viajes que se realizaron cuyos camiones tienen una capacidad 
		superior a: ', capacidadmin, ' y cuya antiguedad es superior a: ', antiguedad,' es de: ', cantViajes);
end;
var
	L:lista;
	Camion:vCamion;
	v:vectorCont;
begin
	l:=nil;
	inicializarVector(v);
	cargarvCamion(vCamion);
	cargarLista(L);
	recorrerLista(L,vCamion);
end;




















