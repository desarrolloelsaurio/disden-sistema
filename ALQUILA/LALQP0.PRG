* ษอออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LALQP0.PRG                      บ
* บ COMENTARIO    : GENERA CABECERA LISTADO ALQ. OK บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION LALQP0
	#DEFINE NUL    0                               && NUL
	SET ORDER TO TAG CODINM IN INM
	SET ORDE TO TAG CODINM IN ALQ
	SET RELA TO CODINM INTO INM
	ACLA=HAZ_ACLA()
	LINEA=REPL("=",LEN(ACLA))
	TT='Listado de Alquileres'+TTQUE
	STORE NUL TO CASOS
RETURN .T.
