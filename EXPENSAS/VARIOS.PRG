* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : VARIOS.PRG                                               �
* � COMENTARIO    : DERIVA A OPERACIONES BASE MIXTA Y OTRAS                  �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 07-27-93                                                    �
* � HORA       : 01:12:26am                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
=cabpan1()
DO CASE
case bar()=1
	=OPCIU()
   DO grl1 WITH 4,5,'Men� de Ciudades'
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
respuesta='MENSAJ#9#14#Gesti�n de Mensajes#3;
#\<Env�a Mensaje;
#Mensajes En\<viados;
#Mensajes \<Recibidos;
#Res\<ponde Mensajes'
=DEFPOP()
ON SELE POPU MENSAJ DO MENSAJ
ACTI POPU MENSAJ
RELE POPU MENSAJ
ENDCASE
RETURN MEN_LIN(BOTOM)
