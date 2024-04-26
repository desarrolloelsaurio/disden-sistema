********************************************************************************
*-- Programa: LMERPP.PRG
*-- Fecha   : 03-26-92 12:57pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE MERCADERIAS,SIN DENOMINACION COMERCIAL, POR PANTALLA
********************************************************************************
STORE hora_ulp(PROGRAM()) to ULPR
IF CHEQSEG()
	=working()
	SET ORDER TO CODRUB IN RUB
	SELE mer
	tmp=GENTMP()
	SET RELA TO RUBRO INTO RUB
	=LMERO(TMP)
	PAG=1
	=unwork()
	=WIN0()
	=CABPAN()
	STOR NUL TO casos
	acla=PAIP+PADC("RUBRO",10)+PAIP+"CODR"+paip+PADC("ARTICULO",10)+PAIP+PADC("DESCRIPCION",30)+PAIP+"TEMPORADA"+PAIP+'UNID'+PAIP+"DI"+PAIP
	lns=REPL("=",LEN(acla))
	=tit_lns(1)
	SCAN
		IF ROW()=21
			IF !fin_lns(1,NUL)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=CABPAN()
			=tit_lns(2)
		ENDIF
		?  PAIP
		?? left(RUB.RUBRO,10)
		?? PAIP
		?? ZERO(MER.RUBRO,4)
		?? PAIP
		?? LEFT(articulo,10)
		?? PAIP
		?? MERCA
		?? PAIP
		?? LEFT(QTEM(TEMPORADA),10)
		?? PAIP
		?? STR(UNIDXBUL,4)
		?? PAIP
		?? IIF(DISCRIM,'SI','NO')
		?? PAIP
		STORE casos+1 TO casos
	ENDSCAN
	=fin_lns(2,casos)
	=RELEWIN('win')
	=reopmer()
ELSE
	=iaudi()
ENDIF
=MEN_LIN(BOTOM)
RETURN
