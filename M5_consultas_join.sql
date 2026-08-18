-----Consulta 1 — Vista base del proyecto (INNER JOIN) : fecha, nombre del cliente, segmento, región, 
----- nombre del producto, categoría, cantidad, precio unitario, total de venta y canal

use Ventas_Tech_DB;

Select * from dbo.categorias,dbo.clientes,dbo.productos, dbo.territorios,dbo.ventas;
SELECT 
    dbo.ventas.fecha_venta AS FECHA,
    dbo.clientes.nombre_cliente,
    dbo.clientes.segmento,
    dbo.territorios.region,
    dbo.productos.nombre_producto,
    dbo.categorias.nombre_categoria AS categoria,
    dbo.ventas.cantidad,
    dbo.ventas.precio_unitario,
    dbo.ventas.total_venta,
    dbo.ventas.canal
FROM dbo.ventas
INNER JOIN dbo.clientes ON dbo.ventas.id_cliente = dbo.clientes.id_cliente
INNER JOIN dbo.territorios ON dbo.clientes.id_territorio = dbo.territorios.id_territorios
INNER JOIN dbo.productos ON dbo.ventas.id_producto = dbo.productos.id_producto
INNER JOIN dbo.categorias ON dbo.productos.categoria = dbo.categorias.nombre_categoria;



--- Consulta 2 — Clientes sin ventas (LEFT JOIN) Identificá clientes registrados que aún no han realizado ninguna compra. 
--- Mostrá su nombre, email y fecha de registro. Usá WHERE ... IS NULL para aislar los casos.

SELECT 
    dbo.clientes.nombre_cliente, 
    dbo.clientes.email, 
    dbo.clientes.fecha_registro
FROM dbo.clientes
LEFT JOIN dbo.ventas ON dbo.clientes.id_cliente = dbo.ventas.id_cliente
WHERE dbo.ventas.id_venta IS NULL;

--- Consulta 3 — Productos sin ventas (LEFT JOIN) Identificá productos del catálogo que no tienen ninguna venta registrada. 
--- Mostrá nombre del producto, categoría y precio. Usá WHERE ... IS NULL.

SELECT 
    dbo.productos.nombre_producto, 
    dbo.categorias.nombre_categoria AS categoria,
    dbo.productos.precio
FROM dbo.productos
LEFT JOIN dbo.categorias ON dbo.productos.categoria = dbo.categorias.nombre_categoria
LEFT JOIN dbo.ventas ON dbo.productos.id_producto = dbo.ventas.id_producto
WHERE dbo.ventas.id_venta IS NULL;

--- Consulta 4 — Consolidado por canal (UNION ALL) Usá UNION ALL para combinar en un solo resultado las ventas Online y
--- Presencial, agregando una columna canal que identifique el origen de cada fila. Al final calculá el total por canal con un GROUP BY.

SELECT canal, SUM(total_venta) AS total
FROM dbo.ventas
WHERE canal = 'Online'
GROUP BY canal

UNION ALL

SELECT canal, SUM(total_venta) AS total
FROM dbo.ventas
WHERE canal = 'Presencial'
GROUP BY canal;