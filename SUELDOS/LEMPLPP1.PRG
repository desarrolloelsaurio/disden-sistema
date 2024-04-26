********************************************************************************
*-- Programa: Lemplpp1.prg
*-- Fecha   : 03/08/91 07:23pm
*-- Version : G. REINER
*-- Notas   : LISTADO empleados parcial por pantalla
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
acla=''
STORE 0 TO casos
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
SCAN FOR &fisc
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
   ? ''
   IF dijo<>1
      ?? legajo
      ?? '|'
   ENDIF
   ?? apynom
   ?? '|'
   IF dijo=2
      ?? telefono
   ELSE
      IF dijo=1
         ?? LEFT(domicilio,26)
         ?? '|'
         ?? LEFT(localidad,19)
      ELSE
         IF dijo=3
            ?? tdoc[tipodoc]
            ?? '|'
            ?? nrodoc
         ELSE
            IF dijo=4
               ?? STR(puntaje,7)
            ELSE
               IF dijo=5
                  GOTO emp->ccos IN ccos
                  ?? ccos->cencos
               ELSE
                  IF dijo=6
                     GOTO emp->cat IN cat
                     ?? cat->categoria
                  ELSE
                     IF dijo=7
                        GOTO emp->con IN con
                        ?? con->convenio
                     ELSE
                        IF dijo=8
                           ?? PADC(pagsal,20)
                        ELSE
                           IF dijo=9
                              ??  PADC(IIF(noliq,"SI","NO"),20)
                           ENDIF
                        ENDIF
                     ENDIF
                  ENDIF
               ENDIF
            ENDIF
         ENDIF
      ENDIF
   ENDIF
   STORE casos+1 TO casos
ENDSCAN
IF LASTKEY()<>48
   ? linea
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
