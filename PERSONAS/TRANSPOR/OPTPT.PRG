* ษอออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : OPTPT.PRG               บ
* บ COMENTARIO    : ABRE BASE DE PERSONAS   บ
* ฬอออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                บ
* บ FECHA      : 10-25-93                   บ
* บ HORA       : 00:42:28am                 บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER    บ
* ศอออออออออออออออออออออออออออออออออออออออออผ
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
