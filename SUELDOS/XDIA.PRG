********************************************************************************
*-- Programa: XDIA
*-- Fecha   : 04/10/91 04:39pm
*-- Version : G. REINER
*-- Notas   : RESTAURA ARCHIVO DE HORAS TRABAJADAS DIARIAS
********************************************************************************
ULPR=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
SELE DIA
SET FILTER TO
DO CASE
   CASE BAR()=1
      @ 24,0 SAY PADC('Reindexando el Archivo de Horas Trabajadas Diarias',80,'*') COLO SCHE 19
      REINDEX
   CASE BAR()=2
     @ 24,0 SAY PADC('Indexando el Archivo de Horas Trabajadas Diarias',80,'*') COLO SCHE 19
indice="DI"+LEFT(ptn[jannro],1)+'A'+SUBSTR(ptn[jannro],2,1)+'S'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
     INDEX ON LEGAJO+STR(THOR,4) TO &INDICE
	  USE
   CASE BAR()=3
     @ 24,0 SAY PADC('Compactando el Archivo de Horas Trabajadas Diarias',80,'*') COLO SCHE 19
     PACK
   CASE BAR()=4
     DO AVDIS
	  USE
indice="DI"+LEFT(ptn[jannro],1)+'A'+SUBSTR(ptn[jannro],2,1)+'S'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
a=indice+'.dbf'
b=indice+'.idx'
b=indice+'.*'
     ERASE &a
     ERASE &b
     ! SUELDOS &c
CLEA
RELE WIND WIN
CLEA
@ 0,0 SAY REPLICATE("�",80) COLOR W
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
DO OPdia
RETURN
