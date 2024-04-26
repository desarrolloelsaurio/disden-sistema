********************************************************************************
*-- Programa: BCNX2.prg
*-- Fecha   : 01-22-92 11:12am
*-- Version : R. 'EL BATA'
*-- Notas   : BORRA DATOS DE TODAS LAS UNIDADES DE UN CONSORCIO
********************************************************************************
stor hora_ulp(PROGRAM()) TO ulpr
IF CHEQSEG()
	=moveWIN(mcnxr,mcnxc,mcnxr+mcnxla,mcnxc+mcnxan,'win'," Confirma Consorcio ")
	SELE cns
	STORE 25 TO COL
	SCAT MEMVAR
	DO mcns with .t.
	store nul to kok
	IF confirma("el CONSORCIO",.T.,mcnXr+mcnXla,mcnXc+10)
		sele cnx
		dele for concod = cns.concod
	ENDIF
	=RELEWIN('WIN')
	=IAUD(CNS.CONCOD)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
