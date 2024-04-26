********************************************************************************
*-- Programa: MMER.PRG
*-- Fecha   : 03-26-92 12:36pm
*-- Version : G. REINER
*-- Notas   : MUESTRA MERCADERIA
*-- Modificaci¢n GOYO 
*-- VERSION PALADEM / NUEVO BALCALA
********************************************************************************
function mmer
PARAMETER COSA
@ 1,1 sAY "RUBRO"
@ 2,1 sAY "ARTICULO"
@ 3,1 sAY "DETALLE"
@ 4,1 SAY "MARCA"
@ 5,1 SAY "PROVEEDOR"
@ 6,1 sAY "TEMPORADA"
@ 7,1 sAY "UNIDAD X BULTO"
@ 8,1 sAY "DISCRIMINA PESO Y UNIDAD"
IF COSA
=XSEEK(M.RUBRO,'RUB','CODRUB')
M.NADA=RUB.RUBRO
@ 1,col get M.nada
@ 2,col get M.articulo
@ 3,col get M.MERCA
=XSEEK(M.MARCA,'MIX','MARCOD')
M.NADA=MIX.TEXTO1
@ 4,col get M.NADA
=XSEEK(M.PROVEEDOR,'PRO','PROCOD')
M.NADA=PRO.PROVEEDOR
@ 5,COL GET M.NADA
M.NADA=QTEM(M.TEMPORADA)
@ 6,col get M.NADA
@ 7,COL GET M.UNIDXBUL PICT '9999'
M.NADA=IIF(M.DISCRIM,'SI','NO')
@ 8,COL GET M.NADA
CLEA GETS
ENDIF
return
