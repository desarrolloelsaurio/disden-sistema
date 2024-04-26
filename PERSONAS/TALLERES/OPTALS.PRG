* ษอออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : OPTALS.PRG                บ
* บ COMENTARIO    : ABRE BASE DE TALLERES     บ
* ศอออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM "  "+REPL("ฐ",78)                  && BOTOM
#DEFINE ABA   "Abriendo Base de "                && ABA
IF USED("PER")
	SELE PER
	SET ORDER TO TAG TALLERES
ELSE
	=MEN_LIN(ABA+'Talleres')
	=PRXAREA(.T.)
	USE (PATHPRO+'\PERSONAS') ORDER TAG TALLERES ALIAS PER
ENDIF
RETURN IIF(TALPOP,DEFPOPER(TALPOPR,TALPOPC),.T.) .AND. MEN_LIN(BOTOM)
