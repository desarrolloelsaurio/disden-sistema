****************************************************************************
*-- Programa: FACR.PRG
*-- Fecha   : 07/08/91
*-- Version : V.LEEGSTRA
*-- Notas   : GENERACION DE FACTURAS A PARTIR DE UN REMITO
*-- Modificaci¢n GOYO 07-23-92 01:11am marca -> empresa
********************************************************************************
STORE HORA_ULP(PROGRAM()) to ULPR
IF CHEQSEG()
	DO WHIL .T.
		DEFI WIND win FROM iremr,iremc TO iremr+iremla,iremc+ireman TITL " Generaci¢n de la Factura " SHAD COLOR SCHE 8
		SELE rex
		STOR " Generaci¢n de la Factura " TO me1
		STOR 22 TO COL
		STOR nul TO kok, nurem,numarca
		ACTI WIND win
		@ 1,2 SAY "NUMERO DE REMITO" COLO SCHE 3
		@ 2,2 SAY "MARCA           " COLO SCHE 3
		@ 1,COL GET nurem PICT "9999999999";
		MESS "Ingrese N§ de Remito a Facturar - [ENTER] para Men£"
		READ
		IF !EMPTY(nurem)
			STOR SPACE(20) TO nada
			@ 2,COL GET nada ;
			MESS "Ingrese la Marca - [ESC] para Men£"
			CLEA GETS
			STOR nul TO respuesta
			t1="EL REMITO Nro. "+ALLTRIM(STR(nurem))
			IF !EMPTY(eliemp(" del Remito",2,COL))
				numarca=MIX.NU1
				nada=mIX.TEXTO1
				PUNMAR=(NUMARCA-1)*20+5
				GO PUNMAR IN DOC
				STOR DOC.NUMERO TO nada18
				ACTI WIND win
				@ 2,COL GET nada
				CLEA GETS
				STOR STR(nurem)+STR(numarca) TO fisc
				t2="de la Marca "+ALLTRIM(nada)
				STOR " " TO nada
				DIME carga[3]
				STOR nul TO carga
				STOR .T. TO sigue
				SELE rem
				SET DELE OFF
				SEEK fisc
				SET DELE ON
				ACTI SCRE
				IF FOUND()
					@ 24,0 SAY PADC(t1+' '+t2+' existe',80) COLO SCHE 19
					ACTI WIND win
					CLEA
					SCAT MEMV
					IF EMPTY(m.facturado)
						IF !(m.interna)
							DO mrem
							IF confirma(" el Remito",.T.,15,0)
								ACTI SCRE
								@ 24,0 SAY PADC(' Remito confirmado ',80,'*') COLO SCHE 19
								STOR RECNO() TO reg
								STOR str(RECNO()) TO registro
								do lok with "rem"
								RELE WIND win
								DEFINE WIND win1 FROM 0,0 TO 23,79 NONE
								ACTI WIND win1
								DO factmas
								CLEA GETS
								SELE PER
								SET ORDER TO 2
								GO TOP
								IF SEEK(m.codcli)
									STOR ALLTRIM(PER.cliente)+' - '+ALLTRIM(PER.codcli) TO nada
								ELSE
									EXIT
								ENDI
								STOR m.codcli TO nada16
								SELE rem
								@ 1,1 SAY "Cliente:"  GET nada COLO SCHE 3
								@ 2,1 SAY PER.domicilio COLO SCHE 3
								GO PER.localidad IN mix
								STOR ALLTRIM(mix.texto1) TO nada
								STOR ALLTRIM(mix.texto2) TO nada1
								STOR ALLTRIM(nada+"-"+STR(mix.nu2,4)+"-") TO nada
								GO mix.nu1 IN mix
								STOR nada+ALLTRIM(mix.texto1) TO nada
								@ 3,1 SAY nada COLO SCHE 3
								STOR "("+nada1+") "+PER.telefonos TO nada1
								@ 4,1 SAY nada1 COLO SCHE 3
								STOR xaciva[PER.condiva,1] TO nada1
								@ 5,1 SAY nada1 COLO SCHE 3
								@ 5,18 SAY "N§ de IVA:"+PER.nroiva COLO SCHE 3
								SELE via
								GO TOP
								IF SEEK(m.codvia)
									STOR via.viajante TO nada
								ELSE
									EXIT
								ENDI
								SELE rem
								@ 6,1 SAY "Viajante: "+nada COLO SCHE 3
								GO rem.condpago IN mix
								STOR mix.texto1 TO nada
								FOR A=4 TO 16 STEP 3
									STOR VAL(SUBSTR(nada,A,3)) TO nada5
									IF EMPTY(nada5)
										STOR SUBSTR(nada,1,A-1) TO nada
										STOR SUBSTR(nada,1,3) TO nada1
										FOR I=4 TO A-1 STEP 3
											STOR nada1+"-"+SUBSTR(nada,I,3) TO nada1
										NEXT
										EXIT
									ENDI
								NEXT
								STOR nada1 TO nada15
								@ 1,45 SAY "Cond. de Pago: "+nada1 COLO SCHE 3
								@ 2,45 SAY "FACTURA N§:"+STR(nada18) COLO SCHE 3
								@ 3,45 SAY "REMITO N§ :"+STR(nurem) COLO SCHE 3
								CLEA GETS
								STOR CTOD("01/01/80") TO nada1
								STOR DATE() TO nada2,nada12
								STOR xauss TO nada9
								STOR "@M "+ALLTRIM(xauss)+","+ALLTRIM(xadols) TO nn
								@ 4,45 SAY "Fecha de emisi¢n: " GET nada12 PICT "@D" RANGE nada1,nada2;
								MESS "Fecha de emisi¢n de la Factura - [ESC] para Salir"
								READ
								IF LASTKEY()=27
									RELE WIND win1
									EXIT
								ENDI
								@ 5,45 SAY "Moneda en que se factura" GET nada9 PICT nn;
								MESS "Moneda en que se Factura"
								READ
								STOR xacotiz TO nada10
								@ 6,45 SAY "Cotizaci¢n" GET nada10 PICT "99999999999.99" MESS "Cotizaci¢n de la fecha - [ESC] para Salir"
								READ
								IF LASTKEY()#27
									ff=""
									SELE rex
									IF SEEK(fisc)
										inicio=RECNO()
										ff=""
										SCAN WHIL rex.remito=nurem .AND. rex.marca=numarca
											ff=ff+ALLTRIM(STR(RECNO()))+','
										ENDS
										STORE LEFT(ff,LEN(ff)-1) TO ff,registro
										DO LOK WITH "rex"
										GO inicio
										************************
										R=10
										c1=1
										c2=17
										c3=35
										c4=42
										c5=55
										c6=65
										STOR nul TO pretot
										************************
										SCAN WHIL rex.remito=nurem .AND. rex.marca=numarca
											SELE mer
											SET ORDER TO 1
											GO TOP
											IF SEEK(LEFT(rex.articulo,13))
												DO flok WITH "mer"
												@ R,c1 SAY mer.articulo
												@ R,c2 SAY mer.merca
												SELE rex
												IF rex.usacurva
													@ R,c1+10 SAY SUBSTR(rex.curva,1,5)
												ELSE
													@ R,c3 SAY rex.talle
												ENDI
												CLEA GETS
												UNLO IN mer
												UNITARIO=PORCEN(PRE.COSTO,IIF(PER.precio=1,pre.precio1,IIF(PER.precio=2,mer.precio2,IIF(PER.precio=3,mer.precio3,mer.precio4))))
												STOR nul TO nada
												FOR A=1 TO 3
													IF !EMPTY(xaci[A])
														IF !EMPTY(xaciva[PER.condiva,A*2])
															IF xaciva[PER.condiva,A*2+1]="NO"
																nada1=unitario*xaciva[A*2]/100
																nada=nada+nada1
															ENDI
														ENDI
													ENDI
												NEXT
												STOR ROUND(unitario+nada,2) TO unitario
												IF nada9#xamoneda
													IF xamoneda=xauss
														STOR ROUND(unitario/nada10,2) TO unitario &&unitario en u/s
													ELSE
														STOR ROUND(unitario*nada10,2) TO unitario &&unitario en A
													ENDI
												ENDI
												REPL rex.unit WITH unitario
												@ R,c4 GET unitario PICT "99999999.99" RANGE 1,99999999.99;
												MESS "Confirma/Modifica el Precio Unitario" COLO SCHEME 3
												READ
												IF LASTKEY()=27
													RELE WIND win1
													EXIT
												ENDI
												REPL rex.unit1 WITH unitario
												IF !rex.usacurva
													STOR rex.cantidad TO cantid
												ELSE
													SELE cur
													GO TOP
													IF SEEK(rex.curva)
														SUM(cur.cantidad) WHIL cur.curva=rex.curva TO cantid
														STOR rex.cantidad*cantid TO cantid
													ELSE
														DO cartel WITH "PARA "+t1,t2,("NO EXISTE CURVA "+rex.curva),"CORRIJA E INTENTE NUEVAMENTE"
														STOR .F. TO sigue
														EXIT
													ENDI
												ENDI
												@ R,c5 SAY cantid PICT '999999.99'
												STOR cantid*unitario TO nada
												@ R,c6 SAY nada PICT "99999999999.99"
												CLEA GETS
												STOR nul TO cantid
												STOR ROUND(pretot+nada,2) TO pretot
												****************************
												IF R<24
													R=R+1
												ELSE
													DO WHIL ren>9
														R=R-1
														@ R,c1 SAY SPACE(16)
														@ R,c2 SAY SPACE(18)
														@ R,c3 SAY SPACE(7)
														@ R,c4 SAY SPACE(13)
														@ R,c5 SAY SPACE(10)
														@ R,c5 SAY SPACE(14)
													ENDD
													R=10
												ENDI
											ELSE
												DO cartel WITH "PARA "+t1,t2,"NO SE ENCONTRO EL ARTICULO "+rex.articulo+"EN MERCADERIA","POR FAVOR CORRIJA"
												STOR .F. TO sigue
												EXIT
											ENDI
										ENDS
										IF sigue
											DO flok WITH "fac"
											STOR nul TO neto,moiva,moot2,moot3,bruto,nada8
											FOR A=1 TO 3
												IF !EMPTY(xaci[A])
													IF !EMPTY(xaciva[PER.condiva,A*2])
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
																	ENDI
																ENDI
															ENDI
															neto=ROUND(bruto+moiva+moot2+moot3,2)
														ENDI
													ENDI
												ENDI
											NEXT
											IF nada9#xamoneda
												IF xamoneda=xauss
													STOR ROUND(moiva*nada10,2) TO moiva
													STOR ROUND(moot2*nada10,2) TO moot2
													STOR ROUND(moot3*nada10,2) TO moot3
												ENDI
											ELSE
												IF xamoneda=xadols
													STOR ROUND(moiva*nada10,2) TO moiva
													STOR ROUND(moot2*nada10,2) TO moot2
													STOR ROUND(moot3*nada10,2) TO moot3
												ENDI
											ENDI
											IF nada9=xauss
												STOR neto-(bruto+moiva+moot2+moot3) TO nada
												IF !EMPTY(nada)
													STOR (bruto+nada) TO bruto
												ENDI
											ENDI
											STOR " " TO nada2
											STOR nul TO nada3
											STOR 40 TO col1
											STOR 60 TO col2
											GO rem.condpago IN mix
											STOR mix.texto1 TO nada2
											STOR 1 TO I
											FOR A=4 TO 16 STEP 3
												STOR VAL(SUBSTR(nada2,A,3)) TO nada5
												IF EMPTY(nada5)
													EXIT
												ENDI
												STOR I+1 TO I
											NEXT
											DEFINE WIND win FROM 10,0 TO 18+I,79 TITL "Condiciones de Pago" SHAD COLOR SCHEME 8
											ACTI WIND win
											@ 1,2 SAY "FECHA DE EMISION: " GET nada12 PICT "@D"
											@ 1,col1 SAY "MONTO BRUTO: "
											@ 1,col2 GET bruto PICT "99999999999.99"
											STOR 2 TO J
											FOR A=1 TO 3
												IF !EMPTY(xaci[A])
													IF !EMPTY(xaciva[PER.condiva,A*2])
														@ J,col1 SAY xaci[A]+": "
														IF A=1
															@ J,col2 GET moiva PICT "99999999999.99"
														ELSE
															IF A=2
																@ J,col2 GET moot2 PICT "99999999999.99"
															ELSE
																@ J,col2 GET moot3 PICT "99999999999.99"
															ENDI
														ENDI
														STOR J+1 TO J
													ENDI
												ENDI
											NEXT
											@ J,col1 SAY "MONTO NETO A PAGAR: "
											@ J,col2 GET neto PICT "99999999999.99"
											CLEA GETS
											DIME fec[6]
											STOR {} TO fec
											STOR 2 TO J
											STOR I*3 TO I
											FOR A=1 TO I STEP 3
												STOR nada12 TO nada1
												STOR VAL(SUBSTR(nada2,A,3)) TO nada6
												STOR nada6+nada1 TO nada1
												IF EMPTY(VAL(SUBSTR(nada2,A,3))) .AND. I=3
													@ 6,2 SAY "FECHA DE VENCIMIENTO" GET nada1 PICT "@D" MESS "Fecha de vencimiento de la factura"
													STOR nada1 TO nada11
													STOR nada1 TO fec[1]
													EXIT
												ELSE
													@ J+4,2 SAY "FECHA DE VENCIMIENTO "+STR(J-1,1)+": " GET nada1 PICT "@D" MESS "Fecha de vencimiento de la factura"
													STOR nada1 TO nada11
													STOR nada1 TO fec[J-1]
												ENDI
												STOR J+1 TO J
											NEXT
											CLEA GETS
											DIME nad[7]
											STOR I/3 TO I
											IF I#1
												STOR ROUND(neto/I,2) TO nad
												DO WHIL .T.
													STOR nul TO nada,K
													DO WHIL K<I
														STOR K+1 TO K
														@ K+5,col1 SAY "MONTO "+STR(K,1)+": "
														@ K+5,col2 GET nad[K] PICT "99999999999.99"
														STOR nada+nad[K] TO nada
													ENDD
													IF nada#neto
														STOR neto-nada TO nada
														STOR nad[1]+nada TO nad[1]
														@ 6,col2 GET nad[1] PICT "99999999999.99"
													ENDI
													CLEA GETS
													ACTI SCRE
													@ 24,0 SAY PADC("Confirme/Modifique el monto",80)
													ACTI WIND win
													STOR nul TO nada2,K
													DO WHIL K<I
														STOR K+1 TO K
														@ K+5,col2 GET nad[K] PICT "99999999999.99"
														READ
														STOR ROUND(nada2+nad[K],2) TO nada2
													ENDD
													IF nada2=neto
														STOR K TO nad[7]
														EXIT
													ENDI
													?CHR(7)
												ENDD
											ELSE
												STOR 1 TO nad[7]
												@ 2,col1 SAY "MONTO BRUTO: "
												@ 2,col2 GET bruto PICT "99999999999.99"
												STOR 2 TO I
												FOR A=1 TO 3
													IF !EMPTY(xaci[A])
														IF !EMPTY(xaciva[PER.condiva,A*2])
															STOR I+1 TO I
															@ I,col1 SAY xaci[A]+": "
															IF A=1
																@ I,col2 GET moiva PICT "99999999999.99"
															ELSE
																IF A=2
																	@ I,col2 GET moot2 PICT "99999999999.99"
																ELSE
																	@ I,col2 GET moot3 PICT "99999999999.99"
																ENDI
															ENDI
														ENDI
													ENDI
												NEXT
												@ I,col1 SAY "MONTO NETO A PAGAR: "
												@ I,col2 GET neto PICT "99999999999.99"
												CLEA GETS
											ENDI                       && I#1
											IF confirma("la Factura",.T.,20,0)
												registro=str(PUNMAR)
												DO LOK WITH "DOC"
												GO PUNMAR IN DOC
												STOR DOC.NUMERO TO NADA18
												REPL DOC.NUMERO WITH DOC.NUMERO+1
												UNLO IN DOC
												SELE ccl
												DO flok WITH "ccl"
												FOR K=1 TO nad[7]
													IF nada9#xadols
														STOR ROUND(nad[K]/nada10,2) TO nada17
													ELSE
														STOR nad[K] TO nada17
														STOR NAD[K]*NADA10 TO NAD[K]
													ENDI
													APPE BLAN
													REPL ccl.codcli WITH nada16, ccl.fechaop WITH nada12, ccl.fechave WITH fec[K]
													REPL ccl.detalle WITH ("FA-"+nada15), ccl.compr WITH ("FAC.N§"+ALLTRIM(STR(nada18,10)))
													REPL ccl.comprre WITH "FA", ccl.numerore WITH nada18, ccl.monto WITH nad[K]
													REPL ccl.moneda WITH nada9, ccl.equivale WITH nada17, ccl.fecha WITH DATE(), ccl.usuario WITH usador
												NEXT
												UNLO IN ccl
												SELE fax
												DO flok WITH "fax"
												SELE rex
												GO inicio
												SCAN WHIL rex.remito=nurem .AND. rex.marca=numarca
													SELE fax
													APPE BLAN
													REPL fax.factura WITH nada18, fax.marca WITH rex.marca, fax.articulo WITH rex.articulo
													REPL fax.curva WITH rex.curva, fax.talle WITH rex.talle, fax.cantidad WITH rex.cantidad
													REPL fax.color WITH rex.color, fax.monto WITH rex.unit, fax.monto1 WITH rex.unit1
													REPL fax.fecha WITH DATE(), fax.usuario WITH usador
													SELE rex
												ENDS
												UNLO IN rex
												SELE fac
												APPE BLAN
												REPL fac.factura WITH nada18, fac.marca WITH rem.marca, fac.fechaem WITH nada12, fac.fechave WITH nada11
												REPL fac.codcli WITH rem.codcli, fac.codvia WITH rem.codvia, fac.condpago WITH rem.condpago
												REPL fac.montobru WITH bruto, fac.montoiva WITH moiva, fac.montoot2 WITH moot2
												REPL fac.montoot3 WITH moot3, fac.montonet WITH neto
												REPL fac.moneda WITH nada9, fac.cotiz WITH nada10
												REPL fac.fecha WITH DATE(), fac.usuario WITH usador
												SELE rem
												REPL rem.facturado WITH DATE()
												REPL rem.factura WITH nada
												UNLO IN rem
												RELE WIND win
												ACTI SCRE
												=iaud(STR(FAC.FACTURA)+'-'+STR(REM.REMITO))
												IF imprime("LA FACTURA",.T.,18,10)
													copias=copias("DE LA FACTURA",.T.,18,10)
													ACTI SCRE
													DO lfaci
												ENDI
												UNLO IN fax
												UNLO IN fac
											ELSE
												GO inicio
												REPL ALL rex.unit WITH 0, rex.unit1 WITH nul WHIL rex.remito=nurem .AND. rex.marca=numarca
											ENDI                       &&CONFIRMA
										ELSE
											GO inicio
											REPL ALL rex.unit WITH 0, rex.unit1 WITH nul WHIL rex.remito=nurem .AND. rex.marca=numarca
										ENDI                         && SIGUE
										RELE WIND win1
										ACTI SCRE
									ELSE
										DO cartel WITH "PARA "+t1,t2,"NO HAY DATOS ","POR FAVOR INGRESE DATOS O ANULE REMITO"
										RELE WIND win1
									ENDI                           && IF FOUND
								ELSE
									RELE WIND win1
								ENDI                             && LASTKEY()#27
								STOR kok+1 TO kok
								UNLO IN rem
							ENDI                               && CONFIRMA REMITO
						ELSE
							DO cartel WITH t1,t2,"Es REMITO Interno","NO se puede FACTURAR"
						ENDI                                 && NO INTERNO
					ELSE
						DO cartel WITH t1,t2,"REMITO YA ESTA Facturado","NO se puede volver a FACTURAR"
					ENDI                                   && NO FACTURADO
				ELSE
					DO cartel WITH t1,t2,"NO EXISTE","Intente nuevamente"
				ENDI                                     && REMITO NO ENCONTRADO
			ENDI                                       && NO ELIGIO MARCA
		ELSE
			RELE WIND win
			EXIT
		ENDI                                         && NUMERO DE REMITO #0
	ENDD
ELSE
	=IAUDI()
ENDI
ACTI SCRE
=MEN_LIN(BOTOM)
RETURN
