* ษอออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LCORZ0.PRG                    บ
* บ COMENTARIO    : GENERA CABECERA LISTADO LCORZ บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION LCORZ0
	=WORKING()
	=DOTALK()
	SELE COR
	SET ORDER TO TAG ARTIRED IN MER
	SET RELA TO ARTICULO INTO MER
	TMP=gentmp()
	=FLOCK("MER") .OR. FLOK("MER")
	=FLOCK("COR") .OR. FLOK("COR")
	SORT ON NUMERO TO (TMP) FOR &FISC
	UNLO IN MER
	=OFF_RELA()
	=PRXAREA(.T.)
	USE (TMP) ALIAS TMP EXCL
	SET RELA TO ARTICULO INTO MER
	STOR NUL TO CASOS
	ACLA=HAZ_ACLA()
	LINEA=REPL("=",LEN(ACLA))
	TT='Listado de Ordenes de '+proper(korte)+iif(empty(ttque),'',ttque)
	=UNTALK()
RETURN UNWORK()
