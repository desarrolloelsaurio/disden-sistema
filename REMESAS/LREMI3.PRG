********************************************************************************
*-- Programa: LREMI3.PRG
*-- Fecha   : 12/18/91
*-- Version : V.LEEGSTRA
*-- Notas   : IMPRESION DE REMESA, POR IMPRESORA
********************************************************************************
IF CHEQSEG()
	acla='| REMESA |'+PADC("ZONA",15)+PAIP+PADC("OBSERVACIONES",20)+PAIP+PADC("ENVASE",15)+'|CANT. BULTOS| Kg.x BULTO |  TOTAL Kg. |'
	stor nul TO casos
	STORE REPL("=",LEN(acla)) TO lns
	STORE LEN(acla) TO largo
	STORE MIN(xacancho,xachoja) TO largoim
	=men_lin(IMPRIMIENDO)
	IF (largoim=80 .AND. largo>132) .OR. (largoim=132 .AND. largo>233)
		A=LEFT(sincosas(janname),8)+'.TXT'
		=men_lin("Imprimiendo Listado en Archivo "+ALLTRIM(A))
		SET PRINTER TO (A)
		largoim=iIF(largoim>80,60,50)
	ENDIF
	SELE rem
	go top
	tt='Listado de las Remesas por Producto '+alltrim(mer.palpopup)
	=cabpri()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_LIN(3)
	IF largo>largoim
		_rmargin=iif(largoim>80,232,132)
		??? CHR(15)
	ENDIF
	SELE REM
	SCAN  FOR &fisc
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			_RMARGIN=80
			_WRAP=.F.
			?
			=CABPRI1()
			=TIT_LIN(4)
		ENDI
		?PAIP
		sele rem
		?? rem.remesa
		?? PAIP
		?? iif(XSEEK(REM.ZONA,'MIX','ZONCOD'),left(mix.texto1,15),space(15))
		?? PAIP
		?? rem.tamano
		?? PAIP
		?? iif(XSEEK(REM.ENVASE,'MIX','ENVCOD'),left(mix.texto1,15),space(15))
		?? PAIP
		?? str(rem.bultos,12)
		?? PAIP
		?? str(rem.kgbulto,12,2)
		?? PAIP
		?? str(rem.bultos*rem.kgbulto,12,2)
		?? PAIP
	ENDSCAN
	=FIN_LIN(4,CASOS)
	ENDP
	=FINIMP()
	=IAUD(fisc)
ELSE
	=IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
