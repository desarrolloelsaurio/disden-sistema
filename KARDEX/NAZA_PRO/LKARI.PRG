* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LKARI.PRG                                                บ
* บ COMENTARIO    : LISTADO DE KARDEX POR IMPRESORA                          บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-16-93                                                    บ
* บ HORA       : 00:58:02am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	DO IMPRESOR
	acla="|Nro.OP|FECHA OP|"+padc("TALLER",30)+PAIP+PADC("OPER.DE KARDEX",20)+PAIP+padc("DETALLE",20)+PAIP+PADC("CANTIDAD",XACDIGI)+"|"
	STORE REPL("=",LEN(acla)) TO lns
	STORE LEN(acla) TO largo
	STORE MIN(XACANCHO,XACHOJA) TO LARGOIM
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LNS(3)
	STORE 0 TO SUMA,RESTA
	SELE KAR
	SCAN FOR &FISC
		IF _PLINENO>63
			=FIN_LNS(3,0,PARSE(" SUBTOTAL",STR(SUMA-RESTA,XACDIGI,2),LEN(ACLA)-1))
			EJECT PAGE
			=CABPRI1()
			=TIT_LNS(4)
		ENDI
		=LKARP0()
	ENDSCAN
	=fin_lns(4,0,PARSE(" TOTAL",STR(SUMA-RESTA,XACDIGI,2),LEN(ACLA)-1))
	EJECT PAGE
	?
	ENDP
	=finimp()
	=iaud(FISC)
ELSE
	=IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
