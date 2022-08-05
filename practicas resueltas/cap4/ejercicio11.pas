
program ejercicio11;
const 
	persona='Art Vandelay';
	dimF=3;
type
	cadena=string[50];
	subrango=1..dimF;
	foto=record
		titulo:cadena;
		autor:cadena;
		mg:integer;
		clics:integer;
		comentarios:integer;
	end;
	vfotos=array[subrango]of foto;

procedure Leerfoto (var f:foto);
begin
	writeln('ingrese titulo de la foto: ');
	readln(f.titulo);
	writeln('ingrese el autor de la foto: ');
	readln(f.autor);
	writeln('ingrese cantidad de mg de la foto: ');
	readln(f.mg);
	writeln('ingrese cantidad de clics en la foto: ');
	readln(f.clics);
	writeln('ingrese cantidad de comentarios en la foto: ');
	readln(f.comentarios);
end;

function esPersona (N:cadena):boolean;
begin
	esPersona:=(N=persona);
end;

procedure cargarFotos (var v:vfotos);
var
	i:integer;
	f:foto;
begin
	for i:=1 to dimF do begin
		Leerfoto(f);
		v[i]:=f;
	end;
end;

procedure maximos (clics:integer; titulo:cadena; var max:integer; var tituloMax:cadena);
begin
	if (clics>max) then begin
		max:=clics;
		tituloMax:=titulo;
	end;
end;

procedure procesarVector (v:vfotos);
var
	tituloMax:cadena;
	max,i,totalMg,cantComentarios:integer;
begin
	max:=-1;
	totalMg:=0;
	for i:=1 to dimF do begin
		cantComentarios:=0;
		maximos(v[i].clics,v[i].titulo,max,tituloMax);
		if esPersona(v[i].autor) then begin
			totalMg:=totalMg+v[i].mg;
		end;
		cantComentarios:=cantComentarios+v[i].comentarios;
		writeln('la cantidad de comentarios en la foto: ',i, ' es de: ',cantComentarios);
	end;
	writeln('el titulo de la foto con mas visualizaciones es: ',tituloMax, ' con: ', max, ' clics');
	writeln(persona, ' tuvo: ', totalMg, ' likes en total');
end;

var
	v:vfotos;
begin
	cargarFotos(v);
	procesarVector(v);
end.
