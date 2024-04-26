* ษออออออออออออออออออออออออออออออออออออออออออออออออออออป 
* บ PROCEDIMIENTO : OPCCI.PRG                          บ
* บ COMENTARIO    : ABRE CUENTA CORRIENTE DE IMPUESTOS บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
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
