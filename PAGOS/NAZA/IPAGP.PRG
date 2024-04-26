*******************************************************************************
*-- Programa: IPAGP.PRG
*-- Fecha   : 08-06-92 11:42am
*-- Version : R. 'EL BATA'
*-- Notas   : INGRESA PAGOS
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	DO WHILE .T.
		STORE NUL TO RESPUESTA
		IF !empty(ELIEMP("a Ingresar",-1,1))
			DO OPCCP
			DO OPCAJ
			=OPCCH()
			DO WHILE .T.
				STORE NUL TO RESPUESTA
				IF !EMPTY(ELIPRO("",-1,1))
					ELPRO=PRO.PROCOD
					SELE CCP
					SET ORDER TO TAG PROCOD
					IF SEEK(ELPRO)
						STORE NUL TO HABER,DEBE,PUNTERO,PESOS,DOLARES,GTTL,PNCHE,cheques
						store .F. to hayCHEQUES, haycheqmio
						RELE FAXT
						DIME FAXT[1]
						IF !Empty(Q_PAG(ELPRO,'HABER','DEBE',.T.))
							lgr=MAX(ALEN(FAXT,1),3)
							if lgr>16
								msg=' HAY MAS OPERACIONES PERO NO ENTRAN EN PANTALLA '
								DIME FAXT[16,3]
							else
								msg=JANNAME
							endif
							CREN=16-MAX(ALEN(FAXT,1),3)
							=MOVEWIN(CREN,NUL,21,79,'WIN',' Ingresa Cobranza - '+alltrim(PRO.PROVEEDOR)+' ',MSG)
							@ 1,1 SAY 'PROVEEDOR' COLO SCHE 3
							@ 1,15 SAY PRO.PROVEEDOR
							@ 3,1 SAY 'COMPRAS' COLO SCHE 3
							@ 3,20 SAY HABER PICT '99,999,999.99'
							@ 4,1 SAY 'PAGOS' COLO SCHE 3
							@ 4,20 SAY DEBE PICT '99,999,999.99'
							DEUDA=HABER-DEBE
							@ 5,1 SAY 'DEUDA' COLO SCHE 3
							@ 5,20 GET DEUDA PICT '99,999,999.99'
							CLEA GETS
							@ 1,40 SAY 'OPERACIONES IMPAGAS' COLO SCHE 3
							REN=3
							FOR pxA=1 TO ALEN(FAXT,1)
								@ REN,40 SAY FAXT[pxa,1] COLO SCHE 3
								@ REN,55 SAY FAXT[pxa,2] PICT '99,999,999.99' COLO SCHE 3
								STORE NUL TO FAXT[pxa,3]
								@ REN,72 GET FAXT[pxa,3] func '*C' colo sche 19
								REN=REN+1
							next
							REN=WROW()
							READ CYCLE
							ZOOM WIND WIN NORM FROM CREN,NUL TO 23,79
							@ REN,45 SAY '*INGRESA*' colo sche 19
							@ REN,65 SAY '**ANULA**' colo sche 19
							STORE 1 TO SIGUE
							@ REN,45 GET SIGUE PICT '@*ITH ;' SIZE 1,9,11 colo sche 19
							READ CYCLE
							IF LAST()#27 .AND. SIGUE=1
								CREN=WROW()+1
								FOR A=1 TO ALEN(FAXT,1)
									IF FAXT[a,3]=1
										FACTURA=val(FAXT[a,1])
										EXIT
									ENDIF
								NEXT
								ZOOM WIND WIN NORM FROM NUL,NUL TO CREN-2,79
								=MOVEWIN(CREN-4,NUL,CREN+5,50,'WIN1',' Discriminaci¢n del Pago ')
								STORE DATE() TO LAFECHA
								@ 1,1 say 'FECHA' COLO SCHE 3
								@ 1,20 GET LAFECHA MESS 'Fecha de la Operaci¢n - [ESC] para Fin'
								@ 3,1 say upper(xauss) colo sche 3
								@ 3,30 GET M.PESOS PICT '@Z 99,999,999.99' MESS 'Cobrado en '+xauss+' - [ESC] para Fin'
								@ 4,1 say upper(xadols) colo sche 3
								@ 4,30 GET M.DOLARES PICT '@Z 99,999,999.99' MESS 'Cobrado en '+xadols+'  - [ESC] para Fin'
								@ 5,1  GET M.hayCHEQUES PICT 'CHEQUES' FUNC '*C' MESS 'Hay Cheques 3ros  - [ESC] para Fin' colo sche 19
								@ 6,1  GET M.hayCHEQMIO PICT 'CHEQUES PROPIOS' FUNC '*C' MESS 'Hay Cheques Propios  - [ESC] para Fin' colo sche 19
								@ 6,30 GET m.nada pict "@* OK" DEFA 0 SIZE 1,6 colo sche 19
								READ CYCLE
								if last()#27
									STORE NUL TO M.CHEQUES
									if m.haycheques
										if !empty(eligas("",-1,1))
											m.gastter=left(mix.texto2,11)
											=elicchp()
										else
											m.haycheques=.F.
										endif
									endif
									STORE NUL TO M.CHEQUESmio
									if m.haycheqmio
										temp=GENTMP()
										sele caj
										copy stru to (temp)
										sele 0
										use (temp) alias tmp2
										=ichep(.T.)
									endif
									M.PUNMAR=(JANNRO-1)*20+19
									GO M.PUNMAR IN DOC
									=RLOCK() .OR. LOK(STR(M.PUNMAR),'DOC')
									m.RECIBO=doc.numero
									M.GTTL=M.chequesmio+M.cheques+M.PESOS+M.DOLARES*XACOTIZ
									IF !EMPTY(M.GTTL)
										ACTI WIND WIN1
										ZOOM WIND WIN1 NORM FROM CREN-4,NUL TO CREN+8,50
										@ 5,1 say space(50)
										@ 5,1 SAY 'CHEQUES' COLO SCHE 3
										@ 5,30 GET m.CHEQUES PICT '99,999,999.99'
										@ 6,1 say space(50)
										@ 6,1 SAY 'CHEQUES PROPIOS' COLO SCHE 3
										@ 6,30 GET m.CHEQUESmio PICT '99,999,999.99'
										@ 7,1 SAY 'TOTAL' COLO SCHE 3
										@ 7,30 GET M.GTTL PICT '99,999,999.99'
										CLEA GETS
										IF CONFIRMA("el Pago",.f.,9,2)
											if m.haycheqmio
												=men_lin("GRABANDO CHEQUES PROPIOS")
												sele caj
												append from (dbf('tmp2'))
												sele tmp2
												=iaud("CAJ mio"+dtoc(tmp2.fechaop)+" CAJA:"+tmp2.CAJA+" "+tmp2.compr)
												scan
													SCAT MEMV
													m.nroche=''
													m.pagada=.t.
													m.fechave=m.fechaop
													m.procod=m.codcli
													m.codcli=''
													M.DETALLE = "CHEQUE N§"+TMP2.NROCHE
													M.COMPRRE = tmp2.compre
													M.NUMERORE= tmp2.numere
													=Agrabar("CCP")
													=iaud("CCP mio"+dtoc(m.fechaop)+" "+m.detalle)
												ends
												use
											endif
											if m.haycheques
												=men_lin("GRABANDO CHEQUES TERCEROS")
												SELE CCH
												SET ORDER TO TAG CODCLI
												SELE TMP
												SCAN FOR !EMPTY(SELECCION)
													SCAT MEMV
													M.PROCOD  = PRO.PROCOD
													M.FECHAOP = M.LAFECHA
													M.FECHAVE = TMP.FECHADE
													M.DETALLE = "CHEQUE N§"+TMP.NROCHE
													M.COMPR   = ''
													M.COMPRRE = "OP"
													M.NUMERORE= STR(M.RECIBO)
													M.TIPO    = "CH"
													M.CUOTA   = NUL
													M.PAGADA  = .F.
													=AGRABAR("CCP")
													=iaud("CCP pro"+dtoc(m.fechaop)+" "+m.detalle)
													SELE CCH
													IF SEEK(TMP.CODCLI)
														SCAN WHILE CODCLI=TMP.CODCLI
															IF EQ_REG("CCH","TMP")
																REPL ENTREGADO WITH .T.
																REPL gasto     WITH m.gastter
																repl procod    with pro.procod
																repl fechasal  with m.lafecha
																EXIT
															ENDIF
														ENDS
													ENDIF
													SELE TMP
												ENDSCAN
											endif
											=men_lin("GRABANDO EN CUENTA CORRIENTE")
											TTL=GTTL
											ULT=1
											FOR IA=1 TO ALEN(FAXT,1)
												IF FAXT[IA,3]=1
													IF TTL>0
														TTL=RESTACCp(PER.CODCLI,FAXT[IA,1],TTL)
														ULT=IA
													ELSE
														EXIT
													ENDIF
												ENDIF
											NEXT
											IF !EMPTY(TTL)
												=RESTACCp(PER.CODCLI,FAXT[ULT,1],TTL,.T.)
											ENDIF
											STORE '' TO M.NROCHE, M.PROCOD, M.BANCO
											STORE PRO.PROCOD TO M.PROCOD, M.CODCLI
											STORE .T. TO M.PROVEEDOR
											STORE M.LAFECHA TO M.FECHAOP, M.FECHAVE
											M.NUMERORE= STR(M.RECIBO)
											M.COMPR="FAC N§ "+ALLTRIM(STR(FACTURA))
											M.COMPRRE="OP"
											M.CAJA="00"
											M.PAGADA=.T.
											IF !EMPTY(PESOS)
												M.DETALLE="PAGO EN EFVO. "+UPPER(XAUSS)
												M.MONTO=PESOS
												M.MONEDA=XAUSS
												M.EQUIVALE=PESOS/XACOTIZ
												=AGRABAR("CCP")
												m.monto=-(m.monto)
												m.equivale=-(m.equivale)
												=AGRABAR("CAJ")
												=iaud("CCP "+dtoc(m.fechaop)+" "+m.detalle)
												=iaud("CAJ "+dtoc(m.fechaop)+" CAJA:"+m.CAJA+" "+m.compr)
											ENDIF
											IF !EMPTY(DOLARES)
												M.DETALLE="PAGO EN EFVO. "+UPPER(XADOLS)
												STORE DOLARES TO M.MONTO
												store dolares/xacotiz to M.EQUIVALE
												M.MONEDA=XADOLS
												=AGRABAR("CCP")
												m.monto=-(m.monto)
												m.equivale=-(m.equivale)
												=AGRABAR("CAJ")
												=iaud("CCP "+dtoc(m.fechaop)+" "+m.detalle)
												=iaud("CAJ "+dtoc(m.fechaop)+" CAJA:"+m.CAJA+" "+m.compr)
											ENDIF
										ENDIF
										UNLO IN DOC
									ENDIF
									if m.haycheques
										SELE TMP
										USE
									endif
								ENDIF
								=RELEWIN("WIN1")
							ENDIF
							=RELEWIN("WIN")
						ENDIF
					ELSE
						=CARTEL2("NO SE ENCONTRO DEUDA",;
						"DEL PROVEEDOR "+ALLTRIM(PRO.PROCOD),;
						ALLTRIM(PRO.PROVEEDOR),"IMPOSIBLE INGRESAR PAGOS")
					ENDIF
				ELSE
					exit
				ENDIF
			ENDDO
		ELSE
			EXIT
		ENDIF
		if cant_empre=1
			exit
		endif
	ENDDO
ELSE
	=Iaudi()
ENDIF
=MEN_LIN(BOTOM)
RETURN
