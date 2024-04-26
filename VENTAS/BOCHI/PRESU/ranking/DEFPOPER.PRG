* зд Funcion ддддддддддддддддддд©
* Ё    File Name: DEFPOPER.PRG  Ё
* Ё       Author: G. REINER     Ё
* Ё Date created: 06-18-93      Ё
* Ё Time created: 02:47:02am    Ё
* юддддддддддддддддддддддддддддды
FUNCTION DEFPOPER
	PARAMETER DE_REN,DE_COL
	DEFI POPU PERPOP ;
		FROM 2,40 ;
		TO 22,72 ;
		PROM FIELD PER.CLIENTE ;
		MESS IIF(_windows,'Su OpciСn','Su Opci╒n') ;
		SHAD ;
		COLOR SCHE 6 ;
		IN SCREEN
	ON SELE POPU PERPOP DO RESP1
RETURN .T.
