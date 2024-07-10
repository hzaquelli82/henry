DESCRIBE empleado;
SELECT * FROM empleado;
SELECT * FROM sucursal;

ALTER TABLE empleado DROP PRIMARY KEY;
ALTER TABLE empleado ADD PRIMARY KEY (IdEmpleado);

ALTER TABLE venta ADD CONSTRAINT `venta_fk_empleado` FOREIGN KEY (IdEmpleado) REFERENCES empleado (IdEmpleado) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`henry_m3`.`#sql-216d3_a`, CONSTRAINT `venta_fk_empleado` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleado` (`IdEmpleado`) ON DELETE RESTRICT ON UPDATE RESTRICT)

DESCRIBE venta;
SELECT * FROM venta;

SELECT DISTINCT v.IdEmpleado 
FROM venta v LEFT JOIN empleado e
ON (v.IdEmpleado = e.IdEmpleado)
WHERE e.IdEmpleado IS NULL;