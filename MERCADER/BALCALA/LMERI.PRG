********************************************************************************
*-- Programa: LmerI.prg
*-- Fecha   : 06/06/91 06:26pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE telos
********************************************************************************
ulpr=hora_ulp(PROGRAM())
dijo=BAR()
respuesta='nada1#13#12#Tipo de Listado#3#\<Denominaciones#\<Caracter¡sticas'
=DEFPOP()
ON SELE POPU nada1 DO lmeri2
ACTI POPU nada1
RELE POPU nada1
ulpr=PROGRAM()
=men_lin(botom)
RETURN
