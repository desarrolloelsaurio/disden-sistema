********************************************************************************
*-- Programa: LRECYI.PRG
*-- Fecha   : 02-05-93 01:55pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE REMITOS DE COMPRA - RANKING POR MERCADERIA O MONTO
********************************************************************************
PARAMETER PORPAN,ELTIPO,PARAQUERY
store "" to ttque
store .t. to habilitado
store 1 to filemp,filREC,filpro,filfee,filori,filPEC,filmer,FILART,filrec,filFPE,filffa,filfec,FILFAC,filfaf
STORE "" TO FISC,TT,TTQUE
CANT_MAX=10
DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], Habilitado[CANT_MAX],habilant[cant_max]
do while queryREC(PORPAN,.T.,PARAQUERY)
	TT="Remitos de Compra"+chr(13)+chr(10)+"Ranking por "+iif(eltipo=1,"Producto","Monto")+IIF(EMPTY(TTQUE),"",TTQUE)
	IF PORPAN
		DO LPECPY WITH "LRECPY","REC"
	ELSE
		DO LPECIY WITH "LRECIY","REC"
	ENDIF
ENDdo
store .f. to variable
=acopy(habilant,habilitado)
RETURN
