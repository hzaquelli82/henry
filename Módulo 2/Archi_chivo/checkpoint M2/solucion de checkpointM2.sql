SELECT * FROM checkpoint_m2.venta;

select IdCanal, sum(Cantidad * Precio) as total_ventas
from venta
group by IdCanal
order by total_ventas;

select IdCanal, sum(Cantidad * Precio) as total_ventas
from venta
where year(Fecha) = 2020
group by IdCanal
order by total_ventas desc;

select producto.Tipo, sum(venta.Cantidad) as unidades_vendidas, sum(venta.Precio) as ingresos, (sum(venta.Cantidad) *sum(venta.Precio)) as total
from producto
inner join venta on (producto.IDProducto = venta.IdProducto)
where year(venta.Fecha) = 2020
group by producto.Tipo
order by total desc;

select avg(timestampdiff(Day, Fecha, Fecha_Entrega)) as Tiempo_Entrega, date_format(Fecha,'%m%Y') as fecha_nueva
from venta
group by fecha_nueva
order by Tiempo_Entrega asc;

select count(*)
from producto
where Tipo like'I%'; 

select Tipo
from producto
where Tipo like'I%'
group by Tipo;

select IDProducto
from producto
where Concepto = 'EPSON COPYFAX 2000';

select IDProducto
from producto
where Concepto = 'PARLANTE JBL GO ORANGE BLUETOOTH';

select DATE_FORMAT(fecha,'%m') as Mes, IdSucursal, sum(Cantidad * Precio) as Ingresos 
from venta
where IdSucursal = 13 and year(Fecha) = 2015
group by Mes
order by Ingresos desc;

