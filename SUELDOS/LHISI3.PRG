*******************************************************************************
*-- Programa: Lhisi3.prg
*-- Fecha   : 04/26/91 04:31pm
*-- Version : G. REINER
*-- Notas   : genera planilla de historica de Conceptos (un solo hombre)
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 0,60 SAY LEFT(janname,19) COLOR I
@ 24,0 SAY PADC(" Calculando Planilla ",80,'*') COLOR SCHE 19
DIMENSION gas[26],ttgas[26],lnea[26]
STORE 0 TO ttgas,RG,fl
SELE his
GOTO TOP
IF BAR()=2
   IF jodesh1=jodesh2
      tit='Hist¢rica de '+titu[QUECOSA]+" de "+ALLTRIM(emp->apynom)+' del mes de '+meses[jodesh1]
   ELSE
      tit='Hist¢rica de '+titu[QUECOSA]+" de "+ALLTRIM(emp->apynom)+' entre '+meses[jodesh1]+' y '+meses[JODESH2]
   ENDIF
ELSE
   IF jodesh1=jodesh2
      tit='Hist¢rica de '+titu[QUECOSA]+" del mes de "+meses[jodesh1]
   ELSE
      tit='Hist¢rica de '+titu[QUECOSA]+" entre "+meses[jodesh1]+' y '+meses[JODESH2]
   ENDIF
ENDIF
if tipo=3
tit=tit+'-'+ALLTRIM(emp->apynom)+' ('+ALLTRIM(emp->legajo)+')'
endif
veces=(jodesh2-jodesh1+1)*2+1
SEPA=IIF(acdigi/2=INT(acdigi/2),1,2)
largo=43+veces*(acdigi+1+SEPA)
largoim=MIN(acancho,achoja)
largoim1=largoim*1.65
B='|'
ON KEY DO abpr
SET DEVICE TO PRINT
SET CONSOLE OFF
IF largo>largoim1
   A=PATH+"\PL"+LEFT(ptn[jannro],1)+'A'+SUBSTR(ptn[jannro],2,1)+'N'+RIGHT(ptn[jannro],1)+LEFT(janname,1)+'.TXT'
   SET PRINTER TO FILE &a
   SET PRINTER ON
   _PSCODE='{27}{64}{27}{67}{53}'
   IF largoim=80
      _PLENGTH=53
   ELSE
      _PLENGTH=90
   ENDIF
ELSE
   SET PRINTER ON
   _PLENGTH=72
   _PSCODE='{27}{64}{27}{67}{72}'
ENDIF
_PEJECT="NONE"
_PLINENO=1
_PAGENO=1
_PECODE='{27}{64}{27}{67}{72}'
_PLOFFSET=0
_RMARGIN=255
_PADVANCE="LINEFEEDS"
_PCOPIES=1
_WRAP=.F.
PRINTJOB
   **** EMPRESA ****
   ? 'PROGRAMA :'
   ?? ALLTRIM(ulpr)
   ?? SPACE(47)
   ? 'FECHA    :'
   ?? DATE()
   ?? SPACE(13)
   ?? 'HORA     :'
   ?? TIME()
   ? jan->empresa
   IF .NOT. EMPTY(jan->plusuno)
      ?? ' - '
      ?? ALLTRIM(jan->plusuno)
   ENDIF
   ? jan->domicilio
   IF .NOT. EMPTY(jan->plusdos)
      ?? ' - '
      ?? ALLTRIM(jan->plusdos)
   ENDIF
   ? jan->localidad
   IF .NOT. EMPTY(jan->plustres)
      ?? ' - '
      ?? ALLTRIM(jan->plustres)
   ENDIF
   **** TITULO ****
   ? 'PLANILLA '
   ?? tit
   ?? SPACE(20)
   ?? 'Pag:'
   ?? STR(_PAGENO,3)
   ?
   **** LINEA ****
   IF largo>largoim
      ??? CHR(15)
   ENDIF
   ?? SPACE(21)
   ?? '-'
   FOR A=1 TO veces-1
      ?? REPL('-',acdigi+SEPA)
   NEXT
   **** TEXTOS ****
   ? ' '
   ?? SPACE(20)
   ?? B
   FOR A=jodesh1 TO jodesh2
      ?? PADC(meses[a],(acdigi+SEPA)*2-1)
      ?? B
   NEXT A
   ? REPL('-',22)
   FOR A=1 TO veces
      ?? REPL('-',acdigi+SEPA)
   NEXT
   ? B
   ?? PADC(titu[QUECOSA],20)
   ?? B
   FOR A=jodesh1 TO jodesh2
      ?? PADC('1¦ Quincena',acdigi)
      ?? REPL("|",SEPA)
      ?? PADC('2¦ Quincena',acdigi)
      ?? REPL("|",SEPA)
   NEXT A
   ?? PADC("TOTALES",acdigi,' ')
   ?? REPL("|",SEPA)
   ? REPL('-',22)
   FOR A=1 TO veces
      ?? REPL('-',acdigi+SEPA)
   NEXT
   ***************************************************************
   SCAN
      IF _PLINENO=_PLENGTH-4
         **** IMPRIME SUBTOTALES
         ? REPL('-',22)
         FOR A=1 TO veces
            ?? REPL('-',acdigi+SEPA)
         NEXT
         ? B
         ?? 'SUBTOTALES'
         ?? SPACE(10)
         ?? B
         STORE 0 TO nada
         FOR A=jodesh1 TO jodesh2
            ?? STR(ttgas[(A-1)*2+1],acdigi,2)
            ?? REPL("|",SEPA)
            ?? STR(ttgas[(A-1)*2+2],acdigi,2)
            ?? REPL("|",SEPA)
            STORE nada+ttgas[(A-1)*2+1]+ttgas[(A-1)*2+2] TO nada
         NEXT
         ?? STR(nada,acdigi,2)
         ?? REPL("|",SEPA)
         EJECT PAGE
         **** IMPRIME TITULOS
         ? 'PROGRAMA :'
         ?? ALLTRIM(ulpr)
         ?? SPACE(47)
         ? 'FECHA    :'
         ?? DATE()
         ?? SPACE(13)
         ?? 'HORA     :'
         ?? TIME()
         ? jan->empresa
         IF .NOT. EMPTY(jan->plusuno)
            ?? ' - '
            ?? ALLTRIM(jan->plusuno)
         ENDIF
         ? jan->domicilio
         IF .NOT. EMPTY(jan->plusdos)
            ?? ' - '
            ?? ALLTRIM(jan->plusdos)
         ENDIF
         ? jan->localidad
         IF .NOT. EMPTY(jan->plustres)
            ?? ' - '
            ?? ALLTRIM(jan->plustres)
         ENDIF
         **** TITULO ****
         ? 'PLANILLA DE '
         ?? tit
         ?? SPACE(20)
         ?? 'Pag:'
         ?? STR(_PAGENO,3)
         ?
         **** LINEA ****
         IF largo>largoim
            ??? CHR(15)
         ENDIF
         ?? SPACE(21)
         ? '-'
         FOR A=1 TO veces-1
            ?? REPL('-',acdigi+SEPA)
         NEXT
         **** TEXTOS ****
         ?? SPACE(21)
         ?? B
         FOR A=jodesh1 TO jodesh2
            ?? PADC(meses[a],(acdigi+SEPA)*2-1)
            ?? B
         NEXT A
         ? REPL('-',22)
         FOR A=1 TO veces
            ?? REPL('-',acdigi+SEPA)
         NEXT
         ? B
         ?? PADC(titu[QUECOSA],20)
         ?? B
         FOR A=jodesh1 TO jodesh2
            ?? PADC('1¦ Quincena',acdigi)
            ?? REPL("|",SEPA)
            ?? PADC('2¦ Quincena',acdigi)
            ?? REPL("|",SEPA)
         NEXT A
         ?? PADC("TOTALES",acdigi,' ')
         ?? REPL("|",SEPA)
         ? REPL('-',22)
         FOR A=1 TO veces
            ?? REPL('-',acdigi+SEPA)
         NEXT
      ENDIF
      STORE 0 TO tt,tthorp
      pl=his->registro
      GOTO his->registro IN (ali[QUECOSA])
      ? B
      ?? &vrb[QUECOSA]
      ?? B
      STORE 0 TO lnea,ttg
      DO WHILE pl=registro
         IF tipo=4
            STORE lnea[(his->mes-1)*2+his->quincena]+his->unidad TO lnea[(his->mes-1)*2+his->quincena]
         ELSE
            STORE lnea[(his->mes-1)*2+his->quincena]+ABS(his->monto) TO lnea[(his->mes-1)*2+his->quincena]
         ENDIF
         SKIP
      ENDDO
      FOR A=jodesh1 TO jodesh2
         ?? STR(lnea[(a-1)*2+1],acdigi,2)
         ?? REPL("|",SEPA)
         ?? STR(lnea[(a-1)*2+2],acdigi,2)
         ?? REPL("|",SEPA)
         STORE ttg+lnea[(a-1)*2+2]+lnea[(a-1)*2+1] TO ttg
         ttgas[(A-1)*2+1]=ttgas[(A-1)*2+1]+lnea[(a-1)*2+1]
         ttgas[(A-1)*2+2]=ttgas[(A-1)*2+2]+lnea[(a-1)*2+2]
      NEXT
      ?? STR(ttg,acdigi,2)
      ?? REPL("|",SEPA)
      SKIP -1
   ENDSCAN
   ? REPL('-',22)
   FOR A=1 TO veces
      ?? REPL('-',acdigi+SEPA)
   NEXT
   **** IMPRIME SUBTOTALES ****
   ? B
   ?? 'TOTALES   '
   ?? SPACE(10)
   ?? B
   STORE 0 TO nada
   FOR A=jodesh1 TO jodesh2
      ?? STR(ttgas[(A-1)*2+1],acdigi,2)
      ?? REPL("|",SEPA)
      ?? STR(ttgas[(A-1)*2+2],acdigi,2)
      ?? REPL("|",SEPA)
      STORE nada+ttgas[(A-1)*2+1]+ttgas[(A-1)*2+2] TO nada
   NEXT
   ?? STR(nada,acdigi,2)
   ?? REPL("|",SEPA)
   EJECT PAGE
   ?
ENDP
SET DEVI TO SCRE
SET CONS ON
SET PRINTER OFF
SET PRINTER TO
ON KEY LABEL shift-f1 DO hlp
SELE his
SET INDEX TO
@ 24,0 SAY SPACE(80)
RETURN
