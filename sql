CREATE DATABASE VentasDB;
GO
USE VentasDB;
CREATE TABLE clientes (
    cliente_id INT IDENTITY PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(50)
);
CREATE TABLE productos (
    producto_id INT IDENTITY PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10,2)
);
CREATE TABLE ventas (
    venta_id INT IDENTITY PRIMARY KEY,
    cliente_id INT,
    producto_id INT,
    fecha DATE,
    cantidad INT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);
INSERT INTO clientes VALUES
('Juan Perez', 'Lima'),
('Ana Torres', 'Arequipa');

INSERT INTO productos VALUES
('Laptop', 3500),
('Mouse', 50);

INSERT INTO ventas VALUES
(1, 1, '2024-01-10', 1),
(2, 2, '2024-01-11', 3);

SELECT 
    v.fecha,
    c.nombre AS cliente,
    p.nombre AS producto,
    v.cantidad,
    p.precio,
    (v.cantidad * p.precio) AS total_venta
FROM ventas v
JOIN clientes c ON v.cliente_id = c.cliente_id
JOIN productos p ON v.producto_id = p.producto_id;



CREATE PROCEDURE sp_reporte_ventas
    @fecha_inicio DATE,
    @fecha_fin DATE
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        v.fecha,
        c.nombre AS cliente,
        p.nombre AS producto,
        v.cantidad,
        p.precio,
        (v.cantidad * p.precio) AS total_venta
    FROM ventas v
    JOIN clientes c ON v.cliente_id = c.cliente_id
    JOIN productos p ON v.producto_id = p.producto_id
    WHERE v.fecha BETWEEN @fecha_inicio AND @fecha_fin
    ORDER BY v.fecha;
END;

EXEC sp_reporte_ventas '2024-01-01', '2024-12-31';

