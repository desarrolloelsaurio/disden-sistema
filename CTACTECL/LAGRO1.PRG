* ÚÄ Funci¢n ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³  Application: IMPRIME CORTE DE CLIENTE Y TOTALIZA EN GRAN TOTAL LPAT*    ³
* ³    File Name: LAGRO1.PRG                                                 ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 09-05-92                                                   ³
* ³ Time created: 04:36:56pm                                                 ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION LAGRO1
#DEFINE PAIP     "|"                             && PAIP
	PARAMETER IMPRIME
	IF IMPRIME
		? LINEA
		? PAIP
		?? SPACE(15)
		?? PAIP
		?? STR(CDEBE,XACDIGI,2)
		?? PAIP
		?? STR(CHABER,XACDIGI,2)
		?? PAIP
		?? STR(CDEBE-CHABER,XACDIGI,2)
		?? PAIP
	ENDIF
	STORE NUL TO CDEBE,CHABER
	TT=TTU+CHR(13)+CHR(10)+ALLTRIM(PER.CLIENTE)
	ELCODIGO=CCL.CODCLI
	ELCLIENTE=PER.CLIENTE
	LAFACTURA=VAL(SUBSTR(COMPR,7))
	LAFACT1=CCL.COMPR
RETURN .T.
