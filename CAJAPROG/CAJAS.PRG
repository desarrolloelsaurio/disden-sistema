* 浜様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : CAJAS.PRG            �
* � COMENTARIO    : MENU DE CAJA         �
* 麺様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER             �
* � FECHA      : 07-03-94                �
* � HORA       : 07:28:55pm              �
* � COPYRIGHT  : 1994 by GREGORIO REINER �
* 藩様様様様様様様様様様様様様様様様様様夕
ULPR=PROGRAM()
=CABPAN1()
DO CASE
CASE BAR()=1
   DO OPCAJ
   =OPPRO()
   DO OPCCP
   DO OPFCO
   respuesta='caja1#6#35#Gesti�n de Caja#3#\<Ingresos#\<Egresos#\<Correcciones#-#Lista \<por Pantalla#\<Lista por Impresora'
   =DEFPOP()
   ON SELE POPU CAJA1 DO CAJA1
   ACTI POPU CAJA1
   RELE POPU CAJA1
CASE BAR()=2
	=OPCCH()
	=OPCLI()
   respuesta='nada#5#30#Cheques#3#\<Ingresa#\<Corrige#-#Listado por \<Pantalla#Listado por \<Pantalla'
   =DEFPOP()
   ON SELE POPU NADA DO CHEQUE
   ACTI POPU NADA
   RELE POPU NADA
ENDCASE
RETURN MEN_LIN(BOTOM)
