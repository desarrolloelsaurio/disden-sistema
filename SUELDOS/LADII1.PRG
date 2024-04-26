********************************************************************************
*-- Programa: LADII1.prg
*-- Fecha   : 03/06/91 05:53pm
*-- Version : g. reiner
*-- Notas   : impresion general por impresora
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
_PLINENO=0
_PAGENO=1
_PSCODE='{27}{64}{27}{67}{72}{18}'
_PLOFFSET=0
_RMARGIN=largoim
_PADVANCE="LINEFEEDS"
_PCOPIES=1
PRINTJOB
   ? 'PROGRAMA :LADII1'
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
   SCAN
      IF _PLINENO>63
         ? linea
         EJECT PAGE
         ?
         ??? CHR(18)
         _RMARGIN=largoim
         ? 'PROGRAMA :LADII1'
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
      ?? STR(RECNO(),3)
      ?? '|'
      ?? adicional
      ?? '|'
      IF dijo=2
         ?? LEFT(adiformqui,107)+SPACE(107-LEN(LEFT(adiformqui,107)))
      ELSE
         ?? LEFT(adiformmes,107)+SPACE(107-LEN(LEFT(adiformmes,107)))
      ENDIF
      ?? '|'
      STORE casos+1 TO casos
   ENDSCAN
   ? linea
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
_WRAP=.F.
RELE casos,largo,largoim
@ 24,0 SAY SPACE(80)
RETURN
