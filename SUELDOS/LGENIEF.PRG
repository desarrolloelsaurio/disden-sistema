*:*********************************************************************
*:
*:        Program: LGENIEF.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: LHORI.PRG                     
*:
*:          Calls: IMPRESOR.PRG
*:               : ABPR           (procedure in PROCESOS.PRG)
*:               : HLP            (procedure in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 21:04               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: lgenieF.prg
*-- Fecha   : 09.09.90
*-- Version : g. reiner
*-- Notas   : impresion general por impresora con relacion y discriminaci¢n
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
acla='|'
STORE 0 TO casos
FOR cc=1 TO MAX
   acla=acla+co[CC]+'|'
NEXT
linea=REPL("=",LEN(acla))
largo=LEN(acla)
largoim=MIN(acancho,achoja)
ON KEY DO abpr
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
   ? 'PROGRAMA :LGENIEF'
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
   IF largo>largoim
      IF largoim>80
         _RMARGIN=233
      ELSE
         _RMARGIN=132
      ENDIF
      ??? CHR(15)
   ENDIF
   ? tt STYLE 'u'
   ? ALLTRIM(janname) STYLE 'u'
   ?
   IF LEN(acla)>80
      ?? CHR(27)
      ?? CHR(15)
   ENDIF
   ?linea
   ? acla
   ? linea
   SCAN FOR &fisc
      IF _PLINENO>63
         ? linea
         EJECT PAGE
         _RMARGIN=largoim
         ?
         ??? CHR(18)
         ? 'PROGRAMA :LGENIEF'
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
         IF largo>largoim
            IF largoim>80
               _RMARGIN=233
            ELSE
               _RMARGIN=132
            ENDIF
            ??? CHR(15)
         ENDIF
         ? tt+' - Continuaci¢n' STYLE 'u'
         ? ALLTRIM(janname) STYLE 'u'
         ?
         ?linea
         ? acla
         ? linea
      ENDI
      ? '|'
      FOR cc=1 TO MAX
         IF ct[CC]='*'
            IF &gt[CC]<>0
               GOTO &gt[CC] IN &gto[CC]
               ?? &ctt[CC]
            ELSE
               ?? SPACE(LEN(co[CC]))
            ENDIF
         ELSE
            ?? &ct[CC]
         ENDIF
         ?? '|'
      NEXT
      STORE casos+1 TO casos
   ENDSCAN
   ? linea
   _WRAP=.F.
   ?
   ? "Cantidad de Casos:"
   ?? STR(casos,10)
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
RELE acla,largo,largoim
RETURN
*: EOF: LGENIEF.PRG
