********************************************************************************
*-- Programa: ELIPAR.PRG
*-- Fecha   : 10/26/90 12:27pm
*-- Version : G. REINER
*-- Notas   : ELIGE PARENTESCO
********************************************************************************
FUNCTION ELIPAR
parameter uno
SELE par
STORE 0 TO respuesta
acti scre
IF parpop
   @ 24,0 say padc('Parentesco '+UNO,80,' ')
   ACTI POPUP parpop
   IF respuesta<>0
      GOTO TOP
      SKIP respuesta-1
		RESPUESTA=RECNO()
	ENDIF
ELSE
   DO infic WITH RECCOUNT('PAR'),'INGRESE N§ DE PARENTESCO'+UNO
ENDIF
@ 24,0 SAY SPACE(80)
RETURN(RESPUESTA)

