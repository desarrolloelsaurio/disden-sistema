* ษอออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : OPSER.PRG               บ
* บ COMENTARIO    : ABRE BASE DE PERSONAS   บ
* ฬอออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                บ
* บ FECHA      : 10-25-93                   บ
* บ HORA       : 00:42:28am                 บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER    บ
* ศอออออออออออออออออออออออออออออออออออออออออผ
IF USED("PER")
	SELE PER
	SET ORDER TO TAG SERVICE
ELSE
	=MEN_LIN(ABA+'Srvices')
	SELE 21
	USE (PATHPRO+'\PERSONAS') ORDER TAG SERVICE ALIAS PER
ENDIF
RETURN IIF(SERPOP,DEFPOPER(SERPOPR,SERPOPC),.T.) .AND. MEN_LIN(BOTOM)
