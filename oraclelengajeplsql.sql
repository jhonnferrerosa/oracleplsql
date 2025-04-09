
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


