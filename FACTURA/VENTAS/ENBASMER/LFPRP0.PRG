* ÚÄ Program ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    File Name: LFPRP0.PRG          ³
* ³       Author: G. REINER           ³
* ³ Date created: 12-26-92            ³
* ³ Time created: 07:10:13pm          ³
* ³    Copyright: 1992 by GOYO REINER ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION LFPRP0
	=WORKING()
	dime ttl[CANT_MAX],ctrl[CANT_MAX]
	hay=.f.
	FOR A=6 TO CANT_MAX
		if variable[A]
			ttl[A]=nul
			store .t. to hay
		endif
	next
	if !hay
		rele ttl,ctrl
	endif
	SELE faX
	set order to tag factura INTO FAC
	SET RELA TO FAX.FACTURA INTO FAC
	set order to tag CODCLI IN PER
	set relation to faC.CODCLI INTO PER ADDI
	set order to tag CODVIA in VIA
	set relation to faC.CODVIA INTO VIA ADDI
	SET ORDER TO TAG ARTICULO IN MER
	SET RELA TO FAX.ARTICULO INTO MER ADDI
	STORE nul TO casos
	acla=HAZ_ACLA()
	linea=REPL("=",LEN(acla))
	tt='Listado de '+PROP(TIT_INVOS)+' con Diferencia de Precios'+TTQUE
	=UNWORK()
RETURN .T.
