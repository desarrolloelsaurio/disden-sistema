*******************************************************************************
*-- Programa: LVIXI2.PRG
*-- Fecha   : 06/10/91 11:28am
*-- Version : R. 'EL BATA'
*-- Notas   : LISTADO DE ZONAS DE UN VIAJANTE POR IMPRESORA
*-- Modificacion Goyo 04-02-92 12:40pm
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	SELE vix
	=men_lin(IMPRIMIENDO)
	STOR NUL TO casos
	acla=PAIP+PADC(upper(bIAJA),10)+PAIP+PADC("ZONA",20)+PAIP+PADC("EMPRESA",20)+'|FECHA IN|  USUARIO |'
	lns=REPL("=",LEN(acla))
	stor LEN(acla) TO largo
	tt=ttu
	fisc=fsc
	stor MIN(xacancho,xachoja) TO largoim
	=cabpri()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=tit_lns(3)
	SCAN FOR &fisc
		IF _PLINENO>63
			=fin_lns(3,nul)
			=cabpri1()
			=tit_lns(4)
		ENDI
		=xseek(vix.zona,'mix','zoncod')
		stor mix.texto1 TO nada
		=xseek(vix.marca,'mix','JANcod')
		stor MIX.TEXTO1 TO nada1
		? PAIP
		?? vix.codvia
		?? PAIP
		?? nada
		?? PAIP
		?? nada1
		=IMPUSE()
	ENDSCAN
	=fin_lns(4,casos)
	EJECT PAGE
	ENDP
	=finimp()
	=iaud((fisc))
ELSE
	=iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)
