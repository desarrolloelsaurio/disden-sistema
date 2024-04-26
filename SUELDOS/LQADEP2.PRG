********************************************************************************
*-- Programa: Lqadep2.prg
*-- Fecha   : 04/25/91 07:57pm
*-- Version : G. REINER
*-- Notas   : LISTADO adelantos de un empleado
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
@ 0,60 SAY LEFT(janname,19) COLOR I
acla='|'
STORE 0 TO casos,total 
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
SCAN for liq->legajo=xcos .AND. FILTCON>70
   IF ROW()=22
      ? LEFT(linea,LEN(linea)-4)
      ?? '\\\\'
	? '|Subtotales          |'
	?? space(8)
	?? '|'
	?? str(m->total,ACDIGI,2)
	?? '|'
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
	goto liq->registro in gas
	?? gas->gasto
	?? '|'
	?? fechaven
	?? '|'
	?? str(liq->UNIDAD,acdigi,2)
	?? '|'
	store m->total+liq->UNIDAD to m->total
   STORE casos+1 TO casos
ENDSCAN
IF LASTKEY()<>48
   ? linea
	? '|Totales             |'
	?? space(8)
	?? '|'
	?? str(m->total,ACDIGI,2)
	?? '|'
   _WRAP=.F.
   ?
   ? "Cantidad de Casos:"
   ?? STR(casos,10)
   DO WHILE INKEY()=0
   ENDDO
ENDIF
_WRAP=.F.
RELE WIND win
RELE casos
RETURN
*: EOF: LGENP.PRG
