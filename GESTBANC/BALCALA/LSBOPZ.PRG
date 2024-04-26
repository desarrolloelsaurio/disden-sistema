***************************************************
*-- Programa: LSBOPZ.PRG
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
	=WIN0()
	pag=1
	=cabpan()
	=TIT_lns(1))
	SCAN
		IF ROW()>21
			IF !LSBOPZ2(1,NUL,'SUBTOTAL')
				EXIT
			ENDIF
			if variable[8]
				STOR NUL TO ttl[8],ttl[9],TTL[10],TTL[11]
				store .t. to hay
			endif
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_lns(2)
		ENDIF
		=LSBOPZ1()
	ENDSCAN
	if last()#27
		=LSBOPZ2(2,casos,'TOTAL')
	endif
	=opcaj(JANNRO,.F.,.T.)
	=iaud((FISC))
	=RELEWIN('win')
ELSE
	=iaudi()
ENDIF
RETURN men_lin(botom)
