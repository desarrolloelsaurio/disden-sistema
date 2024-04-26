* ษออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : OFF_TMP.PRG                บ
* บ COMENTARIO    : BORRA ARCHIVOS TEMPORARIOS บ
* ฬออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                   บ
* บ FECHA      : 08-31-93                      บ
* บ HORA       : 03:28:36pm                    บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER       บ
* ศออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION OFF_TMP
PARAMETER OFF_AREA
=HORA_ULP(PROGRAM())
WAIT "BORRANDO ARCHIVOS TEMPORALES" WIND NOWA
IF EMPTY(OFF_AREA)
   OFF_1=1
   OFF_25=HIGHAREA()
   FOR OFF_A=OFF_25 TO OFF_1 STEP -1
	=OFFTMP1()
   NEXT
ELSE
   STORE XXTONUM(OFF_AREA) TO OFF_A
   =OFFTMP1()
ENDIF
WAIT CLEA
=HORA_ULP(ULPR)
RETURN .T.

FUNCTION OFFTMP1
	SELE (OFF_A)
	IF !EMPTY(DBF())
		OFF_BASE=FULL(DBF())
		IF EXTENS(OFF_BASE)="TMP"
			USE
			OFF_RAIZ=LEFT(OFF_BASE,RAT(".",OFF_BASE))
			ERASE (OFF_BASE)
			ERASE (OFF_RAIZ+"CDX")
			ERASE (OFF_RAIZ+"IDX")
			ERASE (OFF_RAIZ+"FPT")
			ERASE (OFF_RAIZ+"BAK")
			=IAUD(OFF_RAIZ)
		ENDIF
	ENDIF
RETURN .T.
