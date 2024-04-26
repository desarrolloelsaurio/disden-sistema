********************************************************************************
*-- Programa: bVIX4.prg
*-- Fecha   : 06/12/91 12:44pm
*-- Version : R. 'EL BATA'
*-- Notas   : BORRA DATOS DE VIAJANTES
*-- Modificaci¢n GOYO 04-02-92 12:52pm
*-- Modificaci¢n GOYO 07-22-92 11:37pm optimizaci¢n
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	SELE via
	stor 25 TO COL
	SCAT MEMVAR
	=MOVEWIN(mviar,mviac,mviar+mviala,mviac+mviaan,'WIN'," Selecciona "+biaja+" ")
	DO mvia with .t.
	IF confirma(biaja,.T.,12,nul)
		DO WHILE .T.
			SELE vix
			STOR " Borrado de Zonas de "+biajas+" - " TO me1
			STOR 20 TO COL
			STOR NUL TO kok
			=MOVEWIN(ivixr,ivixc,ivixr+ivixla,ivixc+ivixan,"WIN"," Datos de "+biajas+" ")
			SCAT MEMV BLAN
			SET NEAR ON
			SEEK via.codvia+m.marca+m.zona
			SET NEAR OFF
			IF via.codvia#vix.codvia
				ACTI SCREE
				=RELEWIN("win")
				=MEN_LIN(upper(biaja)+' '+ALLTRIM(via.codvia)+'No posee ZONA de VENTA - Enter para continuar')
				ACTI WIND win1
				=existe(' '+upper(biaja)+' SIN MARCA Y ZONA')
				=iNKEY(NUL,'HM')
				DEAC WIND win1
				EXIT
			ENDIF
			SCAN WHILE vix.codvia=via.codvia
				ACTI WIND win1
				SCAT MEMV
				DO mvix
				=MEN_LIN("Elija MARCA y ZONA del "+upper(biaja)+" - [] Sig. - [B] Borra - [ESC] Sale")
				nada=NUL
				DO WHILE nada#98 .AND. nada#66 .AND. nada#24 .AND. nada#27
					nada=INKEY()
				ENDDO
				IF nada=66 .OR. nada=98
					IF confirma("la ZONA y MARCA del "+biaja,.T.,12,nul)
						=loCk("vix",str(recno("vix"))) .or. lok("vix",str(recno("vix")))
						DELE
						UNLO IN vix
						=iaud(via.codvia)
						SELE vix
					ENDIF
				ELSE
					IF nada=27
						EXIT
					ENDIF
				ENDIF
			ENDSCAN
			DEAC WIND win,win1
			EXIT
		ENDDO
	ELSE
		DEAC WIND win
	ENDIF
ELSE
	=iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)
