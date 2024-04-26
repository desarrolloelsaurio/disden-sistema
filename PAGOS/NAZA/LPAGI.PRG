* ษออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LXXXI.PRG              บ
* บ COMENTARIO    : LISTADO DE PAGOS       บ
* ฬออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER               บ
* บ FECHA      : 11-01-93                  บ
* บ HORA       : 01:50:15pm                บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER   บ
* ศออออออออออออออออออออออออออออออออออออออออผ
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
PARAMETER AVIOS, POR_DIA,ALIAS_TMP
EXTERNAL ARRAY L_FUNC
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	STOR NUL TO CASOS
	LINEA=REPL("=",LEN(ACLA))
	=CABPRI()
	_PCOPIES=1
	DIME LLIN[C_MAX], LLINT[C_MAX]
	STORE 0 TO LLINT
	SELE (ALIAS_TMP)
	GO TOP
	STORE "" TO M.CODCORTE, M.DESCRIPC
	STORE .T. TO L_BORRA
	DO CORTEPAG
	STORE 0 TO LLIN
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SCAN
		if ESCORPAG()
			=LPAG0(M.DESCRIPC,@LLIN,.T.)
			IF _PLINENO>60
				? M.LINEA
				=LPAG0("SUBTOTAL",@LLINT)
				=FIN_LIN(3,NUL)
				=cabpri1()
				=TIT_LIN(FOUR)
			ENDI
		ENDIF
		=LPAG1()
	ENDSCAN
	=LPAG0(M.DESCRIPC,@LLIN,.T.)
	? M.LINEA
	=LPAG0("TOTAL",@LLINT)
	=FIN_LIN(FOUR,CASOS)
	ENDP
	=FINIMP()
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
