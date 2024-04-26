* ÚÄ Funci¢n  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³  Description: LPECPZ0                                                    ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 10-15-92                                                   ³
* ³ Time created: 06:28:32pm                                                 ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION lpecpz0
	=WORKING()
	SELE PEC
	SET ORDER TO TAG PROCOD IN PRO
	SET RELA TO PROCOD INTO PRO
	IF '.F.'=FISC
		INDE ON PRO.PROVEEDOR+DTOS(FECHAEM) to (GENTMP()) COMP
	ELSE
		INDE ON PRO.PROVEEDOR+DTOS(FECHAEM) to (GENTMP()) for EVAL(FISC) COMP
	ENDIF
	GO TOP
	ELPRO=PRO.PROCOD
	ACLA=HAZ_ACLA()
	LINEA=REPL("=",LEN(ACLA))
	tt='Listado de Notas de Pedido de Proveedores'+TTQUE
RETURN UNWORK()
