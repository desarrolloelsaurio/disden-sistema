*:*********************************************************************
*-- Programa: IREC.prg
*-- Fecha   : 11-14-91 03:49pm
*-- Versi¢n : R. 'EL BATA'
*-- Notas   : INGRESA MERCADERIA DE NOTAS DE PEDIDO PROVEEDORES
*
DECLARE produto[16]
SELE pec
STORE RECNO() TO ff
registro=STR(ff)
regpec=registro
SCAT MEMV
STORE productiva TO tipopec
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	ACTI WIND win2
	=LOCK() .OR. lok('PEC')
	SELE pe1
	ftb=""
	ft=""
	SCAN FOR pedido=m.pedido .AND. procod=m.procod .AND. cantidad>entregado
		ft=ft+ALLTRIM(STR(RECNO()))+","
	ENDSCAN
	IF LEN(ft)>0
		ft=LEFT(ft,LEN(ft)-1)
		cuantos=OCCURS(",",ft)+1
		registro = ft
		DO lok WITH 'PE1'
		SELE pec
		STORE 17 TO COL
		SCAT MEMVAR
		IF EMPTY(pec.fechaent)
			DO mrec WITH ft, 1, .T.
			DEFINE WINDOW win10 FROM 13,5 TO 18,50 SHAD COLO SCHE 8
			ACTI WIND win10
			m.numero = 0
			m.fecharem = DATE()
			@ 1,3 SAY "NUMERO DE REMITO PROVEEDOR : " GET m.numero PICT "@Z 9999999999"
			@ 2,3 SAY "FECHA DE EMISION           : " GET m.fecharem
			READ
			RELE WIND win10
			IF m.numero > 0
				SELE rec
				IF SEEK(STR(m.numero)+m.procod)
					DEFINE WINDOW win10 FROM 20,5 TO 24,69 DOUB TITL ' *** MENSAJE *** ' SHAD COLO SCHE 8
					ACTI WIND win10
					@ 1,0 SAY PADC("YA FUE INGRESADA EL DIA "+DTOC(fecharem),63)
					=INKEY(nul )
					RELE WIND win10
				ELSE
					desdecual = 1
					DO WHILE .T.
						DO mrec WITH ft, desdecual, .T.
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
											ren = opcion + 9
											GO VAL(SUBSTR(ft, nada, nada1-nada))
											SCAT MEMV
											IF tipopec="M"
												SELE mer
												SET ORDER TO 1
												nadaa=LEFT(m.articulo,13)
												SEEK nadaa
												@ ren ,c1 GET nadaa
												nadam=LEFT(mer.merca,29)
												@ ren ,c2 GET nadam
												IF m.color>0
													SELE mix
													nadac=buscol(SUBSTR(m.articulo,12,2),7)
													@ ren, c6 GET nadac
												ENDIF
												CLEA GETS
											ELSE
												IF tipopec="T"
													SELE tel
													SET ORDER TO 1
													nadaa=LEFT(m.articulo,10)
													SEEK nadaa
													@ ren ,c1 GET nadaa
													nadam = LEFT(tel.tela,29)
													@ ren ,c2 GET nadam
													IF m.color>0
														GO m.color IN ("MIX")
														nadac=LEFT(mix.texto1,7)
														@ ren, c6 GET nadac
													ENDIF
													CLEA GETS
												ELSE
													IF tipopec="A"
														SELE avi
														SET ORDER TO 1
														nadaa=LEFT(m.articulo,10)
														SEEK nadaa
														@ ren ,c1 GET nadaa
														nadam=LEFT(avi.avios,29)
														@ ren ,c2 GET nadam
														IF m.color>0
															GO m.color IN ("MIX")
															nadac=LEFT(mix.texto1,7)
															@ ren, c6 GET nadac
														ENDIF
														CLEA GETS
													ELSE
														@ ren ,c1 GET m.articulo
														@ ren ,c2 GET m.descripcio
														IF m.color>0
															GO m.color IN ("MIX")
															nadac=LEFT(mix.texto1,7)
															@ ren, c6 GET nadac
														ENDIF
														CLEA GETS
													ENDIF
												ENDIF
											ENDIF
											@ ren, c3 GET m.talle        PICT "99.99"
											@ ren, c4 GET unid(m.unidad) PICT "xxxxxx"
											m.cuanto = m.cantidad - m.entregado
											@ ren, c5 GET m.cuanto PICT "@Z 9999999999"
										ENDIF
										CLEA GETS
										DEFINE WINDOW win10 FROM 0,5 TO 4,43 SHAD COLO SCHE 8
										ACTI WIND win10
										m.cuanto = m.cantidad - m.entregado
										@ 1,3 SAY "CANTIDAD RECIBIDA : " GET m.cuanto;
										PICT "@Z 9999999999";
										VALID m.cuanto <= m.cantidad - m.entregado
										READ
										RELE WIND win10
										IF m.cuanto > 0
											SELE re1
											APPE BLANK
											GATH MEMV
											REPL tipo WITH tipopec
											DO repuse
											REPL cantidad WITH m.cuanto
											ftb=ftb+ALLTRIM(STR(RECNO()))+","
											SELE pe1
											REPL entregado WITH m.entregado + m.cuanto
											DO repuse
											ftb=ftb+ALLTRIM(STR(RECNO()))+","
										ENDIF
										SELE pe1
									ENDIF
								ENDIF
							ENDIF
							EXIT
						ENDDO
						IF opcion = ii+1 .OR. cuantos=0
							EXIT
						ENDIF
					ENDDO
					IF LEN(ftb)>0
						DO lrec
						IF confirma("Grabar el remito del proveedor",.T.,17,10)
							ACTI SCRE
							@ 24,0 SAY PADC(grabando,80,'*') COLO SCHE 19
							SELE rec
							DO flok WITH "REC"
							APPE BLAN
							GATH MEMV
							DO repuse
							UNLO IN rec
							SELE re1
							ftb=LEFT(ftb,LEN(ftb)-1)
							DO WHILE LEN(ftb) > 0
								nada = AT(",",ftb)-1
								GO VAL(SUBSTR(ftb, 1, nada)) IN re1
								ftb = SUBSTR(ftb,nada+2)
								nada = AT(",",ftb)-1
								ftb=IIF(nada>0,SUBSTR(ftb,nada+2),"")
								IF tipopec="M"
									SELE pre
									IF SEEK (LEFT(re1.articulo,13)+RIGHT("000"+ALLTRIM(STR(re1.talle*10)),3))
										REPLACE stock WITH stock + re1.cantidad
									ENDIF
								ELSE
									IF tipopec="T"
										SELE tel
										REPLACE stock WITH stock + re1.cantidad
									ELSE
										IF tipopec="A"
											SELE avi
											REPLACE stock WITH stock + re1.cantidad
										ENDIF
									ENDIF
								ENDIF
								SELE kar
								IF tipopec="M"
									APPEND BLANK
									REPL fechaop   WITH m.fecharem
									REPL articulo  WITH LEFT(re1.articulo,13)+RIGHT("000"+ALLTRIM(STR(re1.talle*10)),3)
									REPL opk       WITH 4
									REPL docref    WITH 'RE'
									REPL nrodocref WITH m.numero
									REPL cliente   WITH procod
									REPL detalle   WITH 'Ing.RE Nro:'+STR(m.numero)
									REPL entrada   WITH re1.cantidad
									REPL proveedor WITH .T.
									DO repuse
								ELSE
									IF tipopec="T"
										APPEND BLANK
										REPL fechaop   WITH m.fecharem
										REPL tipo      WITH LEFT(tella,1)
										REPL articulo  WITH tel.telcod
										REPL unidad    WITH tel.unidad
										REPL opk       WITH 4
										REPL detalle   WITH 'Ing.RE Nro:'+STR(re1.numero)
										REPL entrada   WITH re1.cantidad
										REPL numero    WITH re1.numero
										REPL proveedor WITH procod
										DO repuse
									ELSE
										IF tipopec="A"
											APPEND BLANK
											REPL fechaop   WITH m.fecharem
											REPL tipo      WITH LEFT(abio,1)
											REPL articulo  WITH avi.avicod
											REPL unidad    WITH avi.unidad
											REPL opk       WITH 4
											REPL detalle   WITH 'Ing.RE Nro:'+STR(re1.numero)
											REPL entrada   WITH re1.cantidad
											REPL numero    WITH re1.numero
											REPL proveedor WITH procod
											DO repuse
										ENDIF
									ENDIF
								ENDIF
							ENDDO
							UNLO IN re1
							SELE pe1
							SCAN FOR pedido=m.pedido .AND. procod=m.procod .AND. cantidad>entregado
								EXIT
							ENDSCAN
							IF EOF()
								SELE pec
								GO VAL(regpec)
								REPLACE fechaent WITH DATE()
							ENDIF
							IF imprime("el remito del Proveedor",.T.,17,10)
								copias=copias("Remito del Proveedor",.T.,17,10)
								DO lreci1
							ENDIF
						ELSE
							SELE re1
							DO flok WITH "RE1"
							ftb=LEFT(ftb,LEN(ftb)-1)
							DO WHILE LEN(ftb) > 0
								nada = AT(",",ftb)-1
								GO VAL(SUBSTR(ftb, 1, nada)) IN re1
								ftb = SUBSTR(ftb,nada+2)
								nada = AT(",",ftb)-1
								IF nada=0
									GO VAL(ftb) IN pe1
									ftb = ""
								ELSE
									GO VAL(SUBSTR(ftb, 1, nada)) IN pe1
									ftb = SUBSTR(ftb,nada+2)
								ENDIF
								SELE pe1
								REPL entregado WITH entregado - re1.cantidad
								SELE re1
								DELETE
							ENDDO
							UNLO IN re1
						ENDIF
					ENDIF
				ENDIF
			ENDIF
		ENDIF
	ELSE
		DEFINE WINDOW win10 FROM 19,5 TO 24,69 DOUB TITL ' *** MENSAJE *** ' SHAD COLO SCHE 8
		ACTI WIND win10
		@ 1,0 SAY PADC("FUE TOTALMENTE ENTREGADO",63)
		@ 2,0 SAY PADC("EL DIA "+DTOC(pec.fechaent),63)
		=INKEY(nul,"HM")
		RELE WIND win10
		SELE kar
		USE
	ENDIF
ELSE
	=IAUDI()
ENDIF
RETURN
