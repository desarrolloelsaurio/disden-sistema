********************************************************************************
*-- Programa: LrEC1.PRG
*-- Fecha   : 08-27-92 06:09pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE NOTAS DE PEDIDO DE COMPRAS
********************************************************************************
*	#\<Cabecera
*	#\<Ranking por Producto
*	#\<Ranking por Monto
*	#\<Productos'
********************************************************************************
parameter porp
=cabpan1()
DIJO=ALLTRIM(PROMPT())
DO CASE
CASE DIJO="Cabecera"
	DO lrecZ WITH PORP
CASE DIJO="Ranking por Producto"
	DO lrecY WITH PORP,1,.T.
CASE DIJO="Ranking por Monto"
	DO lrecY WITH PORP,2,.T.
CASE DIJO="Productos"
	STORE NUL TO RESPUESTA
	=IIF(ELIMER("a Listar",-1,1),IIF(PORP,lrecXP(),lrecXI()),.T.)
ENDCASE
RETURN MEN_LIN(BOTOM)
