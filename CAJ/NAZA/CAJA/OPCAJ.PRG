***************************************
*-- Programa: OPCAJ.PRG
*-- Fecha   : 09/03/91 06:22pm
*-- Version : G. RENER
*-- Notas   : ABRE ARCHIVO DE CAJA
***************************************
PARA SHIT,O_EXCL,O_REOP
IF O_REOP
   =REOPXXX("CAJ")
ENDIF	
IF O_EXCL 
   IF USED("CAJ")
      USE IN CAJ
   ENDIF   
ENDIF
IF !USED("CAJ")
	=MEN_LIN(ABA+"Caja")
	SELE 17
	IF O_EXCL
	USE (pathcaj+'\CAJA') ALIAS caj EXCL	
	ELSE
	USE (pathcaj+'\CAJA') ALIAS caj
	ENDIF
ENDIF
RETU MEN_LIN(BOTOM)
