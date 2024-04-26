* ÚÄ Funci¢n ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³  Application: IMPRIME CORTE DE CLIENTE Y TOTALIZA EN GRAN TOTAL LPAT*    ³
* ³    File Name: LAGRO1.PRG                                                 ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 09-05-92                                                   ³
* ³ Time created: 04:36:56pm                                                 ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION LAGRO1
	PARAMETER L_IMP
	#DEFINE PAIP   "|"                             && PAIP
	IF L_IMP
		? LINEA
		? PAIP
		?? SPACE(20)
		?? PAIP
		?? SPACE(8)
		?? PAIP
		?? STR(CDEBE,XACDIGI,2)
		?? PAIP
		?? STR(CHABER,XACDIGI,2)
		?? PAIP
		?? STR(CDEBE-CHABER,XACDIGI,2)
		?? PAIP
	ENDIF
	STORE NUL TO CDEBE,CHABER
	ELCODIGO=CCL.CODCLI
	ELCLIENTE=PER.CLIENTE
	LAFECHA=CCL.FECHAOP
	LAFACTURA=CCL.COMPR
	LAFACT1=CCL.COMPR
RETURN .T.
