* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LLIQBC.PRG                                               บ
* บ COMENTARIO    : EMITE LISTADO DE CONTROL PARA BANCO                      บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 09-26-94 11:46pm
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	XMES=GETNU3("XMES","FOXGRL")
	XANIO=GETNU3("XANIO","FOXGRL")
	VENC1=GETNU3("VENC1","FOXGRL")
	VENC2=GETNU3("VENC2","FOXGRL")
	VENC3=GETNU3("VENC3","FOXGRL")
	MORA1=GETNU3("MORA1","FOXGRL")
	MORA2=GETNU3("MORA2","FOXGRL")
	MORA3=GETNU3("MORA3","FOXGRL")
	FVENC1=ARMA_FEC(VENC1,XMES,XANIO)
	ACLA=PAIP+;
		"REGIS"+PAIP+;
		PADC("CONCEPTO",40)+PAIP+;
		PADC("INMUEBLE",10)+PAIP+;
		PADC("MONTO",XACDIGI)+PAIP
	STOR NUL TO CASOS
	LINEA=REPL("=",LEN(ACLA))
	TT="Listado de Control"+;
		crlf+;
		"RECIBOS BANCARIOS A EMITIR"
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_(3)
	SELE ALQ
	SCAN FOR EMITE
		STORE NUL TO M.TOTREC
		_WRAP=.F.
		? SAYPER(ALQ.CODCLI,"INQCOD")
		?? ALQ.CODCLI
		? SAYGRL(ALQ.CODINM,"INM","CODINM","INM.DOMICILIO")
		?? " ("
		?? ALQ.CODINM
		?? ") "
		STORE NUL TO M.TOTREC
		SELE CCL
		SET ORDER TO TAG CODCLI
		IF SEEK(ALQ.CODCLI)
			_WRAP=.T.
			=_LIN(.T.)
			SCAN WHILE ALQ.CODCLI=CCL.CODCLI
				IF !PAGADA .AND. ;
						FECHAVE<GOMONTH(FVENC1,1) .AND. ;
						MARKA
					? PAIP
					?? STR(RECNO(),5)
					?? PAIP
					?? PADR(Q_TIPTEX(DETALLE),40)
					?? PAIP
					?? CODINM
					?? PAIP
					IF COMPRRE="NC"
						TOTREC=TOTREC-MONTO
						?? STR(0-MONTO,XACDIGI,2)
					ELSE
						?? STR(MONTO,XACDIGI,2)
						TOTREC=TOTREC+MONTO
					ENDIF
					?? PAIP
				ENDIF
			ENDSCAN
			? M.LINEA
			? ARMA_FEC(VENC1,XMES,XANIO)
			?? ":"
			?? SPACE(40)
			?? PORCEN(TOTREC,MORA1) PICT "99,999.99"
			? ARMA_FEC(VENC2,XMES,XANIO)
			?? ":"
			?? SPACE(40)
			?? PORCEN(TOTREC,MORA2) PICT "99,999.99"
			? ARMA_FEC(VENC3,XMES,XANIO)
			?? ":"
			?? SPACE(40)
			?? PORCEN(TOTREC,MORA3) PICT "99,999.99"
			? M.LINEA
			? M.LINEA
			?
		ELSE
			?? " SIN REGISTRO EN CTA CTE"
		ENDIF
		SELE ALQ
	ENDSCAN
	=FIN_LIN(FOUR,CASOS)
	ENDP
	=FINIMP()
	=IAUD(ALLTRIM(STR(XMES))+"-"+ALLTRIM(STR(M.XANIO)))
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
