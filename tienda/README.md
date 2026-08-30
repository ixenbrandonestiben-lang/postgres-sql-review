# tienda.

Esta base de datos fue diseñada para gestionar el funcionamiento básico de una tienda, incluyendo el registro de productos y el historial de ventas realizadas. El objetivo principal fue crear una estructura que permita llevar el control del inventario y analizar el comportamiento comercial de forma sencilla.

El nombre de la base de datos es: **Tienda**

Las tablas principales creadas son:

- **Productos**: almacena la información de cada artículo disponible, incluyendo nombre, precio y stock.
- **Ventas**: registra cada operación de venta con el producto asociado, la cantidad vendida y la fecha de la transacción.

## Estructura realizada

Se creó una base de datos de ventas y productos para simular un pequeño sistema comercial.

### Tabla Productos

```sql
CREATE TABLE Productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(120),
    precio NUMERIC(8, 2),
    stock INT
);
```

### Tabla Ventas

```sql
CREATE TABLE Ventas (
    id SERIAL PRIMARY KEY,
    producto_id INT NOT NULL,
    cantidad INT,
    fecha_venta DATE
);
```

## Trabajo realizado

Durante esta parte del proyecto se desarrolló la estructura inicial del sistema de tienda y se preparó la base para trabajar con datos reales de inventario y ventas. Se definieron las entidades principales, se establecieron los campos clave y se llenaron registros de prueba para representar transacciones comerciales.

Entre las tareas realizadas se destacan:

- creación de la base de datos e inicialización de la estructura;
- definición de tablas para productos y ventas;
- inserción de productos con precios y cantidades disponibles;
- carga de ventas con fechas y cantidades por producto;
- preparación del esquema para consultas de análisis de ventas e inventario.

La idea central fue construir una base sólida para poder realizar consultas sobre productos más vendidos, ventas por fecha, productos con mayor movimiento y análisis del stock disponible.

## Descripción general del proyecto

Esta base de datos permite modelar un caso práctico de negocio para una tienda. Con la información de productos y ventas se pueden generar reportes básicos sobre desempeño comercial, comportamiento de compra y flujo de inventario. La estructura es simple, funcional y adecuada para comenzar con consultas de análisis y reportes operativos.

## Puntos de mejora

- agregar una relación explícita entre `Productos` y `Ventas` con clave foránea;
- incorporar una tabla de clientes o categorías para ampliar el análisis;
- agregar validaciones para stock, precios y cantidades negativas;
- incluir índices para mejorar la consulta por fechas y productos;
- incorporar campos de auditoría, como fecha de creación y de actualización.

**autor:** Brandon estiben Ixén.