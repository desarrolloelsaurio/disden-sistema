******************************************************
*-- Programa: CTACTEP1.PRG
*-- Fecha   : 11-08-91 02:38pm
*-- Version : G. REINER
*-- Notas   : listado cuenta corriente de PROVEEDORES
*-- Modificaci¢n 05-04-92 02:58pm
*******************************************************
PARAMETER PORP
ULPR=PROGRAM()
=CABPAN1()
CTACTEC=BAR()
DO CASE
CASE BAR()=1
   DO LCCP WITH PORP
CASE BAR()=2
   DO LDEP WITH PORP
ENDCASE
RETURN MEN_LIN(BOTOM)
