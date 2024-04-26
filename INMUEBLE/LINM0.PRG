* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LINM0.PRG                                                บ
* บ COMENTARIO    : GENERA CABECERA PARA LISTADO DE INMUEBLES                บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION LINM0
	=WORKING()
	=DOTALK()
	TMP=GENTMP()
	SELE INM
	=FLOCK() .OR. FLOK()
	DO CASE
	CASE TYPE("ORDINM")="U" .OR. !ORDINM
		SORT ON DOMICILIO TO (TMP) FOR &FISC
	OTHERWISE
		SORT ON CODINM TO (TMP) FOR &FISC
	ENDCASE
	UNLO IN INM
	=PRXAREA(.T.)
	USE (TMP) ALIAS TMP
	SET ORDER TO TAG PRPCOD IN PER
	SET RELA TO TMP.PROCOD INTO PER
	ACLA=HAZ_ACLA()
	LINEA=REPL("=",LEN(ACLA))
	TT='Listado de Inmuebles'+TTQUE
	=UNWORK()
RETURN UNTALK()
