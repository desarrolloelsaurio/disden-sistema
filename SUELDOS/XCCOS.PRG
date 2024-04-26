*******************************************************************************
*-- Programa: XCCOS.PRG
*-- Fecha   : October 21, 1990
*-- Version : G. REINER
*-- Notas   : RESTAURA ARCHIVO DE CENTROS DE COSTOS
********************************************************************************
ULPR=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
SELE CCOS
SET FILTER TO
DO CASE
   CASE BAR()=1
     @ 24,0 SAY PADC('Reindexando el Archivo de Centro de Costos',80,'*') COLO SCHE 19
     REINDEX
   CASE BAR()=2
     @ 24,0 SAY PADC('Indexando el Archivo de Centro de Costos',80,'*') COLO SCHE 19
     INDEX ON CENCOS TO CENCOS
	  USE
   CASE BAR()=3
     @ 24,0 SAY PADC('Compactando el Archivo de Centro de Costos',80,'*') COLO SCHE 19
     PACK
   CASE BAR()=4
     DO AVDIS
	  USE
     ERASE cencos.DBF
     ERASE cencos.IDX
     ! SUELDOS cencos.DBF
     ! SUELDOS cencos.IDX
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
DO OPCCOS
RETURN
