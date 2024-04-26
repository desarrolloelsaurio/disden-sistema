********************************************************************************
*-- Programa: OPCCL.PRG
*-- Fecha   : 07/30/91 06:22pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE CUENTA CORRIENTE CLIENTES
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca -> empresa
*-- Modificaci¢n GOYO (area 5)
********************************************************************************
PARAMETER CSA
PRIVATE CSA
JANNRO=IIF(PARAMETER()=1,CSA,nul)
STORE NUL TO RESPUESTA
DO WHILE EMPTY(JANNRO)
   =ELIEMP("",-1,1)
ENDDO
SELE 5
cosa=q_arc("ccl")
if EMPTY(DBF()) .OR. substr(DBF(),rat('\',dbf())+1)#cosa+'.DBF'
   =men_lin('Abriendo archivo de Cta Corriente Clientes')
   =GETDBF(COSA,"codcli","ccl")
ENDIF
=MEN_LIN(BOTOM)
RETURN
