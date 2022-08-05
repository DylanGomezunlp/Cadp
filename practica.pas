program practica;
const
dimF=10;
type 
	vector= array[1..dimF] of char; //es hasta 100
	vCont= array[1..27] of integer; //vector contador de los caracteres repetidos
	
procedure cargarVec (var v:vector); //(3*dimF)+2+(dimF)*2
var
	i:integer;
	a:char;
begin
	for i:=1 to dimF do begin
		writeln('ingrese un caracter en orden; ' );
		readln(a);
		v[i]:=a;
	end;
end;

procedure inicializarVec (var v:vCont);
var
i:integer;
begin
	for i:=1 to dimF do begin//(3*dimF)+2+(dimF)*(lo de dentro)
		v[i]:=0;
	end;
end;

procedure repeticiones (var cont:vCont; v:vector);//recibe un caracter y se fija cuantas repeticiones tiene
var
	i,j:integer;
begin
	i:=1;
	j:=1;
	while ((i<=dimF) and (j<=27)) do begin
		if v[i]=v[i+1] then begin
			if cont[j]=0 then begin
				cont[j]:=1;
			end;
			cont[j]:=cont[j]+1
		end
		else
			j:=j+1;
		i:=i+1;
	end;
end;

procedure imprimirVec (v:vCont);
var
	i:integer;
begin
	for i:=1 to 27 do begin //(3*dimF)+2+(dimF)*(lo de dentro)
		writeln('la cantidad de veces que se repitio la letra: ', i, ' fue de: ', v[i]);
	end;
end;

var
	v:vector;
	vCon:vCont;
begin
	inicializarVec(vCon);
	cargarVec(v);
	repeticiones(vCon,v);
	writeln('----------');
	imprimirVec(vCon);
end.
	
