* 浜様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : OPPRO.PRG                 �
* � COMENTARIO    : ABRE BASE DE PROVEEDORES  �
* 藩様様様様様様様様様様様様様様様様様様様様様�
#DEFINE BOTOM "  "+REPL("�",78)                  && BOTOM
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
