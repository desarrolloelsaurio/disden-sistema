********************************************************************************
*-- Programa: VARI.PRG
*-- Fecha   : 10.8.90
*-- Version : G. REINER
*-- Notas   : DERIVA A ACTUALIZACION DE VARIABLES DEL SISTEMA
********************************************************************************
ulpr=PROGRAM()
@ 24,0 SAY PADC('Espere por Favor',80,' ')
@ 0,0 SAY REPLICATE("Û",80) COLOR W
@ 0,1 SAY 'Sueldos y Jornales' COLOR I
@ 0,20 SAY '|'
@ 0,22 SAY DATE() COLOR I
@ 0,32 SAY '|'
@ 0,34 SAY TIME() COLOR I
@ 0,44 SAY '|'
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 0,58 SAY '|'
@ 0,60 SAY LEFT(janname,19) COLOR I
DO CASE
CASE BAR()=1
   DO acpopu
CASE BAR()=2
   DO acancho
CASE BAR()=3
   DO achoja
CASE BAR()=4
   DO acredon
CASE BAR()=5
   DO actbil
CASE BAR()=6
   DO acaus
CASE BAR()=7
   DO adenrec
CASE BAR()=8
   DO imprec
CASE BAR()=9
   DO acform
CASE BAR()=10
   DO acdigi
CASE BAR()=11
   DO nuade
CASE BAR()=12
   DO moncon
CASE BAR()=13
   DO ordlis
CASE BAR()=14
   DO acttex
CASE BAR()=15
   DO actliq
CASE BAR()=16
   DO actagu
CASE BAR()=17
   DO calsac
ENDCASE
ulpr=PROGRAM()
RETURN
