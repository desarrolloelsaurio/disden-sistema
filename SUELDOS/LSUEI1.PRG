*!*********************************************************************
*!
*!      Procedure: LSUEI1.PRG
*!
*!      Called by: LSUEI.PRG      (procedure in PROCESOS.PRG)
*!               : LSUEI2.PRG     (procedure in PROCESOS.PRG)
*!
*!          Calls: IMPRESOR       (procedure in PROCESOS.PRG)
*!               : ABPR           (procedure in PROCESOS.PRG)
*!               : HLP            (procedure in PROCESOS.PRG)
*!
*!    Other Files: FILE
*!
*!*********************************************************************
********************************************************************************
*-- Programa: lsuei1
*-- Fecha   : 09.09.90
*-- Version : g. reiner
*-- Notas   : impresion sueldos pagados por impresora
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
B='|'
acla=B
STORE 67 TO mxrn
STORE 0 TO casos,NEGA
FOR cc=1 TO MAX
   STORE 0 TO ct[CC]
   acla=acla+co[CC]+'|'
NEXT
linea=REPL("=",LEN(acla))
largo=LEN(acla)
largoim=MIN(achoja,acancho)
ON KEY DO abpr
IF (largoim=80 .AND. largo>pds[1]) .OR. (largoim=132 .AND. largo>pds[2])
   A=PATH+"\PL"+LEFT(ptn[jannro],1)+'A'+SUBSTR(ptn[jannro],2,1)+'N'+RIGHT(ptn[jannro],1)+LEFT(janname,1)+'.TXT'
   ACTI SCRE
   @ 24,0 SAY PADC("Imprimiendo Listado en Archivo "+ALLTRIM(A),80) COLO SCHE 19
   SET PRINTER TO FILE &a
   IF largoim>80
      mxrn=85
   ELSE
      mxrn=48
   ENDIF
ENDIF
SET DEVICE TO PRINT
SET CONSOLE OFF
SET PRINTER ON
_PEJECT="NONE"
_PLENGTH=mxrn+5
_PLINENO=0
_PAGENO=1
_PSCODE='{27}{64}{27}{67}{'+ALLTRIM(STR(_PLENGTH))+'}'
_PLOFFSET=0
_ALIGNMENT='LEFT'
IF largo>_RMARGIN
   IF largo>255
      _RMARGIN=255
   ELSE
      _RMARGIN=largo+4
   ENDIF
ENDIF
_PADVANCE="LINEFEEDS"
_PCOPIES=1
PRINTJOB
   ? 'PROGRAMA :LSUEI1'
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
   IF largo>largoim
      ??? CHR(15)
   ENDIF
   ?linea
   ? acla
   ? linea
   SELE emp
   SET ORDER TO ordlis
   SCAN FOR &fisc
      IF _PLINENO>mxrn
         ? linea
         ? 'Subtotales                 |'
         ?? STR(ct[3],acdigi,2)
         ?? B
         ?? STR(ct[4],acdigi,2)
         ?? B
         ?? STR(ct[5],acdigi,2)
         ?? B
         ?? STR(ct[6],acdigi,2)
         ?? B
         ?? STR(ct[7],acdigi-1,2)
         ?? B
         ?? STR(ct[8],acdigi-1,2)
         ?? B
         ?? STR(ct[9],7,2)
         ?? B
         ?? STR(ct[10],acdigi,2)
         ?? B
         ?? STR(ct[11],acdigi-1,2)
         ?? B
         ?? STR(ct[12],acdigi,2)
         ?? B
         EJECT PAGE
         _WRAP=.F.
         ?
         ??? CHR(18)
         ? 'PROGRAMA :LSUEI1'
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
         IF largo>largoim
            ??? CHR(15)
         ENDIF
         ?linea
         ? acla
         ? linea
      ENDI
      STORE casos+1 TO casos
      ? B
      ?? legajo
      ?? B
      ?? LEFT(apynom,15)
      ?? B
      ?? STR(haberret,acdigi,2)
      STORE ct[3]+haberret TO ct[3]
      ?? B
      ?? STR(habersin,acdigi,2)
      STORE ct[4]+habersin TO ct[4]
      ?? B
      ?? STR(adicret,acdigi,2)
      STORE ct[5]+adicret TO ct[5]
      ?? B
      ?? STR(adicsin,acdigi,2)
      STORE ct[6]+adicsin TO ct[6]
      ?? B
      ?? STR(reten,acdigi-1,2)
      STORE ct[7]+reten TO ct[7]
      ?? B
      ?? STR(salar,acdigi-1,2)
      STORE ct[8]+salar TO ct[8]
      ?? B
      ?? STR(emp->redondeo,7,2)
      STORE ct[9]+emp->redondeo TO ct[9]
      ?? B
      ?? STR(TOTAL,acdigi,2)
      STORE ct[10]+TOTAL TO ct[10]
      ?? B
      ?? STR(adelan,acdigi-1,2)
      STORE ct[11]+adelan TO ct[11]
      ?? B
		if emp->total>0
      	?? STR(emp->total,acdigi,2)
      	STORE ct[12]+TOTAL TO ct[12]
		else
      	?? padc("NEGATIVO",acdigi,"-")
			STORE NEGA+1 TO NEGA
		endif
      ?? B
   ENDSCAN
   ? linea
   ? 'Totales                    |'
   ?? STR(ct[3],acdigi,2)
   ?? B
   ?? STR(ct[4],acdigi,2)
   ?? B
   ?? STR(ct[5],acdigi,2)
   ?? B
   ?? STR(ct[6],acdigi,2)
   ?? B
   ?? STR(ct[7],acdigi-1,2)
   ?? B
   ?? STR(ct[8],acdigi-1,2)
   ?? B
   ?? STR(ct[9],7,2)
   ?? B
   ?? STR(ct[10],acdigi,2)
   ?? B
   ?? STR(ct[11],acdigi-1,2)
   ?? B
   ?? STR(ct[12],acdigi,2)
   ?? B
   _WRAP=.F.
   ?
   ? "Cantidad de Casos          :"
   ?? STR(casos,10)
   if nega<>0
   ? "Cantidad de Casos Negativos:"
   ?? STR(nega,10)
   endif
   EJECT PAGE
   ?
ENDP
ON KEY LABEL shift-f1 DO hlp
SET DEVI TO SCRE
SET CONS ON
SET PRINT OFF
SET PRIN TO
SET MESS TO
_RMARGIN=80
_WRAP=.T.
_alignement='left'
_WRAP=.F.
@ 24,0 SAY SPACE(80)
RELE largo,largoim,B,tt,acla,mxrn
RETURN
