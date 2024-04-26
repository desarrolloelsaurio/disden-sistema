********************************************************************************
*-- Programa: XEMP.PRG
*-- Fecha   : 11/02/90 11:48pm
*-- Version : G. REINER
*-- Notas   : RESTAURA ARCHIVO DE EMPLEADOS
********************************************************************************
ULPR=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
SELE EMP
SET FILTER TO
indice="EM"+LEFT(ptn[jannro],1)+'P'+SUBSTR(ptn[jannro],2,1)+'L'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
B="LE"+LEFT(ptn[jannro],1)+'G'+SUBSTR(ptn[jannro],2,1)+'A'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
DO CASE
   CASE BAR()=1
      @ 24,0 SAY PADC('Reindexando el Archivo de Empleados',80,'*') COLO SCHE 19
      REINDEX
   CASE BAR()=2
     @ 24,0 SAY PADC('Indexando el Archivo de Empleados',80,'*') COLO SCHE 19
indice="EM"+LEFT(ptn[jannro],1)+'P'+SUBSTR(ptn[jannro],2,1)+'L'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
B="LE"+LEFT(ptn[jannro],1)+'G'+SUBSTR(ptn[jannro],2,1)+'A'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
NUJ="CU"+LEFT(ptn[jannro],1)+'I'+SUBSTR(ptn[jannro],2,1)+'L'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
      INDEX ON APYNOM TO &INDICE
	  INDEX ON LEGAJO TO &B
	  INDEX ON NUJUB TO &NUJ
	  USE
   CASE BAR()=3
     @ 24,0 SAY PADC('Compactando el Archivo de Empleados',80,'*') COLO SCHE 19
     PACK
   CASE BAR()=4
     DO AVDIS
	  USE
	  C=A+'.IDX'
	  D=A+'.FTP'
	  B=B+'.IDX'
	  E=A+'.DBF'
       ERASE &E
      ERASE &B
	  ERASE &C
	  ERASE &D
	  B=A+'.*'
     ! SUELDOS &B
     ! SUELDOS &B
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
DO OPEMP
RETURN
