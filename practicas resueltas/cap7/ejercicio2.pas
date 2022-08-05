
{Una vez finalizada la lectura de todos los clientes, se pide:
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la
estructura.}
program ejercicio2;
const
	corte=1122;
	dimF=6;
type
	subrango=1..dimF;
	cliente=record
		cod:integer;
		dni:integer;
		apeYnom:cadena;
		poliza:subrango;
		monto:real;
	end;
	tabla=array[subrango]of real; //se dispone los precios dentro

	lista=^nodo;
	nodo=record
		dato:cliente;
		sig:lista;
	end;
procedure cargarTabla (var t:tabla); //se dispone

procedure LeerCliente (var c:cliente);
begin
	writeLn('ingrese el codigo del cliente: ');
	readln(c.cod);
	writeLn('ingrese el dni del cliente: ');
	readln(c.dni);
	writeLn('ingrese el apellido y nombre del cliente: ');
	readln(apeYnom);
	writeLn('ingrese la el numero de poliza del cliente: ');
	readln(poliza);
	writeLn('ingrese el monto basico que abona el cliente: ');
	readln(monto);
end;
procedure agregarAdelante(var L:lista; c:cliente);
var 
	aux:lista;
begin
	new(aux); aux^.dato:=c; aux^.sig:=L;
	L:=aux;
end;

function montoCompleto (monto:real; poliza:subrango; t:tabla):real;
begin
	montoCompleto:= monto+t[poliza];
end;

procedure informarCliente(dni:integer; apeYnom:cadena; monto:real; poliza:subrango; t:tabla);
begin
	writeLn(dni);
	writeLn(apeYnom);
	writeLn(montoCompleto(monto,poliza,t))
end;
function contiene9 (dni:integer):boolean;
var
	cant9:integer;
begin
	cant9:=0;
	while (dni<>0) do begin
		if (dni mod 10) = 9 then
			cant9:=cant9+1;
		dni:=dni div 10;
	end;
	contiene9:= (cant9>=2);
end;


procedure cargarLista (var L:lista);
var
	c:cliente;
begin
	repeat
	LeerCliente(c);
	agregarAdelante(L,c);
	until c.cod=corte;
end;

procedure procesarLista (L:lista);
begin
	while (L<>nil) do begin
		informarCliente(L^.dato.dni,L^.dato.apeYnom,L^.dato.monto,L^.dato.poliza,t);
		if contiene9(L^.dato.apeYnom,L^.dato.dni) then begin
			writeLn(L^.dato.apeYnom);
		end;
	end;
end;

procedure eliminarCliente (var L:lista; v:integer);
var
	ant,act:lista;
begin
	act:=L;
	ant:=L;
	while (act^.dato.codigoDeCliente <> codigo) do begin //cuando seguro existe no es necesario poner el act<>nil
    ant:= act;
    act:= act^.sig;
  end;
  if (act = l) then  
    l:=l^.sig;
  else
    ant^.sig:=act^.sig;
  Dispose(act);
end;
end;

var
	L:lista;
	t:tabla;
	codigo:integer;
begin
	L:=nil;
	cargarTabla(t);
	cargarLista(L);
	procesarLista(L);
	writeLn('ingrese un codigo de cliente a eliminar: ');
	readln(codigo);
	eliminarCliente(L,codigo);
end.



