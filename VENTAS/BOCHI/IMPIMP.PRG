********************************************************************************
*-- Name....: IMPIMP.PRG
*-- Date....: 4-19-60
*-- Version.: G. REINER
*-- Notes...: IMPRESION DATOS DE IMPORTACION
********************************************************************************
CLEAR
@ 0,0 TO 12,68 DOUB
@ 2,10 SAY "INGRESO DATOS IMPORTACION" COLOR wu/n
@ 4,2 SAY "Nro Importaci¢n" COLOR w+/n
@ 4,27 GET nroimp PICT "@X"
@ 5,2 SAY "Mercader¡a a Importar" COLOR w+/n
GO IMPMER IN MER
@ 5,27 GET MER.DETALLE
@ 6,2 SAY "Proveedor" COLOR w+/n
GO IMPPRO IN PRO
@ 6,27 GET PRO.FIRMA
@ 7,2 SAY "Valor F.O.B." COLOR w+/n
@ 7,27 GET impfob PICT "99999999999.99"
@ 8,2 SAY "Moneda del F.O.B." COLOR w+/n
@ 8,27 GET MON[impmon]
@ 9,2 SAY "Posici¢n Arancelaria" COLOR w+/n
@ 9,27 GET imppos PICT "@X"
@ 10,2 SAY "Art¡culo del Proveedor" COLOR w+/n
@ 10,27 GET impart PICT "@X"
CLEAR GETS
RETURN
 
