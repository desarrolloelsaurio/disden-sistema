* ÚÄ PROGRAMA ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³  APLICACION: SISTEMAS VARIOS                                             ³
* ³       AUTOR: G. REINER                                                   ³
* ³ Date created: 05-27-93                                                   ³
* ³ Time created: 03:14:41pm                                                 ³
* ³    Copyright: 1993 by SISTEMAS INFORMATICOS S.R.L.                       ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
* DEVUELVE EL NUMERO DE DOCUMENTO
FUNCTION GETDOC
	PARAMETER G_POS
	PRIVATE G_NUM,G_POS,G_ALIAS
	M.G_ALIAS=ALIAS()
	SELE DOC
	REGISTRO=STR(M.G_POS)
	=LOCK() .OR. LOK()
	GO M.G_POS IN DOC
	M.G_NUM=DOC.NUMERO
	UNLO IN DOC
	IF !EMPTY(G_ALIAS)
		SELE (G_ALIAS)
	ENDIF
RETURN M.G_NUM
