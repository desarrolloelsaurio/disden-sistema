******************************************************************************
*-- Programa: OPPRA.PRG
*-- Fecha   : 10-17-92 07:31pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE PRACTICAS Y UNIDADES DE PRACTICAS
********************************************************************************
IF USED("PRX")
   SELE PRX
ELSE
   SELE 15
   =GETDBF('PRACTDAT','CODPRA','PRX')
ENDIF
IF USED("PRA")
   SELE PRA
ELSE   
	=MEN_LIN(ABA+"Pr cticas")
	SELE 14
   =GETDBF('PRACTICAS','CODPRA','PRA')	
ENDIF
IF PRApop
   =DEFPOGRL(PRAPOPR,PRAPOPC,"PRAPOP","PRA.PRACTICABR",30,"Elija la Pr ctica")
ENDIF
RETURN MEN_LIN(BOTOM)
