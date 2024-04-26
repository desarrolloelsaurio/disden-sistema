******************************************
*-- Programa: OPCAJ.PRG
*-- Fecha   : 05-13-92 02:31am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE CAJA PARA EMPRESA
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca -> empresa
*-- Modificaci¢n GOYO 01-21-93 02:33pm (area 17)
********************************************
PARAMETER CSA
PRIVATE CSA
=men_lin(AbA+'Caja')
JANNRO=IIF(PARAMETER()=1,CSA,nul)
STORE NUL TO RESPUESTA
DO WHILE EMPTY(JANNRO)
	=ELIEMP("",-1,1)
ENDDO
SELE 17
cosa=q_arc("caj")
if substr(DBF(),rat('\',dbf())+1)#cosa+'.DBF'
	USE (PATHVEN+'\'+COSA) order tag codcli ALIAS caj
ENDIF
=MEN_LIN(BOTOM)
RETURN
