* 旼 Funcion 컴컴컴컴컴컴컴컴컴커
* �    File Name: DEFPOPER.PRG  �
* �       Author: G. REINER     �
* � Date created: 06-18-93      �
* � Time created: 02:47:02am    �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
FUNCTION DEFPOPER
	PARAMETER DE_REN,DE_COL
	DEFI POPU PERPOP ;
		FROM 2,40 ;
		TO 22,72 ;
		PROM FIELD PER.CLIENTE ;
		MESS IIF(_windows,'Su Opci�n','Su Opci줻') ;
		SHAD ;
		COLOR SCHE 6 ;
		IN SCREEN
	ON SELE POPU PERPOP DO RESP1
RETURN .T.
