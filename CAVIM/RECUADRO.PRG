FUNCTION RECUADRO
PARAMETER RECTEXTO
REC_ANCHO=LEN(RECTEXTO)
? '�'+REPL('�',REC_ANCHO+2)+'�'
? '�'
?? " "
?? RECTEXTO
?? " "
?? '�'
? '�'+REPL('�',REC_ANCHO+2)+'�'
return .T.