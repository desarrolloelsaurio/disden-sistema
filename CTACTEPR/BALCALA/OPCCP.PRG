********************************************************************************
*-- Programa: OPCCP.PRG
*-- Fecha   : 08/10/91 06:22pm
*-- Version : G. REINER, Y R. 'EL BATA'
*-- Notas   : ABRE ARCHIVO DE CUENTA CORRIENTE PROVEEDORES
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca -> empresa
********************************************************************************
PARAMETER CSA
PRIVATE CSA
=men_lin('Abriendo archivo de Cta Corriente Proveedores')
JANNRO=IIF(PARAMETER()=1,CSA,NUL)
STORE NUL TO RESPUESTA
DO WHILE EMPTY(JANNRO)
	=ELIEMP("",-1,1)
ENDDO
SELE 6
COSA=Q_ARC("CCP")
IF EMPTY(DBF()) .OR. SUBSTR(DBF(),RAT('\',DBF())+1)#COSA+'.DBF'
	USE (PATHCPR+'\'+COSA) ORDER TAG PROCOD ALIAS CCP
ENDIF
=MEN_LIN(BOTOM)
RETURN
