-- Consultas Queries ML 
-- ----------------------------------------PARTE I----------------------------------------
-- Categorías y Productos
-- 1)  Queremos tener un listado de todas las categorías.
SELECT *
FROM categorias;

-- 2) Cómo las categorías no tienen imágenes, Solamente interesa obtener un listado de CategoriaNombre y Descripcion.
SELECT CategoriaNombre, Descripcion
FROM categorias;

-- 3) Obtener un listado de los productos.
SELECT *
FROM productos;
-- 4) ¿Existen productos discontinuados? (Discontinuado = 1). 
SELECT *
FROM productos
WHERE Discontinuado= 1;
-- 5) Para el viernes hay que reunirse con el Proveedor 8. ¿Qué productos son los que nos provee?
SELECT *
FROM productos
WHERE ProveedorID= 8;
-- 6) Queremos conocer todos los productos cuyo precio unitario se encuentre entre 10 y 22.
SELECT *
FROM productos
WHERE PrecioUnitario between 10 and 12;
-- 7) Se define que un producto hay que solicitarlo al proveedor si sus Unidades en stock son menores al Nivel de Reorden. ¿Hay productos por solicitar?
SELECT *
FROM productos
WHERE UnidadesStock<NivelReorden;
-- 8) Se quiere conocer todos los productos del listado anterior pero que Unidades pedidas sea igual a cero.
SELECT *
FROM productos
WHERE UnidadesStock<NivelReorden
and UnidadesPedidas = 0;

-- Clientes
-- 1) Obtener un listado de todos los clientes con Contacto, Compania, Título, País. Ordenar el listado por País.
SELECT contacto, compania, titulo, pais
from Clientes
order by pais;
-- 2) Queremos conocer a todos los clientes que tengan un título “Owner”.
SELECT *
FROM Clientes
WHERE titulo = "Owner";
-- 3) El operador telefónico que atendió a un cliente, no recuerda su nombre. Solo sabe que comienza con “C”. 
-- ¿Lo ayudamos a obtener un listado con todos los contactos que inician con C?
SELECT *
FROM Clientes
WHERE Contacto like 'C%';

-- Facturas
-- 1) Obtener un listado de todas las facturas, ordenado por fecha de factura ascendente.
SELECT *
FROM facturas
order by FechaFactura asc;
-- 2) Ahora se requiere un listado de las facturas con el país de envío “USA” y que su correo (EnvioVia) sea distinto de 3. 
SELECT *
FROM Facturas
WHERE PaisEnvio = "USA" AND EnvioVia<>3;
-- 3) ¿El cliente 'GOURL' realizó algún pedido?
SELECT *
FROM Facturas
WHERE ClienteID= 'GOURL';

-- 4) Se quiere visualizar todas las facturas de los empleados 2, 3, 5, 8 y 9.

SELECT *
FROM Facturas
WHERE EmpleadoID in (2, 3, 5, 8 , 9);

-- ----------------------------------------PARTE II----------------------------------------
-- Productos
-- 1) Obtener el listado de todos los productos ordenados descendentemente por Precio Unitario.
-- 2) Obtener el listado de TOP 5 de Productos cuyo Precio Unitario es el más “Caro”.
-- 3) Obtener un top 10 de los productos con más unidades en Stock.

-- FacturaDetalle
-- 1) Obtener un listado de FacturaID, Producto, Cantidad.
SELECT FacturaID, ProductoID, Cantidad
FROM facturadetalle;
-- 2) Ordenar el listado anterior por Cantidad descendentemente.
SELECT FacturaID, ProductoID, Cantidad
FROM facturadetalle
ORDER BY Cantidad desc;
-- 3) Filtrar el listado solo para aquellos productos donde la cantidad se encuentre entre 50 y 100.
SELECT ProductoID
FROM facturadetalle
WHERE Cantidad between 50 and 100;
-- 4) En otro listado nuevo, obtener un listado con los siguientes nombres de columnas: NroFactura (FacturaID), 
-- Producto (ProductoID), Total (PrecioUnitario*Cantidad)
SELECT FacturaId as NroFactura, ProductoID as Producto, PrecioUnitario* Cantidad as Total
FROM facturadetalle
 ;




-- ¡Extras!


-- 1) Obtener un listado de todos los clientes que viven en “Brazil" o “Mexico” o que tengan un título que empiece con “Sales”.
Select *
FROM clientes
WHERE Pais = "Brazil" OR Pais = "Mexico" OR Titulo like "Sales%";
-- 2) Obtener un listado de todos los clientes que pertenecen a una compañía que empiece "A".
Select *
FROM clientes
WHERE Compania like "A%";
-- 3) Obtener un listado con los datos: Ciudad,Contacto y renombrarlo como Apellido y Nombre, Titulo y renombrarlo como Puesto, de todos los clientes que sean de la ciudad "Madrid".
Select Ciudad, Contacto as "Nombre y Apellido", Titulo as "Puesto"
FROM clientes
WHERE Ciudad = "Madrid";
-- 4) Obtener un listado de todas las facturas con ID entre 10000 y 10500
Select *
FROM facturas
WHERE FacturaID between 10000 and 10500;
-- 5) Obtener un listado de todas las facturas con ID entre 10000 y 10500 o de los clientes que empiecen con “B”.
Select *
FROM facturas
WHERE FacturaID between 10000 and 10500
OR ClienteID like "B%";
-- 6) ¿Existen Facturas que la ciudad de envío “Vancouver” o que utilicen el correo 3?
Select *
FROM facturas
WHERE CiudadEnvio = 'Vancouver'
OR EnvioVia=3;
-- 7) ¿Cuál es el id de empleado de “Buchanan”?
SELECT EmpleadoID
FROM empleados
WHERE Apellido = 'Buchanan';
-- 8) ¿Existen Facturas con EmpleadoID del empleado del ejercicio anterior? (No relacionar sino verificar que existan facturas)
Select *
FROM facturas
WHERE EmpleadoID =5;