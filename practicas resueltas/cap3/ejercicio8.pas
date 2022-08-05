program ejercicio8;
type
	cadena=string[50];
	tDocente=record
		dni:integer;
		nomYape:cadena;
		email:cadena;
	end;
	proyecto=record
		cod:integer;
		titulo:cadena;
		docente:tDocente;
		cantAlu:integer;
		escuela:cadena;
		localidad:cadena;
	end;
procedure LeerDocente (var D:tdocente);
begin
	writeln('ingrese DNI');
	readln(D.dni);
	writeln('ingrese nya');
	readln(D.nomYape);
	writeln('ingrese email');
	readln(D.email);
end;

procedure LeerProyecto (var p:proyecto);
begin
	writeln('ingrese cod');
	readln(p.cod);
	if (p.cod<>-1) then begin
		writeln('ingrese titulo');
		readln(p.titulo);
		//LeerDocente(p.docente);
		writeln('ingrese cantAlu: ');
		readln(p.cantAlu);
		writeln('ingrese escuela: ');
		readln(p.escuela);
		writeln('ingrese localidad: ');
		readln(p.localidad);
	end;
end;
procedure Maximos (var max,max2:integer; var escuMax,escuMax2:string; totAlu:integer; escuelaAct:string);
begin
	if (totAlu>max) then begin
		max2:=max;
		escuMax2:=escuMax;
		max:=totAlu;
		escuMax:=escuelaAct;
	end 
	else if (totAlu>max2) then begin
		max2:=totAlu;
		escuMax2:=escuMax;
	end;
end;

function igualParesImpares (cod:integer):boolean;
 var
   pares,impares,dig:integer;
 begin
   pares:=0;
   impares:=0;
   while (cod<>0)do
     begin
       dig:=cod MOD 10;
       if (dig MOD 2=0)then
         pares:=pares+1
       else
         impares:=impares+1;
       cod:= cod DIV 10;
     end;
    igualParesImpares:=(pares=impares);
 end;
 


procedure cargarProyecto (var P:proyecto);
var
	locAct:cadena;
	escuelaAct:string;
	cantTot,cantLocal,totAlu:integer;
	max,max2:integer;
	escuMax,escuMax2:string;
begin
	max:=-1;
	max2:=-1;
	escuMax:=' ';
	escuMax2:=' ';
	leerProyecto(P);
	cantTot:=0;
	while (P.cod<>-1) do begin
	locAct:=p.localidad;
	while ((p.cod<>-1) and (p.localidad=locAct)) do begin
		cantLocal:=0;
		escuelaAct:=p.escuela;
		totAlu:=0;
		while (p.cod<>-1) and (p.escuela=escuelaAct) do begin
			totAlu:=totAlu+p.cantAlu;
			cantLocal:=cantLocal+p.cantAlu;
			cantTot:=cantTot+p.cantAlu;
			leerProyecto(P);
		end;
		writeln('la cantidad de alumnos en: ', locAct,' es de: ', cantLocal);
		Maximos(max,max2,escuMax,escuMax2,totAlu,escuelaAct);
	end;
	end;
	writeln('la escuela: ', escuMax,' es la que mayor alumnos llevo, seguida de: ', escuMax2);
	writeln('la cantidad total participantes es de: ', cantTot);//lo habia hecho bien poniendo la cantidad de escuelas, mamadera por eso desapobre el examen.
end;

var
	P:proyecto;
begin
	cargarProyecto(P);
end.
		
		
		
		
		
		
		
