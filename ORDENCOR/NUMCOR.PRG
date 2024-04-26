*************************************************
*-- Programa: NUMCOR.PRG
*-- Fecha   : 12/13/90 01:28AM
*-- Version : G. REINER
*-- Notas   : ACTUALIZA NUMERO DE ORDEN DE CORTE
*************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
ULPR=PROGRAM()
@ 0,36 SAY TIME() COLOR I
@ 0,47 SAY PADC(PROGRAM(),10,' ') color i
DEFINE WINDOW win FROM 7,12 TO 11,64 TITL ' N§ Pr¢xima Orden de '+korte+' ' DOUBLE SHAD COLOR SCHE 8
ACTI WINDOW win
@ 1,1 SAY 'N§ PROXIMA ORDEN DE '+ALLTRIM(KORTE) COLOR SCHE 3
vez=1
DO WHILE vez=1 .or. xanumcor=0
   vez=2
   @ 1,28 GET XANUMCOR PICTURE '9999999999';
         MESS 'N§ de la Pr¢xima Orden de '+korte
   READ
ENDDO
RELE WIND win
RELE vez
RETURN MEN_LIN(BOTOM)
