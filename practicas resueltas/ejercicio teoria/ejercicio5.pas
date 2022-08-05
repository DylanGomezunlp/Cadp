program uno;
procedure numero (var a: integer; b:integer; var c:integer);
var
	a:integer;
begin
	a:= (b+c) mod 2;
	if (a mod 2 = 0) then
		begin
			b:= b + a * 3;  //18
			c:= 8 div 2; //4
			a:= a + b * c;//72
		end
	else begin
		b:= (b+a) div 2;
		c:= 25 div 4;
		a:= a + b * c;
		end;
	writeln(a);  //
	writeln(b); //18
	writeln(c); //4
end;

var
a,b,c: integer;
begin
	a:= 18;
	b:= 16;
	c:=3;
	numero (c,a,b);   
	writeln(a); //18
	writeln(b); //4
	writeln(c); //72
end.
