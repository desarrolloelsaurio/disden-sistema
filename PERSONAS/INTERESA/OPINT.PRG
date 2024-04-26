* ษอออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : OPINT.PRG                 บ
* บ COMENTARIO    : ABRE BASE DE PROPIETARIOS บ
* ศอออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM "  "+REPL("ฐ",78)                  && BOTOM
#DEFINE ABA   "Abriendo Base de "                && ABA
IF USED("PER")
	SELE PER
	SET ORDER TO TAG INTERESADO
ELSE
	=MEN_LIN(ABA+'Interesados')
	SELE 21
	USE (PATHPRO+'\PERSONAS') ORDER TAG INTERESADO ALIAS PER
ENDIF
RETURN IIF(INTPOP,DEFPOPER(INTPOPR,INTPOPC),.T.) .AND. MEN_LIN(BOTOM)
