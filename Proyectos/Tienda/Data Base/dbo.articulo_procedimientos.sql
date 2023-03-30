Create Proc articulo_listar
as
	Select 
		articulo.idarticulo as ID, 
		articulo.idcategoria as ID_Categoria, 
		categoria.nombre as Categoria, 
		articulo.codigo as Codigo, 
		articulo.nombre as Nombre, 
		articulo.precio_venta as Precio_venta, 
		articulo.stock as Stock, 
		articulo.descripcion as Descripcion, 
		articulo.imagen as Imagen, 
		articulo.estado as Estado
	from dbo.articulo
		INNER JOIN dbo.categoria ON dbo.articulo.idcategoria = dbo.categoria.idcategoria
	order by articulo.idarticulo desc
go


Create Proc articulo_buscar
	@valor varchar(50)
as
	Select 
		articulo.idarticulo as ID, 
		articulo.idcategoria as ID_Categoria, 
		categoria.nombre as Categoria, 
		articulo.codigo as Codigo, 
		articulo.nombre as Nombre, 
		articulo.precio_venta as Precio_venta, 
		articulo.stock as Stock, 
		articulo.descripcion as Descripcion, 
		articulo.imagen as Imagen, 
		articulo.estado as Estado
	from dbo.articulo
		INNER JOIN dbo.categoria ON dbo.articulo.idcategoria = dbo.categoria.idcategoria
	where articulo.nombre like '%' +  @valor + '%' 
		OR 
		articulo.descripcion like '%' + @valor + '%'
	order by articulo.nombre asc
go


Create Proc articulo_insertar
	@idCategoria int, 
	@codigo varchar(50),
	@nombre varchar(100), 
	@precio_venta decimal,
	@stock int, 
	@descripcion varchar(255),
	@imagen varchar(20), 
	@estado bit
as
	insert into dbo.articulo(
		idcategoria, 
		codigo, 
		nombre, 
		precio_venta, 
		stock, 
		descripcion, 
		imagen,
		estado
		)
	values(
		@idCategoria, 
		@codigo, 
		@nombre, 
		@precio_venta, 
		@stock,
		@descripcion,
		@imagen,
		@estado
		)
go

insert into dbo.articulo(
		idcategoria, 
		codigo, 
		nombre, 
		precio_venta, 
		stock, 
		descripcion, 
		imagen,
		estado
		)
		values(
		1, 
		'Pr',
		'Prueba',
		1.5,
		10,
		'Dato de prueba',
		'IMG Prueba',
		1
		)
go



Create Proc articulo_actualizar
	@idarticulo int,
	@idCategoria int, 
	@codigo varchar(50),
	@nombre varchar(100), 
	@precio_venta decimal,
	@stock int, 
	@descripcion varchar(255),
	@imagen varchar(20)
as
	update dbo.articulo
	set
		idcategoria = @idCategoria,
		codigo = @codigo,
		nombre = @nombre, 
		precio_venta = @precio_venta,
		stock = @stock,
		descripcion = @descripcion,
		imagen = @imagen
	where
		idarticulo = @idarticulo
go



create proc articulo_eliminar
	@idarticulo int
as
	delete from dbo.articulo
	where articulo.idarticulo = @idarticulo
go


Create Proc articulo_activar
	@idarticulo int
as
	Declare @estado bit = (
							select estado 
							from dbo.articulo
							where idarticulo = @idarticulo
							)

	if (@estado = 0) begin
		update dbo.articulo
		set
			estado = 1
		where
			idarticulo = @idarticulo
	end
go


Create Proc articulo_desactivar
	@idarticulo int
as
	Declare @estado bit = (
							select estado 
							from dbo.articulo
							where idarticulo = @idarticulo
							)

	if (@estado = 1) begin
		update dbo.articulo
		set
			estado = 0
		where
			idarticulo = @idarticulo
	end
go