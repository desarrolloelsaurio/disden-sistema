********************************************************************************
*-- Programa: ELIVAR.PRG
*-- Fecha   : 10/26/90 12:27pm
*-- Version : G. REINER
*-- Notas   : ELIGE VARIABLE
********************************************************************************
FUNCTION ELIVAR
parameter uno
acti scre
SELE VAR
@ 24,0 say padc("Constante"+UNO,80,' ')
STORE 0 TO respuesta
IF varpop
   ACTI POPUP varpop
   IF respuesta<>0
      GOTO TOP
      SKIP respuesta-1
		RESPUESTA=RECNO()
	ENDIF
ELSE
   DO infic WITH RECCOUNT('VAR'),'INGRESE N§ DE VARIABLE'+COSA
ENDIF
@ 24,0 SAY SPACE(80)
RETURN(RESPUESTA)
