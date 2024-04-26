SET DELETED ON
USE \\willy\archivos\sistemas\ventas\ventasa\merca SHARED IN 1
USE \\willy\archivos\sistemas\ventas\ventasa\mixta SHARED IN 2
SELECT articulo, merca, ROUND(dolar*pminor/100, 2) as SIN_IVA, dolar*pminor*.21/100 as CON_IVA, dolar*pminor*1.21/100 as PRECIO_FINAL, mixta.texto1 as rubro ;
              FROM merca   ;
              INNER JOIN MIXTA ON MERCA.RUBRO = LEFT(MIXTA.TEXTO2, 3) ;
              ORDER BY rubro, merca
              
