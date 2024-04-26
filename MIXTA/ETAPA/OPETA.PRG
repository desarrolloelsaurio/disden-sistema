* ษออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : OPETA.PRG            บ
* บ COMENTARIO    : ABRE BASE DE ETAPAS  บ
* ฬออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER             บ
* บ FECHA      : 06-02-94                บ
* บ HORA       : 10:54:32pm              บ
* บ COPYRIGHT  : 1994 by GREGORIO REINER บ
* ศออออออออออออออออออออออออออออออออออออออผ
IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG ETATEX
ELSE
	=MEN_LIN(ABA+"Etapas de Producciขn")
	SELE 1
	USE (PATHPRO+'\MIXTA') ORDER TAG ETATEX ALIAS MIX
ENDIF
RETURN IIF(ETAPOP,DEFPOMIX(ETAPOPR,ETAPOPC),.T.) .AND. MEN_LIN(BOTOM)
