********************************************************************************
*-- Programa: lsuep1.prg
*-- Fecha   : 01/14/91 05:58am
*-- Version : G. REINER
*-- Notas   : LISTADO de sueldos pagados
********************************************************************************
ULPR=PROGRAM()
DEFI WIND win FROM 0,0 TO 24,79 NONE
ACTI WIND win
@ 0,0 SAY REPLICATE("Û",80)
@ 0,0 SAY 'P gina N§' COLOR I
@ 0,10 SAY STR(1,8) COLOR I
@ 0,20 SAY '|'
@ 0,22 SAY DATE() COLOR I
@ 0,32 SAY '|'
@ 0,34 SAY TIME() COLOR I
@ 0,44 SAY '|'
@ 0,46 SAY PROGRAM() PICTURE 'XXXXXXXXXX' COLOR I
@ 0,58 SAY '|'
PCHT=left(janname,19)
@ 0,60 SAY PCHT COLOR I
store 0 to casos
b='|'
acla=b
FOR CC=1 TO MAX
   acla=acla+co[CC]+'|'
store 0 to ct[cc]
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
sele emp
SET ORDER TO ORDLIS
SCAN for &fisc
   IF ROW()=22
      ? LEFT(linea,LEN(linea)-4)
      ?? '\\\\'
   ? 'Subtotales                      |'
   ?? STR(ct[3],acdigi,2)
   ?? B
   ?? STR(ct[4],acdigi,2)
   ?? B
   ?? STR(ct[5],acdigi,2)
   ?? B
      DO WHIL INKEY()=0
      ENDDO
      IF LASTKEY()=48
         EXIT
      ENDIF
      CLEA
      STOR pag+1 TO pag
      @ 0,0 SAY REPLICATE("Û",80)
      @ 0,0 SAY 'P gina N§' COLOR I
      @ 0,10 SAY STR(pag,8) COLOR I
      @ 0,20 SAY '|'
      @ 0,22 SAY DATE() COLOR I
      @ 0,32 SAY '|'
      @ 0,34 SAY TIME() COLOR I
      @ 0,44 SAY '|'
      @ 0,46 SAY PROGRAM() PICTURE 'XXXXXXXXXX' COLOR I
      @ 0,58 SAY '|'
      @ 0,60 SAY PCHT COLOR I
      ? tt
      ?linea
      ? acla
      ? linea
   ENDIF
   ? b
	?? legajo
?? b
?? left(apynom,20)
?? b
?? str(total,acdigi,2)
?? b
?? str(adelan,acdigi,2)
?? b
?? str(total-adelan,acdigi,2)
?? b
ct[3]=ct[3]+total
ct[4]=ct[4]+adelan
ct[5]=ct[5]+total-adelan
	store casos+1 to casos
ENDSCAN
? linea
   ? 'Totales                         |'
   ?? STR(ct[3],acdigi,2)
   ?? B
   ?? STR(ct[4],acdigi,2)
   ?? B
   ?? STR(ct[5],acdigi,2)
   ?? B
_WRAP=.F.
? "Cantidad de Casos:"
?? str(casos,10)
DO WHILE INKEY()=0
ENDDO
RELE WIND win
RELE PCHT,CC,PAG,LINEA,ACLA,casos
RETURN

