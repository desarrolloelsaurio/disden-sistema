********************************************************************************
*-- Programa: kar.prg
*-- Fecha   : 06/21/91 11:46am
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE kardex
********************************************************************************
ulpr=PROGRAM()
=CABPAN1()
=OPPRO()
do oprem
=OPKAR()
do opopk
STORE DATE() TO FECFIN,FECINI
sele kar
DO CASE
CASE BAR()=1
   DO ikar
CASE BAR()=3 .or. BAR()=4
   respuesta='LKARP#8#48#Listado de Kardex#3;
#\<Existencia por Remesa;
#Existencia por \<'+ruvro
   =defpop()
   ON SELE popu lkarp do lkar with bar()=3
   ACTI popu lkarp
   rele popu lkarp
CASE BAR()=6
   DO rndx WITH 12,20
   ON SELE POPU rndx DO xkar
   ACTI POPU rndx
	rele popu rndx
ENDCASE
ULPR=PROGRAM()
RETURN MEN_LIN(BOTOM)
