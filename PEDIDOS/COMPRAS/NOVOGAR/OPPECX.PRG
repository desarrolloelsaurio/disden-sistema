*:*************************
*-- Programa: OPPECX.PRG
*-- Fecha   : 07/04/91 11:00am
*-- Version : R. 'EL BATA'
*-- Notas   : ABRE ARCHIVO NOTAS DE PEDIDO PROVEEDORES EXCL
*:*********************************************************
=MEN_LIN(aba+'Notas de Pedido Proveedores')
SELE 13
USE (pathcpr+'\PEDIDAC') ALIAS PE1 EXCL
SELE 12
USE (pathcpr+'\PEDIDC') ALIAS pec EXCL
=MEN_LIN(BOTOM)
RETURN
