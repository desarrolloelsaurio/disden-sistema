*:***************************************
*-- Programa: OPPEC.PRG
*-- Fecha   : 07/04/91 11:00am
*-- Version : R. 'EL BATA'
*-- Notas   : ABRE ARCHIVO NOTAS DE PEDIDO PROVEEDORES
*:****************************************************
IF ESOPEN("Notas de Pedido Proveedores",13,"PE1")
   USE (pathcpr+'\PEDIDAC') ORDER TAG PEDIDO ALIAS PE1
ENDIF
IF ESOPEN("",12,"PEC")
   USE (pathcpr+'\PEDIDC') ORDER TAG PEDIDO ALIAS pec
ENDIF
=MEN_LIN(BOTOM)
RETURN
