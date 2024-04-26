********************************************************************************
*-- Programa: ELIJN.PRG
*-- Fecha   : 10/25/90 00:51am
*-- Version : G. REINER
*-- Notas   : ELIGE EMPRESA
********************************************************************************
FUNCTION ELIJN
parameter uno
acti scre
SELE jan
STORE 0 TO respuesta
IF janpop
	@ 24,0 say padc('Empresa '+uno,80,' ')
	respuesta=0
   ACTI POPUP janpop
   IF respuesta<>0
      GOTO TOP
      SKIP respuesta-1
		RESPUESTA=RECNO()
   ENDIF
ELSE
   DO infic WITH RECCOUNT('JAN'),'INGRESE N§ DE EMPRESA '+uno
ENDIF
@ 24,0 SAY SPACE(80)
RETURN(RESPUESTA)

