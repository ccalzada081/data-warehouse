INSERT INTO Proyecto1.dbo.DimClienteProyecto1(IDCliente, ClienteGrupo, ClienteTipo, ZonaVenta)
VALUES (
'NoExiste', 'NoExiste', 'NoExiste', 'NoExiste'
)

INSERT INTO Proyecto1.dbo.DimVendedorProyecto1(IDVendedor, Nombre)
VALUES (
'NoExiste', 'NoExiste'
)

-- Modern_Spanish_100_CI_AI_SC_UTF8
SELECT name AS DatabaseName, collation_name
FROM sys.databases
WHERE name in ('AutopartesP2025', 'Proyecto1')
