*****************************************
*-- Programa: ICOB.PRG
*-- Fecha   : 04-12-92 11:42am
*-- Version : G. REINER
*-- Notas   : INGRESA COBROS
*** VERSION RAFULS
*****************************************
PARAMETER ENCUOTAS
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM

ULPR=hora_ulp(PROGRAM())
IF CHEQSEG()
	VEZ=1
	DO WHILE .T.
		STORE NUL TO RESPUESTA
		IF !empty(ELIEMP("a Ingresar",-1,1))
			=OPCCL()
			=OPCCH()
			DO WHILE .T.
				STORE NUL TO RESPUESTA
				IF ELICLI("",-1,1)
					=ICOB_1(.T.)
				ELSE
					EXIT
				ENDIF
			ENDDO
		ELSE
			EXIT
		ENDIF
		IF CANT_EMPRE=1
			EXIT
		ENDIF
	ENDDO
ELSE
	=Iaudi()
ENDIF
=MEN_LIN(BOTOM)
UNLO ALL
RETURN
