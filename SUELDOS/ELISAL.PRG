********************************************************************************
*-- Programa: ELISAL.PRG
*-- Fecha   : 11/09/90 08:33pm
*-- Version : G. REINER
*-- Notas   : ELIGE SALARIO FAMILIAR
********************************************************************************
FUNCTION elisal
PARAMETER uno
ACTI SCRE
SELE sal
STORE 0 TO respuesta
IF salpop
   @ 24,0 SAY PADC('Rubro '+uno,80,' ') COLOR I
   ACTI POPUP salpop
   IF respuesta<>0
      GOTO TOP
      SKIP respuesta-1
      respuesta=RECNO()
   ENDIF
ELSE
   DO infic WITH RECCOUNT('SAL'),'INGRESE N§ DE SALARIO FAMILIAR '+uno
ENDIF
@ 24,0 SAY SPACE(80)
RETURN(respuesta)
