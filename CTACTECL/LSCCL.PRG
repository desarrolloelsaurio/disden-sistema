* ษออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LSCCL.PRG                          บ
* บ COMENTARIO    : LISTA CTA CTE CLIENTES CON SALDO 0 บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                           บ
* บ FECHA      : 12-08-93                              บ
* บ HORA       : 06:46:14pm                            บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER               บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	STORE NUL TO RESPUESTA,DEBE,HABER
	=INFIC("MONTO MAXIMO DE CORTE",9999)
	STORE RESPUESTA TO CORTE
	IF !EMPTY(RESPUESTA) .AND. CONFIRMA("MONTO DE CORTE = "+ALLTRIM(TRAN(RESPUESTA,"99,999,999.99")),.T.,10,10)
		=MEN_LIN("LISTANDO CLIENTES A SALDAR")
		=CABPRIR()
		_RMARGIN=80
		SELE PER
		STORE NUL TO TOTAL
		ACLA=PAIP+'  CODIGO  '+PAIP+PADC("CLIENTE",30)+PAIP+PADC("REMANENTE",13)+PAIP
		M.LINEA=REPL("=",LEN(ACLA))
		PRIN
		TT="LISTADO DE CLIENTES A SALDAR"+CHR(13)+CHR(10)+"MONTO DEL CORTE ***"+ALLTRIM(STR(CORTE,2))+"***"
		=TIT_LIN(3)
		SCAN
			STORE NUL TO DEBE,HABER
			SALDO=Q_DEU(PER.CODCLI,"DEBE","HABER")
			IF ABS(SALDO)<=CORTE .AND. (!EMPTY(DEBE) .OR. !EMPTY(HABER))
				? PAIP
				?? PER.CODCLI
				?? PAIP
				?? PER.CLIENTE
				?? PAIP
				?? SALDO PICT '99,999,999.99'
				?? PAIP
				TOTAL=TOTAL+SALDO
			ENDIF
			SELE PER
		ENDS
		? M.LINEA
		? PAIP
		?? PADC("TOTAL",10)
		?? PAIP
		?? SPACE(30)
		?? PAIP
		?? TOTAL PICT '99,999,999.99'
		?? PAIP
		ENDP
		=FINIMP()
		=IAUD("CORTE:"+ALLTRIM(TRAN(RESPUESTA,"99,999,999.99")))
	ENDIF
ELSE
	=IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
