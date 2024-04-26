********************************************************************************
*-- Programa: LKARP3.PRG
*-- Fecha   : 06/20/91
*-- Version : g. reiner
*-- Notas   : LISTADO DE KARDEX, POR PANTALLA
********************************************************************************
SELE Seg
STORE PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
	SELE kar
	DO WIN0
	PAG=1
	DO CABPAN
	STORE 0 TO suma,resta
	acla="|Nro.OP|FECHA OP|"+padc("TALLER",15)+"|OPER.DE KARDEX|"+padc("DETALLE",17)+"|  CANTIDAD  |"
	lines=REPL("=",LEN(acla))
	_wrap=.T.
	_alignment='CENTER'
	? tt
	_WRAP=.F.
	? lines
	? acla
	? lines
	sele kar
	SCAN FOR &fisc
		IF ROW()=21
			? LEFT(LINES,LEN(LINES)-4)
			?? '\\\\'
			IF INKEY(0)=27
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			DO CABPAN
			? tt
			? lines
			? acla
			? lines
		ENDIF
		?'|'
		?? STR(RECNO(),6)
		??'|'
		?? fechaop
		??'|'
		IF KAR->TALLER#0
			GOTO kar->taller in tal
			?? LEFT(tal->talleres,15)
		ELSE
			?? 'DEPOSITO/FABRIC'
		ENDIF
		??'|'
		GOTO kar->opk in opk
		??LEFT(opk->operacion,14)
		??'|'
		??LEFT(detalle,17)
		??'|'
		IF entrada#0
			??STR(entrada,12,2)
			STORE suma+entrada TO suma
		ELSE
			IF salida#0
				?? STR(-1*salida,12,2)
				STORE resta+salida TO resta
			ELSE
				?? padc("----",12)
			ENDIF
		ENDIF
		??'|'
	ENDSCAN
	STORE suma-resta TO TOTAL
	? lines
	_wrap=.F.
	? SPACE(51)+"Cantidad Total: "+STR(TOTAL,10,2)
	=INKEY(0)
	RELE wind win
ELSE
	DO IAUD WITH 'ING ILEGAL '+ulpr
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
