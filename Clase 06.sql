/*
- Ejercicios
1- Insertar 8 clientes con definición de campos desordenado
2- Insertar 5 articulos sin definición de campos
3- Actualizar el nombre del cliente de codigo 10 a Jose
4- Actualizar el nombre, apellido y dni del cliente de codigo 3
a Pablo Fuentes 21053119875
5- Actualizar la dirección del cliente de codigo 2 a vacío
6- Actualizar las direcciones de los clientes de codigo 21, 23 y 26 a 
'null'
7- Eliminar los clientes con apellido Perez
8- Eliminar los clientes con cuit que termine en 0
*/
insert into clientes (nombre, apellido, cuit, direccion) values
('Martha', 'Cleopatra', '82098763741', 'Esquina 8');
insert into clientes (direccion, nombre, cuit, apellido) values
('La Plata 253', 'Felipe', '20938274832', 'Cuello');
insert into clientes (direccion, cuit, apellido, nombre) values
('Plaza Flores', '23873465342', 'Wayne', 'Pedro');
insert into clientes (apellido, nombre, direccion, cuit) values
('Rica', 'Masita', 'Panaderia 23', '29872367230');
insert into clientes (cuit, nombre, apellido, direccion) values
('25982387549', 'Pepe', 'Rosemblent', 'Blender 2895');
insert into clientes (cuit, direccion, nombre, apellido) values
('23456789870', 'Bacacay 1221', 'Diego', 'Martinez');
insert into clientes (nombre, cuit, apellido, direccion) values
('Cristian', '12215665439', 'Lema', 'Yerbal 3293');
insert into clientes (cuit, nombre, direccion, apellido) values
('29390912939', 'Angela', 'Colon 221', 'Torres');
insert into articulos values
(23, 'sandwich de jamon crudo y gruyere', 18000, 10);
insert into articulos values
(19, 'empanadas de carne', 2500, 110);
insert into articulos values
(20, 'Lomo con pure mixto', 18900, 12);
insert into articulos values
(21, 'Suprema con ensalada', 13000, 1);
insert into articulos values
(22, 'Bondiola con Papas Bravas', 21000, 9);
update clientes set nombre='Jose' where codigo=10;
update clientes set nombre='Pablo', apellido='Fuentes', cuit='21053119875' where codigo=3;
select * from articulos;
update clientes set direccion=' ' where codigo=2;
update clientes set direccion=null where codigo in (21, 23, 26);
delete from clientes where apellido='Perez';
delete from clientes where cuit='%0'; -- error
delete from clientes where nombre='%r%' & apellido='%z';
update clientes set precio=(precio*1.20) where precio<=500;

/*
9- Eliminar los clientes cuyo nombre contenga un r y su apellido termine
con z
10- Aumentar un 20% los precios de los artículos que tengan precio
menor o igual a 500
11- Aumentar un 15% los precios de los artículos con precio mayor a 500
12- Bajar un 5% los precios de los artículos con precio mayor a 2000 
pero menor a 100000
13- Bajar el 50% del precio de los artìculos que tengan precio entre
2000 y 4000
14- Aumentar el stock a 200 a todos aquellos productos que tengan el 
stock mayor a 0 y hasta 150
15- Eliminar los articulos con stock menor a 0
16- Eliminar todos los articulos cuyo precio sea mayor a 50.000
*/