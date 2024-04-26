********************************************************************************
*-- Programa: OPPEC
*-- Fecha   : 10-11-92 05:38pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE NOTAS DE PEDIDO DE COMPRAS
*-- Modificaci¢n GOYO 07-23-92 00:25am marca -> empresa
*-- VERSION BALCALA - MULTIEMPRESA
********************************************************************************
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
if empty(dbf()) .or. substr(dbf(),rat("\",dbf())+1)#cosa+'.DBF'
   USE (PATHCPR+'\'+cosa) ORDER TAG PEDIDO ALIAS PEC
endif
SELE 13 
cosa=q_arc("PE1")
if empty(dbf()) .or. substr(DBF(),rat('\',dbf())+1)#cosa+'.DBF'
   USE (PATHCPR+'\'+COSA) ORDER TAG PEDIDO ALIAS PE1
ENDIF
=MEN_LIN(BOTOM)
RETURN
