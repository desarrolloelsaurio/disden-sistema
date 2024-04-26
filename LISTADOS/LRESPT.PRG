********************************************************************************
*-- Programa: LRESPT.PRG
*-- Fecha   : 01-08-93 12:55pm
*-- Version : GOYO REINER
*-- Notas   : LISTADO GENERAL DE RESUMENES POR PANTALLA (suma campos)
* PARAMETROS *******************************************************************
*-- ULPR    : NOMBRE DEL PROGRAMA
*-- C_BASE  : ALIAS DE LA BASE DE DATOS A LISTAS
*-- C_IND   : CAMPO SOBRE EL QUE SE REALIZARA EL INDICE
*-- C_COR   : VALOR DE LA VARIABLE DE CORTE (p.EJ FAC.CODCLI)
*-- C_TEX   : NOMBRE DEL CORTE (P.EJ PER.CLIENTE)
*-- C_TOT   : DENOMINACION DE LAS VARIABLE DE TOTALIZACION (ARRAY)
*-- pROMEDIA: NO PROMEDIA LAS DOS ULTIMAS COLUNAS
* EJEMPLO    *******************************************************************
* DO LRESP WITH "LPROPR","PRO","MIX.TEXTO1","PRO.LOCAL","MIX.TEXTO1",'"|"+STR(GTOTAL)+"|"'
********************************************************************************
PARAMETER ULPR,c_BASE,c_IND,c_COR,c_TEX,c_TOT,C_LAR,PROMEDIA
=HORA_ULP()
IF CHEQSEG()
	DIME TTL[C_LAR],GTL[C_LAR],pichure[c_lar]
	for a=1 to c_lar
	    pichure[a]=texto[a,5]
	next
	STORE "" TO acla,ELCORTE,ELTEXTO,LINEA
	stor nul TO casos,TOTAL,GTOTAL
	=LRESPT0()
	=win0()
	pag=1
	=cabpan()
	=TIT_LIN(1)
	SCAN
		IF ELCORTE#EVAL(c_COR)
			=LRESPT1()
		ENDIF
		IF ROW()>21
			IF !FIN_LIN(1,NUL,FIN_SUM("SUBTOTAL",@gtl,@pichure))
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_LIN(2)
		ENDIF
		=LRESPT2()
	ENDSCAN
	=LRESPT1()
	=FIN_LIN(2,CASOS,FIN_SUM("TOTAL",@gtl,@pichure))
	=RELEWIN("win")
	=IAUD(FISC)
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
