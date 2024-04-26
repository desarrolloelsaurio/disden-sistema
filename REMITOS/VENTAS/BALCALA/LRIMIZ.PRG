********************************************************************************
*-- Programa: LRIMIZ.PRG
*-- Fecha   : 06/06/92 11:38am
*-- Version : G. REINER
*-- Notas   : LISTADO DE REMITOS INTERNOS
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	store "" to ttl,ctrl,hay,casos,linea,tt,acla
	=lrimpz0()
	=cabpri()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_LIN(3)
	SCAN FOR &FISC
		IF _PLINENO>63
			=IIF(HAY,FIN_LIN(1,NUL,FIN_SUM('SUBTOTAL',@TTL)),FIN_LIN(1,NUL))
			=CABPRI1()
			=TIT_LIN(4)
		ENDI
		=LRIMPZ1()
	ENDSCAN
	=IIF(HAY,FIN_LIN(4,CASOS,FIN_SUM('TOTAL',@TTL)),FIN_LIN(4,CASOS))
	ENDP
	=FINIMP()
	=IAUD(FISC)
	=REOPREI()
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
