* ษอออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : OPPRP.PRG                 บ
* บ COMENTARIO    : ABRE BASE DE PROPIETARIOS บ
* ศอออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM "  "+REPL("ฐ",78)                  && BOTOM
#DEFINE ABA   "Abriendo Base de "                && ABA
IF USED("PER")
	SELE PER
	SET ORDER TO TAG PROPIETA
ELSE
	=MEN_LIN(ABA+'Propietarios')
	SELE 21
	USE (PATHPRO+'\PERSONAS') ORDER TAG PROPIETA ALIAS PER
ENDIF
RETURN IIF(PRPPOP,DEFPOPER(PRPPOPR,PRPPOPC),.T.) .AND. MEN_LIN(BOTOM)
