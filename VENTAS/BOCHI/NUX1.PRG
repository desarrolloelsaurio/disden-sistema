********************************************************************************
*-- Programa: NUX1.FUNCT
*-- Fecha   : 25/10/89
*-- Version : G. REINER
*-- Notas   : CONVIERTE NUMERO DE 3 LETRAS EN TEXTO
********************************************************************************
FUNCTION NUX1

PARAMETER X
n_pp=""
IF VAL(X)=100
   n_pp='CIEN '
ELSE
   IF VAL(LEFT(X,1))#0
      IF VAL(LEFT(X,1))=1
         n_pp='CIENTO '
      ELSE
         n_pp=num[30+VAL(LEFT(X,1))]
      ENDI
   ENDI

   * DECENAS
   X=SUBSTR(X,2)
   IF VAL(X)#0
      IF VAL(LEFT(X,1))>2
         n_pp=n_pp+num[20+VAL(LEFT(X,1))]
         IF VAL(RIGHT(X,1))#0
            n_pp=n_pp+' Y '+num[VAL(RIGHT(X,1))]
         ENDI
      ELSE
         IF VAL(LEFT(X,1))=20
            n_pp=n_pp+' VEINTE '
         ELSE
            IF VAL(LEFT(X,1))=2
               n_pp=n_pp+'VEINTI'
               IF VAL(RIGHT(X,1))#0
                  n_pp=n_pp+num[VAL(RIGHT(X,1))]
               ENDI
            ELSE
               n_pp=n_pp+num[VAL(X)]
            ENDI
         ENDI
      ENDI
   ENDI
ENDI
RETURN n_pp
