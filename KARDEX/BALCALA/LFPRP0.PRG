* ÚÄ Program ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    File Name: LFPRP0.PRG                                                 ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 12-25-92                                                   ³
* ³ Time created: 04:09:00pm                                                 ³
* ³    Copyright: 1992 by SISTEMAS INFORMATICOS S.R.L.                       ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION LFPRP0
    =working()
	dime ttl[CANT_MAX],ctrl[CANT_MAX]
	hay=.f.
	=TTLCHEQ(6)
	SELE faX
	set order to tag factura
	SET RELA TO FAX.FACTURA INTO FAC
	set order to tag articulo in mer
	set relation to articulo INTO MER
	set order to tag CODCLI IN PER
	set relation to faC.CODCLI INTO PER
	set order to tag CODVIA in VIA
	set relation to faC.CODVIA INTO VIA ADDI
	STORE nul TO casos
	acla=HAZ_ACLA()
	linea=REPL("=",LEN(acla))
	tt='Listado de '+PROP(TIT_INVOS)+;
	CHR(13)+CHR(10)+'DIFERENCIAS DE PRECIOS'+;
	TTQUE
	=UNWORK()
RETURN .T.
