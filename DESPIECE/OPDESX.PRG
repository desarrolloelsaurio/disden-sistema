*******************************************************
*-- Programa: OPDESX.PRG
*-- Fecha   : 06/26/91
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO ORDENES DE DESPIECE
******************************************************
FUNCTION OPDESX
USE IN DES
RETURN GETDBF('DESPIECE',.F.,"DES",20,.T.)
