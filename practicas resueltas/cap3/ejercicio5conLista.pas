{Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca, y queda almacenada en una estructura correspondiente.Luego de procesados los datos
se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro.}
program ejercicio5;
type
	cadena=string[50];
	auto=record
		marca:string;
		modelo:cadena;
		precio:real;
	end;
	lista=^nodo;
	nodo=record
		dato:auto;
		sig:lista;
	end;
procedure leerAuto (var a:auto);
begin
	writeln('ingrese la marca del auto');
	readln(a.marca);
	if (a.marca<>'zzz') then begin
		writeln('ingrese el modelo del auto');
		readln(a.modelo);
		writeln('ingrese el precio del auto');
		readln(a.precio);
	end;
end;

procedure agregarAdelante (var L:lista; a:auto);
var
	aux:lista;
begin
	new(aux); aux^.dato:=a; aux^.sig:=L;
	L:=aux;
end;

procedure crearLista (var L:lista);
var
	a:auto;
begin
	leerAuto(a);
	while (a.marca<>'zzz') do begin
		agregarAdelante(L,a);
		leerAuto(a);
	end;
end;

function promedio (precioTOT:real; autosMarca:integer):real;
begin
	promedio:= precioTOT/autosMarca;
end;

procedure autoMasCaro (precio:real; marca,modelo:cadena; var max:real; var marcaMax,modeloMax:cadena);
begin
	if (precio>max) then begin
		max:=precio;
		marcaMax:=marca;
		modeloMax:=modelo;
	end;
end;

procedure recorrerYprocesarLista (L:lista);
var
	precioTotal,max:real;
	totalAutos:integer;
	marcaAct,marcaMax,modeloMax:cadena;
begin
	max:=-1;
	while (L<>nil) do begin
		marcaAct:=L^.dato.marca;
		precioTotal:=0;
		totalAutos:=0;
		while ((L<>nil) and (L^.dato.marca=marcaAct)) do begin
			precioTotal:=precioTotal+L^.dato.precio;
			autoMasCaro(L^.dato.precio,marcaAct,L^.dato.modelo,max,marcaMax,modeloMax);
			totalAutos:=totalAutos+1;
			L:=L^.sig;
		end;
		writeln('el precio promedio de autos de: ', marcaAct,' es de: ', promedio(precioTotal,totalAutos):10:3);
	end;
	writeln('El modelo del auto mas caro es: ', modeloMax, ' y su marca es: ', marcaMax);
end;
var
	L:lista;
begin
	L:=nil;
	crearLista(L);
	recorrerYprocesarLista(L);
end.
