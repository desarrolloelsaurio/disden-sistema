*:*********************************************************************
*-- Programa: OPRECx.PRG
*-- Fecha   : 07/04/91 11:00am
*-- Version : R. 'EL BATA'
*-- Notas   : ABRE ARCHIVO REMITO PROVEEDORES exclusive
*-- Modificaci¢n GOYO 08/08/92 
*:*********************************************************************
PARAMETER CSA
PRIVATE CSA
JANNRO=IIF(PARAMETER()=1,CSA,nul)
=MEN_LIN('Abriendo archivo Remitos de Proveedores')
STORE NUL TO RESPUESTA
DO WHILE EMPTY(JANNRO)
   =eliemp("",-1,1)
ENDDO
SELE 11
cosa=q_arc("RE1")
   USE (PATHCPR+'\'+cosa) ALIAS RE1 excl
SELE 10
cosa=q_arc("REC")
   USE (PATHCPR+'\'+cosa) ALIAS REC excl
=MEN_LIN(BOTOM)
RETURN
