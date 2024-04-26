* ษอออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : OPPRO.PRG                 บ
* บ COMENTARIO    : ABRE BASE DE PROVEEDORES  บ
* ศอออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM "  "+REPL("ฐ",78)                  && BOTOM
#DEFINE ABA   "Abriendo Base de "                && ABA
IF USED("PER")
	SELE PER
	SET ORDER TO TAG PROVEEDO
ELSE
	=MEN_LIN(ABA+'Proveedores')
	=PRXAREA(.T.)
	USE (PATHPRO+'\PERSONAS') ORDER TAG PROVEEDO ALIAS PER
ENDIF
RETURN IIF(PROPOP,DEFPOPER(PROPOPR,PROPOPC),.T.) .AND. MEN_LIN(BOTOM)
