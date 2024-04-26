********************************************************************************
*-- Programa: LSTOI.PRG
*-- Fecha   : 09-04-92 12:04pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE STOCK POR IMPRESORA
*-- VERSION NAZA
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	dime ttl[CANT_MAX],ctrl[CANT_MAX],PTL[CANT_MAX],MTL[CANT_MAX]
	STORE '' TO acla,LNS,ELRUBRO,LAMERCA,LAMERCA1,LAMERCOR,ELCORTE
	TTU='Listado de Stock'
	hay=.f.
	=LSTO0()
	STOR NUL TO CASOS
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_LIN(1)
	SCAN
		LAMERCOR=IIF(FILXXX=1,LEFT(MER.ARTICULO,10),IIF(FILXXX=2,LEFT(MER.ARTICULO,13),SUBSTR(MER.ARTICULO,5,6)))
		IF LAMERCOR#LAMERCA
			=LSTO2()
		ENDIF
		if elcorte#mer.rubro
			IF HAY
				IF !fin_lns(3,nul,FIN_SUM(ELRUBRO,@PTL))
					EXIT
				ENDIF
				for a=1 to CANT_MAX
					if variable[a]
						STORE NUL TO PTL[A]
					endif
				NEXT
			ELSE
				IF !fin_lns(3,nul)
					EXIT
				ENDIF
			ENDIF
			=cabpri1()
			ELCORTE=MER.RUBRO
			=XSEEK(ELCORTE,'MIX','rubCOD')
			ELRUBRO=MIX.TEXTO1
			TT=TTU+CHR(13)+CHR(10)+"Rubro:"+alltrim(elrubro)
			=TIT_LNS(3)
		endif
		IF _PLINENO>63
			IF HAY
				IF !FIN_LNS(4,NUL,FIN_SUM('SUBTOTAL',@TTL))
					EXIT
				ENDIF
			ELSE
				IF !FIN_LNS(4,NUL)
					EXIT
				ENDIF
			ENDIF
			=CABPRI1()
			=TIT_LNS(4)
		ENDIF
		=LSTO1()
	ENDSCAN
	=FIN_LNS(4,NUL,FIN_SUM(ELRUBRO,@PTL))
	? LNS
	=FIN_LNS(4,NUL,FIN_SUM('TOTAL',@TTL))
	ENDP
	=FINIMP()
	=IAUD(FISC)
	=REOPMER()
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
