* ÚÄ Program ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    File Name: LRIMPZ0.PRG                                                ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 12-26-92                                                   ³
* ³ Time created: 01:37:57am                                                 ³
* ³    Copyright: 1992 by SISTEMAS INFORMATICOS S. R.L.                      ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION lrimpz0
	dime ttl[CANT_MAX],ctrl[CANT_MAX]
	hay=.f.
	if variable[4]
		ttl[4]=nul
		store .t. to hay
	endif
	if !hay
		rele ttl,ctrl
	endif
	SELE rem
	set order to tag Remito
	set order to tag CODVIA in VIA
	set relation to rem.CODVIA INTO VIA ADDI
	STORE nul TO casos
	acla=HAZ_ACLA()
	linea=REPL("=",LEN(acla))
	tt='Listado de Remitos'+xxtochar(TTQUE)
RETURN .T.
