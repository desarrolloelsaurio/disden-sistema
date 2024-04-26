*****************************************
*-- Programa: OPCAJD.PRG
*-- Fecha   : 21/10/95
*-- Version : G. RENER
*-- Notas   : ABRE ARCHIVO DE CAJA DIARIO
*****************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM

PARA SHIT,O_EXCL,O_REOP
IF O_REOP
   =REOPXXX("CAJD")
ENDIF	
IF O_EXCL 
   =CLOSDBF("CAJD")
ENDIF
IF !USED("CAJD")
	=MEN_LIN(ABA+"Caja Diaria")
	=prxarea(.t.)
	IF O_EXCL
	USE (pathcaj+'\CAJADIA') ALIAS cajD EXCL	
	ELSE
	USE (pathcaj+'\CAJADIA') ALIAS cajD
	ENDIF
ENDIF
if !XSEEK(DATE(),"CAJD","FECHAOP")
   SCAT MEMV BLAN
   M.FECHAOP=DATE()
   M.SUCURSAL=M.SUCU
   =AGRABAR("CAJD")
ENDIF   
RETU MEN_LIN(BOTOM)
