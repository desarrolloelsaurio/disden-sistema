********************************************************************************
*-- Programa: LCIUI.PRG
*-- Fecha   : 06/06/91
*-- Version : R. 'EL BATA'
*-- Notas   : IMPRESION DE CIUDADES POR IMPRESORA
********************************************************************************
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

ulpr=hora_ulp(program())
if cheqseg()
	SELE mix
	SET ORDER TO TAG IIF(TYPE("ORDCIU")='U' .OR. ORDCIU,'CIUCOD','CIUTEX')
	STOR NUL TO CASOS
	acla='|POS.|CODIGO|'+PADC("CIUDAD",20)+paip+PADC("PROVINCIA",20)+'|C.POSTAL|CARACT.TE|  USUARIO |'
	m.linea=REPL("=",LEN(acla))
	tt='Listado de Ciudades'
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=cabpri1()
			=TIT_LIN(4)
		ENDI
		scat memv
		stor RECNO() TO nadarec
		NADA=IIF(XSEEK(RIGHT(m.TEXTO2,2),'MIX','PRVCOD'),MIX.TEXTO1,SPACE(20))
		GO NADAREC
		? paip
		?? STR(RECNO(),4)
		?? PAIP
		?? STR(M.NU1,6)
		?? paip
		?? m.texto1
		?? paip
		?? nada
		?? paip
		??'  '
		?? STR(m.nu2,4)
		?? '  '
		?? paip
		?? '  '
		?? LEFT(m.texto2,5)
		?? '  '
		?? paip
		?? usuario
		?? paip
		stor casos+1 TO casos
	ENDSCAN
	=FIN_LIN(4,CASOS)
	ENDP
	=FINIMP()
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
