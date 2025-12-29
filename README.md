# Automatización de Reportes de Ventas

Proyecto de automatización de reportes de ventas utilizando Python y SQL Server.  
El sistema extrae datos desde una base de datos relacional, los procesa y genera automáticamente un reporte en Excel listo para análisis.

## Tecnologías
- Python
- SQL Server
- pandas
- pyodbc / SQLAlchemy

## ¿Qué hace el proyecto?
- Ejecuta un stored procedure en SQL Server (`VentasDB`)
- Obtiene información de ventas en un rango de fechas
- Procesa y consolida los datos con Python
- Genera un archivo Excelcon el reporte de ventas

## Requisitos
- SQL Server con la base de datos `VentasDB` configurada
- Python 3.x

## Ejecución
Ejecutar el script principal en Python para generar el reporte en Excel.

## Autor
Sergio Martin Sánchez Balvin
