********************************************************************************
*-- Programa: IMHOR.PRG
*-- Fecha   : G. REINER
*-- Version : 4/10/89
*-- Notas   : IMPRIME TITULO DE LA LISTA Y LA HORA
********************************************************************************
PROCEDURE IMHOR
_wrap=.T.
_alignment="CENTER"
? tt style 'U'
_ALIGNMENT="RIGHT"
?'FECHA:' at 0
?? DTOC(DATE())
?? space(50)
?? "HORA  :"
?? TIME()
? "PAGINA:"
?? _PAGENO PICT '99999999'
_ALIGNMENT="LEFT"
_WRAP=.F.
RETURN
