program ejerciciosfinal;
const
	dimf=300;
type
	subrango=100..200;
	venta=record
		cod:integer;
		codPro:subrango;
		cantidad:integer;
	end;
	//vector=array [subrango] of venta;
	
	tabla=array [subrango] of real;
	lista=^nodo;
	nodo=record
		dato:venta;
		sig:lista;
	end;
	
procedure InsertarOrdenado (var L:lista; v:venta);
var
	nuevo,actual,ant:lista;
begin
    new(nuevo); nuevo^.dato:=v;
    actual:=L;
    ant:=L;
    while (actual<>nil) and (v.codPro>actual^.dato.codPro) do begin
        ant:=actual;
        actual:=actual^.sig;
    end;
    if (actual=ant)then begin
        L:=nuevo;
    end else
        ant^.sig:=nuevo;
    nuevo^.sig:=actual;
end;
procedure inicializarVector (var v:tabla);
var	
	i:integer;
begin
	for i:=1 to dimF do begin
		v[i]:=0;
	end;
end;

procedure generarMontoTotal (l:lista; var contador:tabla; v:tabla);
//creo que tambien se puede hacer por corte de control
begin
	while (l<>nil) do begin
		contador[l^.dato.codPro]:=(contador[l^.dato.codPro] + (v[l^.dato.codPro]*l^.dato.cantidad));
		l:=l^.sig;
	end;
end;

procedure informarVec (v:tabla); 
var
	i:integer;
begin
	for i:=1 to dimf do begin
		writeln(v[i]);
	end;
end;
{1) la diferencia entree una lista y un vector es que la lista es una estructura de datos lineal secuencial y dinamica compuesta por nodos, mientras que un vector es una estructura de datos indecsada y se almacena en la memoria estatica. en la lista se puede eliminar los datos mientras que en un vector solo se pueden borrar logicamente.
2)la dimension fisica es la capacidad maxima que tiene un vector y su dimension logica es la cantidad de elementos reales que hay en su interior. la dimension logica se utiliza para mejorar los algortimos de los vectores como el de eliminacion y los de ordenamiento que sin una dimension logica no se podrian hacer.
3)es una eliminacion en un vector
4)//este despuesde ver el video de hoy
5)Procedure borrar (var a :números; var dim:integer;
                  var pude:boolean; pos:integer;);
  
Begin
  pude:= false;
  if ((pos>=1) and (pos<=dim))then begin
    
    for i:= pos to (dim-1) do
      a[i]:= a[i+1];  
    pude:= true;
    dim:= dim - 1;
  end; 
end;
6) Las variables globales son mala idea por, al menos, 5 razones:

El código es más difícil de entender
El código es más difícil de depurar
El código es más difícil de testear
El código es más difícil de mantener
El código es más difícil de reutilizar

7) la diferencia entre el dispose y el nil es que el dispose elimina la direccion en memoria que anteriormente fue creada y en cambio el nil, no la borra, solo que queda de forma inaccesible para cualquier puntero que este apuntando a esa direccion
8)se entiende reusabilidad en la modularizacion como una forma de usar muchas veces un mismo modulo con diferentes datos o usarlo en otro programa.}

