* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : MEDICO.PRG                                               บ
* บ COMENTARIO    : GESTION DE MEDICOS                                       บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 09-05-93                                                    บ
* บ HORA       : 01:07:12pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
=CABPAN1()
MED_DIJO=ALLTRIM(PROMPT())
RNN=BAR()+3
RNN=IIF(RNN>9,9,RNN)
DO CASE
case MED_DIJO='Especialidades'
	DO OPESP
	DO ESP
CASE MED_DIJO='Sanatorios'
	respuesta='SAN#'+str(rnn)+'#25#Submenฃ de Sanatorios#3;
#Datos \<Generales;
#Datos \<Especกficos;
#\<Legajo'
	=defpop()
	ON SELE POPU SAN DO SAN
	ACTI POPU SAN
	RELE POPU SAN
CASE MED_DIJO='Mdicos'
	respuesta='med#'+str(rnn)+'#25#Submenฃ de Mdicos#3;
#Datos \<Generales;
#Datos \<Especกficos;
#\<Legajo;
#-;
#\<Listados;
#-;
#L\<iquidaciขn'
	=defpop()
	ON SELE POPU MED DO MED
	ACTI POPU MED
	RELE POPU MED
CASE MED_DIJO='Internos'
	respuesta='med#'+str(rnn)+'#25#Submenฃ de Operadores#3;
#\<Mdicos Internos;
#Listados por \<Pantalla;
#Listados por \<Impresora'
	=defpop()
	ON SELE POPU MED DO INTER
	ACTI POPU MED
	RELE POPU MED
ENDCASE
RETURN MEN_LIN(BOTOM)
