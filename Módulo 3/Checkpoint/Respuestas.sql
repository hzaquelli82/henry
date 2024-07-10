SELECT * FROM new_checkpoint_m3.region;

ALTER TABLE restaurante_platos ADD CONSTRAINT fk_restaurante
FOREIGN KEY (rid) REFERENCES region(rid);

SELECT COUNT(rp.restid) from restaurante_platos rp
INNER JOIN region r ON (rp.rid=r.rid)
where r.Nombre like "Ñuble";

select count(resvid) from reserva
where fecha_fin like "2022%";

select count(resvid) from reserva
where fecha_inicio like "2022%";

SELECT COUNT(habid) from hoteles_habitaciones
where estrellas=4;

SELECT nombre_hotel,
AVG(precio) OVER (PARTITION BY hid) as promedioPrecio		
FROM hoteles_habitaciones
WHERE estrellas=1
ORDER BY promedioPrecio ASC;



SELECT count(rs.resvid) FROM hoteles_habitaciones hh
INNER JOIN reserva rs ON hh.habid=rs.habid
where hh.estrellas = 1 and rs.fecha_inicio like "2099%";

SELECT count(rs.resvid) FROM hoteles_habitaciones hh
INNER JOIN reserva rs ON hh.habid=rs.habid
where hh.estrellas = 5 and rs.fecha_inicio like "2048%";

SELECT hh.estrellas,
	count(rs.resvid) OVER (PARTITION BY hh.estrellas) as cant
FROM hoteles_habitaciones hh
INNER JOIN reserva rs ON hh.habid=rs.habid
where hh.estrellas = 3;

select count(resvid) from reserva;

SELECT count(*)
 from (SELECT uid from reserva WHERE year(fecha_inicio)=2048) as uid2020
 where uid NOT IN (SELECT uid from reserva where year(fecha_inicio)=2049);
 
 SELECT COUNT(*)
FROM (
    SELECT uid
    FROM (
        SELECT DISTINCT uid
        FROM reserva
        WHERE YEAR(fecha_inicio) = 2048
    ) AS usuarios_2020
    WHERE uid NOT IN (
        SELECT DISTINCT uid
        FROM reserva
        WHERE YEAR(fecha_inicio) = 2049
    )
) AS usuarios_exclusivos;

SELECT COUNT(*)
FROM (
    SELECT uid
    FROM (
        SELECT DISTINCT uid
        FROM reserva
        WHERE YEAR(fecha_inicio) = 2020
    ) AS usuarios_2020
    WHERE uid NOT IN (
        SELECT DISTINCT uid
        FROM reserva
        WHERE YEAR(fecha_inicio) = 2023
    )
) AS usuarios_exclusivos;

SELECT precio
from hoteles_habitaciones
where estrellas = 1
order by precio desc
limit 1;