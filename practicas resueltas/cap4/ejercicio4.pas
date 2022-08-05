program ej4p4;
const
	DIMF=100;
type
	vEnteros= array[1..100] of integer;
	
procedure CargarVector(var v:enteros; var dimL:integer); //se dispone pero se declara el encabezado
var
	num:integer
begin
	dimL:=0
	readln(num);
	while (dimL<>DIMF) and (diml>DIMF) do begin
		readln(num);
		
end;

function posicion(x:integer;v:vEnteros):integer; //busca un numero en un vector
var
	i:integer;
begin
	i:=1;
	while (i<=100) and (v[i] <> x) do begin //si el numero es distinto, avanzo
		i:=i+1;
	end;
	if (i<=100) then begin
		posicion:=i;
	end 
	else begin
		posicion:=-1;
	end;
	
procedure intercambio(x,y:integer; var v:vEnteros); //cambia las posiciones de los vectores
	var
		aux:integer;
		
	begin
		aux:=v[x];
		v[x]:=v[y];
		v[y]:=aux;
	end;
		
function sumaVector(v:vEnteros): integer; //sumar todos lo de dentro de los vectores
var
	i:integer;
	suma:integer;
begin
		suma:=0;
		for i:=1 to DIMF do begin
			suma:= suma+ v[i];
		end;
		sumaVector:= suma;
end;

function promedio(v:vEnteros): real; //promedio total del vector
begin 
	promedio:=sumaVector(v)/100;
end;
		
function elementoMaximo (v:vEnteros):integer //devuelve la posicion del elemento maximo
var 
	i,indiceMax,max:integer
begin
	max:=-32786;
	for i:=1 to 100 do 
		if (v[i] > max) then begin
		max:= v[i];
		indiceMax:=i;
		end;
	end;
	elementoMaximo:= indiceMax;
end;

		
function elementoMinimo(v:vEnteros):integer //devuelve la posicion del elemento minimo
var 
	i,indiceMin,min:integer
begin
	min:= 37672;
	for i:=1 to 100 do 
		if (v[i] < min) then begin
		min:= v[i];
		indiceMin:=i;
		end;
	end;
	elementoMinimo:= indiceMin;
end;
var
	enteros:vEnteros;
	dimL: integer;
begin
	cargarVector(enteros,dimL

		
	
