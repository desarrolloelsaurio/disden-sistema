* 浜様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : OPTPT.PRG               �
* � COMENTARIO    : ABRE BASE DE PERSONAS   �
* 麺様様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER                �
* � FECHA      : 10-25-93                   �
* � HORA       : 00:42:28am                 �
* � COPYRIGHT  : 1993 by GREGORIO REINER    �
* 藩様様様様様様様様様様様様様様様様様様様様�
IF USED("PER")
	SELE PER
	SET ORDER TO TAG TPTTEX
ELSE
	=MEN_LIN(ABA+'Transportes')
	SELE 21
	USE (PATHPRO+'\PERSONAS') ORDER TAG TPTTEX ALIAS PER
ENDIF
RETURN IIF(TPTPOP,;
DEFPOPER(TPTPOPR,TPTPOPC),.T.) .AND. ;
MEN_LIN(BOTOM)
