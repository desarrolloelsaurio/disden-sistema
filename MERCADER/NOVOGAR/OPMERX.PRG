* ษอออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : OPMERX.PRG                      บ
* บ COMENTARIO    : ABRE BASE DE MERCADERIAS - EXCL บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION OPMERX
	#DEFINE BOTOM "  "+repl("ฐ",78)                && BOTOM
	#DEFINE ABA          "Abriendo Base de "       && ABA
	=MEN_LIN(ABA+"Mercaderกas")
	USE IN MER
	SELE 14
	USE (PATHPRO+'\MERCA') ALIAS MER EXCL
RETURN MEN_LIN(BOTOM)
