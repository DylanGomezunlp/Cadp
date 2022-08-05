program ejercicio12;
const
	ramMin=3;
	pulgadas=5;
type
	celular=record
		android:real;
		tamanio:real;
		ram:Integer;
	end;

	lista=^nodo;

	nodo = record
		dato:celular;
		sig:lista;
	end;
	{la lista de precios que se disponen se ponen como vectores y uno usa el indice de cuando se cargan los datos
	y dependiendo lo que te piden lo guardas en una variable total o otra cosa
	y cuando piden maximo clientes de una misma categoria lo que tenes que hacer esponerlos en un vector contador y ahi vas sumando las webas}
	
procedure cargarLista (var L:lista); //se dispone


procedure dispositivo (ramDis:real; tamanio:real; var c:integer;);
begin
	if ((ram>=ramMin) and (tamanio<=pulgadas)) then begin
		c:=c+1;
	end;
end;

procedure procesarLista (L:lista);
var
	contAndroid:integer;
	cantDis:integer;
	androidAct,promedioTot:real;
begin
	totalDis:=0;
	promedioTot:=0;
	while (L<>nil) do begin
		contAndroid:=0;
		totalDis:=totalDis+1;
		promedioTot:=promedioTot+L^.dato.tamanio;
		androidAct:=L^.dato.android;
		while ((L<>nil) and (L^.dato.android=androidAct)) do begin
			dispositivo(L^.dato.ram,L^.dato.tamanio,cantDis);
			contAndroid:=contAndroid+1;
			totalDis=totalDis+1;
			promedioTot:=promedioTot+L^.dato.tamanio;
			L:=L^.sig;
		end;
		writeln('la cantidad de androids version: ',androidAct,' es de: ', contAndroid);
	end;
	writeln('el promedio del tamanio de todos los dispositivos es de: ', promedioTot/totalDis:2:2);
end;

var
	l:lista;
begin
	l:=nil;
	cargarlista(L);
	procesarLista(L);
end.
