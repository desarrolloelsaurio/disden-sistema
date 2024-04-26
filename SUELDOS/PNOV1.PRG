********************************************************************************
*-- Programa: pnov1.prg
*-- Fecha   : 01/15/91 09:06pm
*-- Version : G. REINER
*-- Notas   : imprime planilla de ingreso de novedades
********************************************************************************
PARAMETER cosa,coteret,number,cosa1
STORE BAR() TO mierda
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO WHILE .NOT. PRIN()
   DO impresor
   IF LAST()=27
      RETURN TO MASTER
   ENDIF
ENDDO
A='IMPRIMIENDO LOS DATOS REQUERIDOS'
@ 24,0 SAY PADC(A,80,'*') COLO SCHE 19
SELE (number)
COUNT FOR &cosa1=jannro .OR. &cosa1=0 TO ct
largo=43+ct*(acdigi+1)
largoim=MIN(acancho,achoja)
ON KEY DO abpr
fa='NADA'
IF largo>233
   fa=PATH+"\PL"+LEFT(ptn[jannro],1)+'A'+SUBSTR(ptn[jannro],2,1)+'N'+RIGHT(ptn[jannro],1)+LEFT(janname,1)+'.TXT'
   A=A+' en ARCHIVO en DISCO'
   @ 24,0 SAY PADC(A,80,'*')
   IF achoja>80
      mxlin=49
      _PLENGTH=53
   ELSE
      mxlin=86
      _PLENGTH=90
   ENDIF
ELSE
   _PLENGTH=72
   mxlin=68
ENDIF
B='|'
IF largo<255
   acla='|  Legajo  |'+PADC("Empleado",30,' ')+B
   acla1='|'
   SELE (number)
   SCAN
      acla=acla+PADC(ALLTRIM(&cosa),acdigi,' ')+B
      acla1=acla1+SPACE(acdigi)+B
   ENDSCAN
   linea=REPL("-",LEN(acla))
ENDIF
_PEJECT="NONE"
_PLINENO=0
_PAGENO=1
_PSCODE='{27}{64}{27}{67}{'+ALLTRIM(STR(_PLENGTH,2))+'}'
_PLOFFSET=0
_RMARGIN=255
_PADVANCE="LINEFEEDS"
_PCOPIES=1
DO CASE
CASE mierda=2
   STORE 0 TO respuesta
   IF eliccos(" a Listar")<>0
      GOTO respuesta
      cecos=RECNO()
      A='IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe '
      @ 24,0 SAY PADC(A,80,'*') COLO SCHE 19
      SET DEVICE TO PRIN
      SET CONS OFF
      tt=coteret+' - C. Costos:'+ALLTRIM(ccos->cencos)
      IF fa<>"NADA"
         SET PRINTER TO FILE &fa
      ENDIF
      SET PRINTER ON
      PRINTJOB
         ??? CHR(18)
         ? 'PROGRAMA :PNOV2'
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
         ? tt STYLE 'u'
         ? ALLTRIM(janname) STYLE 'u'
         ?
         IF largo>largoim
            ??? CHR(15)
         ENDIF
         IF largo<255
            ?linea
            ? acla
            ? linea
         ELSE
            ? REPL("-",43)
            FOR A=1 TO ct
               ?? REPL("-",acdigi+1)
            NEXT
            ? "|  Legajo  |"+PADC("Empleado",30,' ')+B
            SELE (number)
            SCAN
               ?? PADC(ALLTRIM(&cosa),acdigi,' ')
               ?? B
            ENDSCAN
            ? REPL("-",43)
            FOR A=1 TO ct
               ?? REPL("-",acdigi+1)
            NEXT
         ENDIF
         DO pnov2
      ENDP
      ON KEY LABEL shift-f1 DO hlp
      IF fa<>"NADA"
         SET PRINTER TO
      ENDIF
      SET DEVI TO SCRE
      SET CONS ON
      SET PRINT OFF
      SET MESS TO
      _RMARGIN=80
      _WRAP=.F.
   ENDIF
CASE mierda=1
   A='IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe'
   @ 24,0 SAY PADC(A,80,'*') COLO SCHE 19
   SELE ccos
   SET DEVICE TO PRIN
   SET CONS OFF
   IF fa<>"NADA"
      SET PRINTER TO FILE &fa
   ENDIF
   SET PRINTER ON
   PRINTJOB
      SCAN
         tt=coteret+' - C. Costos:'+ALLTRIM(ccos->cencos)
         cecos=RECNO()
         ? 'PROGRAMA :PNOV2'
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
         ? tt STYLE 'u'
         ? ALLTRIM(janname) STYLE 'u'
         ?
         IF largo>largoim
            ??? CHR(15)
         ENDIF
         IF largo<255
            ?linea
            ? acla
            ? linea
         ELSE
            ? REPL("-",43)
            FOR A=1 TO ct
               ?? REPL("-",acdigi+1)
            NEXT
            ? "|  Legajo  |"+PADC("Empleado",30,' ')+B
            SELE (number)
            SCAN
               ?? PADC(ALLTRIM(&cosa),acdigi,' ')
               ?? B
            ENDSCAN
            ? REPL("-",43)
            FOR A=1 TO ct
               ?? REPL("-",acdigi+1)
            NEXT
         ENDIF
         DO pnov2
         SELE ccos
      ENDSCAN
      ON KEY LABEL shift-f1 DO hlp
      IF fa<>"NADA"
         SET PRINTER TO
      ENDIF
      SET DEVI TO SCRE
      SET CONS ON
      SET PRINT OFF
      SET MESS TO
      _RMARGIN=80
      _WRAP=.F.
   ENDP
ENDCASE
RELE casos,largo,ct,fa,mxlin,cecos,largoim
@ 24,0 SAY SPACE(80)
RELE mierda
RETURN
