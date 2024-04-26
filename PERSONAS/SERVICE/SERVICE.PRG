* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : SERVICE.PRG                                              บ
* บ COMENTARIO    : GESTION DE SERVICE                                       บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 09-05-93                                                    บ
* บ HORA       : 01:07:12pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
=CABPAN1()
SER_DIJO=ALLTRIM(PROMPT())
RNN=BAR()+3
RNN=IIF(RNN>9,9,RNN)
DO CASE
case SER_DIJO='Especialidades'
     DO OPESP
	 DO ESP
CASE SER_DIJO='Sanatorios'
respuesta='SAN#'+str(rnn)+'#25#Submenฃ de Sanatorios#3;
#Datos \<Generales;
#Datos \<Especกficos;
#\<Legajo'
=defpop()
   ON SELE POPU SAN DO SAN
   ACTI POPU SAN
   RELE POPU SAN
CASE SER_DIJO='Mdicos'
respuesta='SER#'+str(rnn)+'#25#Submenฃ de Mdicos#3;
#Datos \<Generales;
#Datos \<Especกficos;
#\<Legajo'
=defpop()
   ON SELE POPU SER DO SER
   ACTI POPU SER
   RELE POPU SER
ENDCASE
=MEN_LIN(BOTOM)
RETURN
