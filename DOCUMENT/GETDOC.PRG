* 旼 PROGRAMA 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
* �  APLICACION: SISTEMAS VARIOS                                             �
* �       AUTOR: G. REINER                                                   �
* � Date created: 05-27-93                                                   �
* � Time created: 03:14:41pm                                                 �
* �    Copyright: 1993 by SISTEMAS INFORMATICOS S.R.L.                       �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
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
