********************************************************************************
*-- Programa: LMERP.PRG
*-- Fecha   : 12/13/91
*-- Version : V.LEEGSTRA
*-- Notas   : LISTADO DE MERCADERIA POR PANTALLA
********************************************************************************
STORE hora_ulp(PROGRAM()) to ULPR
IF CHEQSEG()
	SELE MER
    tt='Listado de Mercader¡as' 
	=WIN0()
	pag=1
	=cabpan()
	STORE NUL TO casos
	acla='|POSIC|'+PADC(RUvRO,16)+PAIP+PADC("VARIEDAD",16)+PAIP+PADC("CALIDAD",16)+"|FECHA IN|  USUARIO |"
	lns=REPL("=",LEN(acla))
	=TIT_LNS(1)
	SCAN
		IF ROW()>21
			IF !FIN_LNS(1,NUL)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_LNS(2)
		ENDIF
		? PAIP
		?? STR(RECNO(),5)
		?? PAIP
		?? IIF(xseek(MER.RUBRO,'rub','codrub'),LEFT(RUB.RUBRO,16),SPACE(16))
		?? PAIP
		?? IIF(xseek(MER.VARIEDAD,'mix','varcod'),left(MIX.TEXTO1,16),SPACE(16))
		??PAIP
		?? IIF(xseek(MER.CALIDAD,'mix','calcod'),left(MIX.TEXTO1,16),SPACE(16))
		SELE MER
		=impuse()
	ENDSCAN
	=FIN_LNS(2,CASOS)
	=RELEWIN('win')
ELSE
	=iaudi()
ENDIF
=men_lin(botom)
RETURN
