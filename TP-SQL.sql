CREATE TABLE sucursales (codigoSucursal INT NOT NULL, barrio VARCHAR(30), direccion VARCHAR(40),
						PRIMARY KEY (codigoSucursal));

INSERT INTO sucursales (codigoSucursal, barrio, direccion)
VALUES (101, "Belgrano", "Blanco Encalada 1844"),
       (102, "Coghlan", "Quesada 3657"),
       (103, "Villa Devoto", "Chivilcoy 3900"),
       (104, "Villa Luro", "Av Juan B Justo 8166"),
       (105, "Belgrano", "Av Cabildo 1710"),
       (106, "Colegiales", "Av Elcano 3345"),
       (107, "Caballito", "Rosario 690"),
       (108, "Flores", "Av Rivadavia 7324"),
       (109, "Parque Patricios", "Av Caseros 3832"),
       (110, "Monserrat", "Paseo Colon 568");

CREATE TABLE ventas (nroTicket INT NOT NULL, codigoSucursal INT NOT NULL, fecha DATE,
					montoTotal FLOAT, medioDePago VARCHAR(10), 
                    PRIMARY KEY (nroTicket), 
                    FOREIGN KEY(codigoSucursal) REFERENCES sucursales(codigoSucursal));
                    
INSERT INTO ventas (nroTicket, codigoSucursal, fecha, montoTotal, medioDePago)
VALUES (6623, 103, 20191024, 223.89, "Efectivo"),
       (6895, 110, 20191115, 341.15, "Credito"),
       (6813, 104, 20191020, 824.54, "Credito"),
       (6793, 107, 20191103, 285, "Debito"),
       (6859, 105, 20191001, 475, "Efectivo"),
       (6818, 101, 20190829, 564.50, "Efectivo"),
       (6786, 109, 20191022, 396.35, "Debito"),
       (6854, 108, 20191012, 587, "Debito"),
       (6812, 103, 20190929, 406, "Efectivo"),
       (6834, 102, 20190924, 343.99, "Debito"),
       (6802, 105, 20190920, 950, "Debito"),
       (6785, 105, 20190918, 424, "Credito"),
       (6865, 108, 20191017, 124.35, "Efectivo"),
       (6853, 106, 20191103, 405, "Debito"),
       (6892, 102, 20191113, 314, "Efectivo"),
       (6797, 106, 20190915, 503, "Debito"),
       (6849, 107, 20191102, 418, "Efectivo"),
       (6809, 103, 20191004, 385, "Efectivo"),
       (6824, 110, 20191030, 910, "Debito"),
       (6798, 105, 20190917, 425, "Credito"),
       (6844, 107, 20191005, 270.89, "Debito"),
       (6857, 109, 20191024, 340, "Efectivo"),
       (6796, 104, 20190902, 706, "Efectivo"),
       (6866, 108, 20191029, 451, "Debito");
				
       
-- 2) Redacte una consulta que seleccione las sucursales de un barrio determinado.

SELECT codigoSucursal FROM sucursales WHERE barrio = 'Belgrano';

-- 3) Redacte una consulta que seleccione todas las ventas del mes de octubre

SELECT * FROM ventas WHERE fecha BETWEEN '20191001' AND '20191031';

-- 4) Redacte una consulta que seleccione todas las ventas que sean mayores a la venta promedio, ordenadas de forma descendente.

SELECT * FROM ventas WHERE montoTotal > (SELECT AVG(montoTotal) FROM ventas)
ORDER BY montoTotal DESC;

-- 5) Redacte una consulta que muestre las ventas de las sucursales de un barrio determinado, correspondientes al mes de octubre

SELECT ventas.nroTicket, ventas.codigoSucursal, ventas.montoTotal, ventas.fecha, sucursales.barrio
FROM ventas
INNER JOIN sucursales ON ventas.codigoSucursal = sucursales.codigoSucursal
WHERE sucursales.barrio = "Villa Devoto" AND fecha BETWEEN '20191001' AND '20191031';


-- 6) Redacte una consulta que cuente cuantas sucursales tuvieron ingresos mayores a un monto determinado durante el mes de Septiembre. 

SELECT COUNT(codigoSucursal) FROM ventas
WHERE montoTotal > 470
AND fecha BETWEEN '20190901' AND '20190930';
 
-- 7) Una consulta que obtenga los ingresos de todas las sucursales durante la primera quincena de noviembre, y las ordene de menor a mayor

SELECT ventas.codigoSucursal, sucursales.barrio, SUM(ventas.montoTotal) AS ingresosTotales
FROM ventas 
INNER JOIN sucursales ON ventas.codigoSucursal = sucursales.codigoSucursal
WHERE fecha BETWEEN '20190901' AND '20190915'
GROUP BY codigoSucursal
ORDER BY ingresosTotales ASC;