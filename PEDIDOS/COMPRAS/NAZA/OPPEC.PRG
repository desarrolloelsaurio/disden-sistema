*:*********************************************************************
*-- Programa: OPPEC.PRG
*-- Fecha   : 07/04/91 11:00am
*-- Version : R. 'EL BATA'
*-- Notas   : ABRE ARCHIVO NOTAS DE PEDIDO PROVEEDORES
*:*********************************************************************
return
@ 24,0 SAY PADC('Abriendo archivo de Notas de Pedido Proveedores',80,"°") COLO SCHE 19
SELE 21
IF ALIAS()#'PE1'
   USE (pathcpr+'\PEDIDAC') ORDER TAG PEDIDAC
ENDIF
SELE 12
IF ALIAS()#'PEC'
   USE (pathcpr+'\PEDIDC') INDEX (pathcpr+'\PEDIDC') ALIAS pec
ENDIF
@ 24,0 SAY "  "+REPL("°",78)
RETURN
