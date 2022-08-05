program practica2p2_6;
procedure productos (precio: real; var min,min2,max: real; codigo: integer; tipo: string; var codMax,codMin,codMin2:integer);
begin
	if(precio<min)then
		begin
			min2:= min;
			codMin2:= codMin;
			min:= precio;
			codMin:= codigo;
		end
	else
	begin
		if (precio<min2) then
			begin
				min2:=precio;
				codMin2:=codigo;
			end;
		end;
	if (tipo='pantalon') then
		begin 
			if(precio>max) then
				codMax:=precio
			end;
		end;
var
i,codigo,codMax,codMin,codMin2:integer;
precio,min,min2,max,suma:real;
tipo:string;
begin
	min:=32767;
	min2:= 32767;
	max:= -32737;
	suma:=0;
	codMax:=0;
	codMin:=0;
	for i:=1 to 100 do
		begin
			writeln('escriba el codigo: ');
			readln(codigo);
			writeln('escriba el precio');
			readln(precio);
			writeln('escriba el tipo: ');
			readln(tipo);
	productos (precio,min,min2,max,codigo,tipo,codMax,codMin,codMin2);
		suma:= suma+precio;
	writeln('el pantalos mas caro fue:', codMax);
	writeln('el producto mas barato fue: ', codMin);
	writeln('el segundo producto mas barato fue: ', codMin2);
	writeln('el precio promedio es de: ', suma/100:1:4);
     end;
end.
	
