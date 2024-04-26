* ÚÄ PROGRAMA ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    ARCHIVO: LFACPC0.PRG                                                  ³
* ³       AUTOR: G. REINER                                                   ³
* ³ Date created: 11-26-92                                                   ³
* ³ Time created: 02:30:05pm                                                 ³
* ³    Make File: DEMO.RMK                                                   ³
* ³    Exec File: INICIO.EXE                                                 ³
* ³    Copyright: 1992 by SISTEMAS INFORMATICOS S.R.L.                       ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION LFACPC0
	=WORKING()
	=TTLCHEQ(6)
	SELE faC
	set order to tag factura
	set order to tag CODCLI IN PER
	set relation to faC.CODCLI INTO PER
	set order to tag CODVIA in VIA
	set relation to faC.CODVIA INTO VIA ADDI
	TMP=GENTMP()
	inde on FAC.FACTURA TO (TMP) FOR EVAL(FISC) COMP
	acla=HAZ_ACLA()
	linea=REPL("=",LEN(acla))
	tt='Listado de Costos '+PROP(TIT_INVOS)+chr(13)+chr(10)+"(Costos de Reposici¢n)"+TTQUE
	=UNWORK()
RETURN .T.
