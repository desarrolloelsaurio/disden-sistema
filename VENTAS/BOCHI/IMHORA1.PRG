********************************************************************************
*-- Programa: IMHORA1.PRG
*-- Fecha   : G. REINER
*-- Version : 4/10/89
*-- Notas   : IMPRIME TITULO DE LA LISTA Y LA HORA
********************************************************************************
PROCEDURE IMHORA1
_wrap=.T.
_ALIGNMENT="RIGHT"
?'FECHA:' at 0
?? DTOC(DATE())
?? space(49)
?? "HORA    :"
?? TIME()
? "RECIBO N:"
?? RECIBO PICT '99999999'
_ALIGNMENT="LEFT"
_WRAP=.F.
RETURN
 
