* 浜様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : OPMDD.PRG             �
* 麺様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER              �
* � FECHA      : 10-26-93                 �
* � HORA       : 12:48:15pm               �
* � COPYRIGHT  : 1993 by GREGORIO REINER  �
* 藩様様様様様様様様様様様様様様様様様様様�
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM

IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG MDDTEX
ELSE
	=MEN_LIN(ABA+"Unidades de Medida")
	SELE 1
	=GETDBF('MIXTA','MDDTEX','MIX')
ENDIF
RETURN IIF(MDDPOP,DEFPOMIX(MDDPOPR,MDDPOPC),.T.) .AND. MEN_LIN(BOTOM)
