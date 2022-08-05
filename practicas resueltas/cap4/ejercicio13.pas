program ejercicio13;
const
	dimFP=3;
	dimFA=2;
type
	
	puntos = array [1..dimFP] of integer;
	temperatura =array [1..dimFA] of puntos;
	
function promedioAno (total, j:integer): real;
begin
	promedioAno:=total/j;
end;

procedure MaximoAnio (v:real; var maxA:real; var max:real);
begin
	
	if (v>max) then begin
		max:=v;
		maxA:=max;
	end;
end;


procedure MaximoPunto (v:integer; var maxP, max:integer);
begin
	if (v>max) then begin
		max:=v;
		maxP:=max;
	end;
end;
procedure cargarVectorYprocesar (var v:temperatura);
var
	i,j:Integer;
	max,total,maxP:integer;
	maxA:real;
	max2:real;
begin
	max:=-32742;
	max2:=-32742;
	for i:=1 to dimFA do begin
		total:=0;
		writeln('ingrese el promedio de temperatura del anio: ', i);
			for j:=1 to dimFP do begin
				writeln('ingrese el promedio de temperatura del punto: ', j);
				readln(v[i][j]);
				MaximoPunto(v[i][j], maxP, max);
				total:= total+v[i][j];
			end;
			writeln('el promedio del anio:', i, 'es de: ', promedioAno(total,j):1:2);
			writeln('el promedio maximo del punto: ', j, ' es de: ', maxP);
			maximoAnio(promedioAno(total,j), maxA,max2);
	end;
	writeln('el mayor promedio anual fue de: ', maxA:2:2);
end;




var
	v:temperatura;
begin
	cargarVectorYprocesar(v);
	//imprimirVector(v);
end.
