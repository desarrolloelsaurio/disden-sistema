* 浜様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : BSCCL.PRG            �
* � COMENTARIO    : BORRA SALDOS EN CERO �
* 麺様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER             �
* � FECHA      : 12-08-93                �
* � HORA       : 06:48:23pm              �
* � COPYRIGHT  : 1993 by GREGORIO REINER �
* 藩様様様様様様様様様様様様様様様様様様夕
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	STORE NUL TO RESPUESTA,DEBE,HABER
	=INFIC("MONTO MAXIMO DE CORTE",9999)
	STORE RESPUESTA TO CORTE
	IF !EMPTY(RESPUESTA) .AND. CONFIRMA("MONTO DE CORTE = "+ALLTRIM(TRAN(RESPUESTA,"99,999,999.99")),.T.,10,10)
		IF CONFIRMA("BORRAR CLIENTES SIN SALDO",.T.,10,10)
			ULPR=PROGRAM()
			=WORKING()
			=DOTALK()
			SELE PER
			SCAN
				STORE NUL TO DEBE,HABER
				SALDO=Q_DEU(PER.CODCLI,'DEBE','HABER')
				IF ABS(SALDO)<=CORTE .AND. (!EMPTY(DEBE) .OR. !EMPTY(HABER))
					=MEN_LIN("BORRANDO "+ALLTRIM(PER.CLIENTE))
					SELE CCL
					SET ORDER TO
					DELE FOR CCL.CODCLI=PER.CODCLI
					=IAUD(ALLTRIM(PER.CODCLI)+'-'+PER.CLIENTE)
				ENDIF
				SELE PER
			ENDS
			=UNTALK()
			=UNWORK()
		ENDIF
	ENDIF
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
