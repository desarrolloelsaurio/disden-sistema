********************************************************************************
*-- Programa: IMPRIME.PRG
*-- Fecha   : 06/06/91 05:31pm
*-- Version : G. REINER
*-- Notas   : FUNCION DE IMPRIMECION - DEVUELVE .T. O .F.
********************************************************************************
FUNCTION imprime
PARAMETER texto,v,R,C
STORE "SI" TO respuesta
IF v
   lg=len('Imprime '+texto+' ? ')+8
   defi wind fic FROM R,C TO R+4,C+LG TITL " Imprime ? " SHAD colo sche 8
   ACTI WIND fic
   STORE 1 TO R,C
ENDIF
@ R,C SAY 'Imprime '+texto+' ? ' GET respuesta PICTURE '@M SI,NO' MESS 'Imprime '+texto+' ? '
READ
IF LASTKEY()=27
   STORE 'NO' TO respuesta
ENDIF
IF V
   =RELEWIN("FIC")
ENDIF
RETURN RESPUESTA="SI"
