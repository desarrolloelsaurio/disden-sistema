* 浜様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : OPTALS.PRG                �
* � COMENTARIO    : ABRE BASE DE TALLERES     �
* 藩様様様様様様様様様様様様様様様様様様様様様�
#DEFINE BOTOM "  "+REPL("�",78)                  && BOTOM
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
