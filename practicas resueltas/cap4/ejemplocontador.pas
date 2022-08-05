program ejemplocontador;
const
	z=1;
type

	tFecha = record
		dia:1..31;
		mes:1..12;
		ano: 2020..2021;
	end;
	tPasiente = record
		nyp:string;
		fecha: tFecha;
		dni:integer;
	end;
	ContadorMeses = array[1..12] of integer;
	
	
procedure leerPaciente (var p:tPasiente);
begin
	writeln('ingrese un dni');
	readln(p.dni);
	writeln('ingrese un mes');
	readln(p.fecha.mes);
end;
	
var
	i:integer;
	p:tPasiente;
	c:ContadorMeses;
begin
	//inicializacion de variables
	for i:=1 to 12 do begin
		c[i]:=0;
	end;
	leerPaciente(p);//lee pacientes
	while (p.dni<>0) do begin
		c[p.fecha.mes]:=c[p.fecha.mes] + 1;//cuenta pascientes
		leerPaciente(p);
	end;
	writeln('la cantidad de vacunados en enero fue de ', c[1]);
end.
