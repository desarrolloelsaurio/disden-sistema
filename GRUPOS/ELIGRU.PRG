********************************************************************************
*-- Programa: ELIGRU.PRG
*-- Fecha   : 05-16-92 10:35am
*-- Version : G. REINER
*-- Notas   : ELIGE EL GRUPO DE COMPRA
*-- Modificaci¢n GOYO 05-17-92 00:49am
********************************************************************************
FUNCTION eliGRU
PARA msg,r1,c1
SELE mix
IF GRUpop
	 set order to tag grutex
    =men_lin('Grupo de Compra'+msg)
   ACTI POPUP MIXpop
   STOR !empty(respuesta) TO respuesta
ELSE
	 RESPUESTA=ELIMIX1("Grupo de Compras "+msg,'mix','grucod')
ENDIF
RETURN respuesta
