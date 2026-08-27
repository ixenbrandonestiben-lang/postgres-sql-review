# Ejercicios de Consultas SQL - Tabla Estudiantes

## SELECT
## SELECT

-- 1. Obtener el nombre, edad y promedio de todos los estudiantes que se encuentren activos.

select 
        nombre,
        edad,
        promedio 
    from estudiantes 
    where activo = true;

-- 2. Listar todos los estudiantes del género femenino que tengan un promedio mayor o igual a 4.5.

select

e.nombre,

e.genero,

e.promedio

from estudiantes e

where e.genero = 'F' and

e.promedio \>= 4.5;

-- 3. Consultar los estudiantes ingresados en el año 2024, ordenados de forma descendente por su fecha de ingreso.

select

	nombre,

	fecha_ingreso

from estudiantes

where extract(year from fecha_ingreso) = 2024;

-- 4. Obtener el promedio de edad y el promedio general de calificaciones de todos los estudiantes registrados.

select

	avg(e.edad) as promedio_edad,

	avg(e.promedio) as promedio_general

from estudiantes e;

-- 5. Contar cuántos estudiantes hay registrados por cada género.

SELECT

	count(\*), genero

from estudiantes

group by genero;

-- 6. Listar los 5 estudiantes con los promedios más altos de toda la tabla.

select

nombre,

promedio

from estudiantes  

order by promedio desc

limit 5;

-- 7. Seleccionar los estudiantes cuya duración de tests haya sido mayor a 2 horas y media.

select

nombre,

duracion_tests

from estudiantes

where duracion_tests \> '2:00:00'

order by id DESC;

-- 8. Buscar a los estudiantes cuyo análisis de perfil contenga la palabra "bases de datos" o "algoritmos".

select

	nombre,

	analisis_perfil

from estudiantes

where analisis_perfil like '%bases de datos%'

	or analisis_perfil like '%algoritmos%';

-- 9. Calcular la altura máxima y mínima registrada entre los estudiantes hombres.

select

max(altura),

min(altura)

from estudiantes

where genero = 'M';

-- 10. Mostrar el nombre, fecha e hora exacta de registro de los estudiantes que ingresaron antes de las 09:00:00 AM.

select

	nombre,

	fecha_ingreso,

	hora_ingreso,

	activo

from estudiantes

where hora_ingreso \< '09:00:00'

order by hora_ingreso desc;


-- **************************************
-- ## UPDATE
-- **************************************

-- 1. Cambiar el estado a inactivo para el estudiante con id 6.

update estudiantes
set activo = 'false'
where id = 6;

-- 2. Incrementar en 0.2 el promedio de todos los estudiantes que tengan un promedio menor a 3.0.

update estudiantes
set promedio = promedio + 0.2
where promedio < 3.0;

-- 3. Actualizar la hora de ingreso a 08:00:00 para todos los estudiantes que ingresaron el día 2024-02-01.

update estudiantes
set hora_ingreso = '08:00:00'
where fecha_ingreso = '2024-02-01';

-- 4. Modificar el análisis de perfil del estudiante con id 15 para agregar la anotación: "Graduado con honores académicos.".

update estudiantes
set analisis_perfil = 'graduado con honores academicos'
where id = 15;

select
		nombre,
		analisis_perfil
	from estudiantes
	where id = 15;


-- 5. Cambiar el género a F y actualizar la altura a 1.65 para un estudiante específico cuyo ID sea 20.

update estudiantes
set genero = 'F', altura = '1.65'
where id = 20;

select
nombre,
genero,
altura
from estudiantes
where id = 20;

-- 6. Desactivar a todos los estudiantes registrados antes del año 2022 que tengan un promedio inferior a 3.5.

update estudiantes
set activo = false
where extract(year from fecha_ingreso) = 2022 and promedio < 3.5;


-- 7. Ajustar la duración de los tests a 2 horas para todos los estudiantes que actualmente tengan registrada una duración inferior a 1 hora.

update estudiantes
set duracion_tests = '02:00:00'
where duracion_tests < '01:00:00';


-- 8. Aumentar la edad en 1 año a todos los estudiantes que ingresaron en el año 2021.

update estudiantes
set edad = edad + 1
where extract(year from fecha_ingreso) = 2021;

-- 9. Limpiar o establecer como NULL el campo analisis_perfil para los estudiantes inactivos.

select *
	from estudiantes
	where activo = false;

update estudiantes
set analisis_perfil = NULL
where activo = false;

-- 10. Actualizar el promedio a 5.0 para el estudiante que tenga la fecha de registro más antigua de la base de datos.

select
		nombre,
		promedio,
		fecha_ingreso
	from estudiantes
	order by fecha_ingreso asc;

update estudiantes
set promedio = 5.0
where fecha_ingreso = (select min(fecha_ingreso)
from estudiantes);


