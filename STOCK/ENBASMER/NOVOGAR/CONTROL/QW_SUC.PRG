* 旼 Program 컴컴컴컴컴컴컴컴컴컴컴�
* �    File Name: QW_SUC.PRG       �
* �       Author: G. REINER        �
* � Date created: 04-08-94 04:11pm �
* �    Copyright: GOYO REINER      �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
FUNCTION QW_SUC
	PARAMETER QWREN,QWCOL,QWCUAL
	PRIVATE QWREN,QWCOL,QWCUAL
	IF FILsuc=2
		STORE NUL TO RESPUESTA,LARECTEX
		LLSC=AQUESUC()
		IF !EMPTY(LLSC)
			QUESUC=(QWCUAL+"='"+PADR(LLSC,10)+"'")
			ttSUC="a Sucursal "+larectex
		ELSE
			FILSUC=1
		ENDIF
	ENDIF
RETURN .T.
