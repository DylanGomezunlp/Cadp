program ejercicio7parte1creemeami;
const
	dimF=9;
type
	rango=0..9;
	vContador = array [rango] of integer;
procedure InicializarCont (var v:vContador);
var
i:rango;
begin
	for i:=0 to dimF do begin
		v[i]:= 0;
	end;
end;
procedure descomponer (var v:vContador; num:integer);
var
	resto:integer;
begin
	while(num<>0) do begin
		resto:=num mod 10;
		v[resto]:=v[resto]+1;
		num:=num div 10;
	end;
end;
procedure informar (v:vContador);
var
i:integer;
begin
	i:=0;
	while (i<10) do begin
		while (v[i]	<> 0) and (i<=9) do begin
			writeln('el numero: ', i, ' se repitio: ', v[i], ' veces');
			i:=i+1;
		end;
		if (v[i]=0) then begin
			writeln('el numero: ', i, ' no tuvo ocurrencias');
			i:=i+1;
			end;
		end;
end;
function maximo (v:vContador):rango;
var
		
	i,digmax:rango;
		max:integer;
begin
	max:=-1;
	for i:=0 to 9 do
		if (v[i] > max) then begin
			max:= v[i];
			digmax:=i;
		end;
	maximo:=digmax;
end;
var
	num:integer;
	v:vContador;
begin
{	InicializarCont(v);
	writeln('ingrese un numero:');
	readln(num);
	while (num<>-1) do begin
		descomponer(v,num);
		writeln('ingrese un numero:');
		readln(num);
	end;
	informar(v);     asi se hace para informar cuantas veces salio cada uno} 

	
	writeln('ingrese un numero:');
	readln(num);
	while (num<>-1) do begin
		InicializarCont(v);
		descomponer(v,num);
		writeln('ingrese un numero:');
		{riteln('el digito que mas aparece es: ', maximo(v));} //digito mas grande en una sola secuencia
		readln(num);
		{informar(v);}
	end;
	informar(v);
	informarDigMax(v);
end.
