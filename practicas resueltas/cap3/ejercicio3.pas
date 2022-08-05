program ejercicio3;
const
	promedioIdeal=23.435;
type
	tescuela=record
	CUE:integer;
	localidad:string[50];
	Nombre:string[50];
	cantAlu:integer;
	cantProf:integer;
end;
function relacion (A,P:integer):real;
begin
	relacion:= A/P;
end;
function Cociente(A,P:integer): boolean;
begin
	Cociente:= A/P<=promedioIdeal;
end;
procedure EsLaPlata (c:string; A,P:integer; var cant:integer);
begin
	if (c='La plata') and Cociente(A,P) then begin;
		cant:=cant+1;
	end;
end;
procedure mejorEscuela(promedio:real; CUE : integer; var codCUEmax, codCUEmax2:integer; var promMax, promMax2 : real; var nomMax,nomMax2:string; nom:string);
begin
	promMax:=3277; //locura
	if (promedio < promMax) then begin
		promMax2 := promMax;
		promMax := promedio;
		nomMax2:=nomMax;
		nomMax:=nom;
		codCUEmax2:=codCUEmax;
		codCUEmax:=CUE;
		end	
		else 
			if(promedio < promMax2) then begin
				promMax2 := promedio;
				codCUEmax2 := CUE;
				nomMax2:= nom;
	end;
end;
procedure leerEscuela (var escu:tescuela; var cantidad:integer);


begin

	writeln('ingrese el CUE de la escuela: ');
	readln(escu.CUE);
	writeln('ingrese la localidad de la escuela: ');
	readln(escu.localidad);
	writeln('ingrese el nombre de la escuela: ');
	readln(escu.nombre);
	writeln(escu.nombre);
	writeln('ingrese la cantidad de alumnos de la escuela: ');
	readln(escu.cantAlu);
	writeln('ingrese la cantidad de profesores de la escuel: ');
	readln(escu.cantProf);
	EsLaPlata(escu.localidad, escu.cantAlu, escu.cantProf, cantidad);
end;
var
	i,cantidad:integer;
	escuela:tescuela;
	codCUEmax,codCUEmax2:integer;
	promMax,promMax2, aux:real;
	nomMax,nomMax2:string;
begin
	aux:=0;
	cantidad:=0;
	for i:=1 to 2 do begin
	leerEscuela(escuela,cantidad);
	aux:=relacion(escuela.cantAlu,escuela.cantProf);
	MejorEscuela(aux,escuela.cue,codCUEmax,codCUEmax2,promMax,promMax2, nomMax,nomMax2, escuela.nombre);
	end;
	writeln('las mejores escuelas fueron: ', nomMax, ' y ', nomMax2);
	writeln('y sus codigos son: ', codCUEmax, ' y ', codCUEmax2, ' respectivamente');
	writeln('la cantidad de escuelas de La plata con el promedio ideal es de: ', cantidad);
end.


