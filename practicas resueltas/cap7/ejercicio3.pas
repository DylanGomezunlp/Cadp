{3. Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de
2020. De cada viaje se conoce: número de viaje, código de auto, dirección de origen, dirección de
destino y kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por código
de auto y para un mismo código de auto pueden existir 1 o más viajes. Se pide:
a. Informar los dos códigos de auto que más kilómetros recorrieron.
b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número
de viaje.}
program ejercicio3
type
	viajes=record
		numV:integer;
		cod:integer;
		dirOr:string;
		dirDes:string;
		Km:integer;
	end;
	lista=^nodo
	nodo=record
		dato:viajes;
		sig:lista;
	end;

procedure leerViaje(var v:viaje);//SE DISPONE
procedure insertar(var l:lista;v:viaje);//SE DISPONE
procedure cargarLista(var l:lista);//SE DISPONE


procedure armarNodo (var L:lista; v:viajes);
var
	aux:lista;
begin
	new(aux);	aux^.dato:=v;	aux^.sig:=L;
	L:=aux;
end;
	
procedure ProcesarLista (var L:lista);
var
	v:viajes;
	viajeActual:integer;
	totalViajes:integer;
begin
	totalViajes:=0;
	
	while (v.cod<>0) do begin
		
		while (viajeActual=v.cod) do begin	
			totalViajes:=totalViajes+1;
			
		end;
		writeln(totalViajes);
	end;
		
	
begin
	L:nil;

end.
	
