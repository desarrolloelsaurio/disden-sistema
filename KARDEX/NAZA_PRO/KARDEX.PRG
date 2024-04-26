*********************************************************************************
*-- Programa: kardex.prg
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
********************************************************************************
ULPR=PROGRAM()
=CABPAN1()
DO CASE
CASE BAR()=1
   =opopk() .and. OPK()
CASE BAR()=2
   =OPOPK()
   =OPPRO()
   =OPMER()
   do opaviS
   do optelS
   do optal
   =OPKAR()
   RESPUESTA='Grl#4#30#Men£ de Kardex#3;
#\<Compras de Materia Prima;
#-;
#\<Borra;
#\<Calcula Saldos;
#\<Ajusta Stock al Kardex;
#-;
#\<Lista por Impresora;
#Lista \<por Pantalla;
#-;
#Res\<taura el Archivo'
   =DEFPOP()
   ON SELE popu grl DO kar
   ACTI popu grl
   rele popu grl
case bar()=3
   =OPKAR()
   do opaviS
   do optelS
   do optal
   DO OPREM
   DO OPEMP
   do remd
ENDCASE
UNLO ALL
RETURN men_lin(botom)
