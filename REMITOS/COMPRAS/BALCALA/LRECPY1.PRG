* ÚÄ PROGRAMA ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³  APLICACION: SISTEMAS VARIOS                                             ³
* ³    ARCHIVO: LRECPY1.PRG                                                  ³
* ³       AUTOR: G. REINER                                                   ³
* ³ Date created: 11-11-92                                                   ³
* ³ Time created: 03:44:18pm                                                 ³
* ³    Make File: DEMO.RMK                                                   ³
* ³    Exec File: INICIO.EXE                                                 ³
* ³    Copyright: 1992 by SISTEMAS INFORMATICOS S.R.L.                       ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION LRECPY1
	? PAIP
	?? LIS.MERCA
	?? PAIP
	?? LEFT(MER.MERCA,30)
	?? PAIP
	?? STR(LIS.CANTIDAD,XACDIGI)
	?? PAIP
	IF HAYDISC
	?? STR(LIS.PESO,XACDIGI,2)
	?? PAIP
	ENDIF
	?? STR(LIS.MONTO,XACDIGI,2)
	?? PAIP
	tcan=tcan+lis.cantidad
	tpes=tpes+lis.peso
	tmon=tmon+lis.monto
RETURN .T.
