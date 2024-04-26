FUNCTION RECUADRO
PARAMETER RECTEXTO
REC_ANCHO=LEN(RECTEXTO)
? 'É'+REPL('Í',REC_ANCHO+2)+'»'
? 'º'
?? " "
?? RECTEXTO
?? " "
?? 'º'
? 'È'+REPL('Í',REC_ANCHO+2)+'¼'
return .T.