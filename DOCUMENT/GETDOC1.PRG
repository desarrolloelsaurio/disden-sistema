* 旼 PROGRAMA 컴컴컴컴컴컴컴컴컴컴컴컴�
* �  APLICACION: SISTEMAS VARIOS      �
* �       AUTOR: G. REINER            �
* � Date created: 10-21-95 10:58am    �
* �    Copyright: 1995 by GOYO REINER �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
* DEVUELVE EL NUMERO DE DOCUMENTO
* DE LA POSICION INDICADA POR EL PARAMETRO
* DEJA BLOQUEADA LA BASE
FUNCTION GETDOC1
	PARAMETER G_POS
	PRIVATE G_NUM,G_POS,G_ALIAS
	M.G_ALIAS=ALIAS()
	SELE DOC
	REGISTRO=STR(M.G_POS)
	GO (M.G_POS) IN DOC
	=LOCK() .OR. LOK()
	M.G_NUM=DOC.NUMERO+1
	IF !EMPTY(G_ALIAS)
		SELE (G_ALIAS)
	ENDIF
RETURN M.G_NUM
