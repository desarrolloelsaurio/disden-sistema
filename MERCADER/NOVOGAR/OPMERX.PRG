* 浜様様様様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : OPMERX.PRG                      �
* � COMENTARIO    : ABRE BASE DE MERCADERIAS - EXCL �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様�
FUNCTION OPMERX
	#DEFINE BOTOM "  "+repl("�",78)                && BOTOM
	#DEFINE ABA          "Abriendo Base de "       && ABA
	=MEN_LIN(ABA+"Mercader�as")
	USE IN MER
	SELE 14
	USE (PATHPRO+'\MERCA') ALIAS MER EXCL
RETURN MEN_LIN(BOTOM)
