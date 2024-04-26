********************************************************************************
*-- Programa: LRESIT.PRG
*-- Fecha   : 12-19-92 11:36pm
*-- Version : GOYO REINER
*-- Notas   : LISTADO GENERAL DE RESUMENES POR IMPRESORA
* PARAMETROS *******************************************************************
*-- ULPR    : NOMBRE DEL PROGRAMA
*-- C_BASE  : ALIAS DE LA BASE DE DATOS A LISTAS
*-- C_IND   : CAMPO SOBRE EL QUE SE REALIZARA EL INDICE
*-- C_COR   : VALOR DE LA VARIABLE DE CORTE (p.EJ FAC.CODCLI)
*-- C_TEX   : NOMBRE DEL CORTE (P.EJ PER.CLIENTE)
*-- C_TOT   : DENOMINACION DE LA VARIABLE DE TOTALIZACION
* EJEMPLO    *******************************************************************
* DO LRESP WITH "LPROPR","PRO","MIX.TEXTO1","PRO.LOCAL","MIX.TEXTO1",'"|"+STR(GTOTAL)+"|"'
********************************************************************************
PARAMETER ULPR,c_BASE,c_IND,c_COR,c_TEX,c_TOT
=HORA_ULP()
IF CHEQSEG()
	STORE "" TO ACLA,ELCORTE,ELTEXTO,LINEA
	STOR NUL TO CASOS,TOTAL,GTOTAL
	=LRESPT0()
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_LIN(3)
	SCAN
		IF ELCORTE#EVAL(c_COR)
			=LRESPT1()
		ENDIF
		IF _PLINENO>63
			=FIN_LIN(3,NUL,FIN_SUM("SUBTOTAL",@gtl))
			=CABPRI1()
			=TIT_LIN(4)
		ENDI
		=LRESPT2()
	ENDSCAN
	=LRESPT1()
	=FIN_LIN(4,CASOS,FIN_SUM("TOTAL",@gtl))
	EJECT PAGE
	ENDP
	=FINIMP()
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
