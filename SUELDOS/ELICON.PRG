********************************************************************************
*-- Programa: ELICON.PRG
*-- Fecha   : 10/26/90 12:27pm
*-- Version : G. REINER
*-- Notas   : ELIGE CONVENIO
********************************************************************************
FUNCTION elicon
PARAMETER uno
ACTI SCRE
SELE con
STORE 0 TO respuesta
IF conpop
   @ 24,0 SAY PADC('Convenio '+uno,80,' ')
   respuesta=0
   ACTI POPUP conpop
   IF respuesta<>0
      GOTO TOP
      SKIP respuesta-1
      respuesta=RECNO()
   ENDIF
ELSE
   DO infic WITH RECCOUNT('CON'),'Ingrese N� de Convenio '+uno
ENDIF
@ 24,0 SAY SPACE(80)
RETURN(respuesta)
