*:*********************************************************************
*:
*: Procedure file: NUX1.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/27/90      0:00
*:
*:  Procs & Fncts: NUX1()
*:
*:      Documented 04/05/91 at 20:45               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: NUM1.FUNCT
*-- Fecha   : 25/10/89
*-- Version : G. REINER
*-- Notas   : CONVIERTE NUMERO DE 3 LETRAS EN TEXTO
********************************************************************************
*!*********************************************************************
*!
*!       Function: NUX1()
*!
*!      Called by: NUX()          (function  in NUX.PRG)
*!
*!*********************************************************************
FUNCTION nux1
PARAMETER X
pp=""
IF VAL(X)=100
   pp='CIEN '
ELSE
   IF VAL(LEFT(X,1))<>0
      IF VAL(LEFT(X,1))=1
         pp='CIENTO '
      ELSE
         pp=num[30+VAL(LEFT(X,1))]
      ENDIF
   ENDIF
   
   * DECENAS
   X=SUBSTR(X,2)
   IF VAL(X)<>0
      IF VAL(LEFT(X,1))>2
         pp=pp+num[20+VAL(LEFT(X,1))]
         IF VAL(RIGHT(X,1))<>0
            pp=pp+' Y '+num[VAL(RIGHT(X,1))]
         ENDIF
      ELSE
         IF VAL(LEFT(X,2))=20
            pp=pp+' VEINTE '
         ELSE
            IF VAL(LEFT(X,1))=2
               pp=pp+'VEINTI'
               IF VAL(RIGHT(X,1))<>0
                  pp=pp+num[VAL(RIGHT(X,1))]
               ENDIF
            ELSE
               pp=pp+num[VAL(X)]
            ENDIF
         ENDIF
      ENDIF
   ENDIF
ENDIF
RETURN(pp)
*: EOF: NUX1.PRG
