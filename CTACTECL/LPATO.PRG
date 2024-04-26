* ÚÄ Funci¢n ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³  Application: IMPRIME CORTE DE CLIENTE Y TOTALIZA EN GRAN TOTAL LPAT*    ³
* ³    File Name: LPATO.PRG                                                  ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 09-05-92                                                   ³
* ³ Time created: 04:36:56pm                                                 ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION LPATO
	PARAMETER IMPRIME
	IF IMPRIME
		? PAIP
		?? ELCODIGO
		?? PAIP
		?? ELCLIENTE
		?? PAIP
		?? STR(DEBE,XACDIGI,2)
		?? PAIP
		?? STR(HABER,XACDIGI,2)
		?? PAIP
		SALDO=DEBE-HABER
		?? STR(SALDO,XACDIGI,2)
		?? PAIP
		?? STR(CREDITO,XACDIGI,2)
		?? PAIP
		?? STR(CREDITO+SALDO,XACDIGI,2)
		?? PAIP
		TDEBE=TDEBE+DEBE
		THABER=THABER+HABER
		TCREDITO=TCREDITO+CREDITO
		CASOS=CASOS+1
	ENDIF
	STORE NUL TO DEBE,HABER,CREDITO
	ELCLIENTE=PER.CLIENTE
	ELCODIGO=CCL.CODCLI
RETURN .T.
