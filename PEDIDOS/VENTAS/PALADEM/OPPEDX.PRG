**********************************************************
*-- Programa: OPPEDX.PRG
*-- Fecha   : 01-11-93 02:35pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE PEDIDOS EXCLUSIVO
*-- Modificaci¢n GOYO 07-23-92 00:25am marca -> empresa
*-- Modificaci¢n GOYO 01-21-93 02:34pm (areas 12 y 13)
*********************************************************
PARAMETER INICIO
PRIVATE INICIO
JANNRO=IIF(EMPTY(PARAMETER()),NUL,INICIO)
DO WHILE EMPTY(JANNRO)
   store nul to respuesta
   =ELIEMP("",-1,1)
ENDDO
=men_lin('Abriendo archivo de Notas de Pedido')
cosa=q_arc("PEX")
=GETDBF(cosa,.F.,"PEX",13,.T.)
cosa=q_arc("PED")
=GETDBF(cosa,.F.,"PED",12,.T.)
=MEN_LIN(BOTOM)
RETURN
