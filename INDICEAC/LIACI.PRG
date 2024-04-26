********************************************************************************
*-- Programa: LiacI.PRG
*-- Fecha   : 06/06/91
*-- Version : R. 'EL BATA'
*-- Notas   : IMPRESION DE CIUDADES POR IMPRESORA
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	SELE iac
	=impresor()
	=MEN_LIN(IMPRIMIENDO)
	stor nul TO casos
	***      acla='|POS.|CODIGO|'+PADC("iacDAD",20)+paip+PADC("PROVINCIA",20)+'|C.POSTAL|CARACT.TE|  USUARIO |'
	m.linea=REPL("=",LEN(acla))
	tt='Listado de Indices'
	=cabpri()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_LIN(3)
	SCAN
		***		IF _PLINENO>63
		***   		=FIN_LIN(3,NUL)
		***      	=cabpri1()
		***			=TIT_LIN(4)
		***		ENDI
		***		scat memv
		scat to indice
		stor RECNO() TO nadarec
		****		NADA=IIF(XSEEK(RIGHT(m.TEXTO2,2),'MIX','PRVCOD'),MIX.TEXTO1,SPACE(20))
		****		GO NADAREC
		?"A¥O  "
		??indice(13)
		?"TIPO DE ACTUALIZACION "
		??IIF(XSEEK(indice(14),'MIX','ACTCOD'),MIX.TEXTO1,SPACE(20))
		for m.o=1 to 12
			?UPPER(QMES(m.o))
			??indice(m.o) AT 20 picture "999,999,999,999.999"
		endf
		stor casos+1 TO casos
		EJECT PAGE
	ENDSCAN
	=FIN_LIN(4,CASOS)
	EJECT PAGE
	?
	ENDP
	=finimp()
	=iaud("")
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
