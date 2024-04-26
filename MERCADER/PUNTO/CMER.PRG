*****************************************
*-- Programa: CMER.PRG
*-- Fecha   : 06/15/91
*-- Version : G. REINER
*-- Notas   : CORRIGE MERCADERIA
*-- Modificaci¢n GOYO 05-17-92 12:00pm
****************************************
STOR RECNO("MER") TO ff
STORE STR(ff) TO registro
STORE hora_ulp(PROGRAM()) to ULPR
IF CHEQSEG()
	=movewin(cmerr,cmerc,cmerr+cmerla,cmerc+cmeran,'win'," Correcci¢n Producto ")
	SELE mer
	SET ORDER TO 1
	GOTO ff
	SCAT MEMV
	=lock() .or. lok()
	STOR " Correcci¢n Producto - " TO me1
	STOR 17 TO COL
	STOR .F. TO kok
	STORE .T. TO sigue
	DO mmer WITH .T.
	STOR NUL TO respuesta
	=XSEEK(M.RUBRO,'MIX','RUBCOD')
	STORE mix.texto1 TO NADA,nada_o1,nada_e1
	@ 2,COL GET nada MESS '[TECLA] y [ENTER] para Corregir'
	READ
	IF LASTKEY()#27
		IF updated()
			STORE .T. TO sigue
			IF !empty(elirub(" del Producto",2,COL))
				m.rubro=LEFT(MIX.TEXTO2,3)
				NADA=MIX.TEXTO1
				nada_e1=nada
				ACTI WIND win
				@ 2,COL GET nada
				CLEAR GETS
			ELSE
				STORE .F. TO sigue
			ENDIF
		ENDIF
		IF sigue
			SELE mer
			SET ORDER TO TAG ARTICULO
			STORE SUBSTR(m.articulo,5) TO nada
			nada=LEFT(nada,AT('/',nada)-1)
			nada_o2=nada
			nada_e2=nada
			@ 3,COL GET nada PICT "@X";
			MESS "Ingrese el n£mero del Plano.[ESC] para Men£"
			READ
			IF LASTKEY()#27
				IF !EMPTY(m.nada)
					m.ar1=ZERO(m.rubro,3)
					m.ar2=ZERO(m.nada,6)
					nada_e2=m.ar2
					=XSEEK(mer.suela,'MIX','SUECOD')
					STORE MIX.TEXTO1 TO nada
					nada_o3=nada
					nada_e3=nada
					@ 11,COL GET nada MESS '[TECLA] y [ENTER] para Corregir'
					READ
					IF updated()
						STOR NUL TO respuesta
						DO WHILE empty(elisue( "del Producto",11,COL))
						ENDDO
						m.suela=LEFT(MIX.TEXTO2,2)
						nada=MIX.TEXTO1
						nada_e3=nada
						SELE mer
						@ 11,COL GET nada
						CLEAR GETS
					ENDIF
				ENDIF
			ENDIF
		ENDIF
		IF SIGUE .AND. (NADA_O1#NADA_E1 .OR. NADA_O2#NADA_E2 .OR. NADA_O3#NADA_E3)
			=XSEEK(M.SUELA,'MIX','SUECOD')
			m.ar3=LEFT(MIX.TEXTO2,2)
			STORE m.ar1+'-'+m.ar2+'/'+m.ar3 TO m.articulo
			@ 1,COL GET m.articulo
			CLEAR GETS
			SET DELE OFF
			SET ORDER TO 1
			SEEK m.articulo
			SET DELE ON
			IF !EMPTY(m.articulo)
				SELE mer
				SET DELE OFF
				SEEK m.articulo
				SET DELE ON
				IF FOUND()
					SCAT MEMV
					ACTI SCRE
					@ 24,nul say PADC('PRODUCTO '+ALLTRIM(m.articulo)+TEN,80) COLO SCHE 19
					ACTI WIND win
					DO existe WITH ' MERCADERIA'
					=INKEY(0)
					CLEA
					STORE .F. TO sigue
				ENDIF
			ENDIF
		ENDIF
		IF SIGUE
			ACTI WIND win
			nada1=qtem(m.temporada)
			nada2=qsex(m.sexo)
			@ 4,COL GET m.merca PICT "@!";
			MESS "Ingrese la denominaci¢n comercial del producto"
			READ
			ACTI SCRE
			=MEN_LIN("[ESC] para Salir - [TAB] Para Grabar")
			GOTO ff
			ON KEY LABEL TAB KEYBOARD CHR(23)
			=movewin(cmerr+4,cmerc+4,cmerr+10,cmerc+cmeran+4,'win1'," Descripci¢n Completa ")
			MODI MEMO merca1 WINDOW win1
			ON KEY LABEL TAB
			=RELEWIN("WIN1")
			ACTI WIND win
			nada=PADR(CHRTRAN(mer.merca1,CHR(13)+CHR(10),'-'),30)
			@ 5,COL GET nada
			CLEAR GETS
			@ 6,COL GET nada1 PICT "@M Primavera,Verano,Oto¤o,Invierno,Todas";
			MESS "Ingrese la temporada en la que se usa"
			@ 7,COL GET nada2 PICT OPC_SEX;
			MESS "Ingrese caracter¡stica del producto"
			READ
			STORE nada1 TO m.temporada
			STORE nada2 TO m.sexo
			STORE " " TO nada1,nada2
			SELE mer
			GOTO ff
			=xseek(mer.linea,'mix','lincod')
			STORE mix.texto1 TO nada
			=xseek(zero(mix.nu2,2),'mix','marcod')
			STORE mix.texto1 TO nada1
			@ 8,COL GET nada MESS tecmod
			READ
			IF updated()
				STOR NUL TO respuesta
				DO WHILE empty(elilin(" del Producto",8,COL))
				ENDDO
				m.linea=left(mix.texto2,2)
				nada=mix.texto1
				@ 8,COL GET nada
				CLEAR GETS
			ENDIF
			NADA1=SAYMIX(MER.MARCA,'marcod')
			@ 9,COL GET nada1 MESS TECMOD
			READ
			IF updated()
				STOR NUL TO respuesta
				DO WHILE empty(eliMAR(" del Producto",8,COL))
				ENDDO
				m.MARCA=left(mix.texto2,2)
				nada=mix.texto1
				@ 9,COL GET nada
				CLEAR GETS
			ENDIF
			SELE mer
			=XSEEK(mer.material,'MIX','MATCOD')
			STORE MIX.TEXTO1 TO nada
			@ 10,COL GET nada MESS tecmod
			READ
			IF updated()
				STOR NUL TO respuesta
				DO WHILE empty(elimat( "del Producto",10,COL))
				ENDDO
				m.material=LEFT(MIX.TEXTO2,2)
				nada=MIX.TEXTO1
				SELE mer
				@ 10,COL GET nada
				CLEAR GETS
			ENDIF
			=XSEEK(mer.tela,'TELS','TELCODPRO')
			STORE telS.tela TO nada
			@ 12,COL GET nada MESS tecmod
			READ
			IF updated()
				STOR NUL TO respuesta
				DO WHILE empty(elitelS( "del Producto",12,COL))
				ENDDO
				m.tela=TELS.TELCODPRO
				nada=telS.tela
				ACTI WIND win
				SELE mer
				@ 12,COL GET nada
				CLEAR GETS
			ENDIF
			nada1=IIF(m.jean,'SI','NO')
			@ 13,COL GET nada1 MESS 'El Art¡culo pertenece al Grupo JEAN ?'
			READ
			IF confirma("las correcciones",.T.,18,0)
				m.jean=(nada1='SI')
				=men_lin(grabando)
				SELE mer
				GOTO ff
				GATH MEMV
				=REPUSE()
				=iaud(m.articulo)
			ENDIF
		ENDIF
	ENDIF
	=RELEWIN('win')
ELSE
	=iaudi()
ENDIF
UNLO IN mer
RETURN men_lin(BOTOM)
