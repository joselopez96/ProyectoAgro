create database AgroDB
go

use AgroDB
GO


create table usuarios(
idusuario char(8) primary key,
  nombre varchar(20) NOT NULL,
  contra varchar(16) NOT NULL,
  dni varchar(8) NOT NULL,
  correo varchar(30) NOT NULL,
  tipousuario int DEFAULT 0,
  estado int DEFAULT 1,
  telefono varchar(12) DEFAULT NULL,
  direccion varchar(30) DEFAULT NULL
)

select *from usuarios

create PROCEDURE crearcod()
as
declare @conta as int, @primer as int
set @conta=0;
set @primer=1;
begin 
select @conta=count(*) from usuarios

if @conta=0
  select left(5,'0000'+@conta)

  insert into usuarios(idusuario) values (@conta)
else 


END
;