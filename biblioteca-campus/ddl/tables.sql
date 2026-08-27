CREATE TABLE autores (
autor_id SERIAL PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
fecha_nacimiento DATE,
nacionalidad VARCHAR(50)
);
