
SELECT * from dept;
select * from emp;

--el 149 es el advance. 

--bbms.output.put_line('Hola mundo desde PL/SQL');

DECLARE
  miNumero integer := 55;
  miTexto varchar2(100) := 'Hola mundo';
  miFlotante float := 3.1415;
  miFecha date := sysdate;
  longitud integer;
  miNumeroDos integer := 777;
  miSuma integer;
  v_deptno int;
BEGIN
  dbms_output.put_line('Hola mundo desde PL/SQL, este es el número: ' || miNumero);
  dbms_output.put_line ('Estee es el String: ' || miTexto);
  dbms_output.put_line ('Este es el float: ' || miFlotante);
  miTexto := '&dato';
  dbms_output.put_line ('El número es: ' || miTexto);
  longitud := length(miTexto);
  dbms_output.put_line ('La longitud de la cadena es: ' || longitud);
  dbms_output.put_line ('la fecha es: ' || to_char(miFecha, 'day'));
  miSuma := (miNumero + miNumeroDos);
  dbms_output.put_line ('la suma es:  ' || miSuma);
  v_deptno := &deptno;
  update emp set salario = salario + 1 where dept_no = v_deptno;
END;

--quitar la definicion de las variabeles, para que cada vez que se se ejecuta la apllicacion ejecte la peticion de los  números. 
UNDEFINE dato;
UNDEFINE deptno;

SELECT * from dept;

declare 
  v_numero dept.DEPT_NO%TYPE;
  v_nombre dept.dnombre%TYPE;
  v_localidad dept.LOC%TYPE;
BEGIN
  -- le pedimos al usuario los valores. 
  v_numero := &iddepartamento;
  v_nombre := '&nombre;';
  v_localidad := '&localidad;';

  INSERT into dept values (v_numero, v_nombre, v_localidad);
end;

UNDEFINE iddepartamento;
UNDEFINE nombre;
UNDEFINE localidad;

--10/4/2025
--ejercicios de sintaxisu 

--2
INSERT INTO emp VALUES('7839', 'rey', 'PRESIDENTE', NULL, TO_DATE('17-11-2005', 'DD-MM-YYYY'), 650000, NULL, 10);

SELECT * from emp;

DECLARE
  v_empno emp.emp_no%TYPE;
BEGIN
  v_empno := &empno;
  INSERT into emp values (v_empno, 'perez', 'analista', null, sysdate, 2000, null, 10);
END;

UNDEFINE empno;

--3 
SELECT * from emp;

DECLARE
  v_oficio emp.oficio%TYPE;
  miValorSumar integer := 200;
BEGIN
  v_oficio := '&oficio';
  UPDATE emp SET salario = salario + miValorSumar WHERE oficio = v_oficio;
  dbms_output.put_line ('Se han actualizado los salarios de los empleados con oficio ' || v_oficio);
END;

--4  
DECLARE
  v_mientero integer;
  mistring varchar2(100);
BEGIN
  v_mientero := &mientero;
  mistring := to_char(v_mientero);
  dbms_output.put_line ('La cantidad de cifras es: ' || length (mistring));
END;

UNDEFINE mientero;

--5 ya esta hecho. 


--6 
SELECT * from emp;
SELECT emp_no, nvl (COMISION, 0) from emp;
--buscar a los empleados que tiene una comisión de más del 5%. 
SELECT * from emp where nvl(comision,0)/SALARIO > 0.05;

DECLARE 
BEGIN
  update emp set SALARIO = SALARIO * 1.05 where nvl(comision,0)/SALARIO < 0.05;
end;

--7

DECLARE
  miFecha date := sysdate;
  v_cantidadmeses integer := 0;
BEGIN
  v_cantidadmeses := '&cantidadmeses';
  miFecha := add_months (miFecha, v_cantidadmeses);
  dbms_output.put_line ('La fecha hoy es: ' || miFecha);
end;

--8

DECLARE
  v_numerouno integer := 0;
  v_numerodos integer := 0;

BEGIN
  v_numerouno := '&numerouno';
  v_numerodos := '&numerodos';
  dbms_output.put_line ('El resto de la división es:  ' || mod(v_numerouno, v_numerodos));
end;


--9
DECLARE
  v_minombre varchar2(100);
BEGIN
  v_minombre := '&minombre';
  dbms_output.put_line ('El nombre es: ' || initcap(v_minombre));
end;

UNDEFINE minombre;


--10
SELECT * from emp;

DECLARE
  v_numerempleado emp.emp_no%TYPE;
BEGIN
  v_numerempleado := '&numerodeempleado';
  DELETE FROM emp WHERE emp_no = v_numerempleado;
end;


UNDEFINE numerodeempleado;


---  aquí van  ir las estructuras de control.
--- en el texto es en el que tienes que poner las comillas, en el caso de que sea un entero,entonces no hace falta tener las comillas.

declare 
  v_minumerouno integer;
BEGIN
  v_minumerouno := '&minumerouno';

  if (v_minumerouno > 0) then
    dbms_output.put_line ('El número es positivo ');
  elsif (v_minumerouno = 0) then  
    dbms_output.put_line ('El número es cero ');
  else
    dbms_output.put_line ('El número es negativo ');
  end if;
end;

UNDEFINE minumerouno;


declare 
  v_numero integer;
BEGIN
  v_numero := &numero;
  if (v_numero = 1) then
    dbms_output.put_line ('es primavera');
  elsif (v_numero = 2) then
    dbms_output.put_line ('es verano');
  ELSIF (v_numero = 3) then
    dbms_output.put_line ('es otoño');
  ELSIF (v_numero = 4) then
    dbms_output.put_line ('es invierno');
  else
    dbms_output.put_line ('no es una estación válida');
  end if;
end;

UNDEFINE numero;


---ejemplo número mayor.
--hacer


---pedir un número al usuario y decir si es par o impar. 

declare
    v_numero integer;
begin
    v_numero := &numero;
    
    if (mod (v_numero,2) = 0) then
        dbms_output.put_line (' es par. ');
    else
        dbms_output.put_line (' es impar.');
    end if;
end;

-- en el caso de que sea vocal indiarlo, en el caso de que no, es consonante. 

/
declare 
    v_micarater varchar2 (1);
begin
    v_micarater := '&micaracter';
    v_micarater := lower (v_micarater);
    if ((v_micarater = 'a') or (v_micarater = 'e') or (v_micarater = 'i') or (v_micarater = 'o') or (v_micarater = 'u'))  then
        dbms_output.put_line ('es vocal');
    else
        dbms_output.put_line (' es consonante.');
    end if;
end;
/



declare 
    v_minumerouno integer;
    v_minumerodos integer;
    v_minumerotres integer;
begin
    v_minumerouno := &minumerouno;
    v_minumerodos := &minumerodos;
    v_minumerotres := &minumerotres;
    if (v_minumerouno > v_minumerodos) and (v_minumerouno > v_minumerotres) then
        dbms_output.put_line ('elmayor es el primero');
    elsif (v_minumerodos > v_minumerouno) and (v_minumerodos > v_minumerotres) then
        dbms_output.put_line ('elmayor es el segundo');
    else
        dbms_output.put_line ('elmayor es el tercero');
    end if;    
    if (v_minumerouno < v_minumerodos) and (v_minumerouno < v_minumerotres) then
        dbms_output.put_line ('el menor es el primero');
    elsif (v_minumerodos < v_minumerouno) and (v_minumerodos < v_minumerotres) then
        dbms_output.put_line ('el menor es el segundo');
    else
        dbms_output.put_line ('el menor es el tercero');
    end if;
end;


declare 
    v_minumerouno integer;
    v_minumerodos integer;
    v_minumerotres integer;
    v_maximo integer;
    v_minimo integer;
    v_intermedio integer;
begin
    v_minumerouno := &minumerouno;
    v_minumerodos := &minumerodos;
    v_minumerotres := &minumerotres;
    if (v_minumerouno > v_minumerodos) and (v_minumerouno > v_minumerotres) then
        dbms_output.put_line ('elmayor es el primero');
        v_maximo := v_minumerouno;
    elsif (v_minumerodos > v_minumerouno) and (v_minumerodos > v_minumerotres) then
        dbms_output.put_line ('elmayor es el segundo');
        v_maximo := v_minumerodos;
    else
        dbms_output.put_line ('elmayor es el tercero');
        v_maximo := v_minumerotres;
    end if;    
    if (v_minumerouno < v_minumerodos) and (v_minumerouno < v_minumerotres) then
        dbms_output.put_line ('el menor es el primero');
        v_minimo := v_minumerouno;
    elsif (v_minumerodos < v_minumerouno) and (v_minumerodos < v_minumerotres) then
        dbms_output.put_line ('el menor es el segundo');
        v_minimo := v_minumerodos;
    else
        dbms_output.put_line ('el menor es el tercero');
        v_minimo := v_minumerotres;
    end if;
    if (v_maximo != v_minumerouno) and (v_minimo != v_minumerouno) then
        dbms_output.put_line ('el intermedio es el primero');
    elsif (v_maximo != v_minumerodos) and (v_minimo != v_minumerodos) then
        dbms_output.put_line ('el intermedio es el segundo');
    else
        dbms_output.put_line ('el intermedio es el terero');
    end if;
end;


--en el caso de que el mes sea enero, el mes sera el trece y le restaremos uno al año. Lo mismo para febrero. 

declare
    v_dia integer; v_mes integer; v_ano integer; v_anoauxiliaruno integer; v_anoauxiliardos integer;
    v_anoauxiliartres integer; v_uaxiliar_sumas integer;
begin
    v_dia := '&dia'; v_mes := '&mes'; v_ano := '&ano';
    --paso1. 
    v_mes := (((v_mes+1)*3)/5);
    dbms_output.put_line (v_mes);
    --paso2. 
    v_anoauxiliaruno := trunc(v_ano/4);
    dbms_output.put_line (v_anoauxiliaruno);
    --paso3
    v_anoauxiliardos := trunc (v_ano/100);
    dbms_output.put_line (v_anoauxiliardos);
    --paso4 
    v_anoauxiliartres := trunc (v_ano/400);
    dbms_output.put_line (v_anoauxiliartres);
    --paso5.
    v_uaxiliar_sumas := v_dia + (v_mes * 2);
    --paso6.
    --paso7.
    --paso8. 
end;


---  21/4/2025   comenzamos con bucles. 
--se va a mostrar la suma de los primeros 100 números. 
----  este ejemplo escon un break. 
declare 
    i integer;
    miSuma integer;
begin 
    i := 1;
    miSuma := 0;
    loop 
        miSuma := miSuma + i;
        i := i + 1;
        EXIT WHEN i > 100;
    end loop;
    dbms_output.put_line (miSuma);
end;

-- este ejemplo es con un while. 
declare 
    miSuma integer;
    i integer;
begin 
    i := 1;
    miSuma := 0;
    while i <= 100 loop 
        miSuma := miSuma + i;
        i := i + 1;
    end loop;
    dbms_output.put_line (miSuma);
end;

---blucle contador. 
declare 
    miSuma integer;
begin 
    miSuma := 0;
    for i in 1..100 loop
        miSuma := miSuma + i;        
    end loop;
    dbms_output.put_line (miSuma);
end;

-- etiquetas GO TO. 
--No puede haber otra etiqueta en el entorno actual con el mismo nombre.
--No se puede saltar al interior de un bucle
--La etiqueta debe preceder a un bloque o a un conjunto de órdenes ejecutables.
--No se puede saltar al interior de una orden IF
declare 
    miSuma integer;
begin 
    miSuma := 0;
    goto etiqueta;
    for i in 1..100 loop
        miSuma := miSuma + i;        
    end loop;
    <<etiqueta>>
    dbms_output.put_line (miSuma);
end;


---  uso del NULL 
declare 
    miSuma integer;
begin 
    miSuma := &suma;
    if (miSuma > 10) then 
        dbms_output.put_line ('es mayor de 10');
    else
        null;
    end if;
end;

--- mostrar los números desde 1 al 10. 
declare
    i integer;
begin 
    i := 1;
    while (i <= 10) loop
        dbms_output.put_line (i);
        i := i + 1;
    end loop;
end;
-- ahora con for. 
declare
begin 
    for i in 1..10 loop
        dbms_output.put_line (i);
    end loop;
end;

-- mostrar los números comprendidos entre el rango. 
--  si el número inicial es mayor, entonces que no lo haga y que lo indique. 

declare
    minumerocomienzo integer := 0;
    minumerofin integer := 0;
begin
    minumerocomienzo:= &numerocomienzo;
    minumerofin:= &numerofin;
    if (minumerocomienzo >= minumerofin) then 
        dbms_output.put_line (' el del inicial es mayor o igual al mayor. ');
    else
        for i in minumerocomienzo..minumerofin loop
            dbms_output.put_line (i);
        end loop;
    end if;
end;


--queremos un bucle pidiendo un inicio y un fin. Mostrar los números pares en este rango. 
declare
    minumerocomienzo integer := 0;
    minumerofin integer := 0;
begin
    minumerocomienzo:= &numerocomienzo;
    minumerofin:= &numerofin;
    if (minumerocomienzo >= minumerofin) then 
        dbms_output.put_line (' el del inicial es mayor o igual al mayor. ');
    else
        for i in minumerocomienzo..minumerofin loop
            if (mod (i,2) = 0) then 
                dbms_output.put_line (i);
            end if;
        end loop;
    end if;
end;

---ún número siempre llegará a ser 1 siguiendo unas instrucciones. 
-- si el número es par, se divide entre dos. 
-- y si es impar, se multiplica por tres y se suma uno. 
declare
    minumero integer;
begin
    dbms_output.put_line ('comienza');
    minumero := &numero;
    while (minumero > 1) loop
        if (mod (minumero, 2) = 0) then
            minumero := minumero / 2;
        else
            minumero := (minumero * 3) + 1; 
        end if;
        dbms_output.put_line (minumero);
    end loop;
end;

----mostar la tabla de multiplicar dado un número. 

declare 
    miNumero integer;
begin 
    miNumero := &numero;
    for i in 1..10 loop
        dbms_output.put_line (miNumero ||'*' || i || '=' || miNumero*i);
    end loop;
end;

-- un progtama que pedirá un texto, de tal forma que hay que recorrer cada letra. 

declare 
    miTexto varchar2 (50);
begin 
    miTexto := '&texto';
    for i in 1..length(miTexto) loop
        --- recordar que esto es para sacar el caracter correspondiente. el primero es el índice. 
        -- y lo segundo es la cantidad de caracteres que se extraen de la cadena. 
        dbms_output.put_line (substr(miTexto, i, 1));
    end loop;
end;


-- un programa donde el usuario pondra un texto númerico. 
-- y se tiene que mostrar la suma de todos los catacteres númericos. 
declare 
    miTexto varchar2 (50);
    miTotal integer := 0;
begin 
    miTexto := '&texto';
    for i in 1..length(miTexto) loop
        miTotal := miTotal +  to_number (substr(miTexto, i, 1));
    end loop;
    dbms_output.put_line (miTotal);
end;

--22/4 
--consultas de acción. 
--  insertar 5 departamentos en un bloque plsql dinámico. 
declare 
    v_nombre dept.dnombre%type;
    v_loc dept.loc%type;
begin
    ---  un bucle para insertar 5 departamentos. 
    for i in 1..5 loop
        v_nombre := 'departamento' || i;
        v_loc := 'localidad' || i;
        insert into dept values (i, v_nombre,v_loc);    
    end loop;
    dbms_output.put_line ('fin del programa.');
end;

select * from dept;

declare 
    v_nombre dept.dnombre%type;
    v_loc dept.loc%type;
begin
    ---  un bucle para insertar 5 departamentos. 
    for i in 1..5 loop
        v_nombre := 'departamento' || i;
        v_loc := 'localidad' || i;
        insert into dept values ((select max (dept_no) + 1 from dept), v_nombre,v_loc);    
    end loop;
    dbms_output.put_line ('fin del programa.');
end;

--- realizar un bloque que pedirá un número al usuario y mostrará el departamento con dicho número. 
declare 
    v_id integer;
begin
    v_id := &id;
    select * from dept where dept_no = v_id;
end;


---implicito. sólo puede devolver una fila. 
-- recuperar el oficio del empleado. REY. 
declare
    v_oficio emp.oficio%type;
begin
    select oficio into v_oficio from emp where  upper(apellido) = 'REY';
    dbms_output.put_line (v_oficio);
end;
--explicito. 
-- puede devolver más de una fila y es necesario declararlo. 
--mostrar el apellido y el salario de todos los empleados. 
select * from emp;
declare
    v_apellido emp.apellido%type;
    v_sal emp.salario%type;
    -- declaramos el cursor con un consulta. 
    -- la consulta debe de tener los mismso detos para el select. 
    cursor cursoremp is select APELLIDO, SALARIO from emp;
begin
    --abrir el cursor. 
    open cursoremp;
    --bucle infinito. 
    loop
        -- extraemos los datos del cursor. 
        fetch cursoremp into v_apellido, v_sal;
        -- en not found salta cuando no se ha recuperado una fila de la consulta. 
        exit when cursoremp%notfound;
        --dibujamos las variables. 
        dbms_output.put_line (v_apellido);
        dbms_output.put_line (v_sal);
    end loop;
end;
 
 
---SQL%cout, vale para encontrar si se ha podido hacer cambios en esa consulta. 
--sql%rowcount también es para consultas de acción. 
--increemntar en 1 el salario  de los emleados ddel departamento 10. 
-- mostrar el númers de los empeados modificados. 
select * from emp;
declare
begin
    update emp set salario = salario + 1 where dept_no = 10;
    dbms_output.put_line ('emplados modificados: ');
    dbms_output.put_line (sql%rowcount);
end;

---incrementar en 10.000 al empleado que menos cobre en la empresa. 
select * from emp;
select min(salario) from emp; 

declare
    v_salariominimo emp.salario%type;
begin
    select min(salario) into v_salariominimo from emp;
    dbms_output.put_line (v_salariominimo);
    update emp set salario = salario + 10000 where salario =  v_salariominimo;
    dbms_output.put_line ('se ha incrementado el salario a esta cantidad de empleados:  ');
    dbms_output.put_line (sql%rowcount);
    dbms_output.put_line ('fin del prog.');
end;

-- se pide el numero, nombre y loc de un departamento. 
-- en el caso de que el departamento exista,modificamos nombre y localidad 
-- en el caso de que no exista lo insertamos. 
select * from dept;
declare
    v_dept_no dept.dept_no%type;
    v_dnombre dept.dnombre%type;
    v_loc dept.loc%type;
    v_dept_noleido emp.dept_no%type;
begin
    dbms_output.put_line ('comeinza');
    v_dept_no := &dept_no;
    v_dnombre := '&dnombre';
    v_loc := '&loc';
    select dept_no into v_dept_noleido from dept where dept_no = v_dept_no;
    dbms_output.put_line (v_dept_noleido);
    if (v_dept_noleido is null) then 
        dbms_output.put_line ('no existe ese deartamento');
    else
        dbms_output.put_line ('si que existe ese dept');
    end if;
end;


select * from dept;
-- hasta que no se hace el OPEN, no se ejecuta la consulta. 
declare
    v_dept_no dept.dept_no%type; v_dnombre dept.dnombre%type; v_loc dept.loc%type;        
    cursor cursoremp is select dept_no from dept;
    v_dept_norecuperado dept.dept_no%type;
    v_bandera boolean := false;
begin
    dbms_output.put_line ('comeinza');
    open cursoremp;
    v_dept_no := &dept_no;
    v_dnombre := '&dnombre';
    v_loc := '&loc';
    loop 
        fetch cursoremp into v_dept_norecuperado;
        if (v_dept_norecuperado = v_dept_no) then
            v_bandera := true;
        end if;
        exit when cursoremp%notfound;
    end loop;
    if (v_bandera = true) then
        dbms_output.put_line (' en este caso se actualizaaaa'); 
        update dept set dnombre = v_dnombre, loc = v_loc where dept_no = v_dept_no;
    else
        dbms_output.put_line (' en este caso se crea una nueva fila. ');
        insert into dept values (v_dept_no, v_dnombre, v_loc);
    end if;
    close cursoremp;
end;

--- otra form de hacerlo. 
select * from dept;
declare
    v_dept_no dept.dept_no%type; v_dnombre dept.dnombre%type; v_loc dept.loc%type;        
    cursor cursoremp is select dept_no from dept where dept_no = v_dept_no;
    v_dept_norecuperado dept.dept_no%type;
begin
    dbms_output.put_line ('comeinza');
    v_dept_no := &dept_no;
    v_dnombre := '&dnombre';
    v_loc := '&loc';
    open cursoremp;
    
    fetch cursoremp into v_dept_norecuperado;
    if (v_dept_norecuperado = v_dept_no) then
        update dept set dnombre = v_dnombre, loc = v_loc where dept_no = v_dept_no;
    else
        insert into dept values (v_dept_no, v_dnombre, v_loc);
    end if;
    close cursoremp;
end;

--código que modifique el salario del empleado arroyo. 
-- si es epplaedo  cobra más de 250.000  le bajamos el sueldo en 10.000 y en el caso contrario lesubimos a 10.000
select * from emp;
SELECT salario from emp where apellido = 'arroyo';
declare
    miCursorSalario emp.salario%type;
begin
    select salario into miCursorSalario from emp where apellido = 'arroyo';
    dbms_output.put_line (miCursorSalario);
end;

select * from emp;
declare
    cursor cursoremp is select SALARIO from emp where apellido = 'arroyo';
    v_apellido emp.apellido%type;
    v_salario_recuperado emp.salario%type;
begin
    open cursoremp;
    fetch cursoremp into v_salario_recuperado;
    
    if (v_salario_recuperado > 250000) then 
        dbms_output.put_line ('es mas de  250000');
        update emp set salario = salario - 10000 where apellido  = 'arroyo';
    else
        dbms_output.put_line (' es menos de 250000');
        update emp set salario = salario + 10000 where apellido  = 'arroyo';
    end if;
end;
