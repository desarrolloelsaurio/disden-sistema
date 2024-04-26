********************************************************************************
*-- Programa: HFAC.PRG
*-- Fecha   : 01/29/92
*-- Version : V.LEEGSTRA
*-- Notas   : GENERA HISTORICO DE FACTURAS DE PROVEEDORES
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=iaud("")
	CLEA
	=movewin(10,10 TO 15,69,win," Archivando en el Hist¢rico de Facturas de Proveedores ")
	@ 1,3 say "Archivando en el Hist¢rico de Facturas de Proveedores    "
	@ 2,3 say "las facturas previamente marcadas y borradas l¢gicamente."
	if confirma(" Archivar en el Hist¢rico",.t.,20,0)
		SET DELE OFF
		sele far
		COPY TO TMPFAR FOR deleted()
		use
		sele fad
		COPY TO TMPFAD FOR deleted()
		use
		acti scre
		DO ophfa
		SELE har
		=flock("har") .or. flok("har")
		APPE FROM TMPFAR
		UNLO IN har
		USE
		SELE hac
		=flock("hac") .or. flok("hac")
		APPE FROM TMPFAD
		UNLO IN hac
		USE
		DELE FILE TMPFAD.DBF
		DELE FILE TMPFAR.DBF
		DO opfco
		SELE far
		=flock("far") .or. flok("far")
		* pack
		UNLO IN far
		SELE fad
		=flock("fad") .or. flok("fad")
		*     PACK
		UNLO IN fad
		SET DELE ON
	ENDIF
	=RELEWIN(win)
ELSE
	=iaudi()
ENDIF
ACTI SCRE
=men_lin(botom)
RETURN
