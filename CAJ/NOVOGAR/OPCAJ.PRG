* ษอออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : OPCAJ.PRG                   บ
* บ COMENTARIO    : ABRE BASE DE CAJA           บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                    บ
* บ FECHA      : 02-09-94                       บ
* บ HORA       : 12:37:47pm                     บ
* บ COPYRIGHT  : 1994 by GREGORIO REINER        บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออน
* บ OP_EXCL    : ABRE LA BASE EXCLUSIVE         บ
* บ OP_REOP    : CIERRA LA BASE, BORRA TEMPORAL บ
* บ              Y REABRE BASE                  บ
* ศอออออออออออออออออออออออออออออออออออออออออออออผ
PARAMETER SHIT,OP_EXCL,OP_REOP
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
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
