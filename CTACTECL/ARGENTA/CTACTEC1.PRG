*********************************************************************************
*-- Programa: ctactec1.prg
*-- Fecha   : 11-08-91 02:38pm
*-- Version : G. REINER
*-- Notas   : listado cuenta corriente de clientes
*-- Modificaci¢n 05-04-92 02:58pm
*-- VERSION BALCALA
********************************************************************************
ulpr=program()
=cabpan1()
ctactec=bar()
DO CASE
CASE BAR()=1
   DO LCCL WITH .T.
CASE BAR()=2
   DO LCCH WITH .T.
CASE BAR()=3
	 DO LAGR WITH .T.
CASE BAR()=4
	 DO LPAT WITH .T.
CASE BAR()=5
   DO LDEU WITH .T.
ENDCASE
=MEN_LIN(BOTOM)
RETURN
