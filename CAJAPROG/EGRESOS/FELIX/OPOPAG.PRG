*******************************************
*-- PROGRAMA: OPOPAG.PRG
*-- FECHA   : 03-29-95 07:40pm
*-- VERSION : G. REINER
*-- NOTAS   : ABRE ARCHIVO ORDENES DE PAGO
******************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
 
IF USED("ORP")
   SELE ORP
   SET ORDER TO TAG NUMERO
ELSE
   =MEN_LIN(ABA+'Ordenes de Pago')
   =PRXAREA(.T.)
   USE (PATHCAJ+'\ORDENPAG') ORDER TAG NUMERO ALIAS ORP
ENDIF
RETURN MEN_LIN(BOTOM)
