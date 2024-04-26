*****************************************
*-- Programa: ERRASTE.PRG
*-- Fecha   : 4/10/89
*-- Version : G. REINER
*-- Notas   : AVISA ENCENDER LA IMPRESORA
*****************************************
DEFI WIND win FROM 10,0 TO 12,79 DOUB
ACTI WIND win
DO WHILE EMPTY(INKEY())
CLEAR
@ 0,0 SAY PADC('ERROR -> ENTER PARA CONTINUAR',76)
ENDD
DEAC WIND win
RETURN
