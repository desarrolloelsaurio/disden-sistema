*********************************************************************************
*-- Programa: VARI.PRG
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
********************************************************************************
do case
case bar()=1
   do acpopu
case bar()=2
   do acancho.SPR
case bar()=3
   do achoja.SPR
case bar()=4
   do acdigi
CASE BAR()=5
   DO ACAUS
CASE BAR()=6
   DO ORDMER
case bar()=7
   do XANUM
case bar()=8
   do xamer
case bar()=9
   do ACCOTIZ
endcase
=MEN_LIN(BOTOM)
return
