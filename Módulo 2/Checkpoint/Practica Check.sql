use checkpoint_m2;

select * from producto
where Concepto = 'PARLANTE JBL GO ORANGE BLUETOOTH';

SELECT IdEmpleado, sum(Cantidad)
from venta
group by IdEmpleado
Order by sum(Cantidad) asc
limit 1;

select year(Fecha), sum(Cantidad)
from venta
group by year(Fecha)
order by sum(Cantidad) desc;

select cv.IdCanal, cv.Canal, sum(v.Cantidad)
from canal_venta cv
join venta v on (v.IdCanal = cv.IdCanal)
where year(v.Fecha) = '2020'
group by v.IdCanal
order by sum(v.Cantidad) asc;

select cv.IdCanal, cv.Canal, count(v.IdVenta)
from canal_venta cv
join venta v on (v.IdCanal = cv.IdCanal)
where year(v.Fecha) = '2017'
group by v.IdCanal
order by count(v.IdVenta) desc;

select count(demora)
from (select IdVenta, Fecha, timestampdiff(day, Fecha, Fecha_Entrega) as demora
		from venta
		where year(Fecha_Entrega) = 2018
	) AS ventas2018
where demora > 5;

SELECT COUNT(*) AS Envios_Con_Demora
FROM venta
WHERE YEAR(Fecha_Entrega) = 2018
AND DATEDIFF(Fecha_Entrega, Fecha) > 5;

select v.IdProducto, sum(v.Cantidad), p.Tipo
from venta v
join producto p on (v.IdProducto = p.IDProducto)
where year(v.Fecha) = 2018
group by v.IdProducto
order by sum(v.Cantidad) asc
limit 5;