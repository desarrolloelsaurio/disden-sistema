*******************************************************************************
*-- Programa: ABPR.PRG
*-- Fecha   : 01/15/91 04:51pm
*-- Version : G. REINER
*-- Notas   : PROGRAMA DE interrupcion de impresion
********************************************************************************
SET DEVICE TO SCRE
ON PAGE
EJECT PAGE
SET PRINTER TO
SET PRINTER OFF
SET CONS ON
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
IF .NOT. EMPTY(ALIAS())
   GOTO BOTTOM
ENDIF
DEAC WIND ALL
_WRAP=.F.
CLEA
DEFINE WINDOW err FROM 4,10 TO 20,69 DOUB TITL ' *** Interrumpida la Impresi¢n *** ' SHAD COLO SCHE 3
ACTI WIND err
@ WROW()/2,0 SAY PADC('INTERRUMPIDA LA IMPRESION',WCOL()) COLO SCHE 19
@ 14,10 SAY 'Programa:' COLO SCHE 3
@ 14,20 SAY ulpr COLO SCHE 3
DO WHILE INKEY()=0
ENDDO
ON KEY LABEL shift-f1 DO hlp
RELE WIND err
@ 0,0 SAY REPLICATE("Û",80) COLOR W
@ 0,1 SAY 'Sueldos y Jornales' COLOR I
@ 0,20 SAY '|'
@ 0,22 SAY DATE() COLOR I
@ 0,32 SAY '|'
@ 0,34 SAY TIME() COLOR I
@ 0,44 SAY '|'
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 0,58 SAY '|'
@ 0,60 SAY LEFT(janname,19) COLOR I
RETURN TO MASTER
*: EOF: ABPR.PRG
