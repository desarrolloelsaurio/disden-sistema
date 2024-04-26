* зд FUNCTION дддддддддддддддддддддддд©
* Ё  Description: DEFINE POPUP MIXTA1 Ё
* Ё       AUTOR : G. REINER           Ё
* Ё Date created: 03-17-93            Ё
* Ё Time created: 11:59:01am          Ё
* Ё    Copyright: GOYO REINER         Ё
* юддддддддддддддддддддддддддддддддддды
FUNCTION DEFPOMI1
	PARAMETERS REX,COX
	M.REX=XXTONUM(M.REX)
	M.COX=XXTONUM(M.COX)
	DEFI POPU MI1POP ;
	FROM max(2,M.REX),COX ;
	TO 21,MIN(79,M.COX+22) ;
	PROMPT FIELD MI1.TEXTO1 ;
	SHAD ;
	COLOR SCHE 6 ;
	IN SCREEN
	ON SELE POPU MI1POP DO RESP1
RETURN .T.
