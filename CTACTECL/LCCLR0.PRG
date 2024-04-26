* ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ FUNCTION      : LCCLR0.PRG                              บ
* บ COMENTARIO    : GENERA CABECERA PARA LISTADOS DE SALDOS บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                บ
* บ FECHA      : 08-26-93                                   บ
* บ HORA       : 02:17:37pm                                 บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                    บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION LCCLR0
	#DEFINE NUL    0                               && NUL
	#DEFINE PAIP   "|"                             && PAIP
	=WORKING()
	=DOTALK()
	TMP=GENTMP()
	FISC=QW_FISC(FISC,"XSEEK(PER.CODCLI,'CCL','CODCLI')")
	SELE CCL
	SET ORDER TO TAG CODCLI
	SELE PER
	IF FILCLI=4
		TTQUE=CHR(13)+CHR(10)+"CONSORCIO:"+ALLTRIM(CNS.CONSORCIO)
		SET ORDER TO TAG CODCLI IN CNX
		SET RELA TO PER.CODCLI INTO CNX
	ENDIF
	SELE PER
	=FLOCK() .OR. FLOK()
	SET ORDER TO
	IF (SSTM2="ALQUILER" .AND. (TYPE("ORDINQ")#'L' .OR. ORDINQ)) .OR. ;
		TYPE("ORDCLI")#'L' .OR. ORDCLI
		SORT ON CODCLI ;
		TO (TMP) FOR &FISC
	ELSE
		SORT ON CLIENTE ;
		TO (TMP) FOR &FISC
	ENDIF
	SELE PER
	USE
	USE (TMP) ALIAS CLI EXCL
	DELE FOR GY_DEBE=GY_HABER
	PACK
	ACLA="  CODIGO  "+PAIP+;
	PADC(IIF(SSTM2="EXPENSAS","Consorcista","Cliente"),25)+;
	PAIP+PADC("DEBE",13)+PAIP+PADC("HABER",13)+PAIP+PADC("SALDO",13)
	LNS=REPL("=",LEN(ACLA))
	TT='Listado de Saldos'+TTQUE
	STORE NUL TO GDEBE,GHABER,CASOS
	PICU='99,999,999.99'
	=UNTALK()
RETURN UNWORK()

