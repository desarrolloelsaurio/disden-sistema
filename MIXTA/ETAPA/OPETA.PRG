* 浜様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : OPETA.PRG            �
* � COMENTARIO    : ABRE BASE DE ETAPAS  �
* 麺様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER             �
* � FECHA      : 06-02-94                �
* � HORA       : 10:54:32pm              �
* � COPYRIGHT  : 1994 by GREGORIO REINER �
* 藩様様様様様様様様様様様様様様様様様様夕
IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG ETATEX
ELSE
	=MEN_LIN(ABA+"Etapas de Producci�n")
	SELE 1
	USE (PATHPRO+'\MIXTA') ORDER TAG ETATEX ALIAS MIX
ENDIF
RETURN IIF(ETAPOP,DEFPOMIX(ETAPOPR,ETAPOPC),.T.) .AND. MEN_LIN(BOTOM)
