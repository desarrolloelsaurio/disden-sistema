********************************************************************************
*-- Programa: ELIiac.PRG
*-- Fecha   : 06/12/91 03:13pm
*-- Version : R. 'EL BATA'
*-- Notas   : ELIGE EL INDICE
********************************************************************************
FUNCTION eliiac
PARA msg,r1,c1
priv msg,r1,c1
SELE iac
store NUL to respuesta
SET ORDER TO TAG actual
ACTI POPUP iacPOP
STOR !EMPTY(RESPUESTA) TO respuesta
RETURN respuesta
