* ÚÄ Funci¢n  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³  Description: LRECPZ0                                                    ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 10-15-92                                                   ³
* ³ Time created: 06:28:32pm                                                 ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION lRECpz0
	=working()
	SELE REC
	SET ORDER TO TAG PROCOD IN PRO
	SET RELA TO PROCOD INTO PRO
	IF '.F.'=FISC
		INDE ON PRO.PROVEEDOR+DTOS(FECHAREM) to (GENTMP()) COMP
	ELSE
		INDE ON PRO.PROVEEDOR+DTOS(FECHAREM) to (GENTMP()) for EVAL(FISC) COMP
	ENDIF
	GO TOP
	ELPRO=PRO.PROCOD
	ACLA=HAZ_ACLA()
	linea=REPL("=",LEN(acla))
	ttU='Listado de Remitos de Proveedores'+TTQUE
	=UNWORK()
RETURN .T.
