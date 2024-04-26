********************************************************************************
*-- Programa: lhisi5.prg
*-- Fecha   : 06/09/91 06:18pm
*-- Version : g. reiner
*-- Notas   : impresion planilla de ley para obras sociales
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
acla='|'+PADC("Empleado",30)+'|Tipo y Nro Docum.|'+PADC("Sueldo",acdigi)+"|"
GOTO cn1 IN ret
acla=acla+PADC(ALLTRIM(ret->rettexto),acdigi)+"|"
IF cn2<>0
   GOTO cn2 IN ret
   acla=acla+PADC(ALLTRIM(ret->rettexto),acdigi)+"|"
ENDIF
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
_RMARGIN=largoim
_PLOFFSET=0
_ALIGNMENT='LEFT'
_PADVANCE="LINEFEEDS"
_PCOPIES=1
_WRAP=.F.
PRINTJOB
   ? tt STYLE 'u'
   ? ALLTRIM(janname) STYLE 'u'
   ?? 'P g N§   :' AT 60
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
   ?linea
   ? acla
   ? linea
   pl=emp->apynom
   lg=emp->legajo
   nrodo=emp->nrodoc
   tipodo=emp->tipodoc
   STORE 0 TO ttl0,ttl1,ttl2
   STORE 0 TO xtl0,xtl1,xtl2
   SCAN
      IF _PLINENO>63
         ? linea
         ? '|'
         ?? PADR('Subtotal',30)
         ?? '|'
         ?? SPACE(17)
         ?? '|'
         ?? STR(xtl0,acdigi,2)
         ?? "|"
         ?? STR(xtl1,acdigi,2)
         ?? '|'
         IF cn2<>0
            ?? STR(xtl2,acdigi,2)
            ?? '|'
         ENDIF
         EJECT PAGE
         _RMARGIN=largoim
         ?
         ??? CHR(18)
         ? tt+' - Continuaci¢n' STYLE 'u'
         ? ALLTRIM(janname) STYLE 'u'
         ?? 'P g N§   :' at 60
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
         ?linea
         ? acla
         ? linea
      ENDI
      IF pl<>emp->apynom
         RG=RECNO()
         SELE his
         SEEK lg
         IF FOUND()
            DO WHILE lg=his->legajo
               IF cn1=his->registro
                  ttl1=ttl1+ABS(his->monto)
               ELSE
                  ttl2=ttl2+ABS(his->monto)
               ENDIF
               SKIP
            ENDDO
            IF ttl1<>0 .OR. ttl2<>0
               ? '|'
               ?? pl
               ?? '|'
               ?? tdoc[tipodo]
               ?? ' '
               ?? nrodo
               ?? '|'
               ?? STR(ttl0,acdigi,2)
               xtl0=xtl0+ttl0
               ?? "|"
               ?? STR(ttl1,acdigi,2)
               xtl1=xtl1+ttl1
               ?? '|'
               IF cn2<>0
                  ?? STR(ttl2,acdigi,2)
                  ?? '|'
                  xtl2=xtl2+ttl2
               ENDIF
            ENDIF
         ENDIF
         SELE sue
         GOTO RG
         pl=emp->apynom
         lg=emp->legajo
         nrodo=emp->nrodoc
         tipodo=emp->tipodoc
         STORE 0 TO ttl0,ttl1,ttl2
      ENDIF
      STORE ttl0+sue->haberret+sue->adicret TO ttl0
   ENDSCAN
   RG=RECNO()
   SELE his
   SEEK lg
   IF FOUND()
      DO WHILE lg=his->legajo
         IF cn1=his->registro
            ttl1=ttl1+ABS(his->monto)
         ELSE
            ttl2=ttl2+ABS(his->monto)
         ENDIF
         SKIP
      ENDDO
      IF ttl1<>0 .OR. ttl2<>0
         ? '|'
         ?? pl
         ?? '|'
         ?? tdoc[tipodo]
         ?? ' '
         ?? nrodo
         ?? '|'
         ?? STR(ttl0,acdigi,2)
         xtl0=xtl0+ttl0
         ?? "|"
         ?? STR(ttl1,acdigi,2)
         xtl1=xtl1+ttl1
         ?? '|'
         IF cn2<>0
            ?? STR(ttl2,acdigi,2)
            ?? '|'
            xtl2=xtl2+ttl2
         ENDIF
      ENDIF
      STORE ttl0+sue->haberret+sue->adicret TO ttl0
   ENDIF
   ? linea
   ? '|'
   ?? PADR('Total',30)
   ?? '|'
   ?? SPACE(17)
   ?? '|'
   ?? STR(xtl0,acdigi,2)
   ?? "|"
   ?? STR(xtl1,acdigi,2)
   ?? '|'
   IF cn2<>0
      ?? STR(xtl2,acdigi,2)
      ?? '|'
   ENDIF
   _WRAP=.F.
   ?
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
RELE nda,casos,largo,largoim
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: LHISI5.PRG
