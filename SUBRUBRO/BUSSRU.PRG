********************************************************************************
*-- Programa: BUSRUB.PRG
*-- Fecha   : 11-19-91 02:15pm
*-- Version : G. REINER
*-- Notas   : BUSCA subRUBRO
********************************************************************************
function bussru
parameter qrub,qrub1
set order to tag todos
hay=seek(str(qrub)+str(qrub1))
return hay
