*!*********************************************************************
*!
*!      Procedure: LCAMI1.PRG
*!
*!      Called by: LCAMI.PRG      (procedure in PROCESOS.PRG)
*!
*!          Calls: IMPRESOR       (procedure in PROCESOS.PRG)
*!               : ABPR           (procedure in PROCESOS.PRG)
*!               : HLP            (procedure in PROCESOS.PRG)
*!
*!*********************************************************************
********************************************************************************
*-- Programa: lcami1.prg
*-- Fecha   : 01/20/91 06:22pm
*-- Version : g. reiner
*-- Notas   : listado de cambios
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
@ 24,0 SAY PADC('IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe',80,'*') COLOR SCHE 19
STORE 0 TO casos
B='|'
acla='|  Legajo  |'+PADC("Empleado",30,' ')+B+PADC("A Abonar",acdigi,' ')+B
DIMENSION bilt[CANBIL]
FOR A=1 TO canbil
   acla=acla+PADC(ALLTRIM(STR(bils[a],10)),acdigi-3,' ')+B
NEXT
STORE 0 TO bilt,tt1
linea=REPL("=",LEN(acla))
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
_PSCODE='{27}{64}{27}{67}{72}'
_PLOFFSET=0
_RMARGIN=largoim
_PADVANCE="LINEFEEDS"
_PCOPIES=1
PRINTJOB
   ? 'PROGRAMA :LCAMI1'
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
   _WRAP=.T.
   _ALIGNMENT='CENTER'
   ? tt STYLE 'u'
   ? ALLTRIM(janname) STYLE 'u'
   ?
   ?linea
   ? acla
   ? linea
   SELE emp
   SET ORDER TO ordlis
   SCAN FOR &fisc
      IF _PLINENO>63
         ? linea
         ? '|Totales                                  |'
         ?? STR(tt1,acdigi,2)
         ?? B
         FOR A=1 TO canbil
            ?? STR(bilt[a],acdigi-3)
            ?? B
         NEXT
         EJECT PAGE
         ?
         ??? CHR(18)
         _RMARGIN=largoim
         ? 'PROGRAMA :LCAMI1'
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
      IF EMP->TOTAL<1
         ? B
         ?? legajo
         ?? B
         ?? apynom
         ?? B
         ?? PADC("NEGATIVO",LEN(ACLA)-44,'-')
         ?? '|'
      ELSE
      RESTO=EMP->TOTAL
      IF RESTO<>0
         ? B
         ?? legajo
         ?? B
         ?? apynom
         ?? B
         ?? STR(RESTO,acdigi,2)
         ?? B
         STORE tt1+RESTO TO tt1
         STORE casos+1 TO casos
         FOR A=1 TO canbil
            rst1=INT(RESTO/bils[a])
            rst2=MOD(RESTO,bils[a])
            STORE bilt[a]+rst1 TO bilt[a]
            ?? STR(rst1,acdigi-3)
            ?? B
            RESTO=rst2
         NEXT
      ENDIF
      ENDIF
   ENDSCAN
   ? linea
   ? '|Totales                                  |'
   ?? STR(tt1,acdigi,2)
   ?? B
   FOR A=1 TO canbil
      ?? STR(bilt[a],acdigi-3)
      ?? B
   NEXT
   ?
   _ALIGNMENT="LEFT"
   _WRAP=.F.
   ? "Cantidad de Casos:"
   ?? STR(casos,10)
   EJECT PAGE
   ?
ENDP
SET DEVI TO SCRE
SET CONS ON
SET PRINT OFF
SET MESS TO
ON KEY LABEL shift-f1 DO hlp
_RMARGIN=80
_WRAP=.T.
_ALIGNMENT='left'
_WRAP=.F.
RELE casos,B,largo,largoim,bilt,RESTO,rst1,rst2
@ 24,0 SAY SPACE(80)
RETURN
