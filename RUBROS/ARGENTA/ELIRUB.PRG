********************************************************************************
*-- Programa: ELIRUB.PRG
*-- Fecha   : 12/10/91
*-- Version : V.LEEGSTRA
*-- Notas   : ELIGE EL "RUVRO"
********************************************************************************
FUNCTION elirub
PARA msg,r1,c1
SELE rub
IF rubpop
   ACTI SCRE
   SET ORDER TO 1
   =men_lin(PADC(RuVro+" "+msg,80))
   ACTI POPUP rubpop
   STOR IIF(respuesta#0,RECNO(),0) TO respuesta
ELSE
   IF r1=-1
      DO infic WITH RECC('rub'),'INGRESE '+RUVRO+' '+msg
   ELSE
      @ r1,c1 GET respuesta PICTURE '9999'
      READ
      IF EMPTY(respuesta) .OR. respuesta<1 .OR. respuesta>RECC('RUB') .OR. LASTKEY()=27
         STOR 0 TO respuesta
      ENDIF
   ENDIF
   IF !EMPtY(respuesta)
      GOTO respuesta
   ENDIF
*   IF respuesta#0
*      STOR 0 TO respuesta
*   ENDIF
*   IF !empty(codsrub)
*      GOTO respuesta
*   ENDIF
ENDIF
RETURN(respuesta)
*: EOF: ELIRUB.PRG
