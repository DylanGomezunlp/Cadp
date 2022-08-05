program ejercicio3p2;
const
	dimF=5;
type
	tdia=1..31;
	viaje=record
		kilometro:integer;
		dia:tdia;
		dinero:real;
	end;
	vViajes=array [1..dimF] of viaje;
	
	dias=array [1..31] of integer;
	
procedure inicializarVector (var v:dias);
var
	i:integer;
begin
	for i:=1 to 31 do begin
		v[i]:=0;
	end;
end;
procedure aumentar (var c:integer);
begin
	c:=c+1;
end;

procedure leerViaje (var v:vViajes; var dimL:integer);
var
	i:integer;
	//total:real;
begin	
	//total:=0;
	i:=1; //se puede usar dimL tambien
	writeln('ingrese la cantidad de kilometros del viaje: ');
	readln(v[i].kilometro);
	while (v[i].kilometro<>0) and (dimL<dimF) do begin
		aumentar(dimL);
		writeln('ingrese el dia del viaje: ');
		readln(v[i].dia);
		writeln('ingrese el dinero del viaje: ');
		readln(v[i].dinero);
		//total:= total+v[i].dinero;
		aumentar(i);
		writeln('ingrese la cantidad de kilometros del viaje: ');
		readln(v[i].kilometro);
	end;
	//writeln('el promedio de dinero gastado en el total de los viajes es de: ', total/dimL:2:2);
end;
procedure minimos (dia:tdia; dinero:real; var minimo:real; kilometro:integer; var minDia:integer; var minKilometro:integer);

begin
	if (dinero<=minimo) then begin
		minimo:=dinero;
		minDia:=dia;
		minKilometro:=kilometro;
	end;
end;
			
procedure diaMes(var c:Dias; d:tdia);
begin
	aumentar(c[d]);
end;

procedure imprimirV (c:Dias);
var
	i:integer;
begin
	for i:=1 to 2 do begin //va 31
		writeln('la cantidad de viajes hechos en el dia: ',i, 'es de: ',c[i]);
	end;
end;



procedure procesarViaje (v:vViajes; dimL:integer);
var
	i,minDia,minKilometro:integer;
	total,min:real;
	cDia:dias;
begin
	inicializarVector(cDia);
	min:= 32768;
	total:=0;
	minDia:=0;
	minKilometro:=0;
	for i:=1 to dimL do begin
		total:= total+v[i].dinero; //total para el promedio
		minimos(v[i].dia, v[i].dinero, min, v[i].kilometro,minDia,minKilometro);
		diaMes(cDia,v[i].dia);
	end;
	writeln('el promedio de dinero gastado en el total de los viajes es de: ', total/dimL:2:2);
	writeln('el dia en el cual se realizo el viaje que transporto menos dinero fue el dia: ', minDia,' y la cantidad de kilometros fue de: ', minKilometro); //funciona iiiiiiiiiiiiii
	imprimirV(cDia);
end;
procedure eliminar (var v:vViajes;var dimL:integer);
var	
	i,j:integer;
begin
	for i:=1 to dimL do begin
		if (v[i].kilometro=100) then begin
			for j:=i to (dimL-1) do begin
				v[i]:=v[i+1];
				end;
			dimL:=dimL-1;
		end;
	end;
end;
procedure imprimirVectorNuevo (ve:vViajes;dimL:integer);
var
	i:integer;
begin
	writeln('los viajes sin contar a los que tienen 100km recorrieron estas dintancias: ');
	for i:=1 to dimL do begin
		writeln(ve[i].kilometro);
	end;
end;
var
	ve:vViajes;
	dimL:integer;
begin
	leerViaje(ve,dimL);
	procesarViaje(ve,dimL);
	Eliminar(ve,dimL);
	imprimirVectorNuevo(ve, dimL);
end.
	
	
	
	
	
	
	
	
	
