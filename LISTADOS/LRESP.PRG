********************************************************************************
*-- Programa: LRESP.PRG
*-- Fecha   : 12-19-92 11:36pm
*-- Version : GOYO REINER
*-- Notas   : LISTADO GENERAL DE RESUMENES POR PANTALLA
* PARAMETROS *******************************************************************
*-- ULPR    : NOMBRE DEL PROGRAMA
*-- C_BASE  : ALIAS DE LA BASE DE DATOS A LISTAR
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
	STORE "" TO acla,ELCORTE,ELTEXTO,LINEA
	stor nul TO casos,TOTAL,GTOTAL
    =LRESP0()
	=win0()
	pag=1
	=cabpan()
	=TIT_LIN(1)
	SCAN
		IF ELCORTE#EVAL(c_COR)
		=LRESP1()
		ENDIF
		IF ROW()>21
			IF !FIN_LIN(1,NUL,PAIP+PADR("SUBTOTAL",TEXTO[1,2])+EVAL(c_TOT))
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_LIN(2)
		ENDIF
		TOTAL=TOTAL+1
	ENDSCAN
	=LRESP1()
	=FIN_LIN(2,CASOS,PAIP+PADR("TOTAL",TEXTO[1,2])+EVAL(c_TOT))
	=RELEWIN("win")
	=IAUD(FISC)
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
