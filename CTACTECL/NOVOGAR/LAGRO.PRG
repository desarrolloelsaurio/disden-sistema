* ÚÄ Funci¢n ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³  Application: IMPRIME CORTE DE FACTURA Y TOTALIZA EN GRAN TOTAL LPAT*    ³
* ³    File Name: LAGRO.PRG                                                  ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 09-05-92                                                   ³
* ³ Time created: 04:36:56pm                                                 ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION LAGRO
	PARAMETER L_IMP
	#DEFINE PAIP   "|"                             && PAIP
	IF L_IMP
		? PAIP
		?? LAFACT1
		?? PAIP
		?? LAFECHA
		?? PAIP
		?? STR(DEBE,XACDIGI,2)
		?? PAIP
		?? STR(HABER,XACDIGI,2)
		?? PAIP
		?? STR(DEBE-HABER,XACDIGI,2)
		?? PAIP
		TDEBE=TDEBE+DEBE
		THABER=THABER+HABER
		CDEBE=CDEBE+DEBE
		CHABER=CHABER+HABER
		CASOS=CASOS+1
	ENDIF
	STORE NUL TO DEBE,HABER
	LAFACTURA=CCL.COMPR
	LAFECHA=CCL.FECHAOP
	LAFACT1=CCL.COMPR
RETURN .T.
