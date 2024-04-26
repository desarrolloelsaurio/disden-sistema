********************************************************************************
*-- Programa: XGAS.PRG
*-- Fecha   : 10/27/90 10:46pm
*-- Version : G. REINER
*-- Notas   : RESTAURA ARCHIVO DE TIPO DE ADELANTO
********************************************************************************
ULPR=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
SELE GAS
SET FILTER TO
DO CASE
   CASE BAR()=1
      @ 24,0 SAY PADC('Reindexando el Archivo de Tipo de Adelanto',80,'*') COLO SCHE 19
      REINDEX
   CASE BAR()=2
     @ 24,0 SAY PADC('Indexando el Archivo de Tipo de Adelanto',80,'*') COLO SCHE 19
     INDEX ON empresa TO gasemp
     INDEX ON gasto to gasto
	  USE
   CASE BAR()=3
     @ 24,0 SAY PADC('Compactando el Archivo de Tipo de Adelanto',80,'*') COLO SCHE 19
     PACK
   CASE BAR()=4
     DO AVDIS
	  USE
     ERASE GASTOS.DBF
     ERASE GASTO.IDX
     ERASE GASEMP.IDX
     ! SUELDOS GASTOS.DBF
     ! SUELDOS GASTO.IDX
     ! SUELDOS GASEMP.IDX
RELE WIND WIN
CLEA
@ 0,0 SAY REPLICATE("Û",80) COLOR W
@ 0,1 SAY 'Sueldos y Jornales' COLOR I
@ 0,20 SAY '|'
@ 0,22 SAY DATE() COLOR I
@ 0,32 SAY '|'
@ 0,34 SAY TIME() COLOR I
@ 0,44 SAY '|'
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 0,58 SAY '|'
@ 0,60 SAY PADL(janname,19,' ') COLOR I
ENDCASE
=OPGAS()
RETURN
