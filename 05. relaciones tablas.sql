-- Ejercicio  1: Encuentra el nombre de las pistas y los títulos de los álbumes a los que pertenecen.
SELECT "Name" as Nombre_cancion, "Title" as Nombre_album
FROM "Track"
INNER JOIN "Album" ON "Track"."AlbumId" = "Album"."AlbumId";

-- Ejercicio 2: Lista los nombres de los artistas y los títulos de sus álbumes. Ordena los resultados por artista.
SELECT "Name", "Title"
FROM "Artist"
INNER JOIN "Album" ON "Artist"."ArtistId" = "Album"."ArtistId"
ORDER BY "Artist"."Name";

-- Ejercicio 3: Encuentra los nombres de los clientes y los totales de sus facturas. Extrae solo los 5 clientes con mayor total. 
select "FirstName", "Total"
from "Customer"
inner join "Invoice" on "Customer"."CustomerId" = "Invoice"."CustomerId"
order by "Total" desc 
limit 5;

-- Ejercicio 4: Lista los nombres de los empleados y los nombres de los clientes que les han sido asignados.
select "Employee"."FirstName" as nombre_empleado, "Customer"."FirstName" as nombre_cliente
from "Employee" 
inner join "Customer" on "Employee"."EmployeeId" = "Customer"."CustomerId" 

-- Ejercicio 5: Muestra los ID de las facturas y los nombres de las pistas incluidas en esas facturas.
select "InvoiceId", "Name"
from "Invoice"
inner join "Track" on "Invoice"."InvoiceId" = "Track"."TrackId";

-- Ejercicio 6: Encuentra los nombres de los artistas y los géneros de sus pistas.
select "Genre"."Name" as nombre_genero, "Artist"."Name" as nombre_artista
from "Genre"
inner join "Artist" on "Genre"."GenreId" = "Artist"."ArtistId";

--  Ejercicio 7: Muestra los nombres de las pistas y el tipo de medio en el que están disponibles.
select "Track"."Name" as nombre_pista, "MediaType"."Name" as tipo_de_medio
from "Track"
inner join "MediaType" on "Track"."TrackId" = "MediaType"."MediaTypeId";

-- Ejercicio 8: Encuentra todas las pistas y, si existen, muestra los nombres de los géneros a los que pertenecen. Incluye también las pistas que no tienen un género asignado.**
select "Track"."Name" as nombre_pista, "Genre"."Name" as nombre_genero
from "Track"
left join "Genre" on "Track"."TrackId" = "Genre"."GenreId";

-- Ejercicio 9: Muestra todos los clientes y, si existen, muestra las facturas que han realizado. Incluye también los clientes que no tienen ninguna factura.
select "Customer"."FirstName" as Nombre_cliente, "Total"
from "Customer"
left join "Invoice" on "Customer"."CustomerId" = "Invoice"."InvoiceId";

-- Ejercico 10: Encuentra todos los álbumes y, si existen, muestra los nombres de los artistas que los crearon. Incluye también los álbumes que no tienen un artista asignado (aunque en este caso en la base de datos de Chinook, todos los álbumes tienen un artista asignado).
select "Title", "Name"
from "Album"
left join "Artist" on "Album"."ArtistId" = "Artist"."ArtistId";

-- Ejercicio 11: Cuenta cuántas pistas hay en cada género. Ordena los generos en función del número de canciones de mayor a menor. 
select "Genre"."Name" as nombre_genero, count("Track"."TrackId") as pistas_totales
from "Genre"
left join "Track" on "Genre"."GenreId" = "Track"."GenreId" 
group by "nombre_genero"
order by "pistas_totales" desc;

-- Ejercicio 12: Muestra los títulos de los álbumes y la duración total de todas las pistas en cada álbum.
select "Album"."Title" as titulo_album, sum("Track"."Milliseconds") as duracion_total
from "Album"
inner join "Track" on "Album"."AlbumId" = "Track"."AlbumId" 
group by "Album"."Title";

-- Ejercicio 14: Encuentra los nombres de los clientes y el total gastado por cada uno.
select "Customer"."FirstName" as nombre_cliente, sum("Invoice"."Total") as total_gastado
from "Customer"
inner join "Invoice" on "Customer"."CustomerId" = "Invoice"."CustomerId" 
group by nombre_cliente;

-- Ejercicio 15: Encuentra todos los empleados y, si existen, muestra los nombres de los clientes que tienen asignados. Incluye también los empleados que no tienen clientes asignados.
select "Employee"."FirstName" as nombre_empleado, "Customer"."FirstName" as nombre_cliente
from "Employee"
left join "Customer" on "Customer"."CustomerId" = "Employee"."EmployeeId"


