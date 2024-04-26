*:*********************************************
*-- Programa: OPREC.PRG
*-- Fecha   : 07/04/91 11:00am
*-- Version : R. 'EL BATA'
*-- Notas   : ABRE ARCHIVO REMITO PROVEEDORES
*-- Modificaci¢n GOYO 08/08/92
*:********************************************
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
if empty(dbf()) .or. substr(dbf(),rat("\",dbf())+1)#cosa+'.DBF'
   USE (PATHCPR+'\'+cosa) ORDER TAG REMITO ALIAS RE1
ENDIF
SELE 10
cosa=q_arc("REC")
if empty(dbf()) .or. substr(dbf(),rat("\",dbf())+1)#cosa+'.DBF'
   USE (PATHCPR+'\'+cosa) ORDER TAG REMITO ALIAS REC
ENDIF
=MEN_LIN(BOTOM)
RETURN
