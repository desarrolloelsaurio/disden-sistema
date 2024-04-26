*****************************************************
*-- Programa: ABPR.PRG
*-- Fecha   : 01/15/91 04:51pm
*-- Version : G. REINER
*-- Notas   : PROGRAMA DE interrupcion de impresi¢n
****************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE NUL    0                                 && NUL
ON KEY
SET DEVICE TO SCRE
IF !EMPTY(DBF())
   GO BOTT
ENDIF
UNLO ALL
ON PAGE
EJECT PAGE
SET PRINTER TO
SET PRINTER OFF
SET CONS ON
=hora_ulp(PROGRAM())
CLEA
=BOX()
SET SHAD ON
defi wind err FROM 4,10 TO 20,69 DOUB TITL ' *** Interrumpida la Impresi¢n *** ' SHAD COLO SCHE 3
ACTI WIND err
@ WROW()/2,nul SAY PADC('INTERRUMPIDA LA IMPRESION',WCOL()) COLO SCHE 19
@ 14,10 SAY 'Programa:' COLO SCHE 3
@ 14,20 SAY ulpr COLO SCHE 3
ULPR=PROGRAM()
_RMARGIN=80
_LMARGIN=NUL
_PLOFFSET=NUL     
DO ERROR WITH .T.
RETURN .T.