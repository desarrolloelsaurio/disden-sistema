*****************************************
*-- Programa: OPALQ.PRG
*-- Fecha   : 04-15-92 02:37pm
*-- Notas   : ABRE ARCHIVO CONTRATOS
******************************************
IF USED("ALQ")
	SELE ALQ
	SET ORDER TO TAG CODINM
ELSE
	=MEN_LIN(ABA+'Contratos')
	SELE 16
	USE (PATHALQ+'\CONTRATO') ORDER TAG CODINM ALIAS ALQ
ENDIF
RETU IIF(INMPOP,DEFPOGRL(INMPOPR,INMPOPC,"INMPOP","INM.DOMICILIO",40),.T.) .AND. MEN_LIN(BOTOM)
