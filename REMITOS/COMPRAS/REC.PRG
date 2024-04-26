*:*********************************************************************
*-- Programa: REC.prg
*-- Fecha   : 31/1/96
*-- Version : GOYO REINER
*-- Notas   : DERIVA A OPERACIONES DE REMITOS PROVEEDORES
*:**********************************************************************
=cabpan1()
=oppec()
=OPMER()
=OPPRO()
=OPREQ()
=OPPRO()
RC_DIJO=ALLTRIM(PROM())
DO CASE
CASE RC_DIJO="Recibe Remito"
	STORE .T. TO ESPROPIO
	DO IREM.SPR WITH .T.,.T.
CASE RC_DIJO="Legajo de Remito"
	STORE .F. TO ESPROPIO
	DO REM_LEG.SPR
*#Lista \<por Pantalla
*#Lista por \<Impresora
CASE RC_DIJO="Mira un Remito"
	IF PRO()
		DO MREC.SPR
	ENDIF
CASE RC_DIJO="Reindexa"
DO XREC
ENDCASE
ULPR=PROGRAM()
RETURN MEN_LIN(BOTOM)
