********************************************************************************
*-- Programa: lHISI1.prg
*-- Fecha   : 04/25/91 09:46pm
*-- Version : g. reiner
*-- Notas   : impresion historico por impresora
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
acla='|  Legajo  |'+PADC("Empleado",30)+'|MES|QUI|'
IF quecosa=1 .OR. quecosa=4
   acla=acla+PADC(ALLTRIM(&vrb[quecosa]),acdigi)+"|"
ENDIF
acla=acla+PADC("Monto",acdigi)+'|'
tt='Listado '+titu[quecosa]+' - '
tt=tt+'MES '+meses[jodesh1]
IF jamesh<>"A"
   tt=tt+' - '+ALLTRIM(jamesh)
ENDIF
STORE 0 TO casos,uni,mon
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
_WRAP=.F.
PRINTJOB
   ? 'PROGRAMA :LHISI1'
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
         ? '|Subtotales '
         ?? SPACE(30)
         ?? '|   |   |'
         IF quecosa=1 .OR. quecosa=4
            ?? STR(uni,acdigi,2)
            ?? '|'
         ENDIF
         ?? STR(mon,acdigi,2)
         ?? '|'
         EJECT PAGE
         ?
         ??? CHR(18)
         _RMARGIN=largoim
         ? 'PROGRAMA :LHISI1'
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
      GOTO his->empleado IN emp
      ?? emp->legajo
      ?? '|'
      ?? emp->apynom
      ?? '|'
      ?? LEFT(meses[mes],3)
      ?? '|'
      ?? STR(quincena,3)
      ?? '|'
      IF quecosa=1 .OR. quecosa=4
         ?? STR(his->unidad,acdigi,2)
         STORE uni+his->unidad TO uni
         ?? '|'
      ENDIF
      ?? STR(ABS(his->monto),acdigi,2)
      STORE mon+ABS(his->monto) TO mon
      ?? '|'
      STORE casos+1 TO casos
   ENDSCAN
   ? linea
   ? '|Totales   |'
   ?? SPACE(30)
   ?? '|   |   |'
   IF quecosa=1 .OR. quecosa=4
      ?? STR(uni,acdigi,2)
      ?? '|'
   ENDIF
   ?? STR(mon,acdigi,2)
   ?? '|'
   _ALIGNMENT="LEFT"
   _WRAP=.F.
   ?
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
