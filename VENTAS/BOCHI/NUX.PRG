********************************************************************************
*-- Programa: NUX.FUNCT
*-- Fecha   : 25/10/89
*-- Version : G. REINER
*-- Notas   : CONVIERTE DE NUMEROS A LETRAS
********************************************************************************
FUNCTION NUX
PARAMETER numero
A=""
inicial=STR(numero,12,2)
I=LEFT(inicial,3)
IF !EMPTY(VAL(I))
   IF VAL(I)#1
      A=NUX1(I)+' MILLONES '
   ELSE
      A=NUX1(I)+' MILLON '
   ENDI
ENDI
inicial=SUBSTR(inicial,4)
I=LEFT(inicial,3)
IF VAL(I)#0
   A=A+NUX1(I)+' MIL '
ENDI
inicial=SUBSTR(inicial,4)
I=LEFT(inicial,3)
IF VAL(I)#0
   A=A+NUX1(I)
ENDI
A=A+' CON '+RIGHT(inicial,2)+' Centavos.'
RETURN A
