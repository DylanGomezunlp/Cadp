program vectorcito;
type
	vector=array[1..10] of integer;
procedure cargarVector (var v:vector);
var
	i:integer;
begin
	for i:=1 to 10 do begin
		v[i]:=i+1;
	end;
end;

procedure paja (var v:vector; var dimL:integer; dato:integer; b:boolean);
var 
i,j:integer;
begin
  i:=1;
  while (i<=dimL) and (v[i]<dato) do i:=i+1;
  if i>dimL then b:=false
    else begin  
      b:=true;
      while (i<=dimL) and (v[i]=dato) do begin
        for j:=i+1 to dimL do v[j-1]:=v[j];
        dimL:=dimL-1;
      end;
    end;
 end;
 
var
v:vector;
b:boolean;
dato:integer;
dimL:integer;
begin
diml:=10;
cargarVector(v);
readln(dato);
paja(v,dimL,dato,b);
writeln(b);
end.
