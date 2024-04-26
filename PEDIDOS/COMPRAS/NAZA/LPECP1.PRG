************************************************
*-- Programa: LPECP1.PRG
*-- Fecha   : 06/12/91 03:24pm
*-- Version : R. 'EL BATA'
*-- Notas   : LISTA NOTAS DE PEDIDO de PROVEED.
************************************************
DECLARE produto[16]
SELE pec
STORE RECNO() TO ff
registro=STR(ff)
STORE HORA_ULP(PROGRAM()) TO ULPR
IF COEFSEG()
	ACTI WIND win2
	CLEA
	SELE pe1
	ft=""
	ft2=""
	SCAN FOR pedido=m.pedido .AND. marca=m.marca
		IF !entregado>0
			ft=ft+ALLTRIM(STR(RECNO()))+","
		ENDIF
		ft2=ft2+ALLTRIM(STR(RECNO()))+","
	ENDSCAN
	ft2=LEFT(ft2,LEN(ft2)-1)
	IF LEN(ft)>0
		ft=LEFT(ft,LEN(ft)-1)
		cuantos=OCCURS(",",ft)+1
		SELE pec
		STORE 18 TO COL
		SCAT MEMVAR
		IF EMPTY(pec.fechaent)
			desdecual = 1
			DO WHILE .T.
				DO mpec WITH ft, desdecual
				hastacual=desdecual+13
				IF hastacual>cuantos
					hastacual=cuantos
				ENDIF
				ren=10
				ii=1
				FOR I=desdecual TO hastacual
					nada=IIF(I=1,1,AT(",",ft,I-1)+1)
					nada1=IIF(I=cuantos,LEN(ft)+1,AT(",",ft,I))
					GO VAL(SUBSTR(ft, nada, nada1-nada)) IN pe1
					produto[II]=LEFT(pe1.articulo,13)
					ren=ren+1
					ii=ii+1
					ENDFOR
					DO WHILE .T.
						@ 24, 30 PROMPT "\<ANTERIOR"
						@ 24, 45 PROMPT "\<SALIR"
						@ 24, 60 PROMPT "\<POSTERIOR"
						opcion = 0
						MENU TO opcion
						IF !EMPTY(opcion)
							IF opcion = 1
								IF desdecual-14>=1
									desdecual=desdecual-14
								ELSE
									LOOP
								ENDIF
							ELSE
								IF opcion = 2
									EXIT
								ELSE
									IF opcion = 3
										IF desdecual+14<=cuantos
											desdecual=desdecual+14
										ELSE
											LOOP
										ENDIF
									endif
								ENDIF
							ENDIF
						ENDIF
						EXIT
					ENDDO
					IF opcion = 2 cuantos=0
						EXIT
					ENDIF
				ENDDO
			ENDIF
		ELSE
			DO mpec WITH ft2, 1
			DEFINE WINDOW win10 FROM 21,5 TO 24,69 DOUB TITL ' *** MENSAJE *** ' SHAD COLO SCHE 8
			ACTI WIND win10
			@ 0,0 SAY PADC("FUE TOTALMENTE ENTREGADO",63)
			@ 1,0 SAY PADC("EL DIA "+DTOC(pec.fechaent),63)
			=INKEY(nul )
			=RELEWIN("win10")
		ENDIF
	ELSE
		=IAUDI()
	ENDIF
	=MEN_LIN(BOTOM)
RETURN
