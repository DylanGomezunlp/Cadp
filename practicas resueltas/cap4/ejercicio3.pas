{ 3. Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL. 
	a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.
b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.
c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y
desde la mitad más uno hacia la última posición.
* e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c.}}
program eje3;
type
	vector=array [1..dimF] of integer;

procedure imprimirVectorAscendente(v:vector, dimL);
var
	i:integer;
begin
	for i:=1 to dimL do begin
		writeln(v[i]);
	end;
end;

procedure imprimirVectorDescendente(v:vector, dimL);
var
	i:integer;
begin
	for i:=dimL DOWNto 1 do begin
		writeln(v[i]);
	end;
end;

procedure imprimirDesdeMitad (v:vector, dimL);
var
	i:integer;
begin
	i:= dimL div 2;
	while i<>0 do begin
		writeln(v[i]);
		i:=i-1;
	end;
	i:=(dimL div 2)+1;
	while (i<>diml and i<dimF) do begin
		writeln(v[i]);
		i:=i+1;
	end;
end;

procedure IrDeXaY (v:vector, x,y:integer);
begin
	if x<y then begin
		for x to y do begin
			writeln(v[x]);
			end;
	end
	else 
		while x<>y do begin
			writeln(v[x]);
			x=x-1;
		end;
end;

procedure 



















