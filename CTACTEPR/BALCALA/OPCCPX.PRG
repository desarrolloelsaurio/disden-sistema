********************************************************************************
*-- Programa: OPCCPX.PRG
*-- Fecha   : 08/10/91 06:22pm
*-- Version : G. REINER, Y R. 'EL BATA'
*-- Notas   : ABRE ARCHIVO DE CUENTA CORRIENTE PROVEEDORES EXCLUSIVA
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca -> empresa
********************************************************************************
PARAMETER CSA
PRIVATE CSA
=men_lin('Abriendo archivo de Cta Corriente Proveedores')
JANNRO=IIF(PARAMETER()=1,CSA,nul)
STORE NUL TO RESPUESTA
DO WHILE EMPTY(JANNRO)
	=ELIEMP("",-1,1)
ENDDO
SELE 6
cosa=q_arc("ccp")
USE (PATHCpr+'\'+COSA) ALIAS ccp EXCL
=MEN_LIN(BOTOM)
RETURN
