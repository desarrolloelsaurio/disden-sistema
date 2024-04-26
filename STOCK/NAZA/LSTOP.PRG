***************************************************************************
*-- Programa: LSTOP.PRG
*-- Fecha   : 05/22/92 12:16pm
*-- Version : GOYO REINER
*-- Notas   : LISTADO DE STOCKS
*-- VERSION NAZA (MODIFICACION 06-04-92 03:36am)
*-- Modificaci¢n GOYO 09-04-92 12:03pm
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	dime ttl[CANT_MAX],ctrl[CANT_MAX],PTL[CANT_MAX],MTL[CANT_MAX]
	STORE '' TO acla,LNS,ELRUBRO,LAMERCA,LAMERCA1,LAMERCOR,ELCORTE
		TTU='Listado de Stock'
	hay=.f.
	=LSTO0()
	=win0()
	pag=1
	=cabpan()
	stor nul TO casos
	=TIT_LNS(1)
	SCAN
		LAMERCOR=IIF(FILXXX=1,LEFT(MER.ARTICULO,10),IIF(FILXXX=2,LEFT(MER.ARTICULO,13),SUBSTR(MER.ARTICULO,5,6)))
		IF LAMERCOR#LAMERCA
			=LSTO2()
		ENDIF
		if elcorte#mer.rubro
			IF HAY
				IF !fin_lns(1,nul,FIN_SUM(ELRUBRO,@PTL))
					EXIT
				ENDIF
				for a=1 to CANT_MAX
					if variable[a]
						STORE NUL TO PTL[A]
					endif
				NEXT
			ELSE
				IF !fin_lns(1,nul)
					EXIT
				ENDIF
			ENDIF
			clea
			pag=pag+1
			=cabpan()
			ELCORTE=MER.RUBRO
			=XSEEK(ELCORTE,'MIX','rubCOD')
			ELRUBRO=MIX.TEXTO1
			TT=TTU+CHR(13)+CHR(10)+"Rubro:"+alltrim(elrubro)
			=TIT_LNS(1)
		endif
		IF ROW()>21
			IF HAY
				IF !FIN_LNS(2,NUL,FIN_SUM('SUBTOTAL',@TTL))
					EXIT
				ENDIF
			ELSE
				IF !FIN_LNS(2,NUL)
					EXIT
				ENDIF
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_LNS(2)
		ENDIF
		=LSTO1()
	ENDSCAN
	IF LAST()#27
		=FIN_LNS(2,NUL,FIN_SUM(ELRUBRO,@PTL))
		? LNS
		=FIN_LNS(2,NUL,FIN_SUM('TOTAL',@TTL))
	ENDIF
	=RELEWIN("win")
	=reopmer()
ELSE
	=iaudI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
