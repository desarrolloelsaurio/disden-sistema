*:*********************************************************************
*:
*:        Program: LDIAI3.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: LDIAI.PRG                     
*:
*:          Calls: IMPRESOR.PRG
*:               : ABPR           (procedure in PROCESOS.PRG)
*:               : HLP            (procedure in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 21:03               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: LDIAI3.prg
*-- Fecha   : 04/10/91 04:54pm
*-- Version : g. reiner
*-- Notas   : impresion HORAS TRABAJADAS DIARIAS POR DIA
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO WHILE .NOT. PRIN()
   DO impresor
   IF LAST()=27
      RETURN TO MASTER
   ENDIF
ENDDO
STORE RECC('THOR') TO canhors
DIME cntrl[CANHORS],ttl[CANHORS],lnea[CANHORS]
SELE dia
SCAN
   STORE .T. TO cntrl[THOR]
ENDSCAN
STORE 0 TO ttl
@ 24,0 SAY PADC('IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe',80,'*') COLOR SCHE 19
acla='|  Legajo  |'+PADC('Empleado',30)+'|'
SELE thor
SET ORDER TO
canhors=0
SCAN
   IF cntrl[recno()]
      acla=acla+PADC(ALLTRIM(thor->hortipohor),acdigi)+'|'
      STORE canhors+1 TO canhors
   ENDIF
ENDSCAN
SET ORDER TO 1
SELE dia
linea=REPL("=",LEN(acla))
linea1=REPL("-",LEN(acla))
largo=LEN(acla)
largoim=MIN(acancho,achoja)
ON KEY DO abpr
SET DEVICE TO PRINT
SET CONSOLE OFF
SET PRINTER ON
_PEJECT="NONE"
_PLENGTH=72
_PLINENO=0
_PAGENO=1
_PSCODE='{27}{64}{27}{67}{72}{18}'
_PLOFFSET=0
_RMARGIN=largoim
_PADVANCE="LINEFEEDS"
_PCOPIES=1
PRINTJOB
   ? 'PROGRAMA :LDIAI3'
   ?? SPACE(47)
   ? 'FECHA    :'
   ?? DATE()
   ?? SPACE(13)
   ?? 'HORA     :'
   ?? TIME()
   ?? SPACE(13)
   ?? 'P�g N�   :'
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
   _WRAP=.T.
   _ALIGNMENT='CENTER'
   ? tt STYLE 'u'
   ? ALLTRIM(janname) STYLE 'u'
   ?
   ?linea
   ? acla
   ? linea
   GOTO TOP
   mpl=dia->empleado
   STORE 0 TO lnea
   SCAN
      IF _PLINENO>63
         ? linea
         ? '|Subtotales '
         ?? SPACE(30)
         ?? '|'
         FOR A=1 TO RECC("THOR")
            IF cntrl[A]
               ?? STR(ttl[A],acdigi,2)
               ?? '|'
            ENDIF
         NEXT
         EJECT PAGE
         ?
         ??? CHR(18)
         _RMARGIN=largoim
         ? 'PROGRAMA :LDIAI3'
         ?? SPACE(47)
         ? 'FECHA    :'
         ?? DATE()
         ?? SPACE(13)
         ?? 'HORA     :'
         ?? TIME()
         ?? SPACE(13)
         ?? 'P�g N�   :'
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
         ? tt+' - Continuaci�n' STYLE 'u'
         ? ALLTRIM(janname) STYLE 'u'
         ?
         ?linea
         ? acla
         ? linea
      ENDIF
      IF mpl<>dia->empleado
         GOTO mpl IN emp
         ? '|'
         ?? emp->legajo
         ?? '|'
         ?? emp->apynom
         ?? '|'
         FOR A=1 TO RECC("THOR")
            IF cntrl[A]
               ?? STR(lnea[A],acdigi,2)
               ?? '|'
               STORE ttl[a]+lnea[a] TO ttl[a]
            ENDIF
         NEXT
         STORE 0 TO lnea
         STORE dia->empleado TO mpl
      ENDIF
      STORE dia->horas TO lnea[THOR]
   ENDSCAN
   GOTO mpl IN emp
   ? '|'
   ?? emp->legajo
   ?? '|'
   ?? emp->apynom
   ?? '|'
   FOR A=1 TO RECC("THOR")
      IF cntrl[A]
         ?? STR(lnea[A],acdigi,2)
         ?? '|'
         STORE ttl[a]+lnea[a] TO ttl[a]
      ENDIF
   NEXT
   ? linea
   ? '|Totales   |'
   ?? SPACE(30)
   ?? '|'
   FOR A=1 TO RECC("THOR")
      IF cntrl[A]
         ?? STR(ttl[A],acdigi,2)
         ?? '|'
      ENDIF
   NEXT
   ?
   _ALIGNMENT="LEFT"
   _WRAP=.F.
   EJECT PAGE
   ?
ENDP
SET DEVI TO SCRE
SET CONS ON
SET PRINT OFF
SET MESS TO
ON KEY LABEL shift-f1 DO hlp
_RMARGIN=80
_WRAP=.F.
RELE casos,largo,largoim
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: LDIAI3.PRG
