********************************************************************************
*-- Programa: LGENPEW.PRG
*-- Fecha   : 10/25/90 11:41am
*-- Version : G. REINER
*-- Notas   : LISTADO GENERAL PARA ARCHIVOS RELACIONADOS con seleccion WHILE
********************************************************************************
ULPR=PROGRAM()
DEFI WIND win FROM 0,0 TO 24,79 NONE colo SCHE 8
ACTI WIND win
@ 0,0 SAY REPLICATE("Û",80) color W
@ 0,0 SAY 'P gina N§' COLOR I
@ 0,10 SAY STR(1,8) COLOR I
@ 0,20 SAY '|'
@ 0,22 SAY DATE() COLOR I
@ 0,32 SAY '|'
@ 0,34 SAY TIME() COLOR I
@ 0,44 SAY '|'
@ 0,46 SAY padc(PROGRAM(),10) COLOR I
@ 0,58 SAY '|'
PCHT=left(janname,19)
@ 0,60 SAY PCHT COLOR I
store 0 to casos
acla='|'
FOR CC=1 TO MAX
   acla=acla+co[CC]+'|'
next
linea=REPL("=",LEN(acla))
_WRAP=.T.
_ALIGNMENT='CENTER'
_RMARGIN=80
? tt
? linea
? acla
? linea
pag=1
DO WHILE &fisc
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
      @ 0,0 SAY REPLICATE("Û",80) color W
      @ 0,0 SAY 'P gina N§' COLOR I
      @ 0,10 SAY STR(pag,8) COLOR I
      @ 0,20 SAY '|'
      @ 0,22 SAY DATE() COLOR I
      @ 0,32 SAY '|'
      @ 0,34 SAY TIME() COLOR I
      @ 0,44 SAY '|'
      @ 0,46 SAY padc(PROGRAM(),10) COLOR I
      @ 0,58 SAY '|'
      @ 0,60 SAY PCHT COLOR I
      ? tt
      ?linea
      ? acla
      ? linea
   ENDIF
   ? '|'
	FOR CC=1 TO MAX
	  IF CT[CC]='*'
	     IF &GT[CC]<>0
	        GOTO &GT[CC] IN &GTO[CC]
		    ?? &CTT[CC]
         ELSE
            ?? SPACE(LEN(CO[CC]))
         ENDIF
      ELSE
        ?? &ct[CC]
	  ENDIF
     ?? '|'
   NEXT
	store casos+1 to casos
SKIP
ENDDO
? linea
?
_WRAP=.F.
if casos>0
   ? "Cantidad de Casos:"
   ?? str(casos,10)
   DO WHILE INKEY()=0
   ENDDO
endif
RELE WIND win
RELE PCHT,CC,PAG,LINEA,ACLA,casos
RETURN

