PARAMETER INICIO
PRIVATE INICIO
JANNRO=IIF(EMPTY(PARAMETER()),NUL,INICIO)
=men_lin('Abriendo archivo de Facturas de Compra')
DO WHILE EMPTY(JANNRO)
   =ELIEMP("",-1,1)
ENDDO
SELE 9
cosa=q_arc("FAD")
USE (PATHcpr+'\'+cosa) ALIAS fad excl
SELE 8
cosa=q_arc("FAR")
USE (PATHcpr+'\'+cosa) ALIAS far excl
=men_lin(botom)
return
