****************************************
*-- Programa: OPrei.PRG
*-- Fecha   : 07/04/91 10:55am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO RemitoS
*-- Modificaci¢n GOYO (areas 10 y 11)
****************************************
PARAMETER INICIO
PRIVATE INICIO
JANNRO=IIF(EMPTY(PARAMETER()),NUL,INICIO)
=men_lin('Abriendo archivo de Remitos')
DO WHILE EMPTY(JANNRO)
	=ELIEMP("",-1,1)
ENDDO
SELE 11
COSA=Q_ARC("RIX")
IF SUBSTR(DBF(),RAT("\",DBF())+1)#COSA+'.DBF'
	USE (PATHVEN+'\'+COSA) ORDER TAG REMITO ALIAS REX
ENDIF
SELE 10
COSA=Q_ARC("RIM")
IF SUBSTR(DBF(),RAT('\',DBF())+1)#COSA+'.DBF'
	USE (PATHVEN+'\'+COSA) ORDER TAG REMITO ALIAS REM
ENDIF
=MEN_LIN(BOTOM)
RETURN
