********************************************************************************
*-- Programa: ELIRUB.PRG
*-- Fecha   : 05-16-92 10:35am
*-- Version : G. REINER
*-- Notas   : ELIGE EL RUBROS
*-- Modificaci¢n GOYO 05-17-92 00:49am
********************************************************************************
FUNCTION eliRUB
PARA msg,r1,c1
SELE mix
IF RUBpop
   SET ORDER TO TAG RUBTEX
   =men_lin('Rubro '+msg)
   ACTI POPUP MIXpop
   STOR !EMPTY(respuesta) TO respuesta
ELSE
   STORE '  ' TO RESPUESTA
   IF r1=-1
      DO infic1 WITH 'INGRESE RUBRO '+msg,2
   ELSE
      @ r1,c1 GET respuesta PICTURE '999'
      READ
   ENDIF
   IF EMPTY(respuesta) .OR. LASTKEY()=27
      STOR .F. TO respuesta
   ELSE
	    RESPUESTA=IIF(XSEEK(zero(RESPUESTA,3),'MIX','RUBCOD'),.T.,.F.)
   ENDIF
ENDIF
RETURN respuesta
