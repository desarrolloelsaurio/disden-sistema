************************************************
*-- Programa: BUSMAR.PRG
*-- Fecha   : 11-21-91 11:27am
*-- Version : G. REINER
*-- Notas   : BUSCA CODIGO DE MARCA DE PRODUCTO
************************************************
FUNCTION BUSMAR
PARAMETER QMAR
SET ORDER TO TAG MARCOD
HAY=SEEK(QMAR)
SET ORDER TO TAG MARTEX
RETURN HAY
