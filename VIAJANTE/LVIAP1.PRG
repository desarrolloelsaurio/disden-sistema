********************************************************************************
*-- Programa: LVIAP1.PRG
*-- Fecha   : 06/10/91 11:28am
*-- Version : R. 'EL BATA'
*-- Notas   : LISTADO DE DATOS DE VIAJANTES POR PANTALLA
*-- Modificaci¢n GOYO 07-15-92 03:34pm
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	SELE via
	=win0()
	pag=1
	=cabpan()
	STOR NUL TO casos
	acla=PAIP+PADC("CODIGO",10)+PAIP+PADC("APELLIDO Y NOMBRE",30)+PAIP+PADC("DOMICILIO",25)+'| TIPO  |'
	linea=REPL("=",LEN(acla))
	tt='Listado de '+biajas
	=TIT_LIN(1)
	SCAN
		IF ROW()>22
			IF !FIN_LIN(1)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_LIN(2)
		ENDIF
		? PAIP
		?? via.codvia
		?? PAIP
		?? via.viajante
		?? PAIP
		?? LEFT(via.domicilio,25)
		?? PAIP
		??LEFT(qvia(via.tipo),7)
		?? PAIP
		stor casos+1 TO casos
	ENDSCAN
	=FIN_LIN(2,CASOS)
	=RELEWIN("win")
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
