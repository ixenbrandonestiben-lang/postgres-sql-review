create table estudiantes(

    id serial,
    nombre varchar(60),
    genero char(1),
    edad int,
    promedio float,
    altura numeric(3, 2),
    fecha_ingreso date,
    hora_ingreso time,
    fecha_hora_registro timestamp,
    duracion_tests interval,
    analisis_perfil text,
    activo boolean
);
