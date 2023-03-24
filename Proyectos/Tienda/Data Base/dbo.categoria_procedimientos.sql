--PROCEDIMIENTO LISTAR
	CREATE PROC categoria_listar
	as 
	select idcategoria as ID, nombre as Nombre, descripcion as Descripcion, estado as Estado FROM dbo.categoria ORDER BY idcategoria
	go
-- PROCEDIMIENTO BUSCAR
	CREATE PROC categoria_buscar

	@valor VARCHAR(50)
	as 
	select idcategoria as ID, nombre as Nombre, descripcion as Descripcion, estado as Estado FROM dbo.categoria WHERE nombre LIKE '%' + @valor + '%' OR descripcion LIKE '%' + @valor + '%'  ORDER BY nombre ASC
	go

-- PROCEDIMIENTO INSERTAR
	CREATE PROC	categoria_insertar
		@nombre varchar(50),
		@descripcion varchar(50)

	as 
		insert into dbo.categoria(nombre, descripcion) values (@nombre, @descripcion) 
	go

-- PROCEDIMIENTO ACTUALIZAR
	create proc categoria_actualizar
		@idcategoria int,
		@nomrbe varchar(50),
		@descripcion varchar(50)

		as
			update dbo.categoria set nombre = @nomrbe, descripcion = @descripcion where idcategoria = @idcategoria
		go

-- PROCEDMIENTO ELIMINAR
	create proc categoria_eliminar
		@idcategoria int	
		as
			delete from dbo.categoria where idcategoria = @idcategoria
		go

-- PROCEDMIENTO DESACTIVAR
	create proc categoria_desactivar
		@idcategoria int 
		as 
			update dbo.categoria set estado = 0 where idcategoria = @idcategoria
		go

-- PROCEDIMIENTO ACTIVAR
	create proc categoria_activar
		@idcategoria int 
		as 
			update dbo.categoria set estado = 1 where idcategoria = @idcategoria
		go