* ษอออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LRECB.PRG                   บ
* บ COMENTARIO    : GESTION DE RECIBOS BANCARIOSบ
* ฬอออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                    บ
* บ FECHA      : 11-24-93                       บ
* บ HORA       : 12:03:34pm                     บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER        บ
* ศอออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PICUMAX "9,999,999,999,999.99"           && PICUMAX
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF

FUNCTION LRECB
	PARAMETER PORPAN
	XMES=GETNU3("XMES","FOXGRL")
	XANIO=GETNU3("XANIO","FOXGRL")
	VENC1=GETNU3("VENC1","FOXGRL")
	VENC2=GETNU3("VENC2","FOXGRL")
	VENC3=GETNU3("VENC3","FOXGRL")
	FVENC1=ARMA_FEC(VENC1,XMES,XANIO)
	FVENC2=ARMA_FEC(VENC2,XMES,XANIO)
	FVENC3=ARMA_FEC(VENC3,XMES,XANIO)
	=OPINM()
	=OPRECB()
	=OPINQ()
	=OPCCL()
	K_DIJO=ALLTRIM(PROMPT())
	DO CASE
	CASE K_DIJO='Recibo de Prueba'
		STORE NUL TO RESPUESTA
		IF !EMPTY(ELIINM("a Listar",-1,1))
			MORA1=GETNU3("MORA1","FOXGRL")
			MORA2=GETNU3("MORA2","FOXGRL")
			MORA3=GETNU3("MORA3","FOXGRL")
			SELE RECB
			SET ORDER TO TAG NUMERO
			=CABPRI(.F.,"36")
			_PCOPIES=1
			PRINTJOB
			COL1=5
			COL3=55
			COL2=45
			COL4=65
			COL5=65
			COLFEC=70
			COL6=74
			COX1=93
			COX2=90
			SELE ALQ
			IF xseek(INM.CODINM,"ALQ","CODINM")
				WAIT "INMUEBLE ENCONTRADO" WIND NOWA
				DO LLIQB1 WITH .T.
			ENDIF
			ENDP
			=FINIMP()
		ENDIF
	CASE K_DIJO='Recibos Emitidos'
		DO LRECBE with 1
	CASE K_DIJO='Recibos Pendientes'
		DO LRECBE with 2
	CASE K_DIJO='Recibos Cobrados'
		DO LRECBE with 3
    CASE K_DIJO='Recibos de un Inquilino'
        EXTERNAL PROCEDURE LRECB30.PRG
        STORE NUL TO M.RESPUESTA
        IF ELIINQ("a Listar",-1,1)
        =WORKING()
        =DOTALK()
        TMP=GENTMP()
        SELE RECB
        SET ORDER TO
        =FLOCK() .OR. FLOK()
        SORT ON NUMERO TO (TMP) FOR CODCLI=PER.CODCLI
        UNLO IN RECB
        =PRXAREA(.T.)
        USE (TMP) ALIAS TMP
        TT="Recibos Bancarios Pagados"+;
        CRLF+;
        alltrim(per.cliente)+" ("+alltrim(per.codcli)+")"
        ACLA=PAIP+PADC("RECIBO",8)+PAIP+;
        "FEC PAGO"+PAIP+;
        "MES  AฅO"+PAIP+;
        PADC("MONTO",XACDIGI)+PAIP
        =LGRL2(PORPAN,"TMP","LRECB30()",PER.CLIENTE,"RECBEMI",.T.,RIGHT(PICUMAX,XACDIGI))
        =UNTALK()
        =UNWORK()
        =OFF_TMP()
        ENDIF
	ENDCASE
	ULPR=PROGRAM()
RETURN MEN_LIN(BOTOM)
