PROCEDURE LHORI7
ulpr=PROGRAM()
STORE 0 TO M->TOTAL,M->TOTAL1
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO WHILE .NOT. PRIN()
   DO impresor
   IF LAST()=27
      RETURN TO MASTER
   ENDIF
ENDDO
@ 24,0 SAY PADC('IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe',80,'*') COLO SCHE 19
STORE 0 TO casos
acla='|'
FOR cc=1 TO MAX
   acla=acla+co[CC]+'|'
NEXT
largo=LEN(acla)
largoim=MIN(acancho,achoja)
linea=REPL("=",LEN(acla))
mxrn=67
ON KEY DO abpr
SET CONSOLE OFF
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
SET PRINTER ON
_PEJECT="NONE"
_PLENGTH=mxrn+5
_PLINENO=0
_PAGENO=1
_PSCODE='{27}{64}{27}{67}{'+ALLTRIM(STR(mxrn))+'}{18}'
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
   ? 'PROGRAMA :LGENI7'
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
   SCAN FOR &FISC
      IF _PLINENO>mxrn
         ? linea
	? '|'
	?? SPACE(10)
	?? '|'
	?? 'SUBTOTALES                    '
	?? '|'
	?? STR(M->TOTAL1,ACDIGI,2)
	?? '|'
	?? STR(M->TOTAL,ACDIGI,2)
	?? '|'
         EJECT PAGE
         _WRAP=.F.
         ?
         ??? CHR(18)
         ? 'PROGRAMA :LGENI7'
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
         IF largo>largoim
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
      ?? Legajo
		GOTO LIQ->EMPLEADO IN EMP
		?? '|'
		?? EMP->APYNOM
		?? '|'
      ?? str(liq->unidad,ACDIGI,2)
		?? '|'
      ?? str(liq->monto,acdigi,2)
		?? '|'
		STORE M->TOTAL1+LIQ->UNIDAD TO M->TOTAL1
		STORE M->TOTAL+LIQ->MONTO TO M->TOTAL1
      STORE casos+1 TO casos
   ENDSCAN
   ? linea
	? '|'
	?? SPACE(10)
	?? '|'
	?? 'TOTALES                       '
	?? '|'
	?? STR(M->TOTAL1,ACDIGI,2)
	?? '|'
	?? STR(M->TOTAL,ACDIGI,2)
	?? '|'
   ?
   _ALIGNMENT="LEFT"
   ? 'Cantidad de Casos:'
   ?? STR(casos,10)
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
_WRAP=.F.
RELE casos,largo,largoim,mxrn
@ 24,0 SAY SPACE(80)
RETURN
