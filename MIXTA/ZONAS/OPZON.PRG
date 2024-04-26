********************************************
*-- Programa: OPzon
*-- Fecha   : 11-21-91 11:21am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE ZONAS
********************************************
#DEFINE NUL    0                                 && NUL
IF USED("MIX")
   SELE MIX
	SET ORDER TO TAG ZONTEX
ELSE
   =MEN_LIN(ABA+"Zonas")
   SELE 1
	USE (PATH+'\MIXTA') order tag ZONtex ALIAS mix
ENDIF
RETURN IIF(ZONpop,DEFPOMIX(ZONpopr,ZONpopc),MEN_LIN(BOTOM))
