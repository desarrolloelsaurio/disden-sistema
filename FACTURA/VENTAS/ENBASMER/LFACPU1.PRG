* зд Program ддддддддддддддддддддддддд©
* Ё    File Name: LFACPU1.PRG         Ё
* Ё       Author: G. REINER           Ё
* Ё Date created: 12-25-92            Ё
* Ё Time created: 10:36:23am          Ё
* Ё    Copyright: 1992 by GOYO REINER Ё
* юддддддддддддддддддддддддддддддддддды
FUNCTION LFACPU1
	PARAMETER IMPRIME
	IF IMPRIME
		? PAIP
		?? KODCLI
		?? PAIP
		?? KLIENTE
		?? PAIP
		?? FEKHA
		?? PAIP
		?? IIF(TYPE("FAC.FACTURA")="C",RIGHT(ALLTRIM(FAKTURA),10),STR(FAKTURA,10))
		?? PAIP
	ENDIF
	KODCLI=FAC.CODCLI
	KLIENTE=PER.CLIENTE
	FEKHA=FAC.FECHAEM
	FAKTURA=FAC.FACTURA
RETURN .T.
