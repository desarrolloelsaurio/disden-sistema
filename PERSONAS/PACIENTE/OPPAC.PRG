* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : OPCON.PRG                                                �
* � COMENTARIO    : ABRE BASE DE PERSONAS CON CONSORCISTAS                   �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 07-27-93                                                    �
* � HORA       : 01:27:00am                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
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
