*******************************************
*-- Programa: OPCAR.PRG
*-- Fecha   : 11/08/91
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO CARACTERISTICAS
*-- Modificaci¢n GOYO 05-19-92 05:06am
*******************************************
IF USED("MI1")
   SELE MI1
   SET ORDER TO TAG CARTEX   
ELSE
   =MEN_LIN(ABA+"Caracter¡sticas")
   SELE 2
   USE (PATH+'\MIXTA1') ORDER TAG CARTEX ALIAS MI1
ENDIF
RETURN IIF(CARPOP,DEFPOMI1(CARPOPR,CARPOPC),.T.) .AND. MEN_LIN(BOTOM)
