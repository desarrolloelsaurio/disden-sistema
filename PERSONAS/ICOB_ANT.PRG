*****************************************
*-- Programa: ICOB.PRG
*-- Fecha   : 04-12-92 11:42am
*-- Version : G. REINER
*-- Notas   : INGRESA COBROS
*****************************************
PARAMETER ENCUOTAS,XPENSAS
ULPR=hora_ulp(PROGRAM())
IF CHEQSEG()
*    =opiac()
	=OPGAS()
	VEZ=1
	DO WHILE .T.
		STORE NUL TO RESPUESTA
		IF !EMPTY(ELIEMP("a Ingresar",-1,1))
			=IIF(SSTM1#"ADMIN",OPFAC(),IIF(XPENSAS,OPCNS(),OPINM()))
			=OPCCL()
			=OPCCH()
			DO WHILE .T.
				STORE NUL TO RESPUESTA
				IF ELICLI("",-1,1)
					=IIF(SSTM1#"ADMIN" .OR. XPENSAS,ICOB_1(.T.),ICOB_ALQ(.T.))
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
	=IAUDI()
ENDIF
UNLO ALL
RETURN MEN_LIN(BOTOM)
