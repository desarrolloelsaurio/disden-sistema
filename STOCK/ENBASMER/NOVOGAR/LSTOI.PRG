********************************************************************************
*-- Programa: LSTOI.PRG
*-- Fecha   : 05-27-92 03:19pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE STOCK
*-- Modificaci¢n GOYO 06-01-92 12:32pm (Agrega Totales)
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	STORE "" TO acla,LNS,CASOS,ELCORTE,ELRUBRO,TTU,ESTRIN
	dime ttl[CANT_MAX],ctrl[CANT_MAX],PTL[CANT_MAX]
	hay=.f.
	=LSTOP0()
	pag=1
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LNS(3)
	SCAN
		if elcorte#IIF(ESTRIN,STR(MER.RUBRO),MER.RUBRO)
			IF HAY
				=FIN_LNS(3,NUL,FIN_SUM(ELRUBRO,@PTL),.T.)
				? LNS
				=FIN_LNS(3,NUL,FIN_SUM("SUBTOTAL",@PTL))
			ELSE
				=FIN_LNS(3,NUL)
			ENDIF
			=cabpRI1()
			ELCORTE=IIF(ESTRIN,STR(MER.RUBRO),MER.RUBRO)
			=XSEEK(ELCORTE,'RUB','codrub')
			ELRUBRO=RUB.RUBRO
			TT=TTU+CHR(13)+CHR(10)+"Rubro:"+alltrim(elrubro)
			=TIT_LNS(1)
			IF HAY
				for a=1 to CANT_MAX
					if variable[a]
						store nul to ptl[a]
					endif
					endf
				ENDIF
			endif
			IF _PLINENO>62
				IF HAY
					=FIN_LNS(3,NUL,FIN_SUM("SUBT. "+ELRUBRO,@PTL),.T.)
					? LNS
					=FIN_LNS(3,NUL,FIN_SUM('SUBTOTAL',@TTL))
				ELSE
					=FIN_LNS(3,NUL)
				ENDIF
				=cabpri1()
				=TIT_LNS(4)
			ENDI
			=LSTOP1()
		ENDSCAN
		IF HAY
			=FIN_LNS(3,NUL,FIN_SUM(ELRUBRO,@PTL),.t.)
			? LNS
			=FIN_LNS(4,CASOS,FIN_SUM('TOTAL',@TTL))
		ELSE
			=FIN_LNS(4,NUL)
		ENDIF
		ENDP
		=FINIMP()
		=iaud(FISC)
		if sstm2="CONTSTOC"
		   =REOPLSTO()
		ELSE
     	   =reopmer()
     	ENDIF
	ELSE
		=iaudI()
	ENDIF
RETURN MEN_LIN(BOTOM)
