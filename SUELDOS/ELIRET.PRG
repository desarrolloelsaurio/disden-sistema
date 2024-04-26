********************************************************************************
*-- Programa: ELIRET.PRG
*-- Fecha   : 11/09/90 08:28pm
*-- Version : G. REINER
*-- Notas   : ELIGE RETENCION
********************************************************************************
FUNCTION eliret
PARAMETER uno
ACTI SCRE
SELE ret
STORE 0 TO respuesta
IF retpop
   @ 24,0 SAY PADC('Retenci¢n '+uno,80,' ')
   ACTI POPUP retpop
   IF respuesta<>0
      GOTO TOP
      SKIP respuesta-1
      respuesta=RECNO()
   ENDIF
ELSE
   DO infic WITH RECCOUNT('RET'),'INGRESE N§ DE RETENCION '+uno
ENDIF
@ 24,0 SAY SPACE(80)
RETURN(respuesta)
