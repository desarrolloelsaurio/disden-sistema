********************************************************************************
*-- Programa: MCUR.PRG
*-- Fecha   : 10-26-91 01:13am
*-- Version : G. REINER
*-- Notas   : MUESTRA CURVA DE PRODUCCION
*-- Modificación GOYO 26/jul/92 (cuadro)
********************************************************************************
=cuadro("2 0 22 0 1 10 10")
@ 1,0 say '║  TALLE   ║ CANTIDAD ║'
=AR_GET(@CURVE,1,FINCUR,2,3,3,.F.,.F.,5,'99.99',16,'999.99')
CLEA GETS
RETURN
