program ejercicioAdicional2;
type
	nota= 1..10;
var
	notas: nota;
	legajo, i, n10,n0, presente, condicion, notasT, aprobado, aproboTodo, AlUn0, maxNota10, maxLegajoNota10, maxLegajoNota0, maxNota0, SmaxNota10, SmaxLegajoNota10, SmaxLegajoNota0, SmaxNota0: integer;
	condicion: char;
	promedio: Real;
begin
	promedio:=0;
	notas:=0;
	legajo:=0;
	n10:=0;
	n0:=0;
	notasT:=0;
	alumnosDes:=0;
	writeln('Ingrese el legajo del alumno:');
	readln(legajo);
	while (legajo <> -1) begin
		writeln('Ingrese la condicion del alumno:');
		readln(condicion);
		for i:=1 to 5 do
		begin
			writeln('ingrese la nota del alumno:');
			readln(notas);
			notasT:= notasT + notas;
			if notas >= 4 then
				presente:= presente + 1;
				aprobado:= aprobado +1;
			if notas = 10 then
			n10:= n10 + 1;
			if notas = 0 then begin
				n0:= n0+1;
				AlUn0:= AlUn0+1;
			end;
			if (presente=5) and (aprobado = 5) then
				aproboTodo:= aproboTodo;
			end;	
		promedio:= notasT/5;
		if promedio >= 6.5 then
			alumnosDes:= AlumnosDes + 1;
		
		
		if presente >= 4 then 
			begin
				condicion:= condicion+1;
			end;
	//falta maximos y minimos y recursantes e ingresantes.
			
			
	
