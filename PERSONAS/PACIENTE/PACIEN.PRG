* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : PACIENTE.PRG                                             บ
* บ COMENTARIO    : GESTION DE PACIENTES                                     บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 09-05-93                                                    บ
* บ HORA       : 01:07:12pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
=CABPAN1()
PAC_DIJO=ALLTRIM(PROMPT())
RNN=BAR()+3
RNN=IIF(RNN>9,9,RNN)
=OPMUT()
DO CASE
CASE PAC_DIJO='Pacientes'
respuesta='PAC#'+str(rnn)+'#25#Submenฃ de Pacientes#3;
#Datos \<Generales;
#Datos \<Especกficos;
#\<Legajo'
=defpop()
   ON SELE POPU PAC DO PAC
   ACTI POPU PAC
   RELE POPU PAC
CASE PAC_DIJO='Pr cticas de Pacientes'
   DO pac
CASE PAC_DIJO='Agrega Pr ctica'
   do pac
CASE PAC_DIJO='Cu ndo Vino ?'
   =OPMIX()
   =OPPAC()
   =OPLIQ()
   do lpac with .t.,.t.
ENDCASE
RETURN MEN_LIN(BOTOM)
