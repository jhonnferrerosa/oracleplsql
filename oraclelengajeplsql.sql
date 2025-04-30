
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
    v_anoauxiliartres integer; v_auxiliar_sumas_cinco integer;
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
    v_auxiliar_sumas_cinco := v_dia + (v_mes * 2) + v_ano + ;
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

-- en el implicito, en el caso de que no encuentre nada, te saca "not data found" y si salen más de uno entonces te sale "to many rounds".
select * from emp;
declare
    cursor cursoremp is select SALARIO from emp where apellido = ('arroyo');
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

--23/4/2025
--incrementar el salario de los doctores de la PAZ. si supera 1.000.000  bajamos a los que sean 10.000 y para los que cobren menos de un millón
-- entonces subirles 10.000. 
select * from hospital;
select * from doctor;
select * from doctor inner join hospital on doctor.hospital_cod = hospital.hospital_cod;
select * from doctor inner join hospital on doctor.hospital_cod = hospital.hospital_cod where hospital.nombre = 'la paz';
select salario from doctor inner join hospital on doctor.hospital_cod = hospital.hospital_cod where hospital.nombre = 'la paz';

/
declare
    cursor cursordoctorhospital is select salario, doctor_no from doctor inner join hospital on doctor.hospital_cod = hospital.hospital_cod where hospital.nombre = 'la paz';
    cursor cursordoctorhospital2 is select salario, doctor_no from doctor inner join hospital on doctor.hospital_cod = hospital.hospital_cod where hospital.nombre = 'la paz';
    v_salario_recuperado doctor.salario%type; v_doctor_no_recuperado doctor.doctor_no%type; v_salario_total doctor.salario%type;
begin
    dbms_output.put_line ('comienza');
    open cursordoctorhospital;
    loop 
        fetch cursordoctorhospital into v_salario_recuperado, v_doctor_no_recuperado;
        exit when cursordoctorhospital%notfound;
        v_salario_total := v_salario_total + v_salario_recuperado;
    end loop;
    
    if (v_salario_total > 1000000) then 
        dbms_output.put_line (' el salario es más de un millon. ');
        open cursordoctorhospital2;
        loop 
            fetch cursordoctorhospital2 into v_salario_recuperado, v_doctor_no_recuperado;
            exit when cursordoctorhospital2%notfound;
            update doctor set salario = salario - 10000 where doctor_no = v_doctor_no_recuperado;
        end loop;
    else
        dbms_output.put_line (' los salarios son menos del millo. ');
        open cursordoctorhospital2;
        loop 
            fetch cursordoctorhospital2 into v_salario_recuperado, v_doctor_no_recuperado;
            exit when cursordoctorhospital2%notfound;
            update doctor set salario = salario + 10000 where doctor_no = v_doctor_no_recuperado;
        end loop;
    end if;
end;
/


---las subconsultas hay que evitarlas. porque crean dependencias. 

---miVariableFilaPrueba doctor%rowtype;

describe dept;

declare
    --v_id number;
    v_id dept.dept_no%type;
    --miVariableFila dept%rowtype;
    
begin
    dbms_output.put_line ('asdf');
    dbms_output.put_line (v_id);

end;

declare 
    v_fila dept%rowtype;
    cursor cursorDepartamento is select * from dept;
begin
    open cursorDepartamento;
    loop
        fetch cursorDepartamento into v_fila;
        exit when cursorDepartamento%notfound;
        dbms_output.put_line (v_fila.dept_no);
        dbms_output.put_line (v_fila.dnombre);
    end  loop; 
    close cursorDepartamento;
end;

-- realizar un cursor para mostrar el apellido, salario y oficio de los empleados. 
select * from emp;
declare 
    cursor miCursorDoctor is select apellido, salario, oficio from emp;
begin

end;



declare 
    v number;
begin
    if v < 11 then
        dbms_output.put_line ('menor');
    else
        dbms_output.put_line ('myor');
    end if;
end;


---  24/4/2025  control de exceptions. 
declare
    miException exception;
    miNumeroUno number := 444;
    miNumeroDos number := 0;
    miNumeroTres number;
begin
    miNumeroTres := miNumeroUno / miNumeroDos
    -- esto no se está ejecutando  (1/2). 
    dbms_output.put_line (miNumeroTres);
    dbms_output.put_line ('fin del programa. ');
    -- esto no se está ejecutando (2/2). 
    exception
        when zero_divide then
            dbms_output.put_line ('ha saltado la exception  de dividir por cero. ');
end;

--definir una exception.  En el momento en el que los empleados tengan una comisón de Cero, entonces devolver exception. 
-- habra una tabla en la que tenfremos a los que tenga una comision mayor de cero. 
select * from emp;
select   apellido, comision from emp order by comision desc;

create table emp_comision  (apellido varchar2(50), comision number(9));

declare
    cursor miCursor is select  apellido, comision from emp order by comision desc;    
    miException exception;
begin
    dbms_output.put_line ('comienza');
    for v_record in miCursor loop 
        insert into emp_comision values (v_record.apellido, v_record.comision);
        if (v_record.comision = 0) then
            --dbms_output.put_line ('comisión mayor que cero, el apellido: ' || v_record.apellido || ' la comision: ' || v_record.comision);
            raise miException;
        end if;
    end loop;
    
    exception
        when miException then
            dbms_output.put_line ('esta es la excption de comision Cero. ');
end;

select * from emp_comision;
select * from dept;
describe dept;


-- el pragma, es para que se pueda personaliar los mensajes que devueven las exceptions (ya que siempre tienen algo por defecto). 
declare
    miExceptionNulos exception;
    pragma exception_init (miExceptionNulos, -1400);
begin
    dbms_output.put_line ('comienza');
    insert into dept values (null, 'departe', 'pragma');
    
    exception
        when miExceptionNulos then
            dbms_output.put_line ('No se puede insertar NULL en la tabla. ');
end;

select * from dept;
declare 
    v_id number;
begin
    dbms_output.put_line ('comienza');
    --select dept_no into v_id from dept where dnombre = 'VENTAS';
    select dept_no into v_id from dept where dnombre = 'VEasdfNTAS';
    --select dept_no into v_id from dept;
    exception 
        when TOO_MANY_ROWS then
            dbms_output.put_line ('demasiadas filas en el cursor. ');
        when others then
            dbms_output.put_line ('algún error está ocurriendo... ');
            dbms_output.put_line (to_char (SQLCODE));
            dbms_output.put_line (SQLERRM);
end;



declare 
    v_id number;
begin
    dbms_output.put_line ('comienza');
    RAISE_APPLICATION_ERROR (-20400, ' esto es un error de aplicacion');
    dbms_output.put_line ('acaba');
end;

--en los procedieitos no se puede hacer  DROP. 
--  sp es por Store Procedore. 
select * from dept;
create or replace procedure storeProcedureMiProcedimiento 
as
begin 
    dbms_output.put_line ('comienza12');
end;

-- ahora queda llamarlo. 
begin
    storeProcedureMiProcedimiento;
end;
exec storeProcedureMiProcedimiento;

---procedieiento con bloque PLSQL. 
declare 
    v_numero number := 444;
begin
    if (v_numero > 0) then
        dbms_output.put_line ('positivo');
    else
        dbms_output.put_line ('negativo');
    end if;
end;

create or replace procedure storeProcedureMiProcedimientoPrueba
as
begin
    declare 
        v_numero number := 444;
    begin
        if (v_numero > 0) then
            dbms_output.put_line ('positivo');
        else
            dbms_output.put_line ('negativo');
        end if;
    end;
end;

begin
    storeProcedureMiProcedimientoPrueba;
end;


--sintaaxis1. tenemos otras sintaxis para tener variables dentro de un PROC. No se usa la palabra declare. 
create or replace procedure miProcedimientoEjemplo
as 
    v_numero number := -222;
begin
    if (v_numero > 0) then
        dbms_output.put_line ('positivo');
    else
        dbms_output.put_line ('negativo');
    end if;
end;

---show_errors


create or replace procedure miProcedimientoEjemploDos (parametro_uno number, parametro_dos number)
as
    v_suma number;
begin
    dbms_output.put_line ('comeinza miProcedimientoEjemploDos');
    v_suma := parametro_uno + parametro_dos;
    dbms_output.put_line (v_suma);
end;

BEGIN
    miProcedimientoEjemploDos(5, 10);
END;

create or replace procedure miProcedimientoEjemploTres (parametro_uno number, parametro_dos number)
as
begin
    declare 
        v_division number;
    begin
        v_suma := parametro_uno / parametro_dos;
        dbms_output.put_line (v_division);
        exception 
            when ZERO_DIVIDE then
                dbms_output.put_line ('miProcedimientoEjemploTres()--- INNER.  error se ha dividido por cero. o ')
            
    end;
    dbms_output.put_line ('comeinza miProcedimientoEjemploTres');
    exception 
        when ZERO_DIVIDE then
            dbms_output.put_line ('miProcedimientoEjemploTres()--- OUTER.  error se ha dividido por cero. o ');
end;

begin
    miProcedimientoEjemploTres (3, 0);
end;

--30/4. 
--procedimiento para insertar un departamento. 
create or replace procedure sp_insertaDepartamento (p_int integer, p_nombre varchar2, p_localidad varchar2)
as
begin
    dbms_output.put_line ('sp_insertaDepartamento ()--- arranca el procedmieito.');
end;

create or replace procedure sp_insertaDepartamento (p_int dept.dept_no%type, p_nombre dept.dnombre%type, p_localidad dept.loc%type)
as
begin
    --nomalnete dentro de los procedimientos de accion (los que modifican la BBDD) se incluye un commit. 
    dbms_output.put_line ('sp_insertaDepartamento ()--- arranca el procedmieito.');
    insert into dept values (p_int, p_nombre, p_localidad);
    commit;
end;



create or replace procedure sp_insertaDepartamento (p_int dept.dept_no%type, p_nombre dept.dnombre%type, p_localidad dept.loc%type)
as
    v_max_id dept.dept_no%type;
begin
    --realizamos el cursor implicito para biuscar el MAX id. 
    select max (dept_no)+1 into v_max_id from dept;

    --nomalnete dentro de los procedimientos de accion (los que modifican la BBDD) se incluye un commit. 
    dbms_output.put_line ('sp_insertaDepartamento ()--- arranca el procedmieito.');
    dbms_output.put_line (v_max_id);
    insert into dept values (v_max_id, p_nombre, p_localidad);
    commit;
end;

create or replace procedure sp_insertaDepartamento (p_int dept.dept_no%type, p_nombre dept.dnombre%type, p_localidad dept.loc%type)
as
    v_max_id dept.dept_no%type;
begin
    --realizamos el cursor implicito para biuscar el MAX id. 
    select max (dept_no)+1 into v_max_id from dept;

    --nomalnete dentro de los procedimientos de accion (los que modifican la BBDD) se incluye un commit. 
    dbms_output.put_line ('sp_insertaDepartamento ()--- arranca el procedmieito.');
    dbms_output.put_line (v_max_id);
    insert into dept values (v_max_id, p_nombre, p_localidad);
    commit;
    
    exception 
        when no_data_found then
            dbms_output.put_line ('sp_insertaDepartamento () --- no existen datos.');
            rollback;
end;


begin
    sp_insertaDepartamento (11, '11', '11');
end;

select * from dept;
rollback;


-- realizar un proc pra incrementar el salario por el oficio. 
-- hay que enviar el oficio y el incremento. 
select * from emp;

create or replace procedure sp_modificarSalario (p_oficio emp.oficio%type, p_salario emp.salario%type)
as
begin
    dbms_output.put_line ('sp_modificarSalario () --- ' || p_oficio || '---' ||  p_salario);
    update emp set salario  = salario +  p_salario where upper(oficio) = upper(p_oficio);
end;

begin
    sp_modificarSalario ('vendedor', 3000);
end;


-- se va a hacer los mismo con doctor.  Se necesita insertar un doctor con todos sus datos. 
-- se debe recuperar id del docotor dentro del procedure. 
select * from doctor;
describe doctor;
select * from plantilla;


create or replace procedure sp_insertaDoctorImprimirID (p_hospital_cod doctor.hospital_cod%type, p_apellido doctor.apellido%type, p_especialidad doctor.especialidad%type, p_salario doctor.salario%type)
as
    v_max_id number;
begin
    --realizamos el cursor implicito para biuscar el MAX id. 
    select max (doctor_no)+1 into v_max_id from doctor;

    --nomalnete dentro de los procedimientos de accion (los que modifican la BBDD) se incluye un commit. 
    dbms_output.put_line ('sp_insertaDoctorImprimirID ()--- arranca el procedmieito.');
    dbms_output.put_line (v_max_id);
    insert into doctor values (p_hospital_cod, v_max_id, p_apellido, p_especialidad, p_salario);
    commit;
    dbms_output.put_line (SQL%rowcount);    
end;

--en este ejercicio se va a hacer los mismo que el anterior, pero enviamos el nombre del hospital en lugar del id del hospital. 
-- controlamos en el caso de que no exista el nombre del hospital enviado. 

select * from doctor;
select * from hospital;

create or replace procedure sp_insertaDoctorImprimirID (p_hospital_nombre hospital.nombre%type, p_apellido doctor.apellido%type, p_especialidad doctor.especialidad%type, p_salario doctor.salario%type)
as
    v_max_id number;
    v_hospital_cod number;
begin
    dbms_output.put_line ('sp_insertaDoctorImprimirID ()--- arranca el procedmieito.');
    --realizamos el cursor implicito para biuscar el MAX id. 
    select max (doctor_no)+1 into v_max_id from doctor;
    --averiguo el id del hostital el que voy a insertar. 
    select hospital_cod into v_hospital_cod from hospital where nombre = p_hospital_nombre;

    
    dbms_output.put_line (v_max_id);
    dbms_output.put_line (v_hospital_cod);
    insert into doctor values (v_hospital_cod, v_max_id, p_apellido, p_especialidad, p_salario);
    dbms_output.put_line (' este ee s el row countt:  ' || SQL%rowcount); 
    exception 
        when no_data_found then 
            dbms_output.put_line ('sp_insertaDoctorImprimirID ()--- no se ha encontrado ese nombre de hospital. ');
    
end;


begin
    sp_insertaDoctorImprimirID ('la paz', 'serraono', 'cirujano', 4000);
end;


-- procedimiento para mostrar los empleados de un determinado número de departamentos. 
select * from emp;
create or replace procedure sp_mostrarEmpleadosDelDepartamento (p_deptno emp.dept_no%type)
as 
    cursor cursor_emp is select * from emp where dept_no = p_deptno;
begin
    dbms_output.put_line ('sp_mostrarEmpleadosDelDepartamento()--- empieza');
    for i in cursor_emp loop 
        dbms_output.put_line ('este es el apelido: ' || i.apellido || ' este es el oficio: ' || i.oficio);
    end loop;
end;

begin
    sp_mostrarEmpleadosDelDepartamento (10);
end;


-- nombre y departamento. 
--procedimiento para enviar el nombre del departamento y devolver el número del ese departameto. 
select * from dept;
create or replace procedure sp_numeroDepartamento (p_nombre dept.dnombre%type, p_out_idDepartmento out dept.dept_no%type)
as
    v_idDepartamento dept.dept_no%type;
begin
    dbms_output.put_line ('sp_numeroDepartamento()--- comeinza');
    select dept_no into v_idDepartamento from dept where  upper (dnombre) = upper (p_nombre); 
    p_out_idDepartmento := v_idDepartamento;
    dbms_output.put_line ('el numero de departamento es:  ' || v_idDepartamento);
end;

begin
    sp_numeroDepartamento ('ventas');
end;


--- necesito un pric para incrementar en 1 el salario de los empleados de un deaprtamento. 
-- enviaremos al procedimiento el nombre del departamento. 

create or replace procedure sp_incrementar_salario_departamento (p_nombre dept.dnombre%type)
as
    v_num dept.dept_no%type;
begin
    dbms_output.put_line ('sp_incrementar_salario_departamento()--');
    --recuperamos el id del departamento  partir del nombre. 
    sp_numeroDepartamento (p_nombre, v_num);
    dbms_output.put_line ('el numero de departamento es:  ' || v_num);
    update emp set salario = salario + 1 where dept_no = v_num;
    dbms_output.put_line ('salarios modificados: ' || v_num);
end;

begin
    sp_incrementar_salario_departamento ('ventas');
end;

