***************************************************
*-- Programa: LSBOIZ.PRG
*-- Fecha   : 07-27-92 10:02am
*-- Version : R. 'EL BATA'/G. REINER
*-- Notas   : IMPRESION DE cuentas bancos POR PANTALLA
*-- Modificaci¢n GOYO 12-14-92 11:08am - funciones de Inicio e impresi¢n
****************************************************
STORE HORA_ULP(PROGRAM()) TO ulpr
IF CHEQSEG()
	dime ttl[CANT_MAX],ctrl[CANT_MAX]
	store .f. to hay
	store nul to HB,DB,casos
	store "" to acla,lns,tt
	=LSBOPZ0()
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=tit_lns(3)
	SCAN
		IF _PLINENO>63
			=LSBOPZ2(1,NUL,'SUBTOTAL')
			if variable[8]
				STOR NUL TO ttl[8],ttl[9],TTL[10],TTL[11]
				store .t. to hay
			endif
			EJECT PAGE
			=cabpRI1()
			=TIT_LIN(4)
		ENDIF
		=LSBOPZ1()
	ENDSCAN
	ENDP
	=LSBOPZ2(2,casos,'TOTAL')
	=FINIMP()
	=OPCAJ(JANNRO,.F.,.T.)
	=IAUD((FISC))
ELSE
	=iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)
