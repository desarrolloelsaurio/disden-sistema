* 浜様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : OPPRP.PRG                 �
* � COMENTARIO    : ABRE BASE DE PROPIETARIOS �
* 藩様様様様様様様様様様様様様様様様様様様様様�
#DEFINE BOTOM "  "+REPL("�",78)                  && BOTOM
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
