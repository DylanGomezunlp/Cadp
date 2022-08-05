program ejercicio7;
type
	centro=record
		nombre:string;
		universidad:string;
		cantInv:integer;
		cantBec:integer;
	end;
procedure leerCentro (var c:centro);
begin
	writeln('ingrese la cantidad de investigadores del centro');
	readln(c.cantInv);
	writeln('ingrese el nombre del centro');
	readln(c.nombre);
	writeln('ingrese el nombre de la universidad');
	readln(c.universidad);
	writeln('ingrese la cantidad de becarios');
	readln(c.cantBec);
end;
procedure minimos (num:integer; nombre:string; var min1,min2:integer; var nomMin1,nomMin2:string);
begin	
	if (num<min1) then begin
		min2:=min1;
		min1:=num;
		nomMin2:=nomMin1;
		nomMin1:=nombre;
	end
	else if (num<min2) then begin
		min2:=num;
		nomMin2:=nombre;
	end;
end;
procedure maximos (num:integer; nombre:string; var max:integer; var nomMax:string);
begin
	if (num>max) then begin
		max:=num;
		nomMax:=nombre;
	end;
end;
var
	z,y:centro;
	cantCentros,min1,min2,max,cantInve:integer;
	uniActual,nomMax,nomMin1,nomMin2:string;
	
begin
	leerCentro(z);
	{min1:=32767;
	max:=-1;
	nomMin1:=' ';
	nomMin2:=' ';
	nomMax:=' ';
	while (z.cantInv<>0) do begin
		uniActual:=z.universidad;
		cantCentros:=0;
		cantInve:=0;
		while (z.universidad=uniActual) do begin
			cantCentros:= cantCentros+1;
			cantInve:=cantInve+z.cantinv;
			minimos(z.cantBec,z.nombre,min1,min2,nomMin1,nomMin2);
			leerCentro(z);
		end;
		maximos(cantInve, uniActual, max,nomMax);
		writeln('la cantidad de centros en la universidad: ', uniActual, ' es de: ', cantCentros);
	end;
	writeln('los dos centros con menos cantidad de becados son: ', nomMin1, ' y: ', nomMin2);
	writeln('la universidad con la mayor cantidad en sus centros es: ', nomMax);}
	z=y;
end.
