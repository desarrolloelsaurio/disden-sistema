* ษออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LKAR1ARI.PRG         บ
* บ COMENTARIO    : LISTADO DE KARDEX    บ
* ฬออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER             บ
* บ FECHA      : 11-01-93                บ
* บ HORA       : 01:50:15pm              บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER บ
* ศออออออออออออออออออออออออออออออออออออออผ
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	STOR NUL TO CASOS
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SELE kars
	STORE 0 TO M.ENT,M.SAL,M.VEZ
	SCAN
		if KARS.fechaop<m.fecini
			M.ENT=M.ENT+KARS.ENTRADA
			M.SAL=M.SAL+KARS.SALIDA
		ELSE
			=LAVEZ()
			IF _PLINENO>63
				=FIN_LIN(3,NUL,;
				PAIP+SPACE(8)+PAIP+;
				PADR("SUBTOTAL",42)+PAIP+;
				STR(M.ENT,XACDIGI,2)+PAIP+;
				STR(M.SAL,XACDIGI,2)+PAIP)
				=cabpri1()
				=TIT_LIN(FOUR)
			ENDI
			=LKAR1AR0()
			ENDIF
		ENDSCAN
		=LAVEZ()
		=FIN_LIN(FOUR,CASOS,PAIP+SPACE(8)+PAIP+;
		PADR("TOTAL",42)+PAIP+;
		STR(M.ENT,XACDIGI,2)+PAIP+;
		STR(M.SAL,XACDIGI,2)+PAIP,.T.)
		IF M.SAL>M.ENT
			=FIN_LIN(FOUR,CASOS,;
			PAIP+SPACE(8)+PAIP+;
			PADR("STOCK",42)+PAIP+;
			STR(0,XACDIGI,2)+PAIP+;
			STR(M.ENT-M.SAL,XACDIGI,2)+PAIP)
		ELSE
			=FIN_LIN(FOUR,CASOS,;
			PAIP+SPACE(8)+PAIP+;
			PADR("STOCK",42)+PAIP+;
			STR(M.ENT-M.SAL,XACDIGI,2)+PAIP+;
			STR(0,XACDIGI,2)+PAIP)
		ENDIF
		ENDP
		=FINIMP()
		=IAUD("")
	ELSE
		=IAUDI()
	ENDIF
RETURN MEN_LIN(BOTOM)

FUNCTION LAVEZ
	IF EMPTY(VEZ)
		VEZ=1
		IF !EMPTY(M.SAL) .OR. ;
			!EMPTY(M.ENT)
			? PAIP
			?? M.FECINI
			?? PAIP
			?? PADR("MOVIMIENTOS AL "+DTOC(M.FECINI),42)
			?? PAIP
			?? STR(M.ENT,XACDIGI,2)
			?? PAIP
			?? STR(M.SAL,XACDIGI,2)
			?? PAIP
		ENDIF
	ENDIF
RETURN .T.
