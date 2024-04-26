*:*********************************************************************
*:
*:        Program: LHORP2.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: LHORP.PRG                     
*:
*:      Documented 04/23/91 at 21:04               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: LGENP.PRG
*-- Fecha   : 10/26/90 06:59pm
*-- Version : G. REINER
*-- Notas   : LISTADO horas ingresadas POR PANTALLA por empleado
********************************************************************************
ulpr=PROGRAM()
DEFI WIND win FROM 0,0 TO 24,79 NONE COLO SCHE 8
ACTI WIND win
STORE 0 TO TOTAL
@ 0,0 SAY REPLICATE("Û",80) COLOR W
@ 0,0 SAY 'P gina N§' COLOR I
@ 0,10 SAY STR(1,8) COLOR I
@ 0,20 SAY '|'
@ 0,22 SAY DATE() COLOR I
@ 0,32 SAY '|'
@ 0,34 SAY TIME() COLOR I
@ 0,44 SAY '|'
@ 0,46 SAY PADC(PROGRAM(),10) COLOR I
@ 0,58 SAY '|'
@ 0,60 SAY LEFT(janname,19) COLOR I
acla='|'
STORE 0 TO casos
MAX=MAX-IIF(uli='QR' .OR. uli='QA',1,0)
FOR cc=1 TO MAX
   acla=acla+co[CC]+'|'
NEXT
linea=REPL("=",LEN(acla))
_WRAP=.T.
_ALIGNMENT='CENTER'
_RMARGIN=80
? tt STYLE 'u'
?linea
? acla
? linea
pag=1
SCAN FOR empleado=xcos .AND. filtcon=bsc
   IF ROW()=22
      ? LEFT(linea,LEN(linea)-4)
      ?? '\\\\'
      DO WHIL INKEY()=0
      ENDDO
      IF LASTKEY()=48
         EXIT
      ENDIF
      CLEA
      STOR pag+1 TO pag
      @ 0,0 SAY REPLICATE("Û",80) COLOR W
      @ 0,0 SAY 'P gina N§' COLOR I
      @ 0,10 SAY STR(pag,8) COLOR I
      @ 0,20 SAY '|'
      @ 0,22 SAY DATE() COLOR I
      @ 0,32 SAY '|'
      @ 0,34 SAY TIME() COLOR I
      @ 0,44 SAY '|'
      @ 0,46 SAY PADC(PROGRAM(),10) COLOR I
      @ 0,58 SAY '|'
      @ 0,60 SAY LEFT(janname,19) COLOR I
      ? tt STYLE 'u'
      ?linea
      ? acla
      ? linea
   ENDIF
   ? '|'
   GOTO liq->registro IN &fl
   ?? &flva
   ?? '|'
   IF uli='QS' .OR. uli='HO'
      ?? STR(liq->unidad,acdigi,2)
      ?? '|'
      STORE TOTAL+liq->unidad TO TOTAL
   ENDIF
   STORE casos+1 TO casos
ENDSCAN
IF LASTKEY()<>48
   ? linea
   _WRAP=.F.
   ?
   IF uli='QS' .OR. uli='HO'
      ? "Totales          :"
      ?? STR(TOTAL,14,2)
   ENDIF
   ? "Cantidad de Casos:"
   ?? STR(casos,11)
   DO WHILE INKEY()=0
   ENDDO
ENDIF
_WRAP=.F.
RELE WIND win
RELE casos
RETURN
*: EOF: LHORP2.PRG
