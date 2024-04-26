* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : VARIOS.PRG                                               บ
* บ COMENTARIO    : DERIVA A OPERACIONES BASE MIXTA Y OTRAS                  บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 07-27-93                                                    บ
* บ HORA       : 01:12:26am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
=cabpan1()
DO CASE
case bar()=1
	=OPCIU()
   DO grl1 WITH 4,5,'Menฃ de Ciudades'
   ON SELE POPU grl DO ciu
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=2
	DO OPIVA
	DO IVA
CASE BAR()=3
	=OPPRV()
   DO prv
CASE BAR()=4
	=OPPAG()

   DO PAG
CASE BAR()=6
   =opcimp()
CASE BAR()=8
respuesta='MENSAJ#9#14#Gestiขn de Mensajes#3;
#\<Envกa Mensaje;
#Mensajes En\<viados;
#Mensajes \<Recibidos;
#Res\<ponde Mensajes'
=DEFPOP()
ON SELE POPU MENSAJ DO MENSAJ
ACTI POPU MENSAJ
RELE POPU MENSAJ
ENDCASE
RETURN MEN_LIN(BOTOM)
