************************************************
*-- Programa: IMPRESOR.PRG
*-- Fecha   : 4/10/89
*-- Version : G. REINER
*-- Notas   : AVISA ENCENDER LA IMPRESORA
**********************************************
DEFI WIND win FROM 10,0 TO 12,79 DOUB
ACTI WIND win
CLEAR
? '       ENCIENDA LA IMPRESORA Y UBIQUE EL PAPEL EN POSICION - LUEGO ENTER '
DO WHIL INKEY()=0
   ?? CHR(7)
ENDD
DEAC WIND win
RETURN
