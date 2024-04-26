*:*********************************************************************
*:
*:        Program: LGENPET.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: LQADEP.PRG                    
*:
*:      Documented 04/23/91 at 20:56               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: LGENPET.PRG
*-- Fecha   : 10/25/90 11:41am
*-- Version : G. REINER
*-- Notas   : LISTADO GENERAL PARA ARCHIVOS RELACIONADOS CON CALCULO DE TOTALES
********************************************************************************
ulpr=PROGRAM()
DEFI WIND win FROM 0,0 TO 24,79 NONE COLO SCHE 8
ACTI WIND win
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
pcht=LEFT(janname,19)
@ 0,60 SAY pcht COLOR I
STORE 0 TO casos
acla='|'
FOR cc=1 TO MAX
   tgt[CC]=0
   acla=acla+co[CC]+'|'
NEXT
linea=REPL("=",LEN(acla))
_WRAP=.T.
_ALIGNMENT='CENTER'
? tt
? linea
? acla
? linea
pag=1
SCAN FOR &fisc
   IF ROW()=21
      ? LEFT(linea,LEN(linea)-4)
      ?? '\\\\'
      nda=SPACE(LEN(linea))
      FOR ccgt=1 TO MAX
         IF cgt[CCGT]
            nda=LEFT(nda,rgt[ccgt])+TRANSFORM(tgt[CCGT],&pgt[CCGT])
         ENDIF
      NEXT
      nda=nda+SPACE(LEN(linea)-LEN(nda))
      ? nda
      DO WHIL INKEY()=0
      ENDDO
      IF LASTKEY()=27
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
      @ 0,60 SAY pcht COLOR I
      ? tt
      ?linea
      ? acla
      ? linea
   ENDIF
   ? '|'
   FOR cc=1 TO MAX
      IF ct[CC]='*'
         IF &gt[CC]<>0
            GOTO &gt[CC] IN &gto[CC]
            ?? &ctt[CC]
         ELSE
            ?? SPACE(LEN(co[CC]))
         ENDIF
      ELSE
         ?? &ct[CC]
      ENDIF
      IF cgt[CC]
         tgt[CC]=tgt[CC]+VAL(&ct[CC])
      ENDIF
      ?? '|'
   NEXT
   STORE casos+1 TO casos
ENDSCAN
? linea
nda=SPACE(LEN(linea))
FOR ccgt=1 TO MAX
   IF cgt[CCGT]
      nda=LEFT(nda,rgt[ccgt])+TRANSFORM(tgt[CCGT],&pgt[CCGT])
   ENDIF
NEXT
nda=nda+SPACE(LEN(linea)-LEN(nda))
? nda
_WRAP=.F.
? "Cantidad de Casos:"
?? STR(casos,10)
DO WHILE INKEY()=0
ENDDO
RELE WIND win
RELE pcht,cc,pag,linea,acla,casos,nda
RETURN
*: EOF: LGENPET.PRG
