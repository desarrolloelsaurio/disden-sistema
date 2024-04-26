* ษออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : OPPAG.PRG                  บ
* บ COMENTARIO    : ABRE BASE DE COND. DE PAGO บ
* ฬออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                   บ
* บ FECHA      : 12-14-93                      บ
* บ HORA       : 02:49:23am                    บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER       บ
* ศออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
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
