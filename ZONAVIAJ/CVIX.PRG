********************************************************************************
*-- Programa: CVIX.prg
*-- Fecha   : 06/12/91 12:44pm
*-- Version : R. 'EL BATA'
*-- Notas   : CORRIGE DATOS DE VIAJANTES
*-- Modificaci¢n GOYO 04-02-92 12:55pm
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca -> empresa
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	DEFINE WINDOW win FROM mviar,mviac TO mviar+mviala,mviac+mviaan TITL " Selecciona "+biaja+" " SHAD COLOR SCHE 8
	SELE via
	stor 25 TO COL
	SCAT MEMVAR
	DO mvia with .t.
	IF confirma(" "+upper(bIAJA),.T.,mviar+mviala,nul)
		DO WHILE .T.
			DEFINE WINDOW win1 FROM ivixr,ivixc TO ivixr+ivixla,ivixc+ivixan TITL " Correcci¢n de Zonas de "+biajas+" " SHAD COLOR SCHE 8
			SELE vix
			STOR " Correccci¢n de Zonas de "+biajas+" - " TO me1
			STOR 20 TO COL
			STOR .F. TO kok
			ACTI WIND win1
			CLEA
			nada=m->codvia
			SCAT MEMV
			SET NEAR ON
			SEEK via->codvia+m->marca+m->zona
			SET NEAR OFF
			IF via->codvia#vix->codvia .OR. EOF()
				ACTI SCREE
				DEAC WIND win
				@ 24,nul SAY PADC('EL '+upper(bIAJA)+' '+ALLTRIM(via->codvia)+'No posee ZONAS de VENTA - Enter para continuar',80) COLO SCHE 19
				ACTI WIND win1
				DO existe WITH ' '+upper(biaja)+' SIN MARCA Y ZONA'
				=INKEY(0)
				DEAC WIND win1
				EXIT
			ENDIF
			SCAN WHILE via->codvia=vix->codvia
				ACTI WIND win1
				SCAT MEMV
				DO mvix
				ACTI SCREEN
				=men_lin("Elija ZONA de venta del '+biaja+' - [] Sig. - [ENTER] Corrige - [ESC] Sale")
				nada=NUL
				DO WHILE nada#13 .AND. nada#24 .AND. nada#27
					nada=INKEY()
				ENDDO
				IF nada = 13
					ACTI WIND win1
					SELE mix
					=xseek(m.zona,'mix','zoncod')
					nada=mix->texto1
					@ 2,COL GET nada MESS 'Ingrese ZONA, UNA TECLA y [ENTER] modifica'
					READ
					IF updated()
						SET ORDER TO TAG ZONTEX
						STOR NUL TO respuesta
						m->zona = elizon (" del "+biaja+" - [ESC] Sale",2,COL)
						m.zona=left(texto2,2)
						ACTI WIND win1
						nada=mix->texto1
						@ 2,COL GET nada
						CLEAR GETS
					ENDIF
					=xseek(m.marca,'mix','marcod')
					nada=mix.texto1
					@ 3,COL GET nada MESS 'Ingrese MARCA, UNA TECLA y [ENTER] modifica'
					READ
					IF updated()
						m->marca=NUL
						DO WHILE m->marca=NUL
							STOR NUL TO respuesta
							m->marca = ELIEMP (" del "+biaja,2,COL)
						ENDDO
						ACTI WIND win1
						nada=mix.texto1
						marca=left(mix.texto2,2)
						@ 3,COL GET nada
						CLEAR GETS
					ENDIF
					SELE vix
					nada = RECNO()
					SEEK m->codvia+m->marca+m->zona
					ACTI SCRE
					IF FOUND()
						=men_lin('ZONA '+ALLTRIM(mix->texto1)+' Y MARCA '+ALLTRIM(m->marca)+TEN)
						ACTI WIND win1
						DO existe WITH ' MARCA Y ZONA'
						=INKEY(0)
						CLEA
						GO nada
					ELSE
						@ 24,nul SAY grabando COLO SCHE 19
						GO nada
						do flok with "vix"
						GATH MEMV
						do REPuse
						STOR .T. TO kok
						UNLO IN vix
						IF kok
							DO iaud  WITH 'COR Zona Venta '+m->codvia
						ENDIF
					ENDIF
					IF nada = 27
						EXIT
					ENDIF
				ENDIF
			ENDSCAN
			DEAC WIND win1
			DEAC WIND win
			EXIT
		ENDDO
	ELSE
		DEAC WIND win
	ENDIF
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
