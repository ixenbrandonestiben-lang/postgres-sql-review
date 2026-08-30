# biblioteca-campus.

Esta base de datos fue diseñada para gestionar el registro de autores y libros de una biblioteca escolar o universitaria, con el objetivo de organizar la información bibliográfica de forma ordenada y fácil de consultar.

El nombre de la base de datos es: **biblioteca-campus**

Las tablas principales creadas son:

- **autores**: almacena la información de los autores, como nombre, apellido, fecha de nacimiento y nacionalidad.
- **libros**: almacena la información bibliográfica de cada obra, como el título, ISBN, fecha de publicación y precio.

## Estructura realizada

Se creó la base de datos con una estructura simple y clara, centrada en la relación entre autores y libros.

### Tabla autores

```sql
CREATE TABLE autores (
    autor_id SERIAL PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    fecha_nacimiento DATE,
    nacionalidad VARCHAR(50)
);
```

### Tabla libros

```sql
CREATE TABLE libros (
    libro_id SERIAL PRIMARY KEY,
    autor_id INT NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    fecha_publicacion DATE,
    precio NUMERIC(10, 2)
);
```

## Trabajo realizado

Durante esta parte del proyecto se trabajó en la creación de la estructura base de la base de datos para una biblioteca. Se definieron las entidades principales y se establecieron campos clave para un registro funcional y útil en operaciones futuras.

Entre las tareas realizadas se destacan:

- definición del modelo de datos para autores y libros;
- creación de la estructura de tablas con tipos de datos adecuados;
- establecimiento de identificadores únicos para cada registro;
- organización de la información para facilitar consultas y mantenimiento;
- preparación de la base para futuras inserciones y consultas más complejas.

También se dejó la base lista para continuar con el siguiente nivel del proyecto, en donde se pueden agregar registros de ejemplo, realizar consultas de búsqueda por autor o título, y crear reportes de libros por precio, año de publicación o nacionalidad.

## Descripción general del proyecto

Esta base de datos permite manejar información básica de una biblioteca académica, con una estructura que simula un sistema de catalogación y consulta de libros. El enfoque principal es mantener una relación lógica entre los autores y sus publicaciones, brindando una base sólida para futuras operaciones de consulta, actualización y análisis.

## Puntos de mejora

- agregar restricciones de integridad más avanzadas, como claves foráneas explícitas;
- incluir una tabla de categorías o géneros para clasificar los libros;
- validar mejor los precios y códigos ISBN;
- agregar índices para mejorar la velocidad de búsquedas por autor, título o año;
- incorporar auditoría de creación y actualización de registros.

**autor:** Brandon estiben Ixén.