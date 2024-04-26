********************************************************************************
*-- Programa: OPCCH.PRG
*-- Fecha   : 09/03/91 06:22pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE CUENTA CORRIENTE DE CHEQUES
*-- Modificaci¢n GOYO (area 7)
********************************************************************************
PARAMETER CSA
PRIVATE CSA
=men_lin('Abriendo archivo de Cta Corriente de Cheques')
JANNRO=IIF(PARAMETER()=1,CSA,nul)
STORE NUL TO RESPUESTA
DO WHILE EMPTY(JANNRO)
   =ELIEMP("",-1,1)
ENDDO
SELE 7
   cosa=q_arc("cch")
   if EMPTY(DBF()) .OR. substr(DBF(),rat('\',dbf())+1)#cosa+'.DBF'
   USE (PATHVEN+'\'+COSA) order tag codcli ALIAS cch
ENDIF
=MEN_LIN(BOTOM)
RETURN
