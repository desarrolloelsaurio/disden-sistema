********************************************************
*-- Programa: OPFACSI.PRG
*-- Fecha   : 07/04/91 10:55am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO FACTURAS
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
SELE 9
cosa=q_arc("FAX")
if substr(dbf(),rat("\",dbf())+1)#cosa+'.DBF'
   USE (PATHVEN+'\'+cosa) ALIAS fax
endif
SELE 8
cosa=q_arc("FAC")
if substr(DBF(),rat('\',dbf())+1)#cosa+'.DBF'
   USE (PATHVEN+'\'+COSA) ALIAS fac
ENDIF
=MEN_LIN(BOTOM)
RETURN
