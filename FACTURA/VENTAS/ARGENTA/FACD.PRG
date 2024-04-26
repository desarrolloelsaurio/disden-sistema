****************************************************************************
*-- Programa: FACD.PRG
*-- Fecha   : 01-05-93 06:36pm
*-- Versi¢n : G. REINER
*-- Notas   : GENERACION DIRECTA DE LA FACTURAR
********************************************************************************
PARAMETER BAJASTOK
STORE HORA_ULP(PROGRAM()) to ULPR
IF CHEQSEG()
	STOR NUL TO kok,namer,FAXT
	PICU='99999999.99'
	DO WHIL .T.
		M.PUNMAR=(JANNRO-1)*20+7
		GO M.PUNMAR IN DOC
		FACU=doc.numero
		pag=1
		=WIN1()
		acti wind win
		=cabpan()
		rebla="³"+space(30)+"³"+space(8)+"³"+space(12)+"³"+space(14)+"³"+space(10)+"³"
		A="Ú"+REPL("Ä",30)+"Â"+REPL("Ä",8)+"Â"+REPL("Ä",12)+"Â"+REPL("Ä",14)+"Â"+REPL("Ä",10)+"¿"
		B="³"+REPL(' ',30)+"³"+REPL(' ',8)+"³"+REPL(' ',12)+"³"+REPL(' ',14)+"³"+REPL(' ',10)+"³"
		C="Ã"+REPL("Ä",30)+"Å"+REPL("Ä",8)+"Å"+REPL("Ä",12)+"Å"+REPL("Ä",14)+"Å"+REPL("Ä",10)+"´"
		D="À"+REPL("Ä",30)+"Á"+REPL("Ä",8)+"Á"+REPL("Ä",12)+"Á"+REPL("Ä",14)+"Á"+REPL("Ä",10)+"Ù"
		@ 6,0 SAY A
		@ 7,0 SAY B
		@ 7,1  SAY "MERCADERIA"
		@ 7,32 SAY "CANTIDAD"
		@ 7,41 SAY "PRECIO UNIT."
		@ 7,55 SAY "PRECIO TOTAL"
		@ 7,69 SAY "PROVEEDOR"
		@ 8,0 SAY C
		FOR ren=9 TO 22
			@ ren,0 SAY B
		NEXT
		@ ren,0 SAY D
		REN=9
		c1=1
		c2=32
		c3=41
		c4=54
		c5=69
		@ 1,1 SAY "Cliente:"
		@ 5,1 SAY "Factura N§:"
		@ 1,45 SAY padl(biaja+space(10),10)+":"
		@ 2,45 SAY "Cond. Pago:"
		@ 4,45 SAY "Fecha de emisi¢n:"
		@ 5,45 SAY "Se factura en "+alltrim(xauss)
		STOR .T. TO sigue
		STOR .F. TO fuera
		STOR 0 TO pretot,unitario,PUNTERO
		sele fac
		scat memv blan
		SELE PER
		STOR NUL TO respuesta
		IF !empty(elicli(" - [ESC] para Salir",1,10))
			narekar=""
			stor PER.codcli to m.codcli,nacodcli
			m.cliiva=PER.condiva
			acti wind win
			@ 1,1 SAY Alltrim(PER.codcli)+" "+Alltrim(PER.cliente)
			@ 2,1 SAY Alltrim(PER.domicilio)+" T.E."+Alltrim(PER.telefonos)
			NADA=IIF(XSEEK(PER.localidad,'MIX','CIUCOD'),MIX.TEXTO1,SPACE(15))
			@ 3,1 SAY ZERO(PER.localidad,6)+" "+Alltrim(mix.texto1)
			@ 4,1 SAY Alltrim(xaciva(PER.condiva,1))+" "+Alltrim(PER.nroiva)
			M.FACTURA=FACU
			IF LASTKEY()#27
				@ 5,13 get m.factura PICT "9999999999";
				MESS "N§ de la Factura - [ESC] o 0 para Salir"
				read
				if !empty(m.factura) .and. lastkey()#27
					nadfac=m.factura
					SELE fac
					if !SEEK(m.factura)
						SELE via
						@ 1,57 get m.codvia
						clea gets
						STOR NUL TO respuesta
						IF !empty(elivia("",1,57))
							stor via.codvia to m.codvia,nacodvia
							naviaja=via.viajante
							acti wind win
							@ 1,57 SAY left(naviaja,20)
							SELE mix
							STOR NUL TO respuesta
							IF !empty(elipag("",6,13))
								m.condpago=LEFT(mix.TEXTO2,2)
								stor mix.texto1 TO nada
								NADA=TRANSF(NADA,"@R 999-999-999-999-999-999")
								naconpag=ALLTRIM(STRTRAN(NADA,'-000',SPACE(4)))
								acti wind win
								@ 2,57 GET naconpag
								clea GETS
								STOR {01/01/80} TO nada1
								STOR DATE() TO nada2,fechaem
								STOR "@M "+Alltrim(xauss)+","+Alltrim(xadols) TO nn
								@ 4,62  GET m.fechaem PICT "@D" RANGE nada1,nada2;
								MESS "Fecha de emisi¢n de la Factura - [ESC] para Salir"
								READ
								IF LASTKEY()=27
									LOOP
								ENDI
								nada2=occur("-",naconpag)
								nada3=substr(naconpag,nada2*3+(nada2+1),3)
								m.fechave=m.fechaem+val(nada3)
								ren=8
								DO WHIL .T.
									@ 23,0 SAY D
									STOR .T. TO conti
									SELE fax
									SCAT memv BLANK
									ren=ren+1
									stor NUL to nacanti,naunita
									napalpo=space(30)
									acti wind win
									@ ren,c1 get napalpo mess "Elija la Mercader¡a - [ESC] para salir "
									clea gets
									SELE MER
									store 0 to respuesta
									napalpo=iif(EMPTY(elimer("A VENDER",ren,c1,.F.)),0,LEFT(mer.palpopup,30))
									if !empty(napalpo) .and. lastkey()#27
										store mer.rubro+mer.variedad+mer.calidad to namerca
										@ ren,c2 get nacanti PICT "99999.99" mess "Cantidad de Bultos"
										read
										IF empty(nacanti)
											@ ren,NUL SAY rebla
											ren=ren-1
											LOOP
										ENDI
										sele rem
										set order to tag remmer
										nada=namerca+" "
										acti wind win
										if seek(nada) .OR. !BAJASTOK
											IF BAJASTOK
												ELREGI=RECNO()
												CALC SUM(rem.bultos-rem.vendido) WHILE REM.MERCA=NAMERCA TO NAVEN
												GO ELREGI
												narem=rem.remesa
												napro=rem.proveedor
												naprot=.T.
												nakgbul=rem.kgbulto
												naregrem=str(recno())
												if nacanti > naven
													nacanti=naven
												endif
											ENDIF
											@ ren,c1 get napalpo
											@ ren,c2 get nacanti PICT "99999.99" mess "Cantidad de Bultos"
											clear gets
										else
											@ ren,c1 say "No hay existencia - De [ENTER]"
											=inkey(0)
											@ ren,0 SAY rebla
											ren=ren-1
											LOOP
										endif
										@ ren,c3 get naunita PICT "999999999.99" mess "Precio unitario"
										read
										if !empty(naunita) .and. lastkey()#27
											STOR str(round(nacanti*naunita,2),14,2) TO nada
											@ ren,c4 get nada
											clea gets
											stor naunita to m.monto1,m.monto
											sele pro
											set order to tag PROCOD
											nada=SPACE(10)
											if BAJASTOK .AND. seek(napro)
												nada=left(pro.proveedor,10)
												@ ren,c5 get nada
												clea gets
											else
												@ ren,c5 say "Inexis."
											endif
											sele fax
										else
											@ ren,0 SAY rebla
											ren=ren-1
											LOOP
										ENDI
										IF conti
											IF confirm1('Los Datos Ingresados',.T.,20,30)
												=FACD_GRA()
												STOR pretot+nacanti*naunita TO pretot
											ELSE
												@ ren,0 SAY rebla
												ren=ren-1
											ENDI                       && confirma
											IF ren>21
												FOR K=9 TO 22
													@ k,0 SAY rebla
												NEXT
												ren=8
											ENDI
										ENDI                         && conti
									ELSE
										acti wind win
										@ ren,0 SAY rebla
										fuera=.t.
										exit
									ENDI
								ENDD                             && WHIL .t.
								**************************
								MONEXE=0
								DO WHILE .T.
									SELE fax
									SCAT memv BLANK
									ren=ren+1
									stor 0 to nacanti,naunita
									napalpo=space(30)
									acti wind win
									@ ren,c1 get napalpo mess "Elija la Mercader¡a - [ESC] para salir "
									clea gets
									SELE MER
									store 0 to respuesta
									napalpo=iif(EMPTY(elimer("A VENDER",ren,c1,.T.)),0,padr(LEFT(CHRTRAN(mer.palpopup," ",""),30),30))
									if !empty(napalpo) .and. lastkey()#27
										@ ren,c1 get napalpo
										clear gets
										store mer.rubro+mer.variedad+mer.calidad to namerca
										@ ren,c2 get nacanti PICT "99999.99" mess "Cantidad de Mercader¡a "
										read
										IF empty(nacanti)
											@ ren,0 SAY rebla
											ren=ren-1
											LOOP
										ENDI
										@ ren,c3 get naunita PICT "999999999.99" mess "Precio unitario"
										read
										if !empty(naunita) .and. lastkey()#27
											STOR str(round(nacanti*naunita,2),14,2) TO nada
											@ ren,c4 get nada
											clea gets
											sele fax
											IF confirm1('Los Datos Ingresados',.T.,20,30)
												STOR round(nacanti*naunita,2)+MONEXE TO MONEXE
												=FACD_GRA(.T.)
												namer=namer+1
											else
												@ REN,0 SAY REBLA
												REN=REN-1
												LOOP
											endif
										ELSE
											@ REN,0 SAY REBLA
											REN=REN-1
											LOOP
										ENDIF
									ELSE
										EXIT
									ENDIF
								ENDDO
								**************************
							ELSE
								LOOP
							ENDI                               && COND. PAGO
						ELSE
							LOOP
						ENDI                                 && vendedor
						IF ren>21
							FOR K=9 TO 22
								@ k,0 SAY rebla
							NEXT
							ren=8
						ENDI
					ELSE
						DO cartel2 WITH "LA FACTURA N§ "+ALLTRIM(STR(m.factura)),"CORRESPONDE A UNA ","YA EXISTENTE",""
						LOOP
					ENDI
				ELSE
					EXIT
				ENDI                                     && factura=0
			endif
		ELSE
			EXIT
		ENDI                                         && factura=0
		IF !EMPTY(PUNTERO) .AND. !EMPTY(PRETOT)
			STOR 0 TO neto,moiva,moot2,moot3,bruto,nada8
			FOR A=1 TO 3
				IF !EMPTY(xaci[A])
					IF !empty(xaciva[m.cliiva,A*2])
						IF xaciva[m.cliiva,A*2+1]="NO"
							nadis='NO'
							neto=pretot
							nada8=nada8+(xaciva[m.cliiva,A*2]/100)
							bruto=ROUND(neto/(1+nada8),2)
							moiva=ROUND(bruto*xaciva[m.cliiva,2]/100,2)
							moot2=ROUND(bruto*xaciva[m.cliiva,4]/100,2)
							moot3=ROUND(bruto*xaciva[m.cliiva,6]/100,2)
						ELSE
							nadis='SI'
							bruto=pretot
							IF A=1
								moiva=porcen(pretot,xaciva[m.cliiva,A*2])-pretot
							ELSE
								IF A=2
									moot2=porcen(pretot,xaciva[m.cliiva,A*2])-pretot
								ELSE
									IF A=3
										moot3=porcen(pretot,xaciva[m.cliiva,A*2])-pretot
									ENDI
								ENDI
							ENDI
							neto=ROUND(bruto+moiva+moot2+moot3,2)
						ENDI
					ENDI
				ENDI
			NEXT
			STOR neto-(bruto+moiva+moot2+moot3) TO nada
			IF !EMPTY(nada)
				STOR (bruto+nada) TO bruto
			ENDI
			STORE NETO+MONEXE TO NETO
			COLT=20
			IF nadis="SI"
				=movewin(12,10,20,70,'win1'," Totales ")
				@ 1,1 say 'Subtotal '   colo sche 3
				@ 2,1 say 'I.V.A.   '   colo sche 3
				@ 3,1 say 'IVA no insc' colo sche 3
				@ 4,1 say 'Exento '     colo sche 3
				@ 5,1 say 'Total  '     colo sche 3
				@ 1,COLT say BRUTO PICT PICU
				@ 2,COLT say MOIVA PICT PICU
				@ 3,COLT say MOOT2 PICT PICU
				@ 4,COLT say MONEXE PICT PICU
				@ 5,COLT say NETO PICT PICU
			ELSE
				=movewin(12,10,18,70,'win1'," totales ")
				@ 1,1 say 'Subtotal '   colo sche 3
				@ 2,1 say 'Exento '     colo sche 3
				@ 3,1 say 'Total  '     colo sche 3
				@ 1,COLT say NETO-MONEXE PICT PICU
				@ 2,COLT say MONEXE PICT PICU
				@ 3,COLT say NETO PICT PICU
			ENDIF
			IF confirma("la Factura",.T.,20,30) .and. !empty(pretot)
				=FLOCK("FAC") .OR. flok("FAC")
				nafecha=m.fechaem
				m.factura=nadfac
				m.moneda=alltrim(xauss)
				m.cotiz=xacotiz
				m.fecha=fechaem
				m.usuario=usador
				=agrabar("fac")
				repl fac.monto with pretot,fac.montobru with bruto,fac.montoiva with moiva
				repl fac.montoot2 with moot2,fac.montoot3 with moot3,fac.montonet with M.neto
				repl fac.montoexe with monexe
				unlo in fac
				STORE RECNO() TO naregi
				=relewin('win1')
				sele fac
				registro=str(naregi)
				=AGRABAR("FAX",@FAXT)
				sele rem
				set order to  tag remmer
				m.fechaop=nafecha
				m.docref="FA"
				m.nrodocref=FAXT[1,1]
				FOR XA=1 TO ALEN(FAXT,1)
					SELE REM
					SEEK(FAXT[XA,3]+" ")
					m.articulo=FAXT[XA,3]
					m.proveedor=.T.
					m.unitario=FAXT[XA,8]
					m.fecha=fechaem
					m.usuario=usador
					m.imputada=BAJASTOK
					=DESC_REM(FAXT[XA,6])
				NEXT
				SELE ccl
				SCAT MEMV BLAN
				M.codcli=nacodcli
				M.fechaop=nafecha
				M.detalle="Venta de Mercader¡a"
				M.compr='FA N§ '+alltrim(str(nadfac))
				M.comprre='FA'
				M.numerore=nadfac
				M.monto=neto
				M.MONEDA=xauss
				M.FECHA=fechaem
				M.USUARIO=USADOR
				=flock("CCL") .OR. FLOK("CCL")
				nada2=occur("-",naconpag)+1
				DIME fec[nada2+1], mon[nada2]
				STOR {} TO fec
				STOR nada2 TO fec[1]
				a=0
				stor round(NETO/nada2,2) to mon
				for i=1 to nada2
					a=a+mon[i]
				NEXT
				if !empty(NETO-a)
					mon[1]=mon[1]+(NETO-a)
				endif
				K=2
				I=len(naconpag)-3
				FOR j=0 TO i step 4
					STOR VAL(SUBSTR(naconpag,j+1,3))+nafecha TO fec[K]
					K=K+1
				NEXT
				for i=1 to fec[1]
					m.monto=mon[i]
					m.fechave=fec[i+1]
					m.equivale=mon[i]/xacotiz
					APPE BLAN
					GATH MEMV
					IF I=1
						NARECCL=RECNO()
					ENDIF
				NEXT
				UNLO IN CCL
				store 0 to cuota
				STORE NETO TO M.TOMON
				Do icob1.SPR
				sele CCL
				if !empty(cuota)
					registro=str(nareccl)
					do lok with "CCL",REGISTRO
					goto nareccl
					repl ccl.cuota with cuota
					unlo in ccl
				endif
				=DISP_FAC()
				M.PUNMAR=(JANNRO-1)*20+7
				GO M.PUNMAR IN DOC
				repl doc.numero with M.FACTURA+1
				loop
			ENDI                                       &&CONFIRMA
		ENDI
	ENDDO                                          && CAMBIO ELINA
ELSE
	=iaudi()
ENDI
=RELEwin('win')
DEAC WIND ALL
acti SCRE
=men_lin(botom)
RETURN
FUNCTION FACD_GRA
	PARAMETER ESEXENTO
	PUNTERO=PUNTERO+1
	DIME FAXT[PUNTERO,15]
	FAXT[PUNTERO,1]=nadfac
	FAXT[PUNTERO,2]=""
	FAXT[PUNTERO,3]=namerca
	FAXT[PUNTERO,4]=IIF(ESEXENTO,"SI","")
	FAXT[PUNTERO,5]=0
	FAXT[PUNTERO,6]=nacanti
	FAXT[PUNTERO,7]=""
	FAXT[PUNTERO,8]=NAUNITA
	FAXT[PUNTERO,9]=NAUNITA
	FAXT[PUNTERO,10]=IIF(ESEXENTO,.t.,bajastok)
    FAXT[PUNTERO,11]=NAUNITA
	FAXT[PUNTERO,12]=0
	FAXT[PUNTERO,13]=.F.
	FAXT[PUNTERO,14]=FECHAEM
	FAXT[PUNTERO,15]=USADOR
RETURN .T.
FUNCTION DESC_REM
	PARAMETER CUANTOS
	IF FAXT[XA,4]="SI"
		m.opk='02'
		m.detalle="Venta Vac¡os "
		m.cliente=""
		m.remesa=NUL
		m.kilos=0
		M.SALIDA=CUANTOS
		=AGRABAR('KAR')
	ELSE
		m.cliente=REM.PROVEEDOR
		m.opk='05'
		IF BAJASTOK
			DO WHILE CUANTOS>0
				IF SEEK(FAXT[XA,3]+" ")
					IF REM.VENDIDO+CUANTOS<REM.BULTOS
						REPL REM.VENDIDO WITH REM.VENDIDO+CUANTOS
						m.detalle="Venta - RM "+alltrim(str(REM.REMESA))
						m.remesa=REM.REMESA
						m.kilos=rem.kgbulto
						m.salida=CUANTOS
						m.cliente=REM.PROVEEDOR
						=AGRABAR("KAR")
						EXIT
					ELSE
						M.SALIDA=REM.BULTOS-REM.VENDIDO
						CUANTOS=CUANTOS+REM.VENDIDO-REM.BULTOS
						REPL REM.VENDIDO WITH REM.BULTOS
						REPL REM.AGOTADA WITH "S"
						m.detalle="Venta - RM "+alltrim(str(REM.REMESA))
						m.remesa=REM.REMESA
						m.kilos=rem.kgbulto
						m.cliente=REM.PROVEEDOR
						=AGRABAR("KAR")
					ENDIF
				ELSE
					=AGRABAR("KAR")
				ENDIF
			ENDDO
		ELSE
			=AGRABAR('KAR')
		ENDIF
	ENDIF
RETURN .T.
