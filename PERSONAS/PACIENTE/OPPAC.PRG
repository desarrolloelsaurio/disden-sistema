* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : OPCON.PRG                                                บ
* บ COMENTARIO    : ABRE BASE DE PERSONAS CON CONSORCISTAS                   บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 07-27-93                                                    บ
* บ HORA       : 01:27:00am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
IF USED("PER")
	SELE PER
	SET ORDER TO TAG PACIENTE
ELSE
	=MEN_LIN(ABA+"Pacientes")
	SELE 21
	=GETDBF('PERSONAS','PACIENTE','PER')
ENDIF
IF PACPOP
	=DEFPOPER()
ENDIF
=MEN_LIN(BOTOM)
RETURN
