********************************************************************************
*-- Programa: TAJAT.PRG
*-- Fecha   : 30/10/89
*-- Version : G. REINER
*-- Notas   : IMPRIME COLA DE IMPRESION POR PANTALLA
********************************************************************************
PARAMETER CANTIDAD,NUMEROS,RENGLON,COLUMNA
 
REST FROM ..\VENTASA\IMPRIME ADDITIVE
XXII=1
D=EII
DO WHIL XXII<=CANTIDAD
   LIN1=VAL(LEFT(NUMEROS,AT(',',NUMEROS)-1))
   D=D+REPL(LIN,LIN1)+CRAR
   XXII=XXII+1
   NUMEROS=SUBSTR(NUMEROS,AT(',',NUMEROS)+1)
ENDD
D=LEFT(D,LEN(D)-1)+EID
@ RENGLON,COLUMNA SAY D
RETURN
 
