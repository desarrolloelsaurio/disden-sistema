*:*********************************************************************
*-- Programa: OPPECX.PRG
*-- Fecha   : 07/04/91 11:00am
*-- Version : R. 'EL BATA'
*-- Notas   : ABRE ARCHIVO NOTAS DE PEDIDO PROVEEDORES EXCL
*-- VERSION BALCALA - MULTIEMPRESA
*:*********************************************************************
PARAMETER INICIO
PRIVATE INICIO
JANNRO=IIF(EMPTY(PARAMETER()),NUL,INICIO)
=men_lin('Abriendo archivo de Notas de Pedido de Compras')
DO WHILE EMPTY(JANNRO)
	store nul to respuesta
	=ELIEMP("",-1,1)
ENDDO
SELE 12
cosa=q_arc("PEC")
USE (PATHCPR+'\'+cosa) ALIAS PEC EXCL
SELE 13
cosa=q_arc("PE1")
USE (PATHCPR+'\'+COSA) ALIAS PE1 EXCL
=MEN_LIN(BOTOM)
RETURN
