********************************************************************************
*-- Programa: LPEDIQ.PRG
*-- Fecha   : 10-05-92 04:01pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE NOTAS DE PEDIDO DE VENTAS = QUIEN PIDIO
********************************************************************************
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	=WORKING()
	SELE PEX
	TMP=GENTMP()
	IF TYPE("ORDCLI")#'L' .OR. ORDCLI
		INDE ON CODCLI TO (TMP) FOR LEFT(ARTICULO,10)=LEFT(MER.ARTICULO,10) COMP
	ELSE
		INDE ON PER.CLIENTE TO (TMP) FOR LEFT(ARTICULO,10)=LEFT(MER.ARTICULO,10) COMP
	ENDIF
	ACLA=PAIP+"  CODIGO  "+PAIP+PADC("CLIENTE",30)+PAIP+"  PEDIDO  "+PAIP+PADC("PENDIENTE",XACDIGI)+PAIP
	TT="Listado de Remitos"+chr(13)+chr(10)+"Qui‚n Pidi¢ "+left(mer.articulo,10)+chr(13)+chr(10)+alltrim(mer.merca)
	=UNWORK()
	stor nul TO casos
	LINEA=REPL("=",LEN(ACLA))
	=cabpri()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_LIN(3)
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL,paip+padc("SUBTOTAL",10)+PAIP+SPACE(30)+PAIP+SPACE(10)+PAIP+STR(TOTAL,XACDIGI,2)+PAIP)
			=cabpri1()
			=TIT_LIN(4)
		ENDI
		? paip
		?? pex.codcli
		?? paip
		?? PER.cliente
		?? str(pex.pedido,10)
		?? paip
		cc=pex.cantidad-pex.entregado
		?? str(cc,xacdigi)
		store total+cc to total
		?? paip
	ENDSCAN
	=FIN_LIN(4,CASOS,paip+padc("TOTAL",10)+PAIP+SPACE(30)+PAIP+SPACE(10)+PAIP+STR(TOTAL,XACDIGI,2)+PAIP)
	EJECT PAGE
	ENDP
	=FINIMP()
	=reopmer()
	=iaud(MER.ARTICULO)
ELSE
	=iaudI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
