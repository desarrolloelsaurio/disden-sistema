*****************************************
*-- Programa: OPRUBX.PRG
*-- Fecha   : 08-13-92 01:40pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO RUBROS EXCL
****************************************
FUNCTION OPRUBX
#IF "PROD" $ CURDIR()
   IF USED("RUB")
      SELE RUB
   ELSE
     =PRXAREA(.T.)
   ENDIF
#ELSE
   SELE 16   
#ENDIF
RETURN GETDBF("RUBROS",.F.,"RUB",SELE(),.T.)
