*************************************
*-- Programa: OPCOL.PRG
*-- Fecha   : 06/12/91 01:50pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO COLORES
************************************
IF USED("MIX")
    SELE MIX
	SET ORDER TO TAG COLTEX
ELSE
=MEN_LIN(ABA+"Colores")
   SELE 1
	USE (PATHVEN+'\MIXTA') ORDER TAG COLTEX ALIAS MIX
ENDIF
RETURN IIF(COLPOP,DEFPOMIX(COLPOPR,COLPOPC),.T.) .AND. MEN_LIN(BOTOM)
