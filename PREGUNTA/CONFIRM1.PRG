********************************************************************************
*-- Programa: CONFIRM1.PRG
*-- Fecha   : 06/06/91 05:31pm
*-- Version : G. REINER
*-- Notas   : FUNCION DE CONFIRMACION - DEVUELVE .T. O .F.
*--         : MODIFICACION 01/04/92 16:38
********************************************************************************
FUNCTION confirm1
PARAMETER m.con_texto,v,R,C
STORE "SI" TO respuesta
IF v
   lg=len('Confirma '+m.con_texto+' ? ')+8
   DEFI WIND FIC FROM R,C TO R+4,c+lg TITL " Confirma ? " DOUB SHAD COLO SCHE 8
   ACTI WIND FIC
   store 1 to r,c
Endif
@ R,C SAY 'Confirma '+m.con_texto+' ? ' GET respuesta PICTURE '@M SI,NO' MESS 'Confirma '+m.con_texto+' ? '
READ
IF LASTKEY()=27
   STORE 'NO' TO respuesta
ENDIF
IF v
   RELE WIND FIC
ENDIF
RETURN respuesta="SI"
