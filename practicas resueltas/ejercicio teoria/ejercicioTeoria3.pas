program uno;

procedure numero(a:integer; var b:integer);
var
	a:integer;
	
begin
	a:= (36 MOD 2) + 3;
if (a>=3) then b:= b+a * 2
		  else b:= b+a * 3;
b:=(b*6) div 5;
write (a);
write (b);
End;

var 
	a,b:integer;
	
begin
	a:=8;
	b:= 6;
	numero (b, a);
	write(a);
	write(b);
end.
// yo pienso que primero imprime 3 y 16. luego en el programa principal  16 y 6.
