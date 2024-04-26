********************************************************************************
*-- Programa: LLFAC.PRG
*-- Fecha   : 01/29/92
*-- Version : V.LEEGSTRA
*-- Notas   : RECUPERA FACTURAS DE PROVEEDORES COMPRENDIDAS ENTRE 2 FECHAS
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	DO iaud WITH 'INGRESO '+ulpr
	CLEA
	STOR {} TO nada1,nada2
	DEFINE WINDOW win FROM 10,10 TO 15,60 TITL " Recuperaci¢n de Facturas de Proveedores " COLOR SCHE 8
	ACTI WIND win
	@ 1,5 say "Se recuperar n las facturas cuya fecha de operaci¢n est‚n"
	@ 2,5 say "comprendidas entre el d¡a :" get nada1 pictu "@D" MESS "Extremo inferior del rango"
	@ 3,5 say "                 y el d¡a :" get nada2 pictu "@D" MESS "Extremo superior del rango - [ESC] para Salir"
	read
	if !empty(nada1) .and. !empty(nada2) .and. lastkey()#27
		clea
		@ 1,5 say "Recuperando las facturas de Proveedores  "
		@ 2,5 say "incluidas en un determinado lapso.       "
		SELE far
		DO flok WITH "far"
		RECALL ALL FOR far.fechaem>nada1 .AND. far.fechaem<nada2
		UNLO IN far
		SELE fad
		SET ORDER TO
		=FLOCK("FAD") .OR. flok("fad")
		RECALL ALL FOR fad.fechaem>nada1 .AND. fad.fechaem<nada2
		UNLO IN fad
		=relewin("win")
	endif
ELSE
	=IAUDI()
ENDIF
ACTI SCREE
=MEN_LIN(BOTOM)
RETURN
