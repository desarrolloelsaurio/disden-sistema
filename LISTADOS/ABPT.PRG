****************************************************************
*-- Programa: ABPT.PRG
*-- Fecha   : 05-17-92 01:53am
*-- Version : G. REINER
*-- Notas   : PROGRAMA DE interrupcion de LISTADO POR PANTALLA
***************************************************************
ON KEY label F10
UNLO ALL
ON PAGE
=hora_ulp(PROGRAM())
IF !EMPTY(ALIAS())
	GOTO BOTTOM
ENDIF
DEAC WIND ALL
CLEA
IF UPPER(SYS(2006))="VGA/MONO" .OR. ISCOLOR()
	@ 0,0,24,79 BOX REPL("Û°",9)
ELSE
	SET COLO TO W+
	@ 0,0,24,79 BOX REPL("°",9)
	SET COLO TO
ENDIF
SET SHAD ON
=MOVEWIN(4,10,20,69,'ERR',' *** Interrumpido el Listado *** ')
@ WROW()/2,nul SAY PADC('INTERRUMPIDO EL LISTADO',WCOL()) COLO SCHE 19
@ 14,10 SAY 'Programa:' COLO SCHE 3
@ 14,20 SAY ulpr COLO SCHE 3
DO OFF_RELA
DO OFF_IDX
=INKEY(2,"HM")
ON KEY LABEL shift-f1 DO hlp
RELE WIND err
=cabpan1()
SET NEAR OFF
RETURN ERROR()