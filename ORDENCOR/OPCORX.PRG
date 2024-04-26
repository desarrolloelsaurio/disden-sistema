*******************************************************
*-- Programa: OPCORX.PRG
*-- Fecha   : 06/26/91
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO ORDENES DE CORTE y EXTENDED
******************************************************
FUNCTION OPCORX
USE IN COR
=GETDBF('ORDCOR',.F.,"cor",6,.T.)
USE IN CO1
RETURN GETDBF('ORDCOR1',.F.,'co1',7,.T.)
