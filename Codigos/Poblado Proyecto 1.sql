-- Procedimiento para poblar

CREATE OR ALTER PROCEDURE Proyecto1
AS 
BEGIN
 
-- Borrar los datos de FactSalesEntradaProyecto1
DELETE Proyecto1.dbo.FactSalesEntradaProyecto1
-- Borrar los datos de FactSalesSalidaProyecto1
DELETE Proyecto1.dbo.FactSalesSalidaProyecto1
-- Borrar los datos de DimEntradaProyecto1
DELETE Proyecto1.dbo.DimEntradaProyecto1
-- Borrar los datos de DimSalidaProyecto1
DELETE Proyecto1.dbo.DimSalidaProyecto1
-- Borrar los datos de DimArticuloProyecto1
DELETE Proyecto1.dbo.DimArticuloProyecto1
-- Borrar los datos de DimClienteProyecto1
DELETE Proyecto1.dbo.DimClienteProyecto1
-- Borrar los datos de DimVendedorProyecto1
DELETE Proyecto1.dbo.DimVendedorProyecto1
-- Borrar los datos de DimTimeProyecto1
DELETE Proyecto1.dbo.DimTimeProyecto1


-- INSERTAR ESTOS DATOS ANTES DEL POBLADO 
INSERT INTO Proyecto1.dbo.DimClienteProyecto1(IDCliente, ClienteGrupo, ClienteTipo, ZonaVenta)
VALUES (
'NoExiste', 'NoExiste', 'NoExiste', 'NoExiste'
)

INSERT INTO Proyecto1.dbo.DimVendedorProyecto1(IDVendedor, Nombre)
VALUES (
'NoExiste', 'NoExiste'
)


-- Poblar DimEntradaProyecto1
-- SELECT * FROM Proyecto1.dbo.DimEntradaProyecto1
-- SELECT * FROM AutopartesP2025.dbo.EntradaEncabezado
-- SELECT * FROM AutopartesP2025.dbo.Moneda
INSERT INTO Proyecto1.dbo.DimEntradaProyecto1
SELECT DISTINCT Folio AS IDFolio,
Operacion,
Moneda,
M.Descripcion AS DescripcionMoneda,
M.Tipo AS TipoMoneda
FROM AutopartesP2025.dbo.EntradaEncabezado   
LEFT JOIN AutopartesP2025.dbo.Moneda M ON M.Clave = Moneda


-- Poblar DimSalidaProyecto1
-- SELECT * FROM Proyecto1.dbo.DimSalidaProyecto1
-- SELECT * FROM AutopartesP2025.dbo.SalidaEncabezado
-- SELECT * FROM AutopartesP2025.dbo.CondicionPago
INSERT INTO Proyecto1.dbo.DimSalidaProyecto1
SELECT DISTINCT Folio AS IDFolio,
CondicionPago,
CP.Descripcion AS DescripcionCondicionPago,
MedioEmbarque,
ME.Descripcion AS DescipcionMedioEmbarque,
Moneda,
M.Descripcion AS DescripcionMoneda,
M.Tipo AS TipoMoneda
FROM AutopartesP2025.dbo.SalidaEncabezado SE
LEFT JOIN AutopartesP2025.dbo.CondicionPago CP ON CP.Clave = SE.CondicionPago
LEFT JOIN AutopartesP2025.dbo.MedioEmbarque ME ON ME.Clave = SE.MedioEmbarque
LEFT JOIN AutopartesP2025.dbo.Moneda M ON M.Clave = Moneda


-- Poblar DimArticuloProyecto1
-- SELECT * FROM Proyecto1.dbo.DimArticuloProyecto1
-- SELECT * FROM AutopartesP2025.dbo.Articulo
-- SELECT * FROM AutopartesP2025.dbo.ArticuloGrupo
-- SELECT * FROM AutopartesP2025.dbo.ArticuloTipo
-- SELECT * FROM AutopartesP2025.dbo.ArticuloClase
INSERT INTO Proyecto1.dbo.DimArticuloProyecto1
SELECT A.clave AS IDArticulo,
A.Descripcion,
ArticuloTipo,
AT.Descripcion AS DescripcionArticuloTipo,
ArticuloGrupo,
AG.Descripcion AS DescripcionArticuloGrupo,
ArticuloClase,
AC.Descripcion AS DescripcionArticuloClase,
Precio
FROM AutopartesP2025.dbo.Articulo A
LEFT JOIN AutopartesP2025.dbo.ArticuloTipo AT ON  AT.Clave = A.ArticuloTipo
LEFT JOIN AutopartesP2025.dbo.ArticuloGrupo AG ON  AG.Clave = A.ArticuloGrupo
LEFT JOIN AutopartesP2025.dbo.ArticuloClase AC ON  AC.Clave = A.ArticuloClase


-- Poblar DimClienteProyecto1
-- SELECT * FROM Proyecto1.dbo.DimClienteProyecto1
-- SELECT * FROM AutopartesP2025.dbo.Cliente
INSERT INTO Proyecto1.dbo.DimClienteProyecto1
SELECT Clave AS IDCliente,
ClienteTipo,
ClienteGrupo, 
ZonaVenta
FROM AutopartesP2025.dbo.Cliente


-- Poblar DimVendedorProyecto1
-- SELECT * FROM Proyecto1.dbo.DimVendedorProyecto1
-- SELECT * FROM AutopartesP2025.dbo.Vendedor
INSERT INTO Proyecto1.dbo.DimVendedorProyecto1
SELECT Clave AS IDVendedor,
Nombre
FROM AutopartesP2025.dbo.Vendedor


-- Poblar DimTimeProyecto1
-- SELECT * FROM Proyecto1.dbo.DimTimeProyecto1
-- SELECT * FROM AutopartesP2025.dbo.FacturaEncabezado
-- SELECT * FROM AutopartesP2025.dbo.EntradaEncabezado
-- SELECT * FROM AutopartesP2025.dbo.SalidaEncabezado
INSERT INTO Proyecto1.dbo.DimTimeProyecto1
SELECT DISTINCT 
CAST(CONVERT(NVARCHAR(8), Fecha, 112) as BIGINT) AS IDTiempo,
Fecha,
YEAR(Fecha) AS Año,
MONTH(Fecha) AS Mes,
DATENAME(MONTH, Fecha) AS NombreMes,
DAY(Fecha) AS Dia,
DATENAME(WEEKDAY, Fecha) AS NombreDia,
CASE WHEN MONTH(Fecha) BETWEEN 1 AND 6 THEN 1 ELSE 2 END AS Semestre,
CASE 
WHEN MONTH(Fecha) BETWEEN 1 AND 3 THEN 1 
WHEN MONTH(Fecha) BETWEEN 4 AND 6 THEN 2 
WHEN MONTH(Fecha) BETWEEN 7 AND 9 THEN 3 
ELSE 4 
END AS Trimestre,
CASE 
WHEN MONTH(Fecha) BETWEEN 1 AND 4 THEN 1 
WHEN MONTH(Fecha) BETWEEN 5 AND 8 THEN 2 
ELSE 3 
END AS Cuatrimestre
FROM (
    SELECT Fecha FROM AutopartesP2025.dbo.EntradaEncabezado
    UNION
    SELECT Fecha FROM AutopartesP2025.dbo.SalidaEncabezado
) AS Fechas


-- Poblar FactSalesEntradaProyecto1
-- SELECT * FROM Proyecto1.dbo.FactSalesEntradaProyecto1
-- SELECT * FROM AutopartesP2025.dbo.EntradaEncabezado
-- SELECT * FROM AutopartesP2025.dbo.EntradaDetalle
INSERT INTO Proyecto1.dbo.FactSalesEntradaProyecto1
SELECT CAST(CONVERT(NVARCHAR(8), Fecha, 112) as BIGINT) AS IDTiempo,
ISNULL(Cliente, 'NoExiste') AS IDCliente,
ISNULL(NULLIF(TRIM(EE.Vendedor), ''), 'NoExiste') AS IDVendedor,
ED.Folio AS IDFolio,
ED.Articulo AS IDArticulo,
pctDescuentoGlobal,
EE.TotalImporte,
EE.TotalDescuento,
EE.TotalImpuesto,
EE.Total,
ED.TotalImporte AS TotalImporteDetalle,
ED.TotalDescuento AS TotalDescuentoDetalle,
ED.TotalImpuesto AS TotalImpuestoDetalle,
ED.Total AS TotalDetalle,
1.0 / MaxTEMP.MaxPartida AS TotalFacturas
FROM AutopartesP2025.dbo.EntradaEncabezado EE 
LEFT JOIN AutopartesP2025.dbo.EntradaDetalle ED ON ED.Folio = EE.Folio
INNER JOIN (
	SELECT
	Folio,
	MAX(Partida) AS MaxPartida
FROM AutopartesP2025.dbo.EntradaDetalle ED
GROUP BY Folio
) AS MaxTEMP ON ED.Folio = MaxTEMP.Folio


-- Poblar FactSalesSalidaProyecto1
-- SELECT * FROM Proyecto1.dbo.FactSalesSalidaProyecto1
-- SELECT * FROM AutopartesP2025.dbo.SalidaEncabezado
-- SELECT * FROM AutopartesP2025.dbo.SalidaDetalle
INSERT INTO Proyecto1.dbo.FactSalesSalidaProyecto1
SELECT CAST(CONVERT(NVARCHAR(8), Fecha, 112) as BIGINT) AS IDTiempo,
ISNULL(Cliente, 'NoExiste') AS IDCliente,
ISNULL(Vendedor, 'NoExiste') AS IDVendedor,
SD.Folio AS IDFolio,
SD.Articulo AS IDArticulo,
pctDescuentoGlobal,
SE.TotalImporte,
SE.TotalDescuento,
SE.TotalImpuesto,
SE.Total,
SD.TotalImporte AS TotalImporteDetalle,
SD.TotalDescuento AS TotalDescuentoDetalle,
SD.TotalImpuesto AS TotalImpuestoDetalle,
SD.Total AS TotalDetalle,
1.0 / MaxTEMP.MaxPartida AS TotalFacturas
FROM AutopartesP2025.dbo.SalidaEncabezado SE 
LEFT JOIN AutopartesP2025.dbo.SalidaDetalle SD ON SD.Folio = SE.Folio
INNER JOIN (
	SELECT
	Folio,
	MAX(Partida) AS MaxPartida
FROM AutopartesP2025.dbo.SalidaDetalle SD
GROUP BY Folio
) AS MaxTEMP ON SD.Folio = MaxTEMP.Folio

END;

EXECUTE [dbo].[Practica1738803]