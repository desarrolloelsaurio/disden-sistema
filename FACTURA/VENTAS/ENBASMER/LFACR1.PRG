* зд Program ддддддддддддддддддддддддд©
* Ё    File Name: LFACR1.PRG          Ё
* Ё       Author: G. REINER           Ё
* Ё Date created: 02-06-93            Ё
* Ё    Copyright: 1993 by GOYO REINER Ё
* юддддддддддддддддддддддддддддддддддды
FUNCTION LFACR1
	DO CASE
	CASE FILFAC=3
		RETURN FAX.FACTURA
	CASE FILFEC=3
		RETURN FAC.FECHAEM
	CASE FILVIA=3
		RETURN FAC.CODVIA
	CASE FILCLI=3
		RETURN FAC.CODCLI
	CASE FILPAG=3
		RETURN MIX.TEXTO1
	ENDCASE
RETURN ""
