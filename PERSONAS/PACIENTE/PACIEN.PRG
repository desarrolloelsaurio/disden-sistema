* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : PACIENTE.PRG                                             �
* � COMENTARIO    : GESTION DE PACIENTES                                     �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 09-05-93                                                    �
* � HORA       : 01:07:12pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
=CABPAN1()
PAC_DIJO=ALLTRIM(PROMPT())
RNN=BAR()+3
RNN=IIF(RNN>9,9,RNN)
=OPMUT()
DO CASE
CASE PAC_DIJO='Pacientes'
respuesta='PAC#'+str(rnn)+'#25#Submen� de Pacientes#3;
#Datos \<Generales;
#Datos \<Espec�ficos;
#\<Legajo'
=defpop()
   ON SELE POPU PAC DO PAC
   ACTI POPU PAC
   RELE POPU PAC
CASE PAC_DIJO='Pr�cticas de Pacientes'
   DO pac
CASE PAC_DIJO='Agrega Pr�ctica'
   do pac
CASE PAC_DIJO='Cu�ndo Vino ?'
   =OPMIX()
   =OPPAC()
   =OPLIQ()
   do lpac with .t.,.t.
ENDCASE
RETURN MEN_LIN(BOTOM)
