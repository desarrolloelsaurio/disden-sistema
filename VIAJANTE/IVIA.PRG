********************************************************************************
*-- Programa: ivia.prg
*-- Fecha   : 06/12/91 12:44pm
*-- Version : R. 'EL BATA'
*-- Notas   : INGRESA VIAJANTES
*--           MODIFICACION GOYO 03/25/92 03:27pm
*-- Modificaci¢n GOYO 12-24-92 12:47pm - eliciu
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	SELE via
	STOR " Ingreso "+biajas+" - " TO me1
	STOR 25 TO COL
	STOR NUL TO kok
	DO WHIL .T.
		=MOVEWIN(iviar,iviac,iviar+iviala,iviac+iviaan,'win'," Ingreso "+biaja+" ")
		CLEA
		SCAT MEMV BLAN
		=MVIA(.F.)
		@ 1,COL GET m.codvia PICT '@!';
		valid !yaestaba(m.CODVIA,alias(),'CODVIA',.T.);
		error 'CODIGO VIAJANTE EXISTENTE';
		MESS me1+TECMEN
		READ
		@ 2,COL GET m.viajante PICT '@!';
		valid !yaestaba(m.viajante,alias(),'vIAjante',.T.,.F.,.T.);
		error 'CODIGO VIAJANTE EXISTENTE';
		MESS me1+'Apellidos y Nombres completos'
		@ 3,COL GET m.domicilio PICT '@!';
		MESS me1+'Domicilio'
		READ when laST()#27 .AND. !EMPTY(M.CODVIA)
		if last()#27 .and. !empty(m.viajante)
			STOR NUL TO respuesta
			if !empty(ELICIU("del "+biaja+" ",4,col))
				m.localidad=mix.nu1
				ACTI WIND win
				nada=mix.texto1
				@ 4,COL GET nada
				CLEAR GETS
				SELE via
				@ 5,COL GET m.telefono PICT '@!';
				MESS me1+'N§ de Tel‚fono'
				m.tipo = '             '
				@ 6,COL GET m.tipo;
				PICT '@M REPRESENTANTE,'+upper(bIAJA);
				MESS me1+'Tipo'
				READ
				m.tipo = LEFT(m.tipo,1)
				=AGRABAR("VIA")
				=iaud(ALLTRIM(M.CODVIA)+'-'+M.VIAJANTE)
			ENDIF
		ELSE
			EXIT
		ENDIF
	ENDDO
	=RELEWIN("win")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
