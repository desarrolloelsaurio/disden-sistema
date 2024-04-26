*************************************************************
*-- Programa: mensaje.prg
*-- Fecha   : 10-22-91 09:32pm
*-- Version : G. REINER
*-- Notas   : MANDA UN MENSAJE DURANTE UN MINUTO Y DESAPARECE
*************************************************************
FUNCTION MENSAJE
#DEFINE NUL    0                                 && NUL
PARA CS
PRIV CS
=MOVEWIN(10,NUL,14,78,'FIC',' ** MENSAJE ** ')
@ 1,NUL SAY PADC(ALLTRIM(CS),77) COLO SCHE 19
WAIT "" TIMEOUT 1
RETURN RELEWIN("FIC")
