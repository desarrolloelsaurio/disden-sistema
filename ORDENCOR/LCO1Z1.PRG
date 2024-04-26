* ษออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ FUNCTION      : LCO1PZ.PRG                         บ
* บ COMENTARIO    : CUERPO DEL LISTADO - LCO1PZ/LCO1IZ บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                           บ
* บ FECHA      : 08-16-93                              บ
* บ HORA       : 06:42:00pm                            บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER               บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
FUNCTION LCO1Z1
? PAIP
=IIF(VARIABLE[1],QOUT(STR(NUMERO,TEXTO[1,2])+PAIP),'')
=IIF(VARIABLE[2],QOUT(LEFT(ARTICULO,TEXTO[2,2])+PAIP),"")
=IIF(VARIABLE[3],QOUT(STR(TALLE,5,2)+PAIP),'')
STORE NUL TO M.SIG
IF VARIABLE[4]
	M.SIG=M.SIG+1
	?? STR(CANTINI,XACDIGI)
	?? PAIP
	STORE CANTINI + TOTAL[M.SIG] TO TOTAL[M.SIG]
ENDIF
IF VARIABLE[5]
	M.SIG=M.SIG+1
	?? STR(CANTCOR,XACDIGI)
	?? PAIP
	STORE CANTCOR + TOTAL[M.SIG] TO TOTAL[M.SIG]
ENDIF
IF VARIABLE[6]
	M.SIG=M.SIG+1
	?? STR(CANTFIN,XACDIGI)
	?? PAIP
	STORE CANTFIN + TOTAL[M.SIG] TO TOTAL[M.SIG]
ENDIF
=IIF(VARIABLE[7],QOUT(USUARIO+PAIP),"")
CASOS=CASOS+1
RETURN .T.
