---------------------------------------------------------------------
-- Microsoft SQL Server 2008 T-SQL Fundamentals
--
-- Script that creates the sample database FacturasTienda
--
-- Supported versions of SQL Server: 2005, 2008
--
-- Prueba tecnica Gerardo Ramos Vargas | Prueba Técnica.NET_ WTW | Actvios

---------------------------------------------------------------------

---------------------------------------------------------------------
-- Create Database
---------------------------------------------------------------------

USE master;

-- Drop database
IF DB_ID('FacturasTienda') IS NOT NULL DROP DATABASE FacturasTienda;

-- If database could not be created due to open connections, abort
IF @@ERROR = 3702 
   RAISERROR('Database cannot be dropped because there are still open connections.', 127, 127) WITH NOWAIT, LOG;

-- Create database
CREATE DATABASE FacturasTienda;
GO

USE FacturasTienda;
GO


---------------------------------------------------------------------
-- Create Schemas
---------------------------------------------------------------------

CREATE SCHEMA TBL AUTHORIZATION dbo;
GO

CREATE SCHEMA CAT AUTHORIZATION dbo;
GO
---------------------------------------------------------------------
-- Create Tables
---------------------------------------------------------------------

-- Create table CAT.TipoCliente
CREATE TABLE CAT.TipoCliente
(
  id                        INT           NOT NULL IDENTITY,
  tipocliente               NVARCHAR(50)  NOT NULL,

  CONSTRAINT PK_TipoCliente PRIMARY KEY(id)
);

-- Create table TBL.Clientes
CREATE TABLE TBL.Clientes
(
  id                  INT           NOT NULL IDENTITY,
  razonsocial         NVARCHAR(200) NOT NULL,
  idtipocliente       INT           NOT NULL,
  fechacreacion       DATE          NOT NULL,
  rfc                 NVARCHAR(50)  NOT NULL,

  CONSTRAINT PK_Clientes PRIMARY KEY(id),

  CONSTRAINT FK_Clientes FOREIGN KEY(idtipocliente)
   REFERENCES CAT.TipoCliente(id)
);

-- Create table CAT.Productos
CREATE TABLE CAT.Productos
(
  id                        INT           NOT NULL IDENTITY,
  nombreproducto            NVARCHAR(50)  NOT NULL,
  imagenproducto            IMAGE         NULL,
  preciounitario            DECIMAL(18,2) NOT NULL,
  ext                       NVARCHAR(5)   NOT NULL,

  CONSTRAINT PK_Productos PRIMARY KEY(id),
);

-- Create table TBL.Facturas
CREATE TABLE TBL.Factura
(
  id                        INT           NOT NULL IDENTITY,
  fechaemisionfactura       DATETIME      NOT NULL,
  idCliente                 INT           NOT NULL,
  numerofactura             INT           NOT NULL,
  numerototalarticulos      INT           DEFAULT NULL,
  subtotalfactura           DECIMAL(18,2) NOT NULL,
  totalimpuesto             DECIMAL(18,2) NOT NULL,
  totalfactura              DECIMAL(18,2) NOT NULL,

  CONSTRAINT PK_TblFacturas PRIMARY KEY(id),

  CONSTRAINT FK_Factura_Cliente FOREIGN KEY(idCliente)
  REFERENCES TBL.Clientes(id)
);

-- Create table TBL.DetalleFactura
CREATE TABLE TBL.DetalleFactura
(
  id                        INT           NOT NULL IDENTITY,
  idfactura                 INT           NOT NULL,
  idproducto                INT           NOT NULL,
  cantidadproducto          INT           NOT NULL,
  preciounitarioproducto    DECIMAL(18,2) NOT NULL,
  subtototalproducto        DECIMAL(18,2) NOT NULL,
  notas                     NVARCHAR(200)  NOT NULL,

  CONSTRAINT PK_DetalleFactura PRIMARY KEY(id),

  CONSTRAINT FK_DetalleFactura_Factura FOREIGN KEY(idfactura)
    REFERENCES TBL.Factura(id),

  CONSTRAINT FK_DetalleFactura_Productos FOREIGN KEY(idproducto)
    REFERENCES CAT.Productos(id)
);

-- Create Procedimientos Almacenados

--SPIcrearproducto
USE FacturasTienda
GO 
CREATE PROCEDURE SPIcrearproducto
  @nombreproducto            NVARCHAR(50),
  @imagenproducto            IMAGE,
  @preciounitario            DECIMAL(18,2),
  @ext                       NVARCHAR(5)
AS
BEGIN
  INSERT INTO CAT.Productos(nombreproducto, imagenproducto, preciounitario, ext)
    VALUES (@nombreproducto, @imagenproducto, @preciounitario, @ext)
END

--SPIcreartipocliente
GO 
CREATE PROCEDURE SPIcreartipocliente
  @tipocliente     NVARCHAR(50)
AS
BEGIN
  INSERT INTO CAT.TipoCliente(tipocliente)
    VALUES (@tipocliente)
END

--SPIcrearcliente
GO 
CREATE PROCEDURE SPIcrearcliente
  @razonsocial         NVARCHAR(200),
  @idtipocliente       INT,
  @fechacreacion       DATE,
  @rfc                 NVARCHAR(50) 
AS
BEGIN
  INSERT INTO TBL.Clientes(razonsocial, idtipocliente, fechacreacion, rfc)
    VALUES (@razonsocial, @idtipocliente, @fechacreacion, @rfc)
END

--SPIcrearfactura
GO 
CREATE PROCEDURE SPIcrearfactura
  @fechaemisionfactura       DATETIME,
  @idCliente                 INT,
  @numerofactura             INT,
  @numerototalarticulos      INT,
  @subtotalfactura           DECIMAL(18,2),
  @totalimpuesto             DECIMAL(18,2),
  @totalfactura              DECIMAL(18,2)
AS
BEGIN
  INSERT INTO TBL.Factura(fechaemisionfactura, idCliente, numerofactura, numerototalarticulos, subtotalfactura, totalimpuesto, totalfactura)
    VALUES (@fechaemisionfactura, @idCliente, @numerofactura, @numerototalarticulos, @subtotalfactura, @totalimpuesto, @totalfactura)
END

--SPIcrearproductosfactura
GO 
CREATE PROCEDURE SPIcrearproductosfactura
  @idfactura                 INT,
  @idproducto                INT,
  @cantidadproducto          INT,
  @preciounitarioproducto    DECIMAL(18,2),
  @subtototalproducto        DECIMAL(18,2),
  @notas                     NVARCHAR(200)
AS
BEGIN
  INSERT INTO TBL.DetalleFactura (idfactura, idproducto, cantidadproducto, preciounitarioproducto, subtototalproducto, notas)
    VALUES (@idfactura, @idproducto, @cantidadproducto, @preciounitarioproducto, @subtototalproducto, @notas)
END

--SPIactualizarfactura
GO 
CREATE PROCEDURE SPIactualizarfactura
  @idfactura                 INT,
  @fechaemisionfactura       DATETIME,
  @idCliente                 INT,
  @numerofactura             INT,
  @numerototalarticulos      INT,
  @subtotalfactura           DECIMAL(18,2),
  @totalimpuesto             DECIMAL(18,2),
  @totalfactura              DECIMAL(18,2)
AS
BEGIN
    UPDATE TBL.Factura
    SET fechaemisionfactura = @fechaemisionfactura, idCliente = @idCliente, numerofactura = @numerofactura, numerototalarticulos = @numerototalarticulos, subtotalfactura = @subtotalfactura, totalimpuesto = @totalimpuesto, totalfactura = @totalfactura  WHERE id= @idfactura
END

--SPIcreardetallefactura
GO 
CREATE PROCEDURE SPIcreardetallefactura
  @idfactura                 INT,
  @idproducto                INT,
  @cantidadproducto          INT,
  @preciounitarioproducto    DECIMAL(18,2),
  @subtototalproducto        DECIMAL(18,2),
  @notas                     NVARCHAR(200)
AS
BEGIN
  INSERT INTO TBL.DetalleFactura(idfactura, idproducto, cantidadproducto, preciounitarioproducto, subtototalproducto, notas)
    VALUES (@idfactura, @idproducto, @cantidadproducto, @preciounitarioproducto, @subtototalproducto, @notas)
END


--SPIObtenerproductos
GO 
CREATE PROCEDURE SPIObtenerproductos
AS BEGIN
SELECT * FROM CAT.Productos
END

--SPIObtenerFacturas
GO 
CREATE PROCEDURE SPIObtenerFacturas
AS BEGIN
SELECT * FROM TBL.Factura
END

--SPIObtenerclientes
GO 
CREATE PROCEDURE SPIObtenerclientes
AS BEGIN
SELECT * FROM TBL.Clientes
END

-- Datos de prueba
EXEC SPIcrearproducto 'Ashoka', '1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111010111011111
1111111111111111111111110100111101111111
1111111111111111111111111111100111111111
1111111111111111111111010111100111011111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111
1111111111111111111111111111111111111111', 1, 'ext';
EXEC SPIcreartipocliente 'Natural';
EXEC SPIcreartipocliente 'Juridico';
EXEC SPIcrearcliente 'SAS', 1, '2023-10-31','Gerardo';
EXEC SPIcrearfactura '2023-10-31',1,1,0,0,0,0;
EXEC SPIcreardetallefactura 1,1,1,1,1,'notafactura'
