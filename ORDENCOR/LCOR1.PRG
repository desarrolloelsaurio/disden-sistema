* ษออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LCOR1.PRG                          บ
* บ COMENTARIO    : LISTA ESTADO DE UNA ORDEN DE CORTE บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                           บ
* บ FECHA      : 10-12-94 07:34pm                      บ
* บ COPYRIGHT  : 1994 by GREGORIO REINER               บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STOR NUL TO CASOS
	ACLA=PAIP+;
		SPACE(15)+;
		PAIP+;
		SPACE(30)+;
		PAIP+;
		SPACE(30)+;
		PAIP+;
		PADC("ENTRADA",22)+;
		PAIP+PAIP+;
		PADC("SALIDA",22)+;
		PAIP

	ACLA1=PAIP+;
		PADC("REMITO",15)+;
		PAIP+;
		PADC("PROCESO",30)+;
		PAIP+;
		PADC("TALLER",30)+;
		PAIP+;
		REPL("=",22)+;
		PAIP+PAIP+;
		REPL("=",22)+;
		PAIP


	ACLA2=PAIP+SPACE(15)+PAIP+SPACE(30)+PAIP+SPACE(30)+PAIP+;
		" FECHA  "+PAIP+;
		" NAZA "+PAIP+;
		" TALL "+PAIP+PAIP+;
		" FECHA  "+PAIP+;
		" TALL "+PAIP+;
		" NAZA "+PAIP
	LINEA=REPL("=",LEN(ACLA))
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	TT=TT+;
		CRLF+;
		"ARTICULO:"+ALLTRIM(COR.ARTICULO)+' '+ALLTRIM(SAYGRL(COR.ARTICULO,"MER","ARTIRED","MER.MERCA"))
	=TIT_LIN2(3)
	SELE TMP
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=cabpri1()
			=TIT_LIN2(FOUR)
		ENDI
		? PAIP
		?? TMP.REMITO
		?? PAIP
		?? SAYGRL(TMP.PRC,"PRC","PRCCOD","PRC.PROCFAB")
		?? PAIP
		?? SAYGRL(TMP.TALLER,"PER","TALCOD","PER.CLIENTE")
		?? PAIP
		?? EF
		?? PAIP
		?? STR(EEC,6)
		?? PAIP
		?? STR(ESC,6)
		?? PAIP
		?? PAIP
		?? SF
		?? PAIP
		?? STR(SEC,6)
		?? PAIP
		?? STR(SSC,6)
		?? PAIP
	ENDSCAN
	=FIN_LIN(FOUR,CASOS)
	ENDP
	=FINIMP()
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
