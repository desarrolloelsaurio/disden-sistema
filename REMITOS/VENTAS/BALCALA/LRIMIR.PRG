********************************************************************************
*-- Programa: LRIMIR.PRG
*-- Fecha   : 12-26-92 02:15am
*-- Version : G. REINER
*-- Notas   : LISTADO DE REMITOS DE FLETEROS
********************************************************************************
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	store nul to can,tcan,TOT,TTOT,TREM,REM
	STORE "" TO ELarticulo,lamerca,acla,lns,elremito,tt,ELCORTE
	=LRIMPR0()
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_LIN(3)
	GO TOP
	SCAN
		=LRIMPR1()
		IF ELCORTE#ELARTICULO
			=FLRIMPR1()
		ENDIF
		IF ROW()=21
			IF TLRIMPR1("SUBTOTAL")=27
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=CABPAN()
			=tit_lns(2)
		ENDIF
		=LRIMPR2()
	ENDSCAN
	=FIN_LIN(4,CASOS)
	EJECT PAGE
	ENDP
	=FINIMP()
	=iaud('')
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
