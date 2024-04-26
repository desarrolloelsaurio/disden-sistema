********************************************************************************
*-- Programa: XVAR.PRG
*-- Fecha   : October 29, 1990
*-- Version : G. REINER
*-- Notas   : RESTAURA ARCHIVO
********************************************************************************
ULPR=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
SELE VAR
SET FILTER TO
DO CASE
   CASE BAR()=1
      @ 24,0 SAY PADC('Reindexando el Archivo de Constantes',80,'*') COLO SCHE 19
      REINDEX
   CASE BAR()=2
     @ 24,0 SAY PADC('Indexando el Archivo de Constantes',80,'*') COLO SCHE 19
     INDEX ON nombre TO nombre
	  USE
   CASE BAR()=3
     @ 24,0 SAY PADC('Compactando el Archivo de Constantes',80,'*') COLO SCHE 19
     PACK
   CASE BAR()=4
     DO AVDIS
	  USE
     ERASE variable.dbf
     ERASE nombre.idx
     ! SUELDOS variable.dbf
     ! SUELDOS nombre.idx
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
DO OPVAR
RETURN
