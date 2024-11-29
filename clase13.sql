drop database biblioteca;
create database biblioteca;
use biblioteca;
create table libros(
	codigo int auto_increment,
	titulo varchar(50) not null,
    autor varchar (30) not null,
    primary key (codigo)
);

create table prestamos(
	documento char(8),
    codigo_libro int,
    fecha_prestamo date not null,
    fecha_devolucion date not null,
    primary key (documento,codigo_libro)
);

create table socios(
	documento char(8) primary key,
    nombre varchar(30) not null,
    domicilio varchar(50) not null
);

 alter table 	prestamos
 add constraint FK_prestamos_libros
 foreign key	(codigo_libro)
 references		libros(codigo); -- Porque se puede de una tabla a la otra y no de la primera a la segunda
 
 alter table 	prestamos
 add constraint FK_prestamos_documento
 foreign key	(documento)
 references 	socios(documento);
 
INSERT INTO libros (titulo, autor) VALUES
('Don Segundo Sombra', 'Ricardo Güiraldes'),
('Fervor de Buenos Aires', 'Jorge Luis Borges'),
('Martín Fierro', 'José Hernández'),
('El Aleph', 'Jorge Luis Borges'),
('El Eternauta', 'Héctor Germán Oesterheld'),
('Cien años de soledad', 'Gabriel García Márquez'),
('Las fuerzas extrañas', 'Leopoldo Lugones'),
('La casa de los conejos', 'Laura Alcoba'),
('Los siete locos', 'Roberto Arlt'),
('Los peligros de fumar en la cama', 'Mariana Enriquez'),
('El túnel', 'Ernesto Sabato'),
('Sobre héroes y tumbas', 'Ernesto Sabato'),
('Cuentos de la selva', 'Horacio Quiroga'),
('La invención de Morel', 'Adolfo Bioy Casares'),
('La invención del tren fantasma', 'Ricardo Piglia');

INSERT INTO socios (documento, nombre, domicilio) VALUES
('20234567', 'Juan Pérez', 'Av. Corrientes 1000, Buenos Aires'),
('20345678', 'Ana Gómez', 'Calle de la República 450, Rosario'),
('20456789', 'Carlos Martínez', 'Calle San Martín 1200, Córdoba'),
('20567890', 'María Fernández', 'Calle Rivadavia 2500, Mendoza'),
('20678901', 'Luis González', 'Av. 9 de Julio 100, Buenos Aires'),
('20789012', 'Laura López', 'Ruta 5 Km 60, La Pampa'),
('20890123', 'Ricardo Rodríguez', 'Calle San Juan 800, Tucumán'),
('20901234', 'Patricia Díaz', 'Av. Belgrano 2000, Buenos Aires'),
('21012345', 'Sergio Sánchez', 'Calle Libertador 2100, Rosario'),
('21123456', 'María Pérez', 'Calle Sarmiento 3500, Salta'),
('21234567', 'Carlos López', 'Calle San Martín 1000, Entre Ríos'),
('21345678', 'Ana Rodríguez', 'Av. Hipólito Yrigoyen 1500, Buenos Aires'),
('21456789', 'José González', 'Calle Independencia 500, Tucumán'),
('21567890', 'Elena Fernández', 'Calle Chacabuco 1800, Mendoza'),
('21678901', 'Diego Romero', 'Calle Las Heras 2200, Neuquén');

INSERT INTO prestamos (documento, codigo_libro, fecha_prestamo, fecha_devolucion) VALUES
('20234567', 1, '2024-10-01', '2024-10-15'),
('20345678', 2, '2024-10-05', '2024-10-20'),
('20456789', 3, '2024-10-10', '2024-10-24'),
('20567890', 4, '2024-10-12', '2024-10-26'),
('20678901', 5, '2024-10-14', '2024-10-28'),
('20789012', 6, '2024-10-15', '2024-10-30'),
('20890123', 7, '2024-10-16', '2024-10-31'),
('20901234', 8, '2024-10-17', '2024-11-01'),
('21012345', 9, '2024-10-18', '2024-11-02'),
('21123456', 10, '2024-10-19', '2024-11-03'),
('21234567', 11, '2024-10-20', '2024-11-04'),
('21345678', 12, '2024-10-21', '2024-11-05'),
('21456789', 13, '2024-10-22', '2024-11-06'),
('21567890', 14, '2024-10-23', '2024-11-07'),
('21678901', 15, '2024-10-24', '2024-11-08');

select 		s.nombre, l.codigo, l.titulo, l.autor
from 		libros l
join 		prestamos p
on 			l.codigo=p.codigo_libro
join		socios s
on 			s.documento=p.documento;
 
select 		s.documento, s.nombre, s.domicilio
from 		libros l
join 		prestamos p
on 			l.codigo=p.codigo_libro
join		socios s
on 			s.documento=p.documento
where 		l.titulo like '%java%';

select 		l.codigo, l.titulo, l.autor
from 		libros l
join 		prestamos p
on 			l.codigo=p.codigo_libro
WHERE 		p.fecha_devolucion > CURDATE(); -- no hace falta agregar los socios aca

select 		s.documento, s.nombre, s.domicilio
from 		socios s
join 		prestamos p
on 			s.documento=p.documento
WHERE 		p.fecha_devolucion > CURDATE(); 

select 		s.documento, s.nombre, s.domicilio, l.titulo
from 		libros l
join 		prestamos p
on 			l.codigo=p.codigo_libro
join		socios s
on 			s.documento=p.documento
WHERE 		p.fecha_devolucion > CURDATE(); 

select 		count(*) 'cantidad libros no devueltos'
from 		libros l
join 		prestamos p
on			l.codigo=p.codigo_libro
where		p.fecha_devolucion > curdate();

select 		l.titulo
from 		libros l
join 		prestamos p
on	 		l.codigo=p.codigo_libro
where 		fecha_prestamo = CURDATE();

select 		count(*) 'Libros prestados en noviembre'
from 		libros l
join 		prestamos p
on			l.codigo=p.codigo_libro
where		p.fecha_prestamo between '2024-11-01' and '2024-11-30';

select 		count(*) 'Socios que tomaron libros prestados en noviembre'
from 		socios s
join 		prestamos p
on			s.documento=p.documento
where		p.fecha_prestamo between '2024-11-01' and '2024-11-30';