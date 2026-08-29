# ventas_vendedores.

esta base de datos fue diseñada para practica lo que son las consultas y tce,

El nombre de la base de datos es: **ventas_vendedores**

la table que se cró tiene el siguiente nombre: **ventas_vendedores**

Actualmente se realizaron tres cosas primcipales las cuales son 

        
    -- # Funciones de ventana
    -- ## Ranking de mayores ventas:
    -- Obtener el listado de todas las ventas ordenadas por
    -- monto de mayor a menor, asignando un número de posición
    -- (ranking) general a cada venta (ROW_NUMBER()).

    select 
        id,
        fecha,
        vendedor,
        monto,
        ROW_NUMBER() OVER (ORDER BY monto DESC) AS ranking
    from ventas_vendedores
    order by monto desc;
        
    -- ## Porcentaje sobre el total del mes:
    -- Calcular qué porcentaje representa cada venta
    -- individual respecto al total general de ventas registradas
    -- en todo el mes correspondiente (SUM() OVER()).

    select 
        fecha,
        vendedor,
        monto,
        round(
            monto * 100.00 / sum(monto) over (partition by date_trunc('month', fecha)),
            2
        )::text || ' ' || '%' as porcentaje_ventas
    from ventas_vendedores
    order by fecha, vendedor;

    -- # CTE
    -- Obtener un reporte con el total acumulado de ventas
    -- y el promedio por transacción de cada vendedor durante todo
    -- el período registrado. A través de una CTE, calcular estas
    -- métricas y luego filtrar en la consulta principal únicamente
    -- a los vendedores cuya venta promedio por transacción sea superior a $200.00, 
    -- ordenando los resultados de mayor a menor según el monto total vendido.

    with reporte as (
        select 
            vendedor,
            sum(monto) as total_vendido,
            avg(monto) as promedio_por_transaccion
    from ventas_vendedores
    group by vendedor
    )
    select 
        vendedor,
        round(
            promedio_por_transaccion, 2
            ) as promedio_redondeado
        from reporte
        where promedio_por_transaccion > 200
        order by total_vendido desc;

claramente estas son las consultas realizadas, las mejoras futuras es lo mas interesante ya que no solo se trabajaran esas, sino tambien nuevas que nos permitiran implementar procesos totalmente automatizados ayudando asi a fortalecer la base de datos, haciendola asi mas confiable.

**autor:** Brandon Estiben Ixén.
