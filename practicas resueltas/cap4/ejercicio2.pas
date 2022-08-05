program vectores;
const
	cant_datos=5;
type
	vdatos=array[1..cant_datos] of real;

procedure cargarVector (var v:vdatos; var dimL:integer);
var
	num:real;
begin
	writeln('ingrese un numero para el vector: ');
	readln(num);
	while (num<>0) and (dimL < cant_datos) do begin
		v[dimL]:= num;
		dimL:= dimL+1;
		writeln('ingrese un numero para el vector: ');
		readln(num);
	end;
end;




procedure modificarVectorySuma (var v:vdatos; dimL:integer; n:real; var suma:real);
var
i:integer;
begin
	for i:=1 to dimL do begin
		v[i]:= v[i]+n;
		suma:= suma + v[i];
	end;
end;

var
	datos:vdatos;
	dim:integer;
	num,suma:real;

begin
	dim:=0;
	suma:=0;
	cargarVector(datos,dim);
	writeln('ingrese un valor a sumar');
	readln(num);
	modificarVectorySuma(datos,dim,num,suma);
	writeln('la suma de los valores es: ', suma:2:2);
	writeln('se procesaron: ',dim, ' numeros');
end.
	
