program Ejercicio11pract3;

type tVuelo = record
	codAvion : integer;
	paisSalida : string [50];
	paisLlegada : string [50];
	kmR : integer;
	porcOcupacion : real;
end;

procedure leerVuelo(var v: tVuelo);
begin
	writeln('Ingrese codigo de avion: ');
	readln(v.codAvion);
	if(v.codAvion <> 44) then begin
		writeln('Ingrese pais de salida: ');
		readln(v.paisSalida);
		writeln('Ingrese pais de llegada: ');
		readln(v.paisLlegada);
		writeln('Ingrese los km recorridos: ');
		readln(v.kmR);
		writeln('Ingrese porcentaje de ocupacion: ');
		readln(v.porcOcupacion);
	end;
end;
procedure calcularMaximoRecorrido(kmRecorrido, codAvion : integer; var codAvMax1, codAvMax2, km_max1, km_max2 : integer);
begin
	if (kmRecorrido > km_max1) then begin
		km_max2 := km_max1;
		codAvMax2 := codAvMax1;
		km_max1 := kmRecorrido;
		codAvMax1 := codAvion;
		end	
		else 
			if(kmRecorrido > km_max2) then begin
				km_max2 := kmRecorrido;
				codAvMax2 := codAvion;
	end;
end;
procedure calcularMenorRecorrido(kmRecorrido, codAvion : integer; var codAvMin1, codAvMin2, km_min1, km_min2 : integer);
begin
	if (kmRecorrido < km_min1) then begin
		km_min2 := km_min1;
		codAvMin2 := codAvMin1;
		km_min1 := kmRecorrido;
		codAvMin1 := codAvion;
		end	
		else 
			if(kmRecorrido < km_min2) then begin
				km_min2 := kmRecorrido;
				codAvMin2 := codAvion;
	end;
end;
procedure elQueMasPaisesSalio(codAv : integer;cantPaises :integer; var maxPaisSalida, codAvMasSalida:integer);
begin
	if(cantPaises > maxPaisSalida) then begin
		maxPaisSalida := cantPaises;
		codAvMasSalida := codAv;
	end;

end; 

function siLlegoAustralia_NZ(pais : string; km :integer):boolean;
begin
		if( (pais = 'NUEVA ZELANDA') OR (pais = 'AUSTRALIA') AND (km <10000)) then begin
			siLlegoAustralia_NZ := true;
			end
		else begin
			siLlegoAustralia_NZ := false;	
		end;
end; 

function esMasDe5000ymenos60Ocupacion(km :integer; porcOc : real):boolean;
begin
		if( (km > 5000) AND (porcOc < 60) )then begin
			esMasDe5000ymenos60Ocupacion := true;
			end
			else begin
				esMasDe5000ymenos60Ocupacion := false;	
		end;	
end; 

var
	vuelo : tVuelo;
var
	codAvionMaxRecorrio1, codAvionMaxRecorrio2, codAvionMinRecorrio1, codAvionMinRecorrio2,
	codAvionMasPaises, maxRecorrido1, 
	maxRecorrido2, minRecorrido1, minRecorrido2, maxPais, cantMas5kyMenorOcupa,
	cantAorNZ, cantPaisesLeidos,codLeido,cantKm :integer;
var
	paisLeido : string[50];
	
begin
	
	codAvionMaxRecorrio1 := 0;
	codAvionMaxRecorrio2 := 0;
	codAvionMinRecorrio1 := 0;
	codAvionMinRecorrio2 := 0;
	codAvionMasPaises := 0;
	maxRecorrido1 := -1;
	maxRecorrido2 := -1;
	minRecorrido1 := 32767;
	minRecorrido2 := 32767;
	maxPais := -1;
	cantPaisesLeidos := 0;
	cantAorNZ := 0;
	cantMas5kyMenorOcupa := 0;

	leerVuelo(vuelo);
	while (vuelo.codAvion <> 44) do begin
		
		codLeido := vuelo.codAvion;
		cantKm := 0;
		cantPaisesLeidos := 0;
		while (vuelo.codAvion = codLeido) do begin
			cantPaisesLeidos := cantPaisesLeidos + 1;
			paisLeido := vuelo.paisSalida;
			while (vuelo.codAvion = codLeido) and (vuelo.paisSalida = paisLeido) do begin
				cantKm := cantKm + vuelo.kmr;
				if (esMasDe5000ymenos60Ocupacion(vuelo.kmR, vuelo.porcOcupacion)) then begin
					cantMas5kyMenorOcupa := cantMas5kyMenorOcupa + 1;
				end;
				if (siLlegoAustralia_NZ(vuelo.paisLlegada, vuelo.kmR)) then begin
					cantAorNZ := cantAorNZ + 1;
				end;			
				leerVuelo(vuelo);	
			end;
		end;
		elQueMasPaisesSalio(codLeido, cantPaisesLeidos, maxPais, codAvionMasPaises);
		calcularMaximoRecorrido(cantKm, codLeido, codAvionMaxRecorrio1, codAvionMaxRecorrio2, maxRecorrido1, maxRecorrido2);
		calcularMenorRecorrido(cantKm, codLeido, codAvionMinRecorrio1, codAvionMinRecorrio2, minRecorrido1, minRecorrido2);
		cantPaisesLeidos := 0;
	// Impresion de resultados 

	end;
	writeln('Los dos aviones que mas . . .',codAvionMaxRecorrio1,codAvionMaxRecorrio2);
	writeln('Los dos aviones que menos . . .',codAvionMinRecorrio1,codAvionMinRecorrio2);
	writeln('El avion que salio de mas paises es: ',codAvionMasPaises);
	writeln('La cantidad . . . ',cantMas5kyMenorOcupa);
	writeln('La cantidad . . . ',cantAorNZ);
//
	
end.
