* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : MEDICO.PRG                                               �
* � COMENTARIO    : GESTION DE MEDICOS                                       �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 09-05-93                                                    �
* � HORA       : 01:07:12pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
=CABPAN1()
MED_DIJO=ALLTRIM(PROMPT())
RNN=BAR()+3
RNN=IIF(RNN>9,9,RNN)
DO CASE
case MED_DIJO='Especialidades'
	DO OPESP
	DO ESP
CASE MED_DIJO='Sanatorios'
	respuesta='SAN#'+str(rnn)+'#25#Submen� de Sanatorios#3;
#Datos \<Generales;
#Datos \<Espec�ficos;
#\<Legajo'
	=defpop()
	ON SELE POPU SAN DO SAN
	ACTI POPU SAN
	RELE POPU SAN
CASE MED_DIJO='M�dicos'
	respuesta='med#'+str(rnn)+'#25#Submen� de M�dicos#3;
#Datos \<Generales;
#Datos \<Espec�ficos;
#\<Legajo;
#-;
#\<Listados;
#-;
#L\<iquidaci�n'
	=defpop()
	ON SELE POPU MED DO MED
	ACTI POPU MED
	RELE POPU MED
CASE MED_DIJO='Internos'
	respuesta='med#'+str(rnn)+'#25#Submen� de Operadores#3;
#\<M�dicos Internos;
#Listados por \<Pantalla;
#Listados por \<Impresora'
	=defpop()
	ON SELE POPU MED DO INTER
	ACTI POPU MED
	RELE POPU MED
ENDCASE
RETURN MEN_LIN(BOTOM)
