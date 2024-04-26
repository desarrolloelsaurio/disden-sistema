********************************************************************************
*-- Programa: LRIMIY.PRG
*-- Fecha   : 06/06/92 11:45am
*-- Version : G. REINER
*-- Notas   : LISTADO DE REMITOS INTERNOS
********************************************************************************
PARAMETER INTER
PRIVATE INTER
ulpr=hora_ulp(program())
if cheqseg()
	STORE '' TO lamerca,elarticulo,ACLA,LNS,TT
	STORE NUL TO can,tcan
	=LRIMPY0()
	STOR NUL TO CASOS
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SCAN
		IF rex.ARTICULO#ELARTICULO
			=LRIMPY1()
		ENDIF
		IF _PLINENO>63
			=fin_lns(3,nul,PAIP+padR("SUBTOTAL",10)+PAIP+SPACE(20)+PAIP+str(tcan,xacdigi,2)+paip)
			=cabpri1()
			=TIT_LIN(4)
		ENDI
		CAN=CAN+REX.CANTIDAD
	ENDSCAN
	=LRIMPY1()
	=FIN_LNS(4,NUL,PAIP+PADR("TOTAL",10)+PAIP+SPACE(20)+PAIP+STR(TCAN,XACDIGI,2)+PAIP)
	ENDP
	=FINIMP()
	=iaud(FISC)
	=REOPREI()
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
