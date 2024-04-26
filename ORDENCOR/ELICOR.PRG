***********************************
*-- Programa: ELICOR.PRG
*-- Fecha   : 06/28/91 08:08pm
*-- Version : G. REINER -
*-- Notas   : ELIGE ORDEN DE CORTE
***********************************
FUNCTION eliCOR
PARA MSG,R1,C1,QUEORD
SELE COR
RETURN ELIMIXN1('Orden de '+Korte+' '+msg,'cor',iif(parameter()#4,'numero',iif(queord='F','TERMINAD',IIF(QUEORD='N','NOINI','INICIADO'))),10)

