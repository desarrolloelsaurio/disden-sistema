*****************************************
*-- Programa: OPCHEQ.PRG
*-- Fecha   : 21/10/95
*-- Version : G. RENER
*-- Notas   : ABRE ARCHIVO DE CHEQUES
*****************************************
PARAMETER OP_EXCL,OP_REOP
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
=IIF(OP_EXCL .OR. OP_REOP,CLOSDBF("CHEQ"),.T.)
IF !USED("CHEQ")
	=MEN_LIN(ABA+"Cheques")
	=prxarea(.t.)
	IF OP_EXCL
   	   USE (pathcaj+'\CHEQUES') ALIAS CHEQ EXCL	
	ELSE
	   USE (pathcaj+'\CHEQUES') ALIAS CHEQ SHARED
	ENDIF
ENDIF
SELE CHEQ
RETU MEN_LIN(BOTOM)
