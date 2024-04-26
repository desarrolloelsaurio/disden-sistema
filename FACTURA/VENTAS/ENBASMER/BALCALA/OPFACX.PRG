********************************************************
*-- Programa: OPFACX.PRG
*-- Fecha   : 24-07-93
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO FACTURAS - exclusivo
*-- Modificaci¢n GOYO 07-23-92 00:25am marca -> empresa
*-- Modificaci¢n GOYO (areas 8 Y 9)
*********************************************************
PARAMETER INICIO
PRIVATE INICIO
JANNRO=IIF(EMPTY(PARAMETER()),NUL,INICIO)
=men_lin('Abriendo archivo de Facturas')
DO WHILE EMPTY(JANNRO)
   store nul to respuesta
   =ELIEMP("",-1,1)
ENDDO
cosa=q_arc("FAX")
   USE (PATHVEN+'\'+cosa) ALIAS fax EXCL in 9
cosa=q_arc("FAC")
   USE (PATHVEN+'\'+COSA) ALIAS fac EXCL in 8
=MEN_LIN(BOTOM)
RETURN
