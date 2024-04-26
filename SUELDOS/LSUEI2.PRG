*:*********************************************************************
*:
*:        Program: LSUEI2.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: LSUEI.PRG                     
*:
*:          Calls: LSUEI1.PRG
*:               : IMPRESOR.PRG
*:               : ABPR           (procedure in PROCESOS.PRG)
*:               : HLP            (procedure in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:55               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: lisue2.prg
*-- Fecha   : 01/14/91 06:40pm
*-- Version : G. REINER
*-- Notas   : listado resumen de sueldos pagados de todos los c. costos
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
MAX=12
DECL co[MAX],ct[MAX],cgtt[max],cgt[recc("CCOS"),max]
co[1]='  Legajo  '
co[2]=PADC('Empleado',15,' ')
co[3]=PADC('Hab. C/Desc',acdigi,' ')
co[4]=PADC('Hab. S/Desc',acdigi,' ')
co[5]=PADC('Adi. C/Desc',acdigi,' ')
co[6]=PADC('Adi. S/Desc',acdigi,' ')
co[7]=PADC('Retenciones',acdigi-1,' ')
co[8]=PADC('Salario Familiar',acdigi-1,' ')
co[9]=PADC('Redondeo',7,' ')
co[10]=PADC('Neto a Percibir',acdigi,' ')
co[11]=PADC('Adelantos',acdigi-1,' ')
co[12]=PADC('Pagado',acdigi,' ')
SELE ccos
SCAN
   algo=RECNO("CCOS")
   SELE emp
   LOCATE FOR emp->ccos=algo .AND. TOTAL<>0
   IF FOUND()
      fisc='emp->jan=jannro .and. emp->ccos=algo .and. total<>0'
      tt='Sueldos C. Costo:'+ALLTRIM(ccos->cencos)+' - Per¡odo '+peraliq
      DO lsuei1
      ulpr=PROGRAM()
      FOR A=1 TO 12
         cgt[algo,a]=ct[a]
      NEXT
   ELSE
      cgt[algo,1]=-9999
   ENDIF
   SELE ccos
ENDSCAN
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
tt='Resumen de Sueldos Pagados - Per¡odo:'+peraliq
DO WHILE .NOT. PRIN()
   DO impresor
   IF LAST()=27
      RETURN TO MASTER
   ENDIF
ENDDO
@ 24,0 SAY PADC('IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe',80,'*') COLO SCHE 19
B='|'
acla=B
STORE 0 TO casos
co[2]=PADC('Centro de Costos',20,' ')
FOR cc=2 TO MAX
   acla=acla+co[CC]+'|'
   cgtt[cc]=0
NEXT
largo=LEN(acla)
largoim=MIN(achoja,acancho)
linea=REPL("=",LEN(acla))
ON KEY DO abpr
SET DEVICE TO PRINT
SET CONSOLE OFF
SET PRINTER ON
_PEJECT="NONE"
_PLENGTH=72
_RMARGIN=80
_PLINENO=0
_PAGENO=1
_PSCODE='{27}{64}{27}{67}{72}'
_PLOFFSET=0
_ALIGNMENT='LEFT'
_RMARGIN=largoim
_PADVANCE="LINEFEEDS"
_PCOPIES=1
PRINTJOB
   ? 'PROGRAMA :LSUEI2'
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
   ? ALLTRIM(janname) STYLE 'u'
   ?
   ??? CHR(15)
   _WRAP=.F.
   ?linea
   ? acla
   ? linea
   SELE ccos
   SCAN
      algo=RECNO("CCOS")
      IF cgt[algo,1]<>-9999
         IF _PLINENO>63
            ? linea
            ? 'Subtotales           |'
            ?? STR(cgtt[3],acdigi,2)
            ?? B
            ?? STR(cgtt[4],acdigi,2)
            ?? B
            ?? STR(cgtt[5],acdigi,2)
            ?? B
            ?? STR(cgtt[6],acdigi,2)
            ?? B
            ?? STR(cgtt[7],acdigi-1,2)
            ?? B
            ?? STR(cgtt[8],acdigi-1,2)
            ?? B
            ?? STR(cgtt[9],7,2)
            ?? B
            ?? STR(cgtt[10],acdigi,2)
            ?? B
            ?? STR(cgtt[11],acdigi-1,2)
            ?? B
            ?? STR(cgtt[12],acdigi,2)
            ?? B
            STORE casos+1 TO casos
            EJECT PAGE
            ? CHR(18)
            ? 'PROGRAMA :LSUEI2'
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
            ? ALLTRIM(janname) STYLE 'u'
            ?
            IF largoim>largo
               ??? CHR(15)
            ENDIF
            _WRAP=.F.
            ?linea
            ? acla
            ? linea
         ENDI
         ? B
         ?? ccos->cencos
         ?? B
         ?? STR(cgt[algo,3],acdigi,2)
         STORE cgtt[3]+cgt[algo,3] TO cgtt[3]
         ?? B
         ?? STR(cgt[algo,4],acdigi,2)
         STORE cgtt[4]+cgt[algo,4] TO cgtt[4]
         ?? B
         ?? STR(cgt[algo,5],acdigi,2)
         STORE cgtt[5]+cgt[algo,5] TO cgtt[5]
         ?? B
         ?? STR(cgt[algo,6],acdigi,2)
         STORE cgtt[6]+cgt[algo,6] TO cgtt[6]
         ?? B
         ?? STR(cgt[algo,7],acdigi-1,2)
         STORE cgtt[7]+cgt[algo,7] TO cgtt[7]
         ?? B
         ?? STR(cgt[algo,8],acdigi-1,2)
         STORE cgtt[8]+cgt[algo,8] TO cgtt[8]
         ?? B
         ?? STR(cgt[algo,9],7,2)
         STORE cgtt[9]+cgt[algo,9] TO cgtt[9]
         ?? B
         ?? STR(cgt[algo,10],acdigi,2)
         STORE cgtt[10]+cgt[algo,10] TO cgtt[10]
         ?? B
         ?? STR(cgt[algo,11],acdigi-1,2)
         STORE cgtt[11]+cgt[algo,11] TO cgtt[11]
         ?? B
         ?? STR(cgt[algo,12],acdigi,2)
         STORE cgtt[12]+cgt[algo,12] TO cgtt[12]
         ?? B
         STORE casos+1 TO casos
      ENDIF
   ENDSCAN
   ? linea
   ? 'Totales              |'
   ?? STR(cgtt[3],acdigi,2)
   ?? B
   ?? STR(cgtt[4],acdigi,2)
   ?? B
   ?? STR(cgtt[5],acdigi,2)
   ?? B
   ?? STR(cgtt[6],acdigi,2)
   ?? B
   ?? STR(cgtt[7],acdigi-1,2)
   ?? B
   ?? STR(cgtt[8],acdigi-1,2)
   ?? B
   ?? STR(cgtt[9],7,2)
   ?? B
   ?? STR(cgtt[10],acdigi,2)
   ?? B
   ?? STR(cgtt[11],acdigi-1,2)
   ?? B
   ?? STR(cgtt[12],acdigi,2)
   ?? B
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
RELE co,ct,cgt,cgtt,algo,largo,largoim
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: LSUEI2.PRG
