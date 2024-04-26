*:*********************************************************************
*-- Programa: LPECI.PRG
*-- Fecha   : 02-09-93 01:15pm
*-- Versi¢n : G. REINER
*-- Notas   : LISTA NOTA DE PEDIDO DE COMPRA POR IMPRESORA
*:**********************************************************************
#DEFINE PICU "999,999,999,999.99"
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
		SELE PEC
		SCAT MEMV
	IF XSEEK(M.PROCOD,'PRO','PROCOD')
		M.PROCOD = PRO.PROCOD
		STOR NUL TO CASOS
		=CABPRI()
		_PCOPIES=1
		PRINTJOB
		ACLA=PAIP+PADC("ARTICULO",20)+PAIP+;
		PADC("DETALLE",20)+PAIP+;
		PADC("PEDIDO",XACDIGI)+PAIP+;
		PADC("ENTREGADO",XACDIGI)+PAIP+;
		PADC("PENDIENTE",XACDIGI)+PAIP+;
		PADC("Pcio UNITARIO",XACDIGI)+PAIP
		M.LINEA=REPL("=",LEN(ACLA))
		=cabpri1()
		? "Ú"+REPL("Ä",77)+"¿"
		? "³"
		?? PADL(DTOC(m.fechaem),77)
		?? "³"
		? "³"
		?? PADL("NOTA DE PEDIDO N§ "+PEC.PEDIDO,77)
		?? "³"
		? "³"
		?? PADL(ALLTRIM(PRO.PROVEEDOR)+" ("+ALLTRIM(PRO.PROCOD)+")",77)
		?? "³"
		? "³"
		?? PADL(PRO.DOMICILIO+"- TEL:"+ALLTRIM(PRO.TELEFONO)+")",77)
		?? "³"
		? "³"
		=XSEEK(PRO.LOCAL,'MIX','CIUCOD')
		?? PADL(ALLTRIM(MIX.TEXTO1),77)
		?? "³"
		? "Ã"+REPL("Ä",77)+"´"
		? "³"
		? PARSE("FECHA PROMESA:"+DTOC(M.FECHAPROM),"FECHA ENTREGA TOTAL:"+DTOC(M.FECHAENT),77)
		?? "³"
		? "À"+REPL("Ä",77)+"Ù"
		?
		? "1¦ COND "
		?? zpec11(m.condpago1)
		?? m.PRESUP1 PICT PICU AT 40
		? "2¦ COND "
		?? zpec11(m.condpago2)
		?? m.PRESUP2 PICT PICU AT 40
		? "3¦ COND "
		?? zpec11(m.condpago3)
		?? m.PRESUP3 PICT PICU AT 40
		?
		sele pe1
		=seek(pec.pedido+pec.procod)
		=_LIN(.T.)
		scan while pe1.pedido=pec.pedido .and. pe1.procod=pec.procod
			? PAIP
			?? PE1.ARTICULO
			?? PAIP
			=XSEEK(PE1.ARTICULO,'MER','ARTICULO')
			?? LEFT(MER.MERCA,20)
			?? PAIP
			?? STR(PE1.CANTIDAD,XACDIGI)
			?? PAIP
			?? STR(PE1.ENTREGADO,XACDIGI)
			?? PAIP
			?? STR(PE1.CANTIDAD-PE1.ENTREGADO,XACDIGI)
			?? PAIP
			?? STR(PE1.MONTO,XACDIGI,2)
			?? PAIP
		ENDSCAN
		=FIN_LIN(4,NUL)
		ENDP
		=FINIMP()
		=IAUD(PEC.PEDIDO+PAIP+PRO.PROCOD)
	ENDIF
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
