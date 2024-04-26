********************************************************************************
*-- Programa: LVIAP2.PRG
*-- Fecha   : 06/10/91 11:28am
*-- Version : R. 'EL BATA'
*-- Notas   : LISTADO DE DATOS DE VIAJANTES POR PANTALLA
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	SELE via
	=win0()
	=cabpan()
	STOR NUL TO casos
	acla=PAIP+PADC("CODIGO",10)+PAIP+PADC("APELLIDO Y NOMBRE",30)+"|LOCALID.|"+PADC("CARACTERISTICA",5)+PAIP+PADC("TELEFONO",20)+PAIP
	linea=REPL("=",LEN(acla))
	tt='Listado de '+biajas
	=TIT_LIN(1)
	SCAN
		IF ROW()=21
			IF !FIN_LIN(1,NUL)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=TIT_LIN(2)
		ENDIF
		=XSEEK(via.localidad,'MIX','CIUCOD')
		? PAIP
		?? via.codvia
		?? PAIP
		?? via.viajante
		?? PAIP
		?? LEFT(mix.texto1,8)
		?? PAIP
		?? LEFT(mix.texto2,5)
		?? PAIP
		?? via.telefono
		?? PAIP
		stor casos+1 TO casos
	ENDSCAN
	=FIN_LIN(2,CASOS)
	=RELEWIN("win")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
