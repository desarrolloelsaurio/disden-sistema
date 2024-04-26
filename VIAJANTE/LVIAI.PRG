********************************************************************************
*-- Programa: LVIAI.PRG
*-- Fecha   : 06/06/91
*-- Version : R. 'EL BATA'
*-- Notas   : IMPRESION DE VIAJANTES POR IMPRESORA
*-- MOFICACION GOYO 07-15-92 03:32pm
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	SELE via
	SET ORDER TO TAG IIF(ORDVIA,'CODVIA','VIAJANTE')
	STOR NUL TO casos
	acla=PAIP+PADC("CODIGO",10)+PAIP+PADC("APELLIDO Y NOMBRE",30)+PAIP+PADC("DOMICILIO",30)+PAIP+PADC("LOCALIDAD",20)+"|COD.POST.|"+PADC("CARACTERISTICA",5)+PAIP+PADC("TELEFONO",20)+PAIP+PADC("TIPO",13)+PAIP
	stor "Listado de "+biajas TO tt
	=cabpri()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_LIN(3)
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3)
			=Cabpri1()
			=TIT_LIN(4)
		ENDI
		=xseek(via.localidad,'mix','ciucod')
		=xseek(right(mix.texto2,2),'mix','prvcod')
		nada=mix.texto1
		=xseek(via.localidad,'mix','ciucod')
		? PAIP
		?? via.codvia
		?? PAIP
		?? via.viajante
		?? PAIP
		?? via.domicilio
		?? PAIP
		?? mix.texto1
		?? PAIP
		?? PADC(mix.nu2,9)
		?? PAIP
		?? mix.texto2
		?? PAIP
		?? via.telefono
		?? PAIP
		?? qvia(via.tipo)
		?? PAIP
		stor casos+1 TO casos
	ENDSCAN
	=fin_lin(4,casos)
	ENDP
	=finimp()
	=iaud("")
ELSE
	=iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)
