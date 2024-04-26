********************************************************************************
*-- Programa: LFACICD.PRG
*-- Fecha   : 11-13-92 12:29pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE FACTURAS POR MERCADERIAS
*-- Modificaci¢n GOYO 07-21-92 07:17pm
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	DIME PX[15]
	STORE '' TO ACLA,LNS,TT,HAYDISC
	=LFACPCD0()
	store nul to tcan,tiva,tgra,ttot,tpes,tcos
	store nul to can,iva,gra,tot,pes,cos
	lamerca=mer.merca
	elarticulo=fax.articulo
	=MEN_LIN(IMPRIMIENDO)
	=cabpri()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_LIN(3)
	SCAN
		IF FAX.ARTICULO#ELARTICULO
			=LFACPCD1()
		ENDIF
		IF _PLINENO>63
			=LFACPCD2("SUBTOTAL")
			=cabpri1()
			=TIT_LIN(4)
		ENDIF
		=lfacpcd3()
	ENDSCAN
	=lfacpcd3()
	=LFACPCD1()
	=LFACPCD2("TOTAL")
	=FIN_LIN(4,NUL)
	EJECT PAGE
	?
	ENDP
	=finimp()
	=iaud(FISC)
	=REOPFAC()
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
