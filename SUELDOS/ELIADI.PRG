********************************************************************************
*-- Programa: ELIADI.PRG
*-- Fecha   : 10/26/90 12:27pm
*-- Version : G. REINER
*-- Notas   : ELIGE ADICIONAL
********************************************************************************
FUNCTION eliadi
PARAMETER uno
ACTI SCRE
SELE adi
STORE 0 TO respuesta
IF adipop
   @ 24,0 SAY PADC('Adicional '+uno,80,' ')
   respuesta=0
   ACTI POPUP adipop
   IF respuesta<>0
      GOTO TOP
      SKIP respuesta-1
      respuesta=RECNO()
   ENDIF
ELSE
   DO infic WITH RECCOUNT('CAT'),'Ingrese N§ de Adicional '+uno
ENDIF
@ 24,0 SAY SPACE(80)
RETURN(respuesta)
