* 浜様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : OPINT.PRG                 �
* � COMENTARIO    : ABRE BASE DE PROPIETARIOS �
* 藩様様様様様様様様様様様様様様様様様様様様様�
#DEFINE BOTOM "  "+REPL("�",78)                  && BOTOM
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
