* ÚÄ Program ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    File Name: QW_SUC.PRG       ³
* ³       Author: G. REINER        ³
* ³ Date created: 04-08-94 04:11pm ³
* ³    Copyright: GOYO REINER      ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
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
