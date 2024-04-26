*************************************
*-- Programa: OPKAR.PRG
*-- Fecha   : 06/18/91
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO KARDEX DE MERCADERIAS TERMINADAS
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca -> empresa
*-- Modificaci¢n GOYO (area 18)
*************************************
PARAMETER SHIT
PRIVATE SHIT
=men_lin('Abriendo archivo de Kardex')
JANNRO=IIF(PARAMETER()=1,SHIT,nul)
=MEN_LIN('Abriendo archivo de Kardex')
STORE NUL TO RESPUESTA
DO WHILE EMPTY(JANNRO)
	=ELIEMP("",-1,1)
ENDDO
SELE 18
cosa=q_arc("KAR")
if EMPTY(DBF()) .OR. substr(DBF(),rat('\',dbf())+1)#cosa+'.DBF'
	USE (PATHVEN+'\'+cosa) order tag articulo ALIAS kar
ENDIF
=MEN_LIN(BOTOM)
RETURN
