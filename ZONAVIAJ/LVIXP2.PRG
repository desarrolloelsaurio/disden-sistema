********************************************************************************
*-- Programa: LVIXP2.PRG
*-- Fecha   : 06/10/91 11:28am
*-- Version : R. 'EL BATA'
*-- Notas   : LISTADO DE ZONAS DE UN VIAJANTE POR PANTALLA
*-- Modificaci¢n GOYO 04-02-92 12:55pm
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	SELE VIX
	=WIN0()
	PAG=1
	=CABPAN()
	STOR NUL TO CASOS
	acla=PAIP+PADC(upper(bIAJA),10)+PAIP+PADC("ZONA",20)+PAIP+PADC("EMPRESA",20)+'|FECHA IN|  USUARIO |'
	linea=REPL("=",LEN(acla))
	tt=ttu
	fisc=fsc
	=TIT_LIN(1)
	SCAN FOR &fisc
		IF ROW()=21
			IF !FIN_LIN(1,NUL)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=TIT_LIN(2)
		ENDIF
		=xseek(vix.zona,'mix','zoncod')
		stor mix.texto1 TO nada
		=xseek(vix.marca,'mix','JANcod')
		stor left(mix.texto1,20) TO nada1
		? PAIP
		?? vix.codvia
		?? PAIP
		?? nada
		?? PAIP
		?? nada1
		=impuse()
	ENDSCAN
	=FIN_LIN(2,CASOS)
	=RELEWIN("win")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
