********************************************************************************
*-- Programa: ELIkar.PRG
*-- Fecha   : 06/21/91 12:05pm
*-- Version : g. reiner
*-- Notas   : ELIGE la operacion de kardex a corregir
********************************************************************************
FUNCTION elikar
PARA msg,r1,c1
DO infic WITH RECC('tal'),'INGRESE TALLER '+msg
IF RESPUESTA#0
   GOTO RESPUESTA
ENDIF
RETURN(respuesta)
