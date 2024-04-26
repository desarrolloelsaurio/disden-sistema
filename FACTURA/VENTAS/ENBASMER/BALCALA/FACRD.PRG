********************************************************************************
*-- Programa: FACRD.PRG
*-- Fecha   : 13/08/91
*-- Version : V.LEEGSTRA
*-- Notas   : GENERACION DE FACTURAS A PARTIR DE UN REMITO INTERNO
********************************************************************************
PARAMETER nanurem,nnumarca
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	STOR 22 TO COL
	STOR NUL TO kok
	CLEA
	rebla="³"+SPACE(16)+"³"+SPACE(29)+"³"+SPACE(12)+"³"+SPACE(10)+"³"+SPACE(7)+"³"
	GOTO nnumarca in mar
	stor mar->marca TO nadmarca
	t1="REMITO Nro. "+Alltrim(STR(nanurem))
	stor STR(nanurem)+STR(nnumarca) TO fisc
	t2="de la Marca "+Alltrim(nadmarca)
	stor " " TO nada
	DIME carga[3]
	STOR NUL TO carga
	stor .T. TO sigue
	SELE rem
	SET DELE OFF
	SEEK fisc
	SET DELE ON
	acti SCRE
	CLEA
	IF FOUND()
		@ 24,nul SAY padc(t1+' '+t2+' existe',80) COLO sche 19
		SCAT memv
		do while .t.
			IF EMPTY(m->facturado)
				IF (m->interna)
					stor STR(RECNO()) TO Registro
					stor .F. TO salir
					DO lok WITH "rem"
					define wind win1 FROM 0,nul TO 23,79 none
					acti wind win1
					DO factmas
					CLEA GETS
					SELE PER
					SET ORDER TO 2
					GO TOP
					if seek(m->codcli)
						stor Alltrim(PER.cliente)+' - '+Alltrim(PER.codcli) TO nada
					ELSE
						EXIT
					ENDIF
					stor m->codcli TO nada16
					SELE rem
					@ 1,1 SAY "Cliente:"  GET nada COLO sche 1
					@ 2,1 SAY PER.domicilio COLO sche 1
					GOTO PER.localidad in mix
					stor Alltrim(mix->texto1) TO nada
					stor Alltrim(mix->texto2) TO nada1
					stor Alltrim(nada+"-"+STR(mix->nu2,4)+"-") TO nada
					GOTO mix->nu1 in mix
					stor nada+Alltrim(mix->texto1) TO nada
					@ 3,1 SAY nada COLO sche 1
					stor ("("+nada1+") "+PER.telefonos) TO nada1
					@ 4,1 SAY nada1 COLO sche 1
					stor xaciva[PER.condiva,1] TO nada1
					@ 5,1 SAY nada1 COLO sche 1
					@ 5,18 SAY "N§ de IVA:"+PER.nroiva COLO sche 1
					SELE via
					GO TOP
					if SEEK(m->codvia)
						stor via->viajante TO nada
					ELSE
						EXIT
					ENDIF
					SELE rem
					@ 6,1 SAY "Viajante: "+nada COLO sche 1
					GOTO rem->condpago in mix
					stor mix->texto1 TO nada
					FOR A=4 TO 16 STEP 3
						stor VAL(SUBSTR(nada,A,3)) TO nada5
						IF EMPTY(nada5)
							stor SUBSTR(nada,1,A-1) TO nada
							stor SUBSTR(nada,1,3) TO nada1
							FOR I=4 TO A-1 STEP 3
								stor nada1+"-"+SUBSTR(nada,I,3) TO nada1
								endfor
								EXIT
							ENDIF
							endfor
							stor nada1 TO nada15
							@ 1,45 SAY "Cond. de Pago: "+nada1 COLO sche 1
							PUNMAR=(NNUMARCA-1)*20+5
							GOTO PUNMAR IN DOC
							STOR DOC->NUMERO TO nada18
							@ 2,45 SAY "FACTURA N§:"+STR(nada18) COLO sche 1
							@ 3,45 SAY "Remito Interno N§ :"+STR(nanurem) COLO sche 1
							CLEAR GETS
							stor CTOD("01/01/80") TO nada1
							stor DATE() TO nada2,nada12
							stor xauss TO nada9
							stor "@M "+Alltrim(xauss)+","+Alltrim(xadols) TO nn
							@ 4,45 SAY "Fecha de emisi¢n: " GET nada12 PICTURE "@D" RANGE nada1,nada2;
							MESS "Fecha de emisi¢n de la Factura - [ESC] para Salir"
							READ
							IF LASTKEY()=27
								=relewin("WIN1")
								EXIT
							ENDIF
							@ 5,45 SAY "Moneda en que se factura" GET nada9 PICTURE nn;
							MESS "Moneda en que se Factura"
							READ
							stor xacotiz TO nada10
							@ 6,45 SAY "Cotizaci¢n" GET nada10 PICTURE "99999999999.99" MESS "Cotizaci¢n de la fecha - [ESC] para Salir"
							READ
							IF LASTKEY()=27
								=relewin("WIN1")
								stor .T. TO borrarem
								exit
							ENDIF                              && LASTKEY()=27
							ff=""
							SELE rex
							if SEEK(fisc)
								inicio=RECNO()
								ff=""
								SCAN WHILE rex->remito=nanurem .AND. rex->marca=nnumarca
									ff=ff+Alltrim(STR(RECNO()))+','
								ENDSCAN
								ff=LEFT(ff,LEN(ff)-1)
								STORE ff TO registro
								DO lok WITH  "rex"
								GOTO inicio
								************************
								R=10
								c1=1
								c2=18
								c3=35
								c4=42
								c5=55
								c6=65
								STOR NUL TO pretot
								************************
								SCAN WHILE rex->remito=nanurem .AND. rex->marca=nnumarca
									SELE mer
									SET ORDER TO 1
									IF SEEK(LEFT(rex->articulo,13))
										@ R,c1 SAY rex->articulo
										@ R,c2 SAY mer->merca
										SELE rex
										IF rex->usacurva
											SELE cur
											IF SEEK(rex->curva)
												stor LEFT(rex->articulo,13)+RIGHT("000"+Alltrim(STR(cur->talle*10)),3) TO nadart
											ELSE
												@ R,c3 SAY "CURVA INEXISTENTE"
											ENDIF
										ELSE
											stor LEFT(rex->articulo,13)+RIGHT("000"+Alltrim(STR(rex->talle*10)),3) TO nadart
										ENDIF
										SELE pre
										IF SEEK(nadart)
											registro=STR(RECNO())
											DO lok WITH "pre"
											@ R,c1 SAY rex->articulo
											@ R,c2 SAY mer->merca
											SELE rex
											IF rex->usacurva
												@ R,c1+10 SAY SUBSTR(rex->curva,1,5)
											ELSE
												@ R,c3 SAY rex->talle
											ENDIF
											IF PER.precio=1
												unitario=porcen(pre->costo,pre->precio1)
											ELSE
												IF PER.precio=2
													unitario=porcen(pre->costo,pre->precio2)
												ELSE
													IF PER.precio=3
														unitario=porcen(pre->costo,pre->precio3)
													ELSE
														IF PER.precio=4
															unitario=porcen(pre->costo,pre->precio4)
														ELSE
															DO cartel WITH t1,t2,"NO EXISTE PRECIO PARA EL CLIENTE","DE ESE REMITO. POR FAVOR CORRIJA"
														ENDIF
													ENDIF
												ENDIF
											ENDIF
											UNLO in pre
										ELSE
											DO cartel WITH t1,t2,"EL ARTICULO "+mer->merca,"NO TIENE PRECIO"
											stor .F. TO sigue
											EXIT
										ENDIF                        && FOUND EN PRE
										STOR NUL TO nada
										FOR A=1 TO 3
											IF !EMPTY(xaci[A])
												IF xaciva[PER.condiva,A*2]#0
													IF xaciva[PER.condiva,A*2+1]="NO"
														nada1=unitario*xaciva[A*2]/100
														nada=nada+nada1
													ENDIF
												ENDIF
											ENDIF
											endfor
											stor ROUND(unitario+nada,2) TO unitario
											IF nada9#xamoneda
												IF xamoneda=xauss
													stor ROUND(unitario/nada10,2) TO unitario &&unitario en u/s
												ELSE
													stor ROUND(unitario*nada10,2) TO unitario &&unitario en A
												ENDIF
											ENDIF
											REPL rex->unit WITH unitario
											@ R,c4 GET unitario PICTURE "99999999.99" RANGE 1,99999999.99;
											MESS "Confirma/Modifica el Precio Unitario" COLO sche 3
											READ
											IF LASTKEY()=27
												stor .F. TO sigue
												=relewin("WIN1")
												EXIT
											ENDIF
											REPL rex->unit1 WITH unitario
											IF !rex->usacurva
												stor rex->cantidad TO cantid
											ELSE
												SELE cur
												GO TOP
												if SEEK(rex->curva)
													SUM(cur->cantidad) WHILE cur->curva=rex->curva TO cantid
													stor rex->cantidad*cantid TO cantid
												ELSE
													DO cartel WITH "PARA "+t1,t2,("NO EXISTE CURVA "+rex->curva),"CORRIJA E INTENTE NUEVAMENTE"
													stor .F. TO sigue
													EXIT
												ENDIF
											ENDIF
											@ R,c5 SAY cantid PICT '999999.99'
											stor cantid*unitario TO nada
											@ R,c6 SAY nada PICTURE "99999999999.99"
											CLEAR GETS
											STOR NUL TO cantid
											stor ROUND(pretot+nada,2) TO pretot
											****************************
											IF R<24
												R=R+1
											ELSE
												DO WHILE ren>9
													R=R-1
													@ R,nul SAY REBLA
												ENDDO
												R=10
											ENDIF
											*****************************
										ELSE
											DO cartel WITH "PARA "+t1,t2,"NO SE ENCONTRO EL ARTICULO "+rex->articulo+"EN MERCADERIA","POR FAVOR CORRIJA"
											stor .F. TO sigue
											EXIT
										ENDIF
									ENDSCAN
									IF sigue
										DO flok WITH "fac"
										STOR NUL TO neto,moiva,moot2,moot3,bruto,nada8
										FOR A=1 TO 3
											IF !EMPTY(xaci[A])
												IF xaciva[PER.condiva,A*2]#0
													IF xaciva[PER.condiva,A*2+1]="NO"
														neto=pretot
														nada8=nada8+(xaciva[PER.condiva,A*2]/100)
														bruto=ROUND(neto/(1+nada8),2)
														moiva=ROUND(bruto*xaciva[PER.condiva,2]/100,2)
														moot2=ROUND(bruto*xaciva[PER.condiva,4]/100,2)
														moot3=ROUND(bruto*xaciva[PER.condiva,6]/100,2)
													ELSE
														bruto=pretot
														IF A=1
															moiva=porcen(pretot,xaciva[A*2])-pretot
														ELSE
															IF A=2
																moot2=porcen(pretot,xaciva[A*2])-pretot
															ELSE
																IF A=3
																	moot3=porcen(pretot,xaciva[A*2])-pretot
																ENDIF
															ENDIF
														ENDIF
														neto=ROUND(bruto+moiva+moot2+moot3,2)
													ENDIF
												ENDIF
											ENDIF
											endfor
											IF nada9#xamoneda
												IF xamoneda=xauss
													stor ROUND(moiva*nada10,2) TO moiva
													stor ROUND(moot2*nada10,2) TO moot2
													stor ROUND(moot3*nada10,2) TO moot3
												ENDIF
											ELSE
												IF xamoneda=xadols
													stor ROUND(moiva*nada10,2) TO moiva
													stor ROUND(moot2*nada10,2) TO moot2
													stor ROUND(moot3*nada10,2) TO moot3
												ENDIF
											ENDIF
											IF nada9=xauss
												stor neto-(bruto+moiva+moot2+moot3) TO nada
												IF !EMPTY(nada)
													stor (bruto+nada) TO bruto
												ENDIF
											ENDIF
											stor " " TO nada2
											STOR NUL TO nada3
											stor 40 TO col1
											stor 60 TO col2
											GOTO rem->condpago in mix
											stor mix->texto1 TO nada2
											stor 1 TO I
											FOR A=4 TO 16 STEP 3
												stor VAL(SUBSTR(nada2,A,3)) TO nada5
												IF EMPTY(nada5)
													EXIT
												ENDIF
												stor I+1 TO I
												endfor
												define wind win FROM 10,nul TO 18+I,79 TITL "Condiciones de Pago" shad colo sche 8
												acti wind win
												@ 1,2 SAY "FECHA DE EMISION: " GET nada12 PICTURE "@D"
												@ 1,col1 SAY "MONTO BRUTO: "
												@ 1,col2 GET bruto PICTURE "99999999999.99"
												stor 2 TO J
												FOR A=1 TO 3
													IF !EMPTY(xaci[A])
														IF xaciva[PER.condiva,A*2]#0
															@ J,col1 SAY xaci[A]+": "
															IF A=1
																@ J,col2 GET moiva PICTURE "99999999999.99"
															ELSE
																IF A=2
																	@ J,col2 GET moot2 PICTURE "99999999999.99"
																ELSE
																	@ J,col2 GET moot3 PICTURE "99999999999.99"
																ENDIF
															ENDIF
															stor J+1 TO J
														ENDIF
													ENDIF
													endfor
													@ J,col1 SAY "MONTO NETO A PAGAR: "
													@ J,col2 GET neto PICTURE "999999999
