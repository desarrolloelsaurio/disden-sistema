*******************************
*-- Programa: BUSPRV.PRG
*-- Fecha   : 03-23-92 12:21pm
*-- Version : R. 'EL BATA'
*-- Notas   : BUSCA PROVINCIA
*******************************
FUNCTION BUSPRV
PARAMETER QPRV
set order to TAG PRVCOD in "MI1"
hay=seek(qprv,"MI1")
set order to PRVTEX in "MI1"
RETURN(HAY)
