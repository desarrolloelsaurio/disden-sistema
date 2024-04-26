*:*********************************************************************
*:
*: Procedure file: NUX.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/27/90      0:00
*:
*:  Procs & Fncts: NUX()
*:
*:      Documented 04/05/91 at 20:45               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: NUX.FUNCT
*-- Fecha   : 25/10/89
*-- Version : G. REINER
*-- Notas   : CONVIERTE DE NUMEROS A LETRAS
********************************************************************************
*!*********************************************************************
*!
*!       Function: NUX()
*!
*!      Called by: GLADE1.PRG                    
*!
*!          Calls: NUX1()         (function  in NUX1.PRG)
*!
*!*********************************************************************
FUNCTION nux
PARAMETER numero
if numero<0
   numero=abs(numero)
   a='MENOS '
else
   A=""
endif
inicial=STR(numero,12,2)
I=LEFT(inicial,3)
IF VAL(I)<>0
   IF VAL(I)<>1
      A=nux1(I)+' MILLONES '
   ELSE
      A=nux1(I)+' MILLON '
   ENDIF
ENDIF
inicial=SUBSTR(inicial,4)
I=LEFT(inicial,3)
IF VAL(I)<>0
   A=A+nux1(I)+' MIL '
ENDIF
inicial=SUBSTR(inicial,4)
I=LEFT(inicial,3)
IF VAL(I)<>0
   A=A+nux1(I)
ENDIF
A=A+' CON '+RIGHT(inicial,2)+' Centavos.'
RETURN(A)
*: EOF: NUX.PRG
