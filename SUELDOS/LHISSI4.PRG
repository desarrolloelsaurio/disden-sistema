*******************************************************************************
*-- Programa: LHISSI4.prg
*-- Fecha   : 04/26/91 07:56pm
*-- Version : G. REINER
*-- Notas   : genera planilla de historica de Sueldos (un solo concepto)
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 0,60 SAY LEFT(janname,19) COLOR I
SELE JAN
GOTO JANNRO
@ 24,0 SAY PADC(" Calculando Planilla ",80,'*') COLOR SCHE 19
DIMENSION gas[12],ttgas[12],lnea[12]
STORE 0 TO ttgas,RG,fl
SELE sue
GOTO TOP
tit=tt+' del mes de '+meses[jodesh1]
veces=11
SEPA=IIF(acdigi/2=INT(acdigi/2),1,2)
largo=43+veces*(acdigi+1+SEPA)
largoim=MIN(acancho,achoja)
largoim1=largoim*1.65
B='|'
ON KEY DO abpr
SET PRINTER TO NADA.TXT
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
_wrap=.F.
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
   ? jan.empresa
   IF .NOT. EMPTY(jan.plusuno)
      ?? ' - '
      ?? ALLTRIM(jan.plusuno)
   ENDIF
   ? jan.domicilio
   IF .NOT. EMPTY(jan.plusdos)
      ?? ' - '
      ?? ALLTRIM(jan.plusdos)
   ENDIF
   ? jan.localidad
   IF .NOT. EMPTY(jan.plustres)
      ?? ' - '
      ?? ALLTRIM(jan.plustres)
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
   ? SPACE(12)
   ?? SPACE(30)
   ?? '-'
   FOR A=1 TO veces
      ?? REPL('-',acdigi+SEPA)
   NEXT
   **** TEXTOS ****
   ? ' '
   ?? SPACE(10)
   ?? ' '
   ?? SPACE(30)
   ?? B
   FOR A=jodesh1 TO jodesh2
      ?? PADC(meses[a],(acdigi+SEPA)*veces-1)
      ?? B
   NEXT A
   ? REPL('-',12)
   ?? REPL('-',31)
   FOR A=1 TO veces
      ?? REPL('-',acdigi+SEPA)
   NEXT
   ? B
   ?? PADC("Legajo",10,' ')
   ?? B
   ?? PADC("Apellido y Nombre Empleado",30," ")
   ?? B
      ?? PADC('1¦ Quincena',(acdigi+1)*5-1)
      ?? REPL("|",SEPA)
      ?? PADC('2¦ Quincena',(acdigi+1)*5-1)
      ?? REPL("|",SEPA)
?? space(acdigi)
?? b
         ? REPL('-',12)
   ?? REPL('-',31)
   FOR A=1 TO veces
      ?? REPL('-',acdigi+SEPA)
   NEXT
      ? B
   ?? space(10)
   ?? B
   ?? space(30)
   ?? B
   FOR A=1 TO 2
      ?? PADC('Haberes c/Desc.',acdigi)
      ?? REPL("|",SEPA)
      ?? PADC('Haberes s/Desc',acdigi)
      ?? REPL("|",SEPA)
      ?? PADC('Adic. c/Desc.',acdigi)
      ?? REPL("|",SEPA)
      ?? PADC('Adic. s/Desc',acdigi)
      ?? REPL("|",SEPA)
      ?? PADC('Total Quincena',acdigi)
      ?? REPL("|",SEPA)
   NEXT A
   ?? PADC("TOTALES",acdigi,' ')
   ?? REPL("|",SEPA)
   ? REPL('-',12)
   ?? REPL('-',31)
   FOR A=1 TO veces
      ?? REPL('-',acdigi+SEPA)
   NEXT
   ***************************************************************
   SCAN
      IF _PLINENO=_PLENGTH-4
         **** IMPRIME SUBTOTALES
         ? REPL('-',12)
         ?? REPL('-',31)
         FOR A=1 TO veces
            ?? REPL('-',acdigi+SEPA)
         NEXT
         ? B
         ?? 'SUBTOTALES'
         ?? SPACE(31)
         ?? B
         FOR A=1 to 11
            ?? STR(ttgas[A],acdigi,2)
            ?? REPL("|",SEPA)
         NEXT
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
         ? jan.empresa
         IF .NOT. EMPTY(jan.plusuno)
            ?? ' - '
            ?? ALLTRIM(jan.plusuno)
         ENDIF
         ? jan.domicilio
         IF .NOT. EMPTY(jan.plusdos)
            ?? ' - '
            ?? ALLTRIM(jan.plusdos)
         ENDIF
         ? jan.localidad
         IF .NOT. EMPTY(jan.plustres)
            ?? ' - '
            ?? ALLTRIM(jan.plustres)
         ENDIF
         **** TITULO ****
   IF largo>largoim
      ??? CHR(15)
   ENDIF
   ? SPACE(12)
   ?? SPACE(30)
   ?? '-'
   FOR A=1 TO veces
      ?? REPL('-',acdigi+SEPA)
   NEXT
   **** TEXTOS ****
   ? ' '
   ?? SPACE(10)
   ?? ' '
   ?? SPACE(30)
   ?? B
   FOR A=jodesh1 TO jodesh2
      ?? PADC(meses[a],(acdigi+SEPA)*veces-1)
      ?? B
   NEXT A
   ? REPL('-',12)
   ?? REPL('-',31)
   FOR A=1 TO veces
      ?? REPL('-',acdigi+SEPA)
   NEXT
   ? B
   ?? PADC("Legajo",10,' ')
   ?? B
   ?? PADC("Apellido y Nombre Empleado",30," ")
   ?? B
      ?? PADC('1¦ Quincena',(acdigi+1)*5-1)
      ?? REPL("|",SEPA)
      ?? PADC('2¦ Quincena',(acdigi+1)*5-1)
      ?? REPL("|",SEPA)
?? space(acdigi)
?? b
         ? REPL('-',12)
   ?? REPL('-',31)
   FOR A=1 TO veces
      ?? REPL('-',acdigi+SEPA)
   NEXT
      ? B
   ?? space(10)
   ?? B
   ?? space(30)
   ?? B
   FOR A=1 TO 2
      ?? PADC('Haberes c/Desc.',acdigi)
      ?? REPL("|",SEPA)
      ?? PADC('Haberes s/Desc',acdigi)
      ?? REPL("|",SEPA)
      ?? PADC('Adic. c/Desc.',acdigi)
      ?? REPL("|",SEPA)
      ?? PADC('Adic. s/Desc',acdigi)
      ?? REPL("|",SEPA)
      ?? PADC('Total Quincena',acdigi)
      ?? REPL("|",SEPA)
   NEXT A
   ?? PADC("TOTALES",acdigi,' ')
   ?? REPL("|",SEPA)
   ? REPL('-',12)
   ?? REPL('-',31)
   FOR A=1 TO veces
      ?? REPL('-',acdigi+SEPA)
   NEXT
      ENDIF
      STORE 0 TO tt,tthorp
      pl=sue.empleado
      GOTO sue.empleado IN emp
      ? B
      ?? emp.legajo
      ?? B
      ?? emp.apynom
      ?? B
      STORE 0 TO lnea,ttg
      DO WHILE pl=empleado
         if sue.quincena=1
         store sue.haberret to lnea[1]
         store sue.habersin to lnea[2]
         store sue.adicret to lnea[3]
         store sue.adicsin to lnea[4]
         store lnea[1]+lnea[2]+lnea[3]+lnea[4] to lnea[5]
         store lnea[5] to lnea[11]
         else
         store sue.haberret to lnea[6]
         store sue.habersin to lnea[7]
         store sue.adicret to lnea[8]
         store sue.adicsin to lnea[9]
         store lnea[6]+lnea[7]+lnea[8]+lnea[9] to lnea[10]
         store lnea[11]+lnea[10] to lnea[11]
         endif
         SKIP
      ENDDO
      FOR A=1 TO 11
        ?? str(lnea[a],acdigi,2)
        ?? '|'
        ttgas[a]=ttgas[a]+lnea[a]
      NEXT
      SKIP -1
   ENDSCAN
   ? REPL('-',12)
   ?? REPL('-',31)
   FOR A=1 TO veces
      ?? REPL('-',acdigi+SEPA)
   NEXT
   **** IMPRIME SUBTOTALES ****
   ? B
   ?? 'TOTALES   '
   ?? SPACE(31)
   ?? B
   STORE 0 TO nada
   FOR A=1 to 11
      ?? STR(ttgas[A],acdigi,2)
      ?? REPL("|",SEPA)
   NEXT
   EJECT PAGE
   ?
ENDP
SET DEVI TO SCRE
SET CONS ON
SET PRINTER OFF
SET PRINTER TO
ON KEY LABEL shift-f1 DO hlp
SELE sue
SET INDEX TO
@ 24,0 SAY SPACE(80)
RETURN
