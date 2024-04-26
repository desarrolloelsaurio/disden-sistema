**********************************************************
*-- Programa: OPPED.PRG
*-- Fecha   : 01-11-93 02:35pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE PEDIDOS
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
SELE 13
cosa=q_arc("PEX")
if EMPTY(DBF()) .OR. substr(dbf(),rat("\",dbf())+1)#cosa+'.DBF'
   =men_lin('Abriendo archivo de Notas de Pedido')
   =GETDBF(cosa,"PEDIDO","PEX")
endif
SELE 12
cosa=q_arc("PED")
if EMPTY(DBF()) .OR. substr(DBF(),rat('\',dbf())+1)#cosa+'.DBF'
   =GETDBF(cosa,"PEDIDO","PED")
ENDIF
=MEN_LIN(BOTOM)
RETURN
