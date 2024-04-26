*******************************************************************************
*-- Programa: LFACPY.PRG
*-- Fecha   : 08/25/91
*-- Version : G. REINER
*-- Notas   : LISTADO DE ITEMS DE FACTURAS
*-- Modificaci¢n GOYO 07-21-92 07:17pm
********************************************************************************
STORE PROGRAM() TO ULPR
IF CHEQSEG()
	DIME PX[15]
	STORE '' TO ACLA,LNS,TT
	STORE HAYCAMPO("DISCRIM","MER") TO M.HAYDISC	
	=LFACPY0()
	store nul to tcan,tiva,tgra,ttot,TPES
	store nul to can,iva,gra,tot,PES
	lamerca=mer.merca
	elarticulo=fax.articulo
	=WIN0()
	pag=1
	=CABPAN()
	=tit_lns(1)
	SCAN
		IF FAX.ARTICULO#ELARTICULO
			=LFACPY1()
		ENDIF
		IF ROW()=21
			IF LFACPY2("SUBTOTAL",.T.)=27
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=CABPAN()
			=tit_lns(2)
		ENDIF
		=lfacpy3()
	ENDSCAN
	IF LAST()#27
		=LFACPY1()
		=LFACPY2("TOTAL",.T.)
	ENDIF
	=relewin("WIN")
	=REOPFAC()
	=iaud(fisc)
ELSE
	=iaudi()
ENDIF
RETURN men_lin(botom)
