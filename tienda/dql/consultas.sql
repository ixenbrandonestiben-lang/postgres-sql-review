INSERT INTO productos(id, nombre, precio, stock)
VALUES (100, 'producto fake', 5, 0);

-- eliminacion en base a consulta.
DELETE FROM productos
 WHERE id NOT IN (SELECT producto_id FROM ventas) AND stock = 0;



CREATE TABLE datos_fake(
    id SERIAL PRIMARY KEY,
    codigo CHAR(3),
    nombre VARCHAR(30),
    apellido VARCHAR(30),
    edad INT
);

INSERT INTO datos_fake(codigo, nombre, apellido, edad) VALUES
('001', 'Patricia', 'Fernandez', 40),
('002', 'Armando', 'Benedetti', 38),
('001', 'Patricia', 'Fernandez', 40),
('003', 'Kevin', 'Garcia', 42),
('004', 'Jhon', 'Cuevas', 23),
('005', 'Luna', 'Herrera', 40),
('002', 'Armando', 'Benedetti', 38),
('001', 'Patricia', 'Fernandez', 40),
('002', 'Armando', 'Benedetti', 38),
('001', 'Patricia', 'Fernandez', 40);

