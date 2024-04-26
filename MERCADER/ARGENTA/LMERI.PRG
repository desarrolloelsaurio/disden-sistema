********************************************************************************
*-- Programa: LMERI.PRG
*-- Fecha   : 12/14/91
*-- Version : V.LEEGSTRA
*-- Notas   : IMPRESION DE MERCADERIA POR IMPRESORA
********************************************************************************
STORE hora_ulp(PROGRAM()) to ULPR
IF CHEQSEG()
	tt='Listado de Mercader¡as'
	SELE mer
	STORE NUL TO casos
	STORE '|POSIC|'+PADC(RUvRO,20)+PAIP+PADC("VARIEDAD",20)+PAIP+PADC("CALIDAD",20)+"|FECHA IN|  USUARIO |" TO acla
	STORE 'Listado de Mercader¡a' TO tt
	=CABPRI()
	STORE REPL("=",LEN(acla)) TO lns
	STORE LEN(acla) TO largo
	STORE MIN(xacancho,xachoja) TO largoim
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LNS(3)
	SCAN
		IF _PLINENO>63
			=FIN_LNS(3,NUL)
			=cabpri1()
			=TIT_LNS(4)
		ENDI
		? PAIP
		?? STR(RECNO(),5)
		?? PAIP
		?? iif(xseek(mer.rubro,'rub','codrub'),rub.rubro,space(20))
		?? PAIP
		?? iif(xseek(mer.variedad,'mix','varcod'),mix.texto1,space(20))
		?? PAIP
		?? iif(xseek(MER.CALIDAD,'mix','calcod'),mix.texto1,space(20))
		SELE MER
		=IMPUSE()
	ENDSCAN
	=FIN_LNS(4,CASOS)
	ENDP
	=FINIMP()
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
