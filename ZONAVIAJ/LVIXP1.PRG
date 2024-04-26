********************************************************************************
*-- Programa: LVIXP1.PRG
*-- Fecha   : 06/10/91 11:28am
*-- Version : R. 'EL BATA'
*-- Notas   : LISTADO DE ZONAS DE UN VIAJANTE POR PANTALLA
*-- Modificaci¢n GOYO 04-02-92 12:52pm
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	SELE VIX
	=WIN0()
	PAG=1
	=CABPAN()
	STOR 0 TO CASOS
	acla=PAIP+PADC("ZONA",20)+PAIP+PADC("EMPRESA",20)+'|FECHA IN|  USUARIO |'
	linea=REPL("=",LEN(acla))
	tt=ttu
	fisc=fsc
	=TIT_LIN(1)
	SCAN FOR vix.codvia = via.codvia
		IF ROW()=21
			IF !FIN_LIN(1,0)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_LIN(2)
		ENDIF
		=XSEEK(vix.zona,'mix','ZONCOD')
		stor mix.texto1 TO nada
		=XSEEK(vix.marca,'MIX','JANCOD')
		stor mix.texto1 TO nada1
		? PAIP
		?? nada
		?? PAIP
		?? nada1
		=IMPUSE()
	ENDSCAN
	=FIN_LIN(2,CASOS)
	=RELEWIN("win")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
