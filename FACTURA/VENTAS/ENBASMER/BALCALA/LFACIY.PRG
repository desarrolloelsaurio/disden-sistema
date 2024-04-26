********************************************************************************
*-- Programa: lfaciy.prg
*-- Fecha   : 04-27-92 04:16pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE FACTURAS POR MERCADERIAS
*-- Modificaci¢n GOYO 07-21-92 07:17pm
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	DIME PX[15]
	STORE '' TO ACLA,LNS,TT
	STORE HAYCAMPO("DISCRIM","MER") TO M.HAYDISC
	=LFACPY0()
	store nul to tcan,tiva,tgra,ttot,TPES
	store nul to can,iva,gra,tot,PES
	lamerca=mer.merca
	elarticulo=fax.articulo
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SCAN
		IF FAX.ARTICULO#ELARTICULO
			=LFACPY1()
		ENDIF
		IF _PLINENO>63
			=LFACPY2("SUBTOTAL")
			EJECT PAGE
			=CABPRI1()
			=TIT_LIN(4)
		ENDIF
		=LFACPY3()
	ENDSCAN
	=LFACPY1()
	=LFACPY2("TOTAL")
	=FIN_LIN(4,NUL)
	EJECT PAGE
	?
	ENDP
	=FINIMP()
	=IAUD(FISC)
	=REOPFAC()
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
