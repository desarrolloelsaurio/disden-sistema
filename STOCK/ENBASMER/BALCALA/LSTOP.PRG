***************************************************************************
*-- Programa: LSTOP.PRG
*-- Fecha   : 05/22/92 12:16pm
*-- Version : GOYO REINER
*-- Notas   : LISTADO DE STOCKS
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	STORE "" TO acla,LNS,CASOS,ELCORTE,ELRUBRO,TTU,ESTRIN
	dime ttl[CANT_MAX],ctrl[CANT_MAX],PTL[CANT_MAX]
	hay=.f.
	=LSTOP0()
	=win0()
	pag=1
	=cabpan()
	stor nul TO casos
	=TIT_LNS(1)
	SCAN
		if elcorte#IIF(ESTRIN,STR(MER.RUBRO),MER.RUBRO)
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
 	        ELCORTE=IIF(ESTRIN,STR(MER.RUBRO),MER.RUBRO)
			=XSEEK(ELCORTE,'RUB','codrub')
			ELRUBRO=RUB.RUBRO
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
		=LSTOP1()
	ENDSCAN
	IF LAST()#27
		=FIN_LNS(2,NUL,FIN_SUM(ELRUBRO,@PTL))
		? LNS
		=FIN_LNS(2,casos,FIN_SUM('TOTAL',@TTL))
	ENDIF
	=RELEWIN("win")
	=IAUD(FISC)
		if sstm2="CONTSTOC"
		   =REOPLSTO()
		ELSE
     	=reopmer()		
     	ENDIF
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
