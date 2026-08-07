CREATE TABLE Clientes(
Id_cliente int not null identity(1,1) primary key,
Nombre_Cliente varchar(100) not null,
Perfil_bio text not null, 
Fecha_registro date not null
);
--- En Id_cliente use INT por que es conteo de clientes y lo establecí como primary key
--- Use varchar en Nombre_Cliente por que pedian solo espacio para 100 caracteres, 
---Tex en Perfil_bio por que era ilimitado
--- y use solo date en fecha_registro por que no pedia hora.
  
CREATE TABLE Productos(
Id_productos int not null identity (1,1) Primary Key,
Descripción varchar (255) not null,
Precio decimal not null,
esta_activo varchar(2) not null
);
--- En Id-productos use INT por que es conteo de productos y lo establecí como primary key
---Use varchar en descripción por que pedian solo espacio para 255 caracteres, 
---Decimal para precio por que permite agregar los centavos, 
--- En esta_activo use varchar (02) para que solo se pueda completar con SI o NO y no ocupe mucha memoria.
