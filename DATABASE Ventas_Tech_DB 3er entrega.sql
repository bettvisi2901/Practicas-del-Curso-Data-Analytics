CREATE DATABASE Ventas_Tech_DB;
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

create table categorias(
Id_categoria int not null primary key,
Nombre_categoria varchar (50) not null,
descripcion varchar (200),
);


create table Clientes(
Id_cliente int not null primary key,
Nombre varchar (100) not null,
email varchar (100) unique,
ciudad varchar (50),
Fecha_registro date not null,
);

create table Productos(
Id_producto int not null Primary key,
nombre_producto varchar (100) not null,
Id_categoria int not null foreign key references categorias (Id_categoria),
Precio decimal (10,2) not null,
stock int not null default (0),
activo tinyint not null default (1)
);

create table Ventas(
Id_venta int not null Primary key,
Id_cliente int not null foreign key references Clientes (Id_cliente),
Id_producto int not null foreign key references Productos (Id_producto),
Cantidad int not null,
precio_unitario decimal (10,2) not null,
Venta_fecha date not null
);

Select * from categorias;
INSERT INTO categorias (Id_categoria,Nombre_categoria,descripcion)
VALUES ('1','Computación','Laptops, PCs y monitores');
INSERT INTO categorias (Id_categoria,Nombre_categoria,descripcion)
VALUES ('2','Accesorios', 'Periféricos y complementos');
INSERT INTO categorias (Id_categoria,Nombre_categoria,descripcion)
VALUES ('3','Audio', 'Auriculares y parlantes');
INSERT INTO categorias (Id_categoria,Nombre_categoria,descripcion)
VALUES ('4','Almacenamiento', 'Discos y memorias');

Select * from Clientes;
INSERT INTO clientes (Id_cliente,Nombre,email,ciudad,Fecha_registro)
VALUES (1, 'María López','maria@mail.com','Buenos Aires','2024-01-05');
INSERT INTO clientes (Id_cliente,Nombre,email,ciudad,Fecha_registro)
VALUES (2, 'Carlos Ruiz','carlos@mail.com','Córdoba','2024-01-10');
INSERT INTO clientes (Id_cliente,Nombre,email,ciudad,Fecha_registro)
VALUES (3, 'Ana Gómez','ana@mail.com','Rosario','2024-02-01');
INSERT INTO clientes (Id_cliente,Nombre,email,ciudad,Fecha_registro)
VALUES (4, 'Pedro Sanz','pedro@mail.com','Mendoza','2024-02-15');
INSERT INTO clientes (Id_cliente,Nombre,email,ciudad,Fecha_registro)
VALUES (5, 'Laura Torres','laura@mail.com','Tucumán','2024-03-01');

Select * from Productos;
INSERT INTO productos (Id_producto,nombre_producto,Id_categoria,Precio,stock,activo)
VALUES (1, 'Laptop Pro 15', 1, 1200.00, 15, 1);
INSERT INTO productos (Id_producto,nombre_producto,Id_categoria,Precio,stock,activo)
VALUES (2, 'Mouse Inalámbrico',   2,   28.00, 80, 1);
INSERT INTO productos (Id_producto,nombre_producto,Id_categoria,Precio,stock,activo)
VALUES (3, 'Monitor 4K 27"',      1,  450.00, 12, 1);
INSERT INTO productos (Id_producto,nombre_producto,Id_categoria,Precio,stock,activo)
VALUES (4, 'Auriculares BT Pro',  3,  120.00, 35, 1);
INSERT INTO productos (Id_producto,nombre_producto,Id_categoria,Precio,stock,activo)
VALUES (5, 'SSD Externo 1TB',     4,  130.00, 18, 1);
INSERT INTO productos (Id_producto,nombre_producto,Id_categoria,Precio,stock,activo)
VALUES (6, 'Teclado Mecánico',    2,   95.00, 40, 1);

Select * from Ventas;
INSERT INTO ventas (Id_venta,Id_cliente,Id_producto,Cantidad,precio_unitario,Venta_fecha)
VALUES (1,  1, 1, 2, 1200.00, '2024-03-05');
INSERT INTO ventas (Id_venta,Id_cliente,Id_producto,Cantidad,precio_unitario,Venta_fecha)
VALUES (2,  2, 2, 5,   28.00, '2024-03-06');
INSERT INTO ventas (Id_venta,Id_cliente,Id_producto,Cantidad,precio_unitario,Venta_fecha)
VALUES (3,  3, 3, 1,  450.00, '2024-03-07');
INSERT INTO ventas (Id_venta,Id_cliente,Id_producto,Cantidad,precio_unitario,Venta_fecha)
VALUES (4,  1, 4, 2,  120.00, '2024-03-08');
INSERT INTO ventas (Id_venta,Id_cliente,Id_producto,Cantidad,precio_unitario,Venta_fecha)
VALUES (5,  4, 5, 3,  130.00, '2024-03-10');
INSERT INTO ventas (Id_venta,Id_cliente,Id_producto,Cantidad,precio_unitario,Venta_fecha)
VALUES (6,  2, 6, 4,   95.00, '2024-03-11');
INSERT INTO ventas (Id_venta,Id_cliente,Id_producto,Cantidad,precio_unitario,Venta_fecha)
VALUES (7,  5, 1, 1, 1200.00, '2024-03-12');
INSERT INTO ventas (Id_venta,Id_cliente,Id_producto,Cantidad,precio_unitario,Venta_fecha)
VALUES (8,  3, 2, 8,   28.00, '2024-03-13');
INSERT INTO ventas (Id_venta,Id_cliente,Id_producto,Cantidad,precio_unitario,Venta_fecha)
VALUES (9,  4, 4, 1,  120.00, '2024-03-14');
INSERT INTO ventas (Id_venta,Id_cliente,Id_producto,Cantidad,precio_unitario,Venta_fecha)
VALUES (10, 5, 3, 2,  450.00, '2024-03-15');

