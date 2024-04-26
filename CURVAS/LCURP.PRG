********************************************************************************
*-- Programa: LCURP.PRG
*-- Fecha   : 06/13/91 03:01pm
*-- Version : g. reiner
*-- Notas   : LISTA CURVA
**********************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	SELE cur
	STOR " Lista Curva - " TO me1
	STOR 17 TO COL
	store nul to respuesta,kok
	if !EMPTY(elicur(" a Listar"))
		scat memv
		SET DELE OFF
		SEEK m.curva
		SET DELE ON
		ACTI SCRE
		RELE curve
		DIME curve[19,3]
		store space(10) to curve
		IF FOUND()
			COPY TO ARRAY curve FOR m.curva=curva
			fincur=19
			=movewin(0,icurc+icuran-4,24,21+icurc+icuran,'win1'," Curva "+ALLTRIM(M.CURVA)+' ')
			=MCUR()
			=INKEY(nul,'hm')
			=relewin("win1")
		endif
	ENDIF
ELSE
	=iaudi()
ENDIF
RETURN men_lin(botom)