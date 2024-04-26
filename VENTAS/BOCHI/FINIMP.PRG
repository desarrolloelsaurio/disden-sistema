******************************
*-- Programa: finimp.prg
*-- Fecha   : 10-23-91 11:07am
*-- Version : g. reiner
*-- Notas   : fin de IMPRESION
******************************
FUNCTION FINIMP
ON KEY
?
SET DEVI TO SCRE
SET CONS ON
SET PRIN TO
SET PRINT OFF
SET PRIN TO LPT1
SET MESS TO SPACE(78)
ON ESCAPE
DEAC WIND ALL
_RMARGIN=80
_WRAP=.F.
_PCOPIES=1
=BEEP(3)
RETURN .T.
