*******************************************************************************
*-- Programa: ICOB.PRG
*-- Fecha   : 04-12-92 11:42am
*-- Version : G. REINER
*-- Notas   : INGRESA COBROS
********************************************************************************
PARAMETER ENCUOTAS
STORE HORA_ulp(program()) to ulpr
if cheqseg()
	STORE NUL TO RESPUESTA
	DO WHILE .T.
		STORE NUL TO RESPUESTA
		IF !EMPTY(ELICLI("",-1,1))                   && OJO
		 =ICOB_1()
		ELSE
			EXIT
		ENDIF
	ENDDO
ELSE
	=Iaudi()
ENDIF
=MEN_LIN(BOTOM)
RETURN
