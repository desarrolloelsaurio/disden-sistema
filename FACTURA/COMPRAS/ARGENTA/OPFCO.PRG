**********************************************
*-- Programa: OPFCO.PRG
*-- Fecha   : 07/04/91 10:55am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO FACTURAS de COMPRA
*-- VERSION BALCALA
**********************************************
PARAMETER INICIO
PRIVATE INICIO
JANNRO=IIF(EMPTY(PARAMETER()),NUL,INICIO)
=men_lin('Abriendo archivo de Facturas')
DO WHILE EMPTY(JANNRO)
   =ELIEMP("",-1,1)
ENDDO
SELE 23
cosa=q_arc("FAD")
if substr(dbf(),rat("\",dbf())+1)#cosa+'.DBF'
   USE (path+'\FACTUDAC') order tag factura ALIAS fAD
ENDIF
SELE 8
cosa=q_arc("FAR")
if substr(dbf(),rat("\",dbf())+1)#cosa+'.DBF'
   USE (path+'\FACTURAc') order tag factura ALIAS fAR
ENDIF
=MEN_LIN(BOTOM)
RETURN
