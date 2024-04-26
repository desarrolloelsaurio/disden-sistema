********************************************************************************
*-- Programa: CVIA.PRG
*-- Fecha   : 06/12/91 03:04pm
*-- Version : R. 'EL BATA'
*-- Notas   : CORRIGE VIAJANTES
*-- Modificaci¢n GOYO 12-24-92 12:46pm - eliciu
********************************************************************************
STOR RECNO() TO ff
registro=STR(ff)
ulpr=hora_ulp(program())
if cheqseg()
	=moveWIN(cviar,cviac,cviar+cviala,cviac+cviaan,'win'," Correcci¢n "+biajas+" ")
	SELE via
	if lock(registro,'via') .or. lok("via")
		SCAT MEMV
		STOR " Correcci¢n "+biajas+" - " TO me1
		STOR 25  TO COL
		STOR .F. TO kok,cambio
		STOR .T. TO sigue
		=mvia(.t.)
		@ 1,COL GET m.codvia PICT '@!';
		valid !yaestaba(m.CODVIA,alias(),'CODVIA',.T.,.T.,.T.);
		error 'CODIGO VIAJANTE EXISTENTE';
		MESS me1+TECMEN
		READ
		cambio=update()
		@ 2,COL GET m.viajante PICT '@!';
		valid !yaestaba(m.viajante,alias(),'VIAJANTE',.T.,.T.,.T.);
		error 'VIAJANTE EXISTENTE';
		MESS me1+'Apellidos y Nombres completos'
		@ 3,COL GET m.domicilio  PICT x30;
		MESS me1+'Domicilio'
		READ WHEN LAST()#27 .AND. !EMPTY(M.CODVIA)
		IF LAST()#27 .AND. !EMPTY(M.CODVIA)
			CAMBIO=IIF(UPDATE(),.T.,CAMBIO)
			=XSEEK(m.localidad,'mix','CIUCOD')
			stor mix.texto1 TO nada
			@ 4,COL GET nada MESS 'UNA TECLA y [ENTER] modifica'
			READ
			IF updated()
				STOR NUL TO respuesta
				if !empty(eliciu (" de la Ciudad",4,COL))
					nada=mix.texto1
					@ 4,COL GET nada
					CLEAR GETS
					stor .T. TO cambio
					SELE via
					M.LOCALIDAD=MIX.NU1
				else
					store .f. to sigue
				endif
			ENDIF
			if sigue
				@ 4,COL GET nada
				CLEAR GETS
				@ 5,COL GET m.telefono PICT x20;
				MESS me1+'N§ de Tel‚fono'
				m.tipo = qvia(m.tipo)
				@ 6,COL GET m.tipo;
				PICT '@M REPRESENTANTE,'+upper(biaja);
				MESS me1+'Tipo'
				READ WHEN LAST()#27
				m.tipo = LEFT(m.tipo,1)
				CAMBIO=IIF(UPDATE(),.T.,CAMBIO)
				IF LAST()#27 .AND. CAMBIO
					=men_lin(grabando)
					SELE via
					GOTO ff
					GATH MEMV
					=repuse()
					=iaud(alltrim(m.codvia)+"-"+viajante)
				ENDIF
			ENDIF
		ENDIF
	ENDIF
	UNLO IN via
	=RELEWIN("win")
ELSE
	=iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)
