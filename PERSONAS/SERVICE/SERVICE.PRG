* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : SERVICE.PRG                                              �
* � COMENTARIO    : GESTION DE SERVICE                                       �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 09-05-93                                                    �
* � HORA       : 01:07:12pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
=CABPAN1()
SER_DIJO=ALLTRIM(PROMPT())
RNN=BAR()+3
RNN=IIF(RNN>9,9,RNN)
DO CASE
case SER_DIJO='Especialidades'
     DO OPESP
	 DO ESP
CASE SER_DIJO='Sanatorios'
respuesta='SAN#'+str(rnn)+'#25#Submen� de Sanatorios#3;
#Datos \<Generales;
#Datos \<Espec�ficos;
#\<Legajo'
=defpop()
   ON SELE POPU SAN DO SAN
   ACTI POPU SAN
   RELE POPU SAN
CASE SER_DIJO='M�dicos'
respuesta='SER#'+str(rnn)+'#25#Submen� de M�dicos#3;
#Datos \<Generales;
#Datos \<Espec�ficos;
#\<Legajo'
=defpop()
   ON SELE POPU SER DO SER
   ACTI POPU SER
   RELE POPU SER
ENDCASE
=MEN_LIN(BOTOM)
RETURN
