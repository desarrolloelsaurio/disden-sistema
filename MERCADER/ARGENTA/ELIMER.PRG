********************************************************************************
*-- Programa: ELIMER.PRG
*-- Fecha   : 12/14/91
*-- Version : V.LEEGSTRA
*-- Notas   : ELIGE LA MERCADERIA
********************************************************************************
FUNCTION elimer
PARA msg,r1,c1,exe
SELE mer
IF merpop
   IF exe
     SET ORDER TO TAG merce
   ELSE
     SET ORDER TO TAG merca
   ENDIF
   ACTI SCRE
   =men_lin(PADC("MERCADERIA "+msg,80))
   ACTI POPUP merpop
   STOR IIF(respuesta#0,RECNO(),0) TO respuesta
ELSE
   IF r1=-1
      DO infic WITH RECC('mer'),'INGRESE MERCADERIA '+msg
   ELSE
      @ r1,c1 GET respuesta PICTURE '9999'
      READ
      IF EMPTY(respuesta) .OR. respuesta<1 .OR. respuesta>RECC('mer') .OR. LASTKEY()=27
         STOR 0 TO respuesta
      ENDIF
   ENDIF
   IF !EMPtY(respuesta)
      GOTO respuesta
   ENDIF
ENDIF
RETURN(respuesta)
