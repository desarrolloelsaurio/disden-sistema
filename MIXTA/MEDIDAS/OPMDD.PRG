* ษอออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : OPMDD.PRG             บ
* ฬอออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER              บ
* บ FECHA      : 10-26-93                 บ
* บ HORA       : 12:48:15pm               บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER  บ
* ศอออออออออออออออออออออออออออออออออออออออผ
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM

IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG MDDTEX
ELSE
	=MEN_LIN(ABA+"Unidades de Medida")
	SELE 1
	=GETDBF('MIXTA','MDDTEX','MIX')
ENDIF
RETURN IIF(MDDPOP,DEFPOMIX(MDDPOPR,MDDPOPC),.T.) .AND. MEN_LIN(BOTOM)
