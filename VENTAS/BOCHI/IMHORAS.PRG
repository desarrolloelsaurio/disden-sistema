********************************************************************************
*-- Programa: IMHORAS.PRG
*-- Fecha   : G. REINER
*-- Version : 4/10/89
*-- Notas   : IMPRIME TITULO DE LA LISTA Y LA HORA
********************************************************************************
PARAMETER SOLOTIT
_WRAP=.T.
_ALIGNMENT="CENTER"
? tt STYLE 'U'
_ALIGNMENT="RIGHT"
?'FECHA:' AT 0
?? DTOC(DATE())
?? SPACE(49)
?? "HORA    :"
?? TIME()
IF SOLOTIT
	? 'PAGINA  :'
	?? STR(_PAGENO,8)
ENDIF
_ALIGNMENT="LEFT"
_WRAP=.F.
RETURN
