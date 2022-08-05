program ejercicio2;

type
tcasamiento = record
		dia:1..31;
		mes:1..12;
		ano:1..2021;
	end;
function esPrimerDia (t:tcasamiento): boolean;
begin
	if t.dia<= 10 then begin
		esPrimerDia:= TRUE;
	end
	else
		esPrimerDia:=FALSE;
end;
function esVerano (c:tcasamiento): boolean;
begin
	if ((c.mes = 1) or (c.mes= 2)) then begin
		esVerano:=TRUE;
	end
	else if ((c.mes=3) and (c.dia <= 21)) then begin
		esVerano:=TRUE;
	end
		else
			esVerano:=FALSE;
	end;
procedure cantCasamiento(var cant:tcasamiento; var cantidad,mesesVerano:integer);
begin
		if esVerano(cant) then begin
		mesesVerano:= mesesVerano+1;
		end;
		if esPrimerDia(cant) then begin
		cantidad:=cantidad+1;
		end;
end;
	
procedure leerCasamiento(var casa:tcasamiento; var cantidad: integer; var mesesVerano:integer);
	begin
		writeln('ingrese el ano del casamiento: ');
		readln(casa.ano);
		while (casa.ano <> 2020) do begin
		writeln('ingrese el dia del casamiento');
		readln(casa.dia);
		writeln('ingrese el mes del casamiento: ');
		readln(casa.mes);
		cantCasamiento(casa,cantidad,mesesVerano);
			writeln('ingrese el ano del casamiento: ');
		readln(casa.ano);
		end;
		
	end;
var
	casamiento: tcasamiento;
	cantidad,mesesVerano:integer;
begin
	cantidad:=0;
	mesesVerano:=0;
	leerCasamiento(casamiento,cantidad,mesesVerano);
	writeln('la cantidad de casamientos hechos los primeros diez dias del mes fueron: ', cantidad, ' y la cantidad de casaminetos hechos en verano fueron: ', mesesVerano);
end.
