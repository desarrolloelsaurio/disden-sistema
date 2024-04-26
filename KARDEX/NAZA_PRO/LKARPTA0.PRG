* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LKARPTA0.PRG                                             บ
* บ COMENTARIO    : PREPARA LISTADO DE KARDEX - TALLERES                     บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-16-93                                                    บ
* บ HORA       : 11:11:22am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION LKARPTA0
	PARAMETER DEFAB
	=WORKING()
	SET ORDER TO TAG TELCOD IN TEL
	SET ORDER TO TAG AVICOD IN AVI
	SET ORDER TO TAG OPKCOD IN MIX
	SET ORDER TO TAG TALCOD IN TAL
	IF PORPAN
		IF DEFAB
			acla="FECHA OP|"+padc(TELLA+'/'+ABIO,15)+PAIP+padc("TALLER",15)+PAIP+padc("OPERACION",15)+"|  CANTIDAD  |"
		ELSE
			ACLA="FECHA OP|"+PADC(TELLA+'/'+ABIO,15)+"|OPER.DE KARDEX|"+PADC("DETALLE",17)+"|  CANTIDAD  |"
		ENDIF
	ELSE
		IF DEFAB
			acla="FECHA OP|"+padc(TELLA+'/'+ABIO,30)+PAIP+padc("TALLER",30)+PAIP+padc("OPERACION",20)+PAIP+PADC("DETALLE",20)+PAIP+PADC("CANTIDAD",XACDIGI)+"|"
		ELSE
			acla="FECHA OP|"+padc(TELLA+'/'+ABIO,30)+PAIP+PADC("OPER.DE KARDEX",20)+PAIP+padc("DETALLE",30)+PAIP+PADC("CANTIDAD",XACDIGI)+"|"
		ENDIF

	ENDIF
	LNS=REPL("=",LEN(ACLA))
	SELE KAR
	SET ORDER TO
	TMP=(GENTMP())
	SORT ON TALLER,TIPO,ARTICULO,FECHAOP TO (TMP) FOR &FISC
	=GETDBF(TMP,.F.,"KAR",18,.T.)
	SET RELA TO KAR.ARTICULO INTO TEL
	SET RELA TO KAR.ARTICULO INTO AVI ADDI
	SET RELA TO KAR.OPK      INTO MIX ADDI
	SET RELA TO KAR.TALLER   INTO TAL ADDI
RETURN UNWORK()
