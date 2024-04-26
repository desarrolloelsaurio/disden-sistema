********************************************************************************
*-- Programa: LPRDPQ.PRG
*-- Fecha   : 09-08-92 01:46am
*-- Version : GOYO REINER
*-- Notas   : LISTADO QUIEN PIDIO
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
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
	=win0()
	pag=1
	=cabpan()
	stor nul TO casos
	LINEA=REPL("=",LEN(ACLA))
	store nul to total
	=TIT_LIN(1)
	SCAN
		IF ROW()>21
			IF !FIN_LIN(1,NUL,paip+padc("SUBTOTAL",10)+PAIP+SPACE(30)+PAIP+SPACE(10)+PAIP+STR(TOTAL,XACDIGI,2)+PAIP)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_LIN(2)
		ENDIF
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
	=FIN_LIN(2,CASOS,paip+padc("TOTAL",10)+PAIP+SPACE(30)+PAIP+SPACE(10)+PAIP+STR(TOTAL,XACDIGI,2)+PAIP)
	=RELEWIN("win")
	=reopmer()
	=IAUD(MER.ARTICULO)
ELSE
	=iaudI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
