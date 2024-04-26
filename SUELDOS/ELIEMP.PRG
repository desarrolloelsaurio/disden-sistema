********************************************************************************
*-- Programa: ELIEMP.PRG
*-- Fecha   : 10/26/90 12:27pm
*-- Version : G. REINER
*-- Notas   : ELIGE EMPLEADO
********************************************************************************
FUNCTION eliemp
PARAMETER uno
ACTI SCRE
SELE emp
STORE 0 TO respuesta
IF emppop
   @ 24,0 SAY PADC('Empleado '+uno,80,' ')
   respuesta=0
   SET ORDER TO 1
   ACTI POPUP emppop
   IF respuesta<>0
      GOTO TOP
      SKIP respuesta-1
      respuesta=RECNO()
   ENDIF
   SET ORDER TO ordlis
ELSE
   DO infic1 WITH 'INGRESE N§ DE LEGAJO '+uno
   IF .NOT. EMPTY(respuesta)
      SET ORDER TO 2
      SEEK respuesta
      IF FOUND()
         respuesta=RECNO()
      ELSE
         respuesta=0
      ENDIF
   ELSE
      respuesta=0
   ENDIF
ENDIF
@ 24,0 SAY SPACE(80)
RETURN(respuesta)
*: EOF: ELIEMP.PRG
