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

