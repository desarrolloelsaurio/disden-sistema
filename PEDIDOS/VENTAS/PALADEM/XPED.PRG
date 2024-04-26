***************************************
*-- Programa: XPED.PRG
*-- Fecha   : 08-03-92 08:18pm
*-- Version : G. REINER
*-- Notas   : RESTAURA DE NOTAS DE PEDIDO DE VENTAS
*-- Modificaci¢n GOYO 08-12-92 10:27am
***************************************
Ulpr=hora_ulp(PROGRAM())
IF CHEQSEG()
   =WORKING()
   =OPPED()
   =men_lin('Reindexando el Archivo de Notas de Pedido')
   SELE PED
   =FLOCK("PED") .or. FLOK("PED")
   USE
   SELE PEX
   =FLOCK("PEX") .or. FLOK("PEX")
   USE
   =OPPEDX()   
   =dotalk()
   SELE PED
   Index TAG CODCLI ON CODCLI
   Index TAG PEDIDO ON PEDIDO
   SELE PEX
   Index TAG PEDIDO ON PEDIDO
   =reopPED()
   =untalk()
   =iaud('PEDIDOS')
   =UNWORK()
ELSE
   =IAUDI()
ENDIF
RETURN
