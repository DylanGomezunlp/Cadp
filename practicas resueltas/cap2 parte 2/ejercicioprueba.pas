El siguiente programa intenta resolver un enunciado. Sin embargo, el código posee 5 errores. Indicar en
qué línea se encuentra cada error y en qué consiste el error.
Enunciado: Realice un programa que lea datos de 130 programadores Java de una empresa. De cada
programador se lee el número de legajo y el salario actual. El programa debe imprimir el total del dinero
destinado por mes al pago de salarios, y el salario del empleado mayor legajo.

program programadores;
2. procedure leerDatos(var legajo: integer; salario : real); //el salario no es un parametro por referencia, esta mal
3. begin
4. writeln(‘Ingrese el nro de legajo y el salario”);
5. read(legajo);
6. read(salario);
7. end;
8. procedure actualizarMaximo(nuevoLegajo:integer; nuevoSalario:real; var maxLegajo:integer); //el nuevo legano y el nuevo salar
9. var
10. maxSalario : real;
11. begin
12. if (nuevoLegajo > maxLegajo) then begin //creo que es que no se puede hacer esto sin iniciar el numero maximo en primer lugar.
13. maxLegajo:= nuevoLegajo;
14. maxSalario := nuevoSalario
15. end;
16. end;
17. var
18. legajo, maxLegajo, i : integer;
19. salario, maxSalario : real;
20. begin
21. sumaSalarios := 0;
22. for i := 1 to 130 do begin
23. leerDatos(salario, legajo); //los datos estan al reves, los datos de los parametros son por posicion, no por nombre
24. actualizarMaximo(legajo, salario, maxLegajo);
25. sumaSalarios := sumaSalarios + salario;//esto es mal por el error anterior
26. end;
27. writeln(‘En todo el mes se gastan ‘, sumaSalarios, ‘ pesos’);
28. writeln(‘El salario del empleado más nuevo es ‘,maxSalario);
29. end.
