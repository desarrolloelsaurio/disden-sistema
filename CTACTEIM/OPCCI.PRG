* 浜様様様様様様様様様様様様様様様様様様様様様様様様様融 
* � PROCEDIMIENTO : OPCCI.PRG                          �
* � COMENTARIO    : ABRE CUENTA CORRIENTE DE IMPUESTOS �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様夕
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
PARA SHIT
IF USED("CCI")
	SELE CCI
	SET ORDER TO TAG CODCLI
ELSE
	=MEN_LIN(ABA+"Cta Corriente Impuestos")
	SELE 2
	USE (PATHALQ+'\CCIMP') ORDER TAG CODCLI ALIAS CCI
ENDIF
RETURN MEN_LIN(BOTOM)
