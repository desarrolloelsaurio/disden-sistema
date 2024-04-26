PARAMETER INICIO
PRIVATE INICIO
JANNRO=IIF(EMPTY(PARAMETER()),NUL,INICIO)
=men_lin('Abriendo archivo de Facturas de Compra')
DO WHILE EMPTY(JANNRO)
   =ELIEMP("",-1,1)
ENDDO
SELE 9 
cosa=q_arc("FAD")
if empty(dbf()) .or. substr(dbf(),rat("\",dbf())+1)#cosa+'.DBF'
   USE (PATHcpr+'\'+cosa) ORDER TAG FACTURA ALIAS fad
ENDIF
SELE 8
cosa=q_arc("FAR")
if empty(dbf()) .or. substr(dbf(),rat("\",dbf())+1)#cosa+'.DBF'
   USE (PATHcpr+'\'+cosa) ORDER TAG FACTURA ALIAS far
ENDIF
=men_lin(botom)
return
