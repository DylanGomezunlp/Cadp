program ejercicioadicional1;
var
	promedio: Real;
	codEmpresa, i, montoInversion, maxEmp, montoT, cantInv, inversion, maxCodEmpresa: integer;
begin
	maxEmp:= -32768;
	montoT:=0;
	inversion:=0;
	
	repeat
		writeln('ingrese un codigo de empresa:');
		readln(codEmpresa);
		writeln('ingrese cantidad de inversiones de la empresa:');
		readln(cantInv);
		for i:=1 to cantInv do 
		begin
			writeln('ingrese la inversion de la empresa:');
			readln(montoInversion);
				if (montoInversion >= 30000) then
					inversion:= inversion + 1;
			montoT:= montoT + montoInversion;
		end;
		if montoT>maxEmp then 
		begin
			maxEmp:= montoT;
			maxCodEmpresa:= codEmpresa;
		end;
		promedio:= montoT/cantInv;
		writeln('el promedio de la empresa es de:', promedio:2:2);
		montoT:=0
	until (codEmpresa=100);
	writeln('La empresa con mayor total invertido fue: ', maxCodEmpresa);
	writeln('La cantidad de empresas con inversiones mayores a 30000 fueron: ', inversion);
end.
			
			
			
