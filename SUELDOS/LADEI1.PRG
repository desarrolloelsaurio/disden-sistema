********************************************************************************
*-- Programa: ladei1.prg
*-- Fecha   : 01/17/91 03:11pm
*-- Version : G. REINER
*-- Notas   : lista planilla adjunta de adelantos que acompa¤a a Recibo de suel.
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
A=PATH+'\INDIDX1'
B='|'
INDEX ON legajo+STR(registro,4)+legajo FOR filtcon>70 TO &a
acla=B+PADC("Tipo de Adelanto",20,' ')+B+PADC("N§ Recibo",10,' ')+B+PADC("Monto",acdigi,' ')+B
linea=REPL("=",LEN(acla))
largo=LEN(acla)
largoim=MIN(achoja,acancho)
ON KEY DO abpr
SET DEVICE TO PRINT
SET CONSOLE OFF
SET PRINTER ON
_PEJECT="NONE"
_PLENGTH=36
_PLINENO=0
_PAGENO=1
_PSCODE='{27}{64}{27}{67}{36}'
_PLOFFSET=0
_RMARGIN=largoim
_PADVANCE="LINEFEEDS"
_PCOPIES=1
tt="Adelantos Descontados en Per¡odo "+ALLTRIM(peraliq)
GOTO TOP
GOTO liq->empleado IN emp
PRINTJOB
   DO pagehead
   ? 'PROGRAMA :LADEI1'
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
   _WRAP=.T.
   _ALIGNMENT='CENTER'
   ? tt STYLE 'u'
   ? liq->legajo+' - '+ALLTRIM(emp->apynom)
   ?
   ?linea
   ? acla
   ? linea
   STORE 0 TO ttl

   ea=empleado
   SCAN
      IF empleado<>ea
         ? linea
         ? "Total:"
         ?? STR(ttl,acdigi,2)
         ? linea
         ea=empleado
         DO WHILE _PLINENO<32
            ?
         ENDDO
         ? REPL("-",largoim)
         EJECT PAGE
         _RMARGIN=largoim
         ?
         ??? CHR(18)
         DO pagehead
         GOTO liq->empleado IN emp
         ? 'PROGRAMA :LADEI1'
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
         _WRAP=.T.
         _ALIGNMENT='CENTER'
         ? tt STYLE 'u'
         ? liq->legajo+' - '+ALLTRIM(emp->apynom)
         ?
         ?linea
         ? acla
         ? linea
         STORE 0 TO ttl
      ENDIF
      IF _PLINENO>63
         ? linea
         EJECT PAGE
         _RMARGIN=largoim
         ?
         ??? CHR(18)
         ? 'PROGRAMA :LADEI1'
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
         _WRAP=.T.
         _ALIGNMENT='CENTER'
         ? tt+' - Continuaci¢n' STYLE 'u'
         ? liq->legajo+' - '+ALLTRIM(emp->apynom)
         ?
         ?linea
         ? acla
         ? linea
      ENDI
      ? B
      GOTO liq->registro IN gas
      ?? gas->gasto
      ?? B
      ?? STR(liq->valor,10)
      ?? B
      ?? STR(ABS(liq->monto),acdigi,2)
      ?? B
      STORE ttl+ABS(liq->monto) TO ttl
   ENDSCAN
   ? linea
   ? "Sueldo Neto    :"
   ?? STR(emp->total,acdigi,2)
   ? "Total Adelantos:"
   ?? STR(ttl,acdigi,2)
   ? "Neto a Percibir:"
   ?? STR(emp->total-ttl,acdigi,2)
   ? linea
   _ALIGNMENT="LEFT"
   _WRAP=.F.
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
_ALIGNMENT='left'
_WRAP=.F.
RELE casos,ttl,largo,largoim
@ 24,0 SAY SPACE(80)
RETURN
