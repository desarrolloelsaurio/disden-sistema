********************************************************************************
*-- Programa: ELIRUS.PRG
*-- Fecha   : 07-27-94 01:33pm
*-- Version : G. REINER
*-- Notas   : ELIGE EL RUBRO DE STOCK 
********************************************************************************
FUNCTION eliRUS
PARA msg,r1,c1
SELE mix
IF RUSpop
   SET ORDER TO TAG RUSTEX
   =MEN_LIN('Rubro '+MSG)
   ACTI POPUP MIXPOP
   STOR !EMPTY(RESPUESTA) TO RESPUESTA
ELSE
   STORE '   ' TO RESPUESTA
   IF R1=-1
      DO INFIC1 WITH 'INGRESE RUBRO '+MSG,3
   ELSE
      @ R1,C1 GET RESPUESTA PICTURE '999'
      READ
   ENDIF
   IF EMPTY(RESPUESTA) .OR. LASTKEY()=27
      STOR .F. TO RESPUESTA
   ELSE
	    RESPUESTA=IIF(XSEEK(zero(RESPUESTA,3),'MIX','RUSCOD'),.T.,.F.)
   ENDIF
ENDIF
RETURN RESPUESTA
