program prueba;
var c:integer;
procedure Calcular (var a,b:integer);
begin
	b:=10;
	while (b>0) do begin
		a:=a-b;
		b:=b-2;
		c:=c-b;
	end;
	writeln('a:= ', a, ' b:= ', b, ' c:= ', c);
end;

var
	a,b:integer;
begin
	b:=80;
	c:=30;
	writeln('a:= ', a, ' b:= ', b, ' c:= ', c);
	calcular(a,b);
	writeln('a:= ', a, ' b:= ', b, ' c:= ', c);
end.
