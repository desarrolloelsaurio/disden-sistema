********************************************************************************
*-- Programa: INMERPRO.PRG
*-- Fecha   : 3/9/90
*-- Version : G. REINER
*-- Notas   : INGRESA DATOS DE PROPAGANDA DE MERCADERIAS
********************************************************************************
DEFI WIND WIN FROM 7,33 TO 14,79 DOUB
DEFI WIND WIN1 FROM 12,0 TO 18,79 DOUB
ACTI WIND WIN
STOR PROPAG TO PR
STOR PR+SPACE(250-LEN(PR)) TO PR
@ 1,2 SAY "ARTICULO" COLOR w+/n
@ 1,13 SAY artic PICT "@X"
@ 2,2 SAY "DETALLE" COLOR w+/n
@ 2,13 say detalle PICT "@XXXX"
@ 3,2 SAY "PROVEEDOR" COLOR w+/n
GO MER.PROVEEDOR IN PRO
@ 3,13 SAY PRO.FIRMA
@ 4,2 SAY "PUBLICIDAD" COLOR w+/n
ACTI WIND WIN1
@ 1,1 GET PR MESS 'INGRESE TEXTO DE PROPAGANDA'
READ
REPL PROPAG WITH PR
RELE WIND WIN
RELE WIND WIN1
RETURN
