* ÚÄ Funci¢n  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³  Description: LFARPR2                                                    ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 10-16-92                                                   ³
* ³ Time created: 04:48:35pm                                                 ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION LFARPR2
	IF FILFAC=3
		? PAIP
		?? FECHAEM
		?? PAIP
		?? FACTURA
		?? PAIP
		?? LEFT(PRO.PROVEEDOR,20)
		?? PAIP
		?? STR(MONTONET,XACDIGI,2)
		?? PAIP
		TOT=TOT+MONTONET
	ELSE
		IF FILFEC=3 .OR. FILVEN=3
			TOT=TOT+MONTONET
			CAN=CAN+1
		ENDIF
	ENDIF
RETURN .T.
