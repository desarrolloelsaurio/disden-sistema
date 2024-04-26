************************************
*-- Programa: MMI1.PRG
*-- Fecha   : 04-18-92 05:14pm
*-- Version : G. REINER
*-- Notas   : MUESTRA MI1TA NIVEL 1
************************************
FUNCTION MMI1
ACTI WIND win
@ 1,2 SAY TEXTO[1,1] COLO SCHE TEXTO[1,2]
@ 2,2 SAY TEXTO[2,1] COLO SCHE TEXTO[2,2]
@ 1,COL GET m.texto1 PICT TEXTO[1,3]
@ 2,COL GET m.texto2 PICT TEXTO[2,3]
CLEA GETS
RETURN .T.
