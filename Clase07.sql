-- Clase 07
use cursobd;
-- AVG average (promedio) trabaja con numeros
select avg(monto) from facturas;
-- trae el monto promedio de la tabla facturas

select avg(monto) promedio from facturas;
-- agregamos un alias al campo del promedio

select avg(monto) promedio from facturas where letra='A';
-- trae el promedio de las facturas cuya letra sea 'A'

select round(avg(monto),2) promedio from facturas;

-- función SUM
-- trabaja con numeros
select sum(monto) suma_total from facturas;
select round(sum(monto),2) suma_total from facturas;

-- COUNT
select count(*) from facturas;
-- trae la cantidad de registros de facturas
select count(*) from clientes;
-- trae la cantidad total de registros que tiene la tabla clientes
select count(direccion) from clientes;
-- trae la cantidad de registros que hay en la tabla clientes con direccion
select * from clientes where direccion is null;
-- chequeamos cuales son los clientes que tienen direccion nula

-- agrupamiento en MySQL
select * from facturas;
select letra, count(*) total, sum(monto) suma_total from facturas where letra='A';
select letra, count(*) total, sum(monto) suma_total from facturas where letra='B';
select letra, count(*) total, sum(monto) suma_total from facturas where letra='C';
select letra, count(*) total, sum(monto) suma_total from facturas where letra='E';
select letra, count(*) total, sum(monto) suma_total from facturas where letra='M';

-- GROUP BY
-- devuelve un registro por cada valor del campo agrupado
-- debe ir como primer campo el campo por el cual agrupamos
select letra, count(*) total, sum(monto) suma_total from facturas group by letra;

-- uso de having, se utiliza para filtrar campos agrupados
select			letra,
				count(*) total,
                sum(monto) suma_total
from			facturas
group by		letra
having			sum(monto) > 16000;

-- SUBQUERIES
-- son consultas dentro de consultas
select max(monto) from facturas; -- me devuelve 15000
select * from facturas where monto = (select max(monto) from facturas);
-- trae todos los campos, de todos los registros de la tabla facturas, cuyo monto
-- sea igual al monto maximo facturado.
select * from facturas where fecha = (select min(fecha) from facturas);
-- trae las facturas cuya fecha sea la minima encontrada


-- EJERCICIOS
alter table articulos add stockMinimo int unsigned;
alter table articulos modify stockMaximo int unsigned;
update articulos set stockMinimo = 200;
update articulos set stockMaximo = 10000;
select *, stockMinimo-stock reposicion from articulos;
select sum(precio) precio_total from articulos where stock>0;
select sum(precio)+0.21 precio_total_IVA from articulos where stock>0;


create table autos(
	codigo integer,
    marca varchar(255),
    modelo varchar(255),
	color varchar(255),
    anio integer,
    precio double,
    primary key (codigo)
    );
select * from autos;
insert into autos values (1, 'Renault', '12', 'rojo', 1980, 560000);
insert into autos values (16, 'Volkswagen', 'Gol', 'gris', 2003, 1500000),
(17, 'Peugeot', '306', 'negro', 2015, 2350000),
(18, 'Ford', 'Fiesta', 'azul', 1988, 180000),
(19, 'Ford', 'Fiesta Full', '', 1988, 180000),
(20, 'Volkswagen', 'Gol', 'Rojo', 2020, 1500000),
(2, 'Ford', 'Fiesta', 'Blanco', 2019, 1400000),
(3, 'Chevrolet', 'Onix', 'Negro', 2021, 1600000),
(4, 'Renault', 'Sandero', 'Azul', 2020, 1350000),
(5, 'Toyota', 'Corolla', 'Gris', 2022, 2500000),
(6, 'Nissan', 'Kicks', 'Verde', 2021, 2300000),
(7, 'Peugeot', '208', 'Naranja', 2020, 1550000),
(8, 'Fiat', 'Cronos', 'Blanco', 2023, 1450000),
(9, 'Kia', 'Seltos', 'Negro', 2022, 2700000),
(10, 'Honda', 'Civic', 'Rojo', 2021, 3000000),
(11, 'Hyundai', 'Tucson', 'Gris', 2023, 3200000),
(12, 'Citroën', 'C3', 'Azul', 2020, 1300000),
(13, 'Volkswagen', 'Polo', 'Blanco', 2022, 1800000),
(14, 'Ford', 'EcoSport', 'Rojo', 2021, 1900000),
(15, 'Chevrolet', 'Tracker', 'Verde', 2022, 2100000);

select max(precio) from autos;
select min(precio) from autos;
select min(precio) from autos where modelo between 2010 and 2020;
select avg(precio) promedio from autos;
select avg(precio) promedio from autos where anio=2024;
select count(*) from autos;
select count(*) from autos where precio between 30500000 and 40000000;
select count(*) from clientes;
select anio, count(*) total from autos group by anio;






