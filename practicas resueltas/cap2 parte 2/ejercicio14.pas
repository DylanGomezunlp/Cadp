program ejercicio14;
const
rendimiento1=6;
rendimiento2=2.6;
rendimiento3=1.4;
type
	tipo=1..3;
	cadena=string[30];
	Siembra=record
		ha:real;
		zona:tipo;
		precio:real;
	end;
procedure LeerSiembra (var s:siembra);
begin
	writeln('ingrese el ha de la siembra');
	readln(s.ha);
	writeln('ingrese la zona de la siembra');
	readln(s.zona);
	writeln('ingrese el precio de la soja: ');
	readln(s.precio);
end;	

function rendimiento(cantHa:real; tipo:integer;precio:real):real;
begin
  case tipo of
    1: rendimiento:=cantHa*rendimiento1*precio;
    2: rendimiento:= cantHa *(rendimiento2)*precio;
    3: rendimiento:= cantHa* (rendimiento3)*precio;
    else 
     writeln('No existe esa zona');
  end;
end;

var
	s:siembra;
begin
	LeerSiembra(s);
	writeln(rendimiento(s.ha,s.zona,s.precio):5:10);
end.

		
