********************************************************************************
*-- Programa: Lqadep3.PRG
*-- Fecha   : 04/25/91 08:30pm
*-- Version : G. REINER
*-- Notas   : LISTADO de adelantos total
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
linea1=REPL("-",LEN(acla))
_WRAP=.T.
_ALIGNMENT='CENTER'
_RMARGIN=80
? tt STYLE 'u'
?linea
? acla
? linea
pag=1
pl=liq->legajo
SCAN
   IF ROW()>20
     ? LEFT(linea,LEN(linea)-4)
     ?? '\\\\'
	? '|Subtotal  |'
	?? space(20)
	?? '|'
	?? space(15)
	?? '|'
	?? space(8)
	?? '|'
	?? str(m->total,acdigi,2)
	?? '|'
      tA=INKEY(0)
      IF ta=48
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
		if pl<>liq->legajo
			pl=liq->legajo
		endif
	else
		if pl<>liq->legajo
			pl=liq->legajo
			? linea1
		endif
   ENDIF
   ? '|'
	?? liq->legajo
	?? '|'
	goto liq->empleado in emp
	?? left(emp->apynom,20)
	?? '|'
	goto liq->registro in gas
	?? left(gas->gasto,15)
	?? '|'
	?? liq->fechaven
	?? '|'
	?? str(liq->unidad,acdigi,2)
	?? '|'
	store m->total+liq->unidad to m->total
   STORE casos+1 TO casos
ENDSCAN
IF LASTKEY()<>48
   ? linea
	? '|Totales   |'
	?? space(20)
	?? '|'
	?? space(15)
	?? '|'
	?? space(8)
	?? '|'
	?? str(m->total,acdigi,2)
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
