********************************************************************************
*-- Programa: EXISTE
*-- Fecha   : 24/07/90
*-- Version : G.REINER
*-- Notas   : INGRESO EXISTENTE
*	      R1=RENGLON TEXTO
*	      C1=COLUMNA TEXTO
*             T1=TEXTO DE CONCEPTO
********************************************************************************
PARAMETER t1
t2=t1+' EXISTENTE '
IF DELETED()
t2=t2+' (Borrada) '
ENDIF
SET MESS TO me1+t2
ii=LEN(t2)
ii=WCOLS()-ii
ii=INT(ii/2)
r1=INT(WROWS()/2)
@ r1,ii SAY t2 COLOR SCHE 19
@ r1-1,ii-1 TO r1+1,ii+LEN(t2) DOUBLE
RELE ii,r1,t2
RETURN
