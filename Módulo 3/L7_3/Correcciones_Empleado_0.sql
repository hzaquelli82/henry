SELECT * FROM henry_m3.empleado;
INSERT INTO empleado VALUE (3875, 3875, "Muñoz", "Carolina", 25, 5, 1, 42000.00);

UPDATE empleado SET IdEmpleado = 25003875
WHERE IdEmpleado = 3875 AND IdSucursal = 25;

UPDATE empleado SET IdSucursal = 25
WHERE IdEmpleado IN (3478,3905,3287,3916,3622,3950,3599,3110,3728);

UPDATE empleado SET IdSucursal = 26
WHERE IdSucursal = 0 ;

UPDATE empleado SET IdEmpleado = (IdSucursal * 1000000) + CodigoEmpleado
WHERE IdSucursal=26;

UPDATE empleado SET IdEmpleado = (IdSucursal * 1000000) + CodigoEmpleado
WHERE IdSucursal=25;