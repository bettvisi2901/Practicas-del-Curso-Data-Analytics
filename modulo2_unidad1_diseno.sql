CREATE TABLE Clientes(
Idcliente int not null identity(1,1) primary key,
Nombrecliente varchar(100) not null,
Perfil_bio text not null, 
fecha_registro date not null
);
CREATE TABLE Productos(
Id_productos int not null identity (1,1) Primary Key,
Descrición varchar (255) not null,
Precio decimal not null,
esta_activo varchar(2) not null
);
