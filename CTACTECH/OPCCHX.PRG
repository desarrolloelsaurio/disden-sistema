******************************************
*-- Programa: OPCCH.PRG
*-- Fecha   : 09/03/91 06:22pm
*-- Version : V.LEEGSTRA
*-- Notas   : ABRE ARCHIVO DE CUENTA CORRIENTE DE CHEQUES EXCL
*-- VERSION NOVOGAR
*******************************************
PARAMETER SHIT
RETURN GETDBF('CCCHE',.F.,'cch',7,.T.)
