SELECT * FROM checkpoint_m2.venta;

select IDProducto
from producto
where
    Concepto = 'EPSON COPYFAX 2000';

SELECT
    IdCanal,
    count(Cantidad) as total_ventas
from venta
group by IdCanal;

select sum(Cantidad) from venta;

select
    DATE_FORMAT(fecha, '%M') as Mes,
    IdSucursal,
    sum(Cantidad * Precio) as Ingresos
from venta
where
    IdSucursal = 13
    and year(Fecha) = 2015
group by Mes
order by Ingresos desc;

select
    DATE_FORMAT(fecha, '%M') as Mes,
    IdSucursal,
    sum(Cantidad) as Cantidad
from venta
where
    IdSucursal = 13
    and year(Fecha) = 2015
group by Mes
order by Cantidad desc;

select
    avg(
        timestampdiff(Day, Fecha, Fecha_Entrega)
    ) as Tiempo_Entrega,
    year(Fecha) as Año
from venta
group by Año;

select
    producto.Tipo,
    sum(venta.Cantidad) as unidades_vendidas,
    sum(venta.Precio) as ingresos
from producto
    inner join venta on (
        producto.IDProducto = venta.IdProducto
    )
where year(venta.Fecha) = 2020
group by producto.Tipo
order by ingresos desc;

select
    DATE_FORMAT(fecha, '%Y%m') as Año_Mes,
    sum(Cantidad) as Cantidad_venta
from venta
group by Año_Mes
order by Cantidad_venta desc;