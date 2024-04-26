* зд Program ддддддддддддддддддддддддддддд©
* Ё    File Name: QUEIMP.PRG              Ё
* Ё       Author: G. REINER               Ё
* Ё Date created: 14/08/95 12:13          Ё
* Ё    Copyright: 1995 by GREGORIO REINER Ё
* юддддддддддддддддддддддддддддддддддддддды
FUNCTION QUEIMP
	DO CASE
	CASE TYPE("LPT1")="U" .OR. LPT1
		SET PRINTER TO LPT1
	CASE LPT2
		SET PRINTER TO LPT2
	CASE LPT3
		SET PRINTER TO LPT3
	OTHERWISE
		SET PRINTER TO LPT1
	ENDCASE
RETURN .T.
