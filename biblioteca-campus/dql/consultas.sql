
-- # EJERCICIOS DE REVIEW

-- Elabore las consultas para los siguientes enunciados:

-- 1. **Obtener el título, fecha de publicación y precio de todos los libros
-- publicados después del año 2000, ordenados del más reciente al más antiguo.**

select
		titulo,
		fecha_publicacion,
		precio
	from libros
	where extract(year from fecha_publicacion) < 2000;

-- 2. **Listar los nombres completos (nombre y apellido en una sola columna)
-- y la nacionalidad de todos los autores cuya nacionalidad sea 'Española' o 'Argentina'.**

select
		concat( nombre, apellido) as nombre_completo,
		nacionalidad
	from autores
	where nacionalidad = 'Española' or nacionalidad = 'Argentina';

-- 3. **Consultar todos los libros cuyo precio esté entre $15.00 y $20.00 inclusive.**

select
		titulo,
		precio
	from libros
	where precio between 15.00 and 20.00;

-- 4. **Buscar todos los libros cuyo título contenga la palabra "amor" (sin importar si está en mayúsculas o minúsculas).**

select
		titulo
	from libros
	where titulo Ilike '%amor%';

-- 5. **Mostrar los 5 libros más costosos de la base de datos con su título y precio.**

select
		titulo,
		precio
	from libros
	order by precio desc
	limit 5;


-- 6. **Mostrar el título del libro, el precio y el nombre completo del autor al que pertenece cada libro.**
select
		l.titulo,
		l.precio,
		a.nombre || ' ' || a.apellido as nombre_autor
	from libros l
	inner join autores a
		on l.autor_id = a.autor_id
	order by nombre_autor, l.titulo;

-- 7. **Calcular la cantidad total de libros que ha escrito cada autor. Mostrar el nombre completo del autor y el total de libros, ordenados de mayor a menor.**

select
		count(l.titulo) as total_libros_autor,
		a.nombre || ' ' || a.apellido as nombre_autor
	from libros l
	inner join autores a
		on l.autor_id = a.autor_id
	group by nombre_autor
	order by total_libros_autor desc;

-- 8. **Obtener el precio promedio, el precio mínimo y el precio máximo de los libros publicados por cada autor.**
select
		a.nombre || ' ' || a.apellido as nombre_autor,
		round(avg(l.precio), 2) as promedio_libros,
		min(l.precio) as precio_minimo,
		max(l.precio) as precio_maximo
	from libros l
	inner join autores a
		on l.autor_id = a.autor_id
	group by nombre_autor
	order by promedio_libros desc;

-- 9. **Listar los autores que tienen un promedio de precio en sus libros superior a $20.00.**
select
		a.nombre || ' ' || a.apellido as nombre_autor,
		round(avg(l.precio), 2) as promedio_precio
	from libros l
	inner join autores a
		on l.autor_id = a.autor_id
	group by nombre_autor
	having avg(l.precio) > 20.00
	order by promedio_precio desc;


-- 10. **Contar cuántos libros se han publicado por cada nacionalidad de los autores.**

select
		a.nacionalidad,
		count(l.titulo) as libros
	from libros l
	inner join autores a
		on l.autor_id = a.autor_id
	group by a.nacionalidad
	order by libros;

