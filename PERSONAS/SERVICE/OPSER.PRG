* 浜様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : OPSER.PRG               �
* � COMENTARIO    : ABRE BASE DE PERSONAS   �
* 麺様様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER                �
* � FECHA      : 10-25-93                   �
* � HORA       : 00:42:28am                 �
* � COPYRIGHT  : 1993 by GREGORIO REINER    �
* 藩様様様様様様様様様様様様様様様様様様様様�
IF USED("PER")
	SELE PER
	SET ORDER TO TAG SERVICE
ELSE
	=MEN_LIN(ABA+'S�rvices')
	SELE 21
	USE (PATHPRO+'\PERSONAS') ORDER TAG SERVICE ALIAS PER
ENDIF
RETURN IIF(SERPOP,DEFPOPER(SERPOPR,SERPOPC),.T.) .AND. MEN_LIN(BOTOM)
