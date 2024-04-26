* ÚÄ Program ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    File Name: LREMPZ0.PRG                                                ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 12-26-92                                                   ³
* ³ Time created: 01:57:05am                                                 ³
* ³    Copyright: 1992 SISTEMAS INFORMATICOS S.R.L.                          ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION LREMPZ0
	=WORKING()
	dime ttl[CANT_MAX],ctrl[CANT_MAX]
	hay=.f.
	if variable[5]
		ttl[5]=nul
		store .t. to hay
	endif
	if !hay
		rele ttl,ctrl
	endif
	SELE REM
	set order to tag REMITO
	set order to tag CODCLI IN PER
	set relation to REM.CODCLI INTO PER
	set order to tag CODVIA in VIA
	set relation to REM.CODVIA INTO VIA ADDI
	set order to tag PAGCOD in MIX
	set relation to REM.CONDPAGO INTO MIX ADDI
	tmp=gentmp()
	IF TYPE("REM.REMITO")="C"
		INDE ON DTOS(fechaem)+REMITO to (tmp) for eval(fisc) COMP
	ELSE
		INDE ON DTOS(fechaem)+STR(REMITO) to (tmp) for eval(fisc) COMP
	ENDIF
	stor nul TO casos
	acla=HAZ_ACLA()
	linea=REPL("=",LEN(acla))
	tt='Listado de Remitos'+TTQUE
RETURN UNWORK()
