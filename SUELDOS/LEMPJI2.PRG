*:*********************************************************************
*:
*:        Program: LEMPJI2.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: LEMPJI.PRG                    
*:
*:          Calls: IMPRESOR.PRG
*:               : ABPR           (procedure in PROCESOS.PRG)
*:               : PGH1.PRG
*:               : HLP            (procedure in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 21:01               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: lempji2.prg
*-- Fecha   : 01/22/91 01:08pm
*-- Version : g. reiner
*-- Notas   : Impresi¢n de Legajos
********************************************************************************
ff=RECNO()
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO WHILE .NOT. PRIN()
   DO impresor
   IF LAST()=27
      RETURN TO MASTER
   ENDIF
ENDDO
@ 24,0 SAY PADC('IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe',80,'*') COLO SCHE 19
ON KEY DO abpr
largoim=80
SET DEVICE TO PRINT
SET CONSOLE OFF
SET PRINTER ON
_PEJECT="NONE"
_PLENGTH=72
_RMARGIN=80
_PLINENO=0
_PAGENO=1
_PSCODE='{27}{64}{27}{67}{72}{18}'
_PLOFFSET=0
_ALIGNMENT='LEFT'
_RMARGIN=largoim
_PADVANCE="LINEFEEDS"
_PCOPIES=1
PRINTJOB
   _PAGENO=1
   prx=64
   ? 'PROGRAMA :LEMPJI2'
   ?? SPACE(47)
   ? 'FECHA    :'
   ?? DATE()
   ?? SPACE(13)
   ?? 'HORA     :'
   ?? TIME()
   ?? SPACE(13)
   ?? 'P g N§   :'
   ?? STR(_PAGENO,5)
   ?
   ? 'EMPLEADO:'
   ?? emp->apynom
   ? 'LEGAJO  :'
   ?? emp->legajo
   ? REPL("-",80)
   ON PAGE AT LINE 69 DO pgh1
   ? texto
   ? REPL("-",80)
   ON PAGE
   EJECT PAGE
   ?
ENDP
ON KEY LABEL shift-f1 DO hlp
SET DEVI TO SCRE
SET CONS ON
SET PRINT OFF
SET MESS TO
_RMARGIN=80
_WRAP=.T.
_alignement='left'
_WRAP=.F.
@ 24,0 SAY SPACE(80)
RELE acla,largo,largoim,prx
ON PAGE
RETURN
*: EOF: LEMPJI2.PRG
