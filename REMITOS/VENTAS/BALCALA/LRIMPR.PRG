*******************************************************************************
*-- Programa: lrimpr.prg
*-- Fecha   : 08/25/91
*-- Version : G. REINER
*-- Notas   : LISTADO DE RESUMEN DE REMITOS
********************************************************************************
parameter inter
private inter
ulpr=hora_ulp(program())
if cheqseg()
	store nul to can,tcan,TOT,TTOT,TREM,REM
	STORE "" TO ELarticulo,lamerca,acla,lns,elremito,tt,ELCORTE
	=LRIMPR0()
	=WIN0()
	pag=1
	=CABPAN()
	=tit_lns(1)
	GO TOP
	SCAN
		=LRIMPR1()		
		IF ELCORTE#ELARTICULO
			=FLRIMPR1(.T.)
		ENDIF
		IF _PLINENO>63
			=TLRIMPR1("SUBTOTAL",.T.)
			=TIT_LNS(4)
		ENDIF
		=LRIMPR2()
	ENDSCAN
	=FLRIMPR1()
	=TLRIMPR1("TOTAL")
	=relewin("WIN")
	=reoprei()
ELSE
	=iaudi()
ENDIF
=men_lin(botom)
RETURN
