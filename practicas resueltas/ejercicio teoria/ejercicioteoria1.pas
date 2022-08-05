program porValor;
procedure uno (num:integer);
var
	x:integer;
begin
	if (num=7) then
	    num:= num+1;
	x:=num;
	write(num);
	write(x);
end;
var
	x: integer;
begin
	x:= 7;
	uno (x);
end.
// el primer ejercicio devuelve 8, el segundo devuelve 8 8.
