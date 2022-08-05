{3. Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de
2020. De cada viaje se conoce: número de viaje, código de auto, dirección de origen, dirección de
destino y kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por código
de auto y para un mismo código de auto pueden existir 1 o más viajes. Se pide:
a. Informar los dos códigos de auto que más kilómetros recorrieron.
b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número
de viaje.}
program ejercicio3
type
    cadena=string[50];
	viajes=record
		numV:integer;
		cod:integer;
		dirOr:cadena;
		dirDes:cadena;
		Km:integer;
	end;
	lista=^nodo
	nodo=record
		dato:viajes;
		sig:lista;
	end;

procedure leerViaje(var v:viaje);//se dispone
procedure insertar(var l:lista;v:viaje);//se dispone
procedure cargarLista(var l:lista);//se dispone


procedure ProcesarLista (L:lista; var listaN:viajes); //va por valor!!! ya que la estoy recorriendo
var
	v:viajes;
	autoActual:integer;
	totalKm:real;
begin
    MaxKm:=-1;
	while (L<>nil) do begin
	    autoActual:= L^dato.cod;
	    totalKm:=0;
		while (L<>nil) and (L^dato.cod=autoActual) do begin	
			totalViajes:=totalViajes+L^.dato.Km;
			L:=L^sig;
		end;
		MaximoAuto(viajeActual,autoMax1,autoMax2,totalKm,MaxKm1,MaxKm2);
	end;
		writeln(totalViajes);
end;
		
var
    L:lista;
begin
	L:=nil;
	ProcesarLista(L);
end.
	
