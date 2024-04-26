* ษอออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LCO1Z0.PRG                      บ
* บ COMENTARIO    : GENERA CABECERA - LCO1PZ/LCO1IZ บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                        บ
* บ FECHA      : 08-16-93                           บ
* บ HORA       : 06:39:46pm                         บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER            บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE NUL    0                               && NUL
FUNCTION LCO1Z0
EXTERNAL ARRAY LOSPIC, HABILITADO
	=WORKING()
	=DOTALK()
	IF HABILITADO[2]
		SELE COR
		SET ORDER TO TAG ARTIRED IN MER
		SET RELA TO LEFT(ALLTRIM(ARTICULO),10) INTO MER
		SELE CO1
		SET ORDER TO TAG NUMERO IN COR
		SET RELA TO NUMERO INTO COR
	ENDIF
	SELE CO1
	SET ORDER TO
	TMP=GENTMP()
	SORT ON NUMERO TO (TMP) FOR &FISC ;
		FIELDS NUMERO,;
			ARTICULO,;
			TALLE,;
			CANTINI,;
			CANTCOR,;
			CANTFIN,;
			USUARIO
	=PRXAREA(.T.)
	USE (TMP) ALIAS TMP EXCL
	STOR NUL TO CASOS
	ACLA=HAZ_ACLA()
	LINEA=REPL("=",LEN(ACLA))
	M.NPIC=0
	FOR M.ZZ=4 TO 6
		IF VARIABLE[M.ZZ]
			M.NPIC=M.NPIC+1
			STORE REPL("9",XACDIGI) TO LOSPIC[M.NPIC]
		ENDIF
	NEXT
	IF VARIABLE[7]
		M.NPIC=M.NPIC+1
		STORE "@Z "+REPL("9",10) TO LOSPIC[M.NPIC]
	ENDIF
	TT='Listado de Ordenes de '+PROPER(KORTE)+IIF(EMPTY(TTQUE),'',TTQUE)
	=UNTALK()
RETURN UNWORK()
