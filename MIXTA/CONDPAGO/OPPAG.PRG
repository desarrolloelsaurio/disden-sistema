* 浜様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : OPPAG.PRG                  �
* � COMENTARIO    : ABRE BASE DE COND. DE PAGO �
* 麺様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                   �
* � FECHA      : 12-14-93                      �
* � HORA       : 02:49:23am                    �
* � COPYRIGHT  : 1993 by GREGORIO REINER       �
* 藩様様様様様様様様様様様様様様様様様様様様様夕
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG PAGTEX
ELSE
	=MEN_LIN(ABA+"Condicion de Pado")
	SELE 1
	=GETDBF('MIXTA','PAGTEX',"MIX")
ENDIF
RETURN IIF(PAGPOP,DEFPOMIX(PAGPOPR,PAGPOPC),.T.) .AND. MEN_LIN(BOTOM)
