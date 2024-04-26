* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LPERP0.PRG                               บ
* บ COMENTARIO    : PREPARA CABECERA DE LISTADO PROPIETARIOS บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION LPER0
	#DEFINE NUL    0                               && NUL
	SELE PER
	VARORDEN="ORD"+LEFT(CONTENIDO[3],3)
	IF TYPE(VARORDEN)="U" .OR. EVAL(VARORDEN)
	   SET ORDER TO TAG (CONTENIDO[3])
	ELSE
	   SET ORDER TO TAG (CONTENIDO[4])
	ENDIF
	STORE NUL TO CASOS
	ACLA=HAZ_ACLA()
	LINEA=REPL("=",LEN(ACLA))
RETURN .T.
