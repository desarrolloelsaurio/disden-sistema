*********************************************************************************
*-- Programa: ctactec2.prg
*-- Fecha   : 11-08-91 06:28pm
*-- Version : G. REINER
*-- Notas   : listado cuenta corriente de clientes por impresora
*-- VERSION ARGENTA
********************************************************************************
ulpr=program()
=cabpan1()
DO CASE
CASE BAR()=1
   DO LCCL WITH .F.
CASE BAR()=2
   DO LCCH WITH .F.
CASE BAR()=3
	 DO LAGR WITH .F.
CASE BAR()=4
	 DO LPAT WITH .F.
CASE BAR()=5
   DO LDEU WITH .F.
ENDCASE
=MEN_LIN(BOTOM)
RETURN
