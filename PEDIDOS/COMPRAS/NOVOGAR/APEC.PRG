*:*********************************************************************
*-- Programa: APEc.PRG
*-- Fecha   : 06/12/91 03:24pm
*-- Version : R. 'EL BATA'
*-- Notas   : BORRA LINEAS DE NOTAS DE PEDIDO proveedores
*-- Modificaci¢n GOYO 08-12-92 12:25pm
*:**********************************************************************
DECLARE produto[16]
SELE pec
SCAT MEMV
STORE productiva TO tipopec
STORE RECNO() TO ff
registro=STR(ff)
STORE productiva TO tipopec
STORE HORA_ULP(PROGRAM()) TO ulpr
IF cheqseg()
	ACTI WIND win2
	CLEA
	DO lok WITH 'PEC'
	SELE pe1
	ft=""
	ft2=""
	SCAN FOR pedido=m->pedido .AND. procod=m->procod
		IF !entregado>0
			ft=ft+ALLTRIM(STR(RECNO()))+","
		ENDIF
		ft2=ft2+ALLTRIM(STR(RECNO()))+","
	ENDSCAN
	ft2=SINULT(FT2)
	IF LEN(ft)>0
		ft=SINULT(FT)
		cuantos=OCCURS(",",ft)+1
		registro = ft
		DO lok WITH 'PE1'
		SELE pec
		STORE 17 TO COL
		SCAT MEMVAR
		IF EMPTY(pec->fechaent)
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
					produto[II]=LEFT(pe1->articulo,13)
					ren=ren+1
					ii=ii+1
				NEXT
				DO WHILE .T.
					FOR I=1 TO ii-1
						@ I+9 ,c1 PROMPT produto[I]
					NEXT
					@ 24, 30 PROMPT "\<ANTERIOR"
					@ 24, 45 PROMPT "\<SALIR"
					@ 24, 60 PROMPT "\<POSTERIOR"
					opcion = 0
					MENU TO opcion
					IF !EMPTY(opcion)
						IF opcion = ii
							IF desdecual-14>=1
								desdecual=desdecual-14
							ELSE
								LOOP
							ENDIF
						ELSE
							IF opcion = ii+1
								EXIT
							ELSE
								IF opcion = ii+2
									IF desdecual+14<=cuantos
										desdecual=desdecual+14
									ELSE
										LOOP
									ENDIF
								ELSE
									SELE pe1
									I = opcion + desdecual - 1
									nada=IIF(I=1,1,AT(",",ft,I-1)+1)
									nada1=IIF(I=cuantos,LEN(ft)+1,AT(",",ft,I))
									GO VAL(SUBSTR(ft, nada, nada1-nada))
									SCAT MEMV
									ren = opcion + 9
									XSEEK(m->articulo,"MER","ARTICULO")
									@ ren ,c1 GET m->articulo
									nada = mer->merca
									@ ren ,c2 GET nada
									@ ren, c3 GET m->cantidad     PICT "@Z 9999999999"
									@ REN,C4 GET M.MONTO PICT '99,999,999.99'
								ENDIF
								CLEA GETS
								IF confirma("Borrar la linea de Pedido",.T.,12,0)
									SELE pe1
									DELE
									DO iaud WITH 'BORRO LIN PED.PRO '+STR(m->pedido)+pro->procod
									IF cuantos=1
										cuantos=0
										SELE pe1
										SEEK STR(m->pedido)+STR(m->procod)
										IF FOUND()
											DO cartel2 WITH "NO QUEDAN MAS ARTICULOS","PARA ENTREGAR DE","ESTA NOTA DE PEDIDO",""
											SELE pec
											DO repuse
											REPL fechaent WITH DATE()
										ELSE
											DO cartel2 WITH "UD. BORRA LA UNICA LINEA","DE LA NOTA DE PEDIDO","ESTA SERA BORRADA",""
											SELE pec
											DELE RECO ff
											DO iaud WITH 'BORRO NOTA PED. PRO '+ALLTRIM(STR(m->pedido))+pro->procod
										ENDIF
									ELSE
										nada=IIF(I=1,0,AT(",",ft,I-1))
										nada1=IIF(I=cuantos,LEN(ft)+1,AT(",",ft,I))
										ft = STUFF (ft, nada, nada1-nada,"")
										cuantos = cuantos - 1
									ENDIF
									SELE pe1
								ENDIF
							ENDIF
						ENDIF
					ENDIF
					EXIT
				ENDDO
				IF opcion = ii+1 .OR. cuantos=0
					EXIT
				ENDIF
			ENDDO
		ENDIF
	ELSE
		DO mpec WITH ft2, 1
		=cartel2("LA NOTA DE PEDIDO","FUE TOTALMENTE ENTREGADA","HASTA EL DIA",DTOC(ped->fechaent))
	ENDIF
ELSE
	=iaudi()
ENDIF
=men_lin(botom)
RETURN
