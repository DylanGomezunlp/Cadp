program ejercicio8practica4p1;
const
	dimF=6;
	porcentaje=15;
type
	
	Salarios=array [1..dimF] of real;

procedure inicializarVector (var v:salarios);
var
	i:integer;
begin
	for i:=1 to dimF do begin
		v[i]:=0;
	end;
end;

procedure aumentar (var c:integer);
begin
	c:=c+1;
end;

procedure cargarVector (var V:Salarios; var dimL:integer);
var
	salario:real;
begin
	writeln('ingrese un salario: ');
	readln(salario);
	while (salario<>0) and (dimL<dimF) do begin
		aumentar(dimL);
		v[dimL]:=salario;
		writeln('ingrese un salario: ');
		readln(salario);
	end;
end;	

procedure imprimirVector (sal:salarios);
var
	i:integer;
begin
	for i:=1 to dimF do begin
		writeln(sal[i]:2:2);
	end;
end;
function Calcular (V:real): real;
var
	aux:real;
begin
	aux:= V*porcentaje/100;
	Calcular:=aux+V;
end;
	
	
	
	
procedure aumentarSal (var sal:salarios;var Total:real);
var
	i:integer;
begin
	for i:=1 to dimF do begin
		sal[i]:= Calcular(sal[i]);
		Total:= Total+sal[i];
	end;
end;

var
	Sal:salarios;
	dimL:integer;
	Total:real;
begin
	Total:=0;
	inicializarVector(Sal);
	cargarVector(sal,dimL);
	aumentarSal(sal,Total);
	//imprimirVector(sal);
	writeln('el promedio total de salarios es de: ', (Total/dimL):2:2);
end.
	
	
	
	
	
	
	
	
	
	
	
