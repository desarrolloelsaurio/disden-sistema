********************************************************************************
*-- Programa: COPIAS.PRG
*-- Fecha   : 06/06/91 05:31pm
*-- Version : G. REINER
*-- Notas   : FUNCION DE COPIAS
********************************************************************************
FUNCTION copias
PARAMETER texto,v,R,C
STOR NUL TO respuesta
IF v
   defi wind fic FROM R,C TO R+4,78 TITL " Cantidad de Copias " SHAD colo sche 8
   ACTI WIND fic
   store 1 to r,c
Endif
@ R,C SAY 'Cantidad de Copias '+texto+' ' GET respuesta PICTURE '999' MESS 'Cantidad de Copias '+texto
READ
IF LASTKEY()=27
   STOR NUL TO respuesta
ENDIF
IF v
   RELE WIND fic
ENDIF
RETURN respuesta
