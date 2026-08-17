select * from Ventas;

--Consulta 1 — Resumen ejecutivo mensual. Total facturado, cantidad de pedidos y ticket promedio, agrupados por mes. 

SELECT 
MONTH(Venta_fecha) AS "mes",
COUNT (Id_venta) AS "cantidad_pedidos",
SUM (cantidad * precio_unitario) AS "total_facturado",
AVG(cantidad * precio_unitario) AS "ticket_promedio"
FROM ventas
GROUP BY MONTH(Venta_fecha)
ORDER BY mes;

---Consulta 2: Top 5 de productos por total facturado y unidades vendidas.

SELECT TOP 5
id_producto,
SUM (cantidad * precio_unitario) AS "total_facturado",
SUM (Cantidad) AS "unidades_vendidas"
FROM Ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;

---- No se puede usar Limit, por eso utilicé TOP

--- Consulta 3 — Clientes recurrentes
SELECT 
id_cliente,
COUNT(*) AS "cantidad_pedidos",
SUM(cantidad * precio_unitario) AS "total_gastado"
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY "total_gastado" DESC;

--- Consulta 4 - Meses por encima/por debajo del promedio 

WITH FacturacionMensual AS (
SELECT 
MONTH(Venta_fecha) AS mes,
SUM(cantidad * precio_unitario) AS "total_facturado"
FROM ventas
GROUP BY MONTH(Venta_fecha)
)
SELECT 
mes,
total_facturado,
CASE WHEN total_facturado > (SELECT AVG(total_facturado) 
FROM FacturacionMensual) THEN 'Por encima'
ELSE 'Por debajo'
END AS promedio_mensual
FROM FacturacionMensual
ORDER BY mes;


---- El Producto ID_producto 1, es el de menor venta, pero el que generó el mayor ingreso.
---- a diferencia del Producto ID_producto 2, que tiene la mayor cantidad de unidades vendidas
---- pero el menor total facturado.

---- EL total facturado en el mes 3, está por debajo del promedio mensual general.

---- Los clientes no realizan mas de dos pedidos por mes.