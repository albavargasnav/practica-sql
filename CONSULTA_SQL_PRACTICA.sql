--Sentencia SQL

select modelos.nombre_modelos, marcas.nombre_marcas, grupos.nombre_grupo, vehiculos.matricula,
vehiculos.color, vehiculos.total_km, aseguradora.nombre_aseguradora, vehiculos.poliza
from DATOS_PRACTICASQL_DLL.modelos
inner join DATOS_PRACTICASQL_DLL.marcas
on modelos.id_modelo = marcas.id_marca
inner join DATOS_PRACTICASQL_DLL.grupos
on marcas.id_marca = grupos.id_grupo
inner join DATOS_PRACTICASQL_DLL.vehiculos
on vehiculos.id_vehiculo = marcas.id_marca
inner join DATOS_PRACTICASQL_DLL.colores
on vehiculos.id_vehiculo = colores.id_color
inner join DATOS_PRACTICASQL_DLL.aseguradora
on vehiculos.id_vehiculo = aseguradora.id_aseguradora
where aseguradora.activo = 'SI'
;
