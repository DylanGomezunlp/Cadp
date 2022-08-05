program ejercicio10;
const
	numero=123456; //el rango del pascal no llega a ese numero
	
function esPar (num:integer): boolean;

begin
	esPar:=((num mod 2)=0);
end;
	
procedure descomponerNum (num:integer;var sumaPar:integer;var sumaImpar:integer);
var
	dig:integer;
begin
	dig:=0;
	while (num<>0) do begin
		dig:=num mod 10;
		if esPar(dig) then begin
			sumaPar:=sumaPar + dig;
		end else
			sumaImpar:= sumaImpar + 1;
		num:=num div 10;
		end;
end;

var
num,sumaImpar,sumaPar:integer;
begin
	repeat
	sumaImpar:=0;
	sumaPar:=0;
	writeln('ingrese un numero: ');
	readln(num);
	descomponerNum(num,sumaPar,sumaImpar);
	writeln('la suma de los digitos pares es: ', sumaPar, ' y la cantidad de numeros impares es: ', sumaImpar);
	until num=numero;
end.
	
	
	
	
	
	
