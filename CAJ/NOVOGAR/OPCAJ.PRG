* 浜様様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : OPCAJ.PRG                   �
* � COMENTARIO    : ABRE BASE DE CAJA           �
* 麺様様様様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER                    �
* � FECHA      : 02-09-94                       �
* � HORA       : 12:37:47pm                     �
* � COPYRIGHT  : 1994 by GREGORIO REINER        �
* 麺様様様様様様様様様様様様様様様様様様様様様様�
* � OP_EXCL    : ABRE LA BASE EXCLUSIVE         �
* � OP_REOP    : CIERRA LA BASE, BORRA TEMPORAL �
* �              Y REABRE BASE                  �
* 藩様様様様様様様様様様様様様様様様様様様様様様�
PARAMETER SHIT,OP_EXCL,OP_REOP
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
IF OP_REOP
   =REOPXXX("CAJ")
ENDIF
IF !USED("CAJ") .OR. OP_EXCL
	=MEN_LIN(ABA+"Caja")
	SELE 17
	=GETDBF('CAJA',"CAJA","CAJ",17,OP_EXCL)
ENDIF
RETURN MEN_LIN(BOTOM)
