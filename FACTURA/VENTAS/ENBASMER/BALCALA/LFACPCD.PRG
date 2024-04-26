*******************************************************************************
*-- Programa: LFACPCD.PRG
*-- Fecha   : 08/25/91
*-- Version : G. REINER
*-- Notas   : LISTADO DE ITEMS DE FACTURAS
*-- Modificaci¢n GOYO 07-21-92 07:17pm
********************************************************************************
STORE PROGRAM() TO ULPR
IF CHEQSEG()
	DIME PX[15]
	STORE '' TO ACLA,LNS,TT,HAYDISC
	=LFACPCD0()
	store nul to tcan,tiva,tgra,ttot,Tcos,Tpes
	store nul to can,iva,gra,tot,cos,pes
	lamerca=mer.merca
	elarticulo=fax.articulo
	=WIN0()
	pag=1
	=CABPAN()
	=tit_lns(1)
	SCAN
		IF FAX.ARTICULO#ELARTICULO
			=LFACPCD1()
		ENDIF
		IF ROW()=21
			IF LFACPCD2("SUBTOTAL",.T.)=27
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=CABPAN()
			=tit_lns(2)
		ENDIF
		=Lfacpcd3()
	ENDSCAN
	=Lfacpcd3()	
	IF LAST()#27
		=LFACPCD1()
		=LFACPCD2("TOTAL",.T.)
	ENDIF
	=IAUD(FISC)
	=relewin("WIN")
	=REOPFAC()
ELSE
	=iaudi()
ENDIF
RETURN men_lin(botom)
