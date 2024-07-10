use adventureworks;

-- Ejercicio 1
DELIMITER $$
CREATE PROCEDURE ventasPorDia (IN fecha DATE)
BEGIN
	SELECT COUNT(*)
	FROM salesorderheader
	WHERE DATE(OrderDate) = fecha;
END $$

DELIMITER ;


-- Ejercicio 2
DELIMITER $$
CREATE FUNCTION margenBruto(precio DECIMAL(15,3), margen DECIMAL (9,2)) RETURNS DECIMAL (15,3)
BEGIN
	DECLARE margenBruto DECIMAL (15,3);
    
    SET margenBruto = precio * margen;
    
    RETURN margenBruto;
END$$

DELIMITER ;


-- Ejercicio 3
SELECT Name,
		ListPrice,
        StandardCost,
        margenBruto(StandardCost, 1.2) AS precioSugerido,
        ListPrice - (margenBruto(StandardCost, 1.2)) AS margenNegativo
From product
WHERE ListPrice > 0 AND StandardCost > 0;

-- Ejercicio 4
SELECT 
	customerId,
    SUM(Freight) AS CostoTotalTransporte
FROM
	salesorderheader
WHERE DATE(OrderDate) BETWEEN '2001-07-01' AND '2001-07-31'
GROUP BY customerId
ORDER BY CostoTotalTransporte DESC
LIMIT 10;

SELECT * FROM salesorderheader;

DELIMITER $$
CREATE PROCEDURE topClientesTransporte (IN fechaInicio DATE, IN fechaFin DATE)
BEGIN
	SELECT 
	customerId,
    SUM(Freight) AS CostoTotalTransporte
FROM
	salesorderheader
WHERE DATE(OrderDate) BETWEEN fechaInicio AND fechaFin
GROUP BY customerId
ORDER BY CostoTotalTransporte DESC
LIMIT 10;
END $$

DELIMITER ;


-- Ejercicio 5
DROP PROCEDURE cargarDatosShipmethod;

DELIMITER $$
CREATE PROCEDURE cargarDatosShipmethod (IN nombre VARCHAR(30), IN ShipBase DOUBLE, IN ShipRate DOUBLE)
BEGIN
	INSERT INTO shipmethod(Name, ShipBase, ShipRate, ModifiedDate)
    VALUES(nombre, ShipBase, ShipRate, NOW());
END $$
DELIMITER ;