*******************************************************************************
*-- Programa: ILIQ.PRG
*-- Fecha   : 07/21/92
*-- Version : BANALOTTI
*-- Notas   : LIQUIDACION DE REMESA
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	=iaud('LIQUIDACION'+ulpr)
	=hora_ulp()
	=movewin(10,10,15,69,'win1',"Liquidaci¢n de Remesas")
	ACTI WIND win1
	ff=""
	PICU='9999999.99'
	@ 1,1  SAY "Proveedor:"
	@ 2,1  SAY "N§ Remesa:"
	stor 0 to kok,respuesta,naremes
	narekar=''
	sele pro
	set order to tag proveedor
	store nul to respuesta
	naprove=iif(EMPTY(elipro(" de la Remesa a Liquidar- [ESC] para Salir ",1,12)),'',PRO.PROCOD)
	if !empty(naprove) .and. lastkey()#27         && OJO
		acti wind win1
		@ 1,12 get pro.proveedor
		napro=left(pro.proveedor,15)
		condiva=pro.condiva
		clea gets
		@ 2,12 get naremes pict "99999999" mess "Ingrese el N§ de la Remesa a Liquidar"
		read
		sele rem
		set order to tag REMESA
		if seek(naprove+str(naremes))                && OJO
			=movewin(0,0,23,79,'win',' ')
			naferem=rem.fechaop
			ACTI WIND win
			cuantos=0
			SCAN WHILE !EOF()
				IF rem.proveedor=naprove .AND. rem.remesa=naremes
					STORE ff+ALLTRIM(STR(RECNO()))+"," TO ff
				ENDIF
			ENDSCAN
			STORE LEFT(ff,LEN(ff)-1) TO ff
			IF LEN(ff)>0
				cuantos=OCCURS(",",ff)+1
				registro=ff
				=lock('rem') .or. lok("rem")
				SELE rem
				desdecual = 1
				DO Mrem1 WITH ff, desdecual,.T.
				IF confirma("La remesa a Liquidar",.T.,20,30)
					store ff to nadrrem,nada10
					store occur(",",nada10) to nahasta
					DIME SUBMER(CUANTOS),PROMER(CUANTOS),CANMER(CUANTOS),MERCA(CUANTOS),TOTMER[CUANTOS]
					STORE 0 TO SUBMER,PROMER,CANMER,TOTMER,MONTOT
					STORE SPACE(6) TO MERCA
					=movewin(3,5,18,75,'win1',"Liquidaci¢n de Remesa N§ "+ALLTRIM(STR(NAREMES)))
					=centwin('win1')
					@ 1,1  SAY "Proveedor:"
					@ 1,12 SAY  napro
					@ 2,1 SAY Alltrim(xaciva(pro.condiva,1))+" "+Alltrim(pro.nroiva)
					@ 1,40  SAY "N§ Liquidaci¢n:"
					@ 2,40  SAY "Fecha Emisi¢n :"
					REN=3
					stor pro.procod to m.procod,nacodpro
					m.condiva=pro.condiva
					m.liquida=xanum[1,15]
					napro=Alltrim(pro.procod)+" "+Alltrim(pro.proveedor)
					nadom=Alltrim(pro.domicilio)+" T.E."+Alltrim(pro.telefono)
					naciu=IIF(XSEEK(PRO.local,'MIX','CIUCOD'),MIX.TEXTO1,SPACE(15))
					@ 1,55 get m.liquida PICT "9999999999";
					MESS "N§ de la Liquidaci¢n - [ESC] o 0 para Salir"
					read
					if !empty(m.liquida) .and. lastkey()#27 && OJO
						nadfac=m.liquida
						*                SELE fac
						STOR CTOD("01/01/80") TO nada1
						STOR DATE() TO nada2,fechaem
						STOR "@M "+Alltrim(xauss)+","+Alltrim(xadols) TO nn
						@ 2,55  GET m.fechaem PICT "@D" RANGE nada1,nada2;
						MESS "Fecha de emisi¢n de la Factura - [ESC] para Salir"
						READ
						if !empty(m.fechaem) .and. lastkey()#27 && OJO
							c1=1
							c2=15
							c3=31
							c4=42
							c5=55
							@ REN,C1 SAY 'Mercader¡a' COLO SCHE 3
							@ REN,C2 SAY PADL('Monto',10) COLO SCHE 3
							@ REN,C3 SAY PADL(' Cant.',6) COLO SCHE 3
							@ REN,C4 SAY PADL('Promedio',10) COLO SCHE 3
							@ REN,C5 SAY PADL('Total',10) COLO SCHE 3
							for K=1 to cuantos
								SELE rem
								IF K < occur(",",nada10)+1
									STORE AT(",",nadrrem) TO nada
									IF !EMPTY(nada)
										STORE SUBSTR(nadrrem,1,nada-1) TO nadpos
										STORE SUBSTR(nadrrem,nada+1,LEN(nadrrem)-nada) TO nadrrem
										SELE REM
										goto val(nadpos)
									ENDIF
								ELSE
									SELE REM
									goto val(nadrrem)
								ENDIF
								acti wind win1
								sele mer
								namerca=iif(seek(rem.merca),left(palpopup,15),"Mercader¡a Inexistente")
								MERCA[k]=REM.MERCA
								sele kar
								set order to tag remesa
								if seek (NAPROVE+STR(NAREMES)+MERCA[k])
									SCAN WHILE (NAPROVE=KAR.CLIENTE .AND. NAREMES=KAR.REMESA .AND. MERCA[k]=ALLTRIM(KAR.ARTICULO)) .AND. !EOF()
										submer[k]=submer[k]+round(unitario*kar.salida,2)
										canmer[k]=canmer[k]+kar.salida
										narekar=narekar+alltrim(str(recno()))+","
									ENDSCAN
								endif
								promer[k]=iif(canmer[K]=0,0,round(submer[k]/canmer[k],2))
								REN=REN+1
								IF REN > 10
									for z=4 to 10
										@ z,0 say space(70)
									NEXT
									ren=4
								ENDIF
								@ REN,C1 SAY NAMERCA
								@ REN,C2 SAY SUBMER[K] PICTU PICU
								@ REN,C3 GET CANMER[K] PICTU '999999'
								@ REN,C4 GET PROMER[K] PICTU PICU
								READ
								totmer[k]=round(canmer[k]*promer[k],2)
								@ REN,C5 SAY TOTMER[K] PICTU PICU
								MONTOT=MONTOT+TOTMER[K]
							NEXT
							=MEN_LIN(TEC)
							=INKEY(NUL,"HM")
							ACTI WIND WIN1
							CLEA
							@ 1,1  SAY "Proveedor:"
							@ 1,12 SAY  napro
							@ 1,1  SAY "Proveedor:"
							@ 1,12 SAY  napro
							@ 2,1 SAY Alltrim(xaciva(pro.condiva,1))+" "+Alltrim(pro.nroiva)
							@ 1,40  SAY "N§ Liquidaci¢n:"
							@ 2,40  SAY "Fecha Emisi¢n :"
							@ 1,55 SAY m.liquida PICT "9999999999"
							@ 2,55  SAY m.fechaem
							col=20
							col1=55
							store 15 to napoco
							store 7 to napore
							store 0 to nacomi,naflet,navaci,nadesc,naotro,narete,naivaf
							store 'NO' to nivf
							@ 3,1 SAY 'TOTAL VENDIDO    '  COLO SCHE 3
							@ 4,1 SAY 'COMISION % '           COLO SCHE 3
							@ 5,40 SAY 'GASTOS  '           COLO SCHE 3
							@ 6,40 SAY 'Fletes           '  COLO SCHE 3
							@ 7,40 SAY 'Flete Vac¡o      '  COLO SCHE 3
							@ 8,40 SAY 'Descarga         '  COLO SCHE 3
							@ 9,40 SAY 'Otros            '  COLO SCHE 3
							@ 10,40 SAY 'Calcula IVA Flete?' COLO SCHE 3
							nacomi=montot*napoco/100
							@ 4,COL SAY nacomi PICTU PICU
							@ 4,COL-6 SAY napoco PICTU '99.99'
							clear get
							@ 3,col get montot pictu PICU
							@ 4,COL-6 GET napoco PICTU '99.99' MESS 'Modifique Porcentaje de Comisi¢n'
							read
							nacomi=montot*napoco/100
							@ 4,COL GET nacomi PICTU PICU
							clear get
							@ 6,col1 get naflet pictu PICU
							@ 7,col1 get navaci pictu PICU
							@ 8,col1 get nadesc pictu PICU
							@ 9,col1 get naotro pictu PICU
							@ 10,col1+4 get nivf pictu '@M SI,NO'
							read
							if confirma('los datos ingresados',.T.,20,30)
								gravado=montot-nacomi
								nadedu=naflet+navaci+nadesc+naotro
								@ 5,col1 get nadedu pictu PICU
								clear get
								STOR 0 TO neto,moiva,moot2,moot3,bruto,nada8,moniv1,moniv2,monret
								STOR 0 TO coiva,coini,cfiva,cfini
								FOR A=1 TO 3
									IF !EMPTY(xaci[A])
										IF !empty(xaciva[m.condiva,A*2])
											IF ABREV(xaciva[m.condiva,1],.T.)#"RIR"
												neto=gravado
												if A=1
													coiva=porcen(nacomi,xaciva[m.condiva,A*2])-nacomi
													IF NIVF='SI'
														cfiva=porcen(naflet,xaciva[m.condiva,A*2])-naflet
													ENDIF
												else
													if A=2
														coini=porcen(nacomi,xaciva[m.condiva,A*2])-nacomi
														IF NIVF='SI'
															cfini=porcen(naflet,xaciva[m.condiva,A*2])-naflet
														ENDIF
													else
														if A=3
															monret=porcen(gravado,xaciva[m.condiva,A*2])-gravado
														endif
													endif
												endif
												*          nada8=nada8+(xaciva[m.condiva,A*2]/100)
												*          bruto=ROUND(neto/(1+nada8),2)
												*          moiva=ROUND(gravado*xaciva[m.condiva,2]/100,2)
												*          moot2=ROUND(bruto*xaciva[m.condiva,4]/100,2)
												*          moot3=ROUND(bruto*xaciva[m.condiva,6]/100,2)
											ELSE
												bruto=gravado
												IF A=1
													moiva=porcen(gravado,xaciva[m.condiva,A*2])-gravado
													coiva=porcen(nacomi,xaciva[m.condiva,A*2])-nacomi
													IF NIVF='SI'
														cfiva=porcen(naflet,xaciva[m.condiva,A*2])-naflet
													ENDIF
												ELSE
													IF A=2
														moot2=porcen(gravado,xaciva[m.condiva,A*2])-gravado
													ELSE
														IF A=3
															monret=porcen(gravado,xaciva[m.condiva,A*2])-gravado
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
								@ 5,1 SAY 'SUBTOTAL' COLO SCHE 3
								@ 6,1 SAY 'I.V.A. '  COLO SCHE 3
								@ 7,1 SAY 'GASTOS '  COLO SCHE 3
								@ 8,1 SAY  'SUBTOTAL  '  COLO SCHE 3
								@ 9,1 SAY 'IVA SERVICIOS'  COLO SCHE 3
								@ 10,1 SAY 'IVA SERV. NO INSC.'  COLO SCHE 3
								nada=montot-nacomi
								nada1=montot-nacomi+moiva-nadedu
								cosei=coiva+cfiva
								cosen=coini+cfini
								@ 5,col get nada pictu PICU
								@ 6,col get moiva         pictu PICU
								@ 7,col get nadedu       pictu PICU
								@ 8,col get nada1 pictu PICU
								@ 9,col get cosei pictu PICU
								@ 10,col get cosen pictu PICU
								clea get
								totliq=montot-nacomi+moiva-(nadedu+coiva+coini+cfiva+cfini)
								@ 12,1 say 'TOTAL LIQUIDACION ' COLO SCHE 3
								@ 12,COL GET TOTLIQ PICTU PICU
								CLEA GET
								IF CONFIRMA('la Liquidac¡on',.T.,20,30)
									SELE ccp
									SCAT MEMV BLAN
									M.PROCOD=NAPROVE
									M.FECHAOP=FECHAEM
									M.FECHAVE=FECHAEM
									M.DETALLE='Liq. Remesa N§ '+alltrim(str(naremes))
									COMPR='FA N§ '+alltrim(str(m.liquida))
									COMPRRE='FA'
									NUMERORE=str(m.liquida)
									MONTO=m.totliq
									MONEDA=xauss
									EQUIVALE=m.totliq/xacotiz
									=AGRABAR("CCP")
									IF ABREV(xaciva[m.condiva,1],.T.)="RIR" .AND. m.monret#0
										M.DETALLE='Retenc. Liq. Rem. N§ '+alltrim(str(naremes))
										COMPR='FA N§ '+alltrim(str(m.liquida))
										COMPRRE='NC'
										MONTO=m.monret
										=AGRABAR("CCP")
									endif
									SELE FAR
									=flock('FAR') .or. flok("FAR")
									APPE BLAN
									REPLA FACTURA WITH SPACE(4)+STR(M.LIQUIDA), FECHAEM WITH M.FECHAEM
									REPLA FECHAVE WITH M.FECHAEM, PROCOD  WITH M.NAPROVE
									REPLA MONTO WITH M.MONTOT, MONTOBRU WITH GRAVADO,DESCUENTO WITH M.NACOMI
									REPLA MONTOIVA WITH M.MOIVA, MONTOPER WITH MONRET
									REPLA MONSEI WITH M.COSEI, MONSEN WITH M.COSEN,MONTONET WITH GRAVADO+M.MOIVA
									REPLA MONTOOT2 WITH MOOT2, TIPO WITH 'FA', NOGRAVADO WITH NADEDU
									REPLA MONEDA WITH XAMONEDA, COTIZ WITH XACOTIZ
									=REPUSE()
									UNLO IN FAR
									SELE FAD
									=flock('FAD') .or. flok("FAD")
									FOR K=1 TO CUANTOS
										NAESP=IIF(XSEEK(LEFT(MERCA[K],2),'RUB','CODRUB'),LEFT(RUB.RUBRO,10),SPACE(10))
										NAVAR=IIF(XSEEK(SUBSTR(MERCA[K],3,2),'MIX','VARCOD'),LEFT(MIX.TEXTO1,9),SPACE(9))
										NACAL=IIF(XSEEK(RIGHT(MERCA[K],2),'MIX','CALCOD'),LEFT(MIX.TEXTO1,8),SPACE(8))
										NADET=NAESP+' '+NAVAR+' '+NACAL
										APPE BLAN
										REPLA FACTURA WITH SPACE(4)+STR(M.LIQUIDA), PROCOD  WITH M.NAPROVE
										REPLACE ARTICULO WITH MERCA[K], CANTIDAD WITH CANMER[K]
										REPLA MONTO WITH PROMER[K], DETALLE WITH NADET
										=REPUSE()
									NEXT
									UNLO IN FAD
									SELE KAR
									store LEFT(narekar,LEN(narekar)-1)  to narekar,nada10
									registro=narekar
									=flock('KAR') .or. flok("KAR")
									store occur(",",nada10) to nahasta
									for i=0 to nahasta
										IF I<occur(",",nada10)
											STORE AT(",",narekar) TO nada
											IF !EMPTY(nada)
												STORE SUBSTR(narekar,1,nada-1) TO nadpos
												STORE SUBSTR(narekar,nada+1,LEN(narekar)-nada) TO narekar
												SELE KAR
												goto val(nadpos)
												REPLACE KAR.LIQUIDA WITH .T.
											ENDIF
										ELSE
											SELE KAR
											goto val(narekar)
											REPLACE KAR.LIQUIDA WITH .T.
										ENDIF
										sele KAR
									NEXT
									UNLO IN KAR
									xanum[1,15]=m.liquida+1
									******** GRABAR
									IF imprime("Liquidaci¢n",.T.,10,10)
										copias=copias("Liquidaci¢n",.T.,10,10)
										DO lliqi WITH COPIAS,.T.
									ENDIF
									IF ABREV(xaciva[m.condiva,1],.T.)="RIR"
										IF imprime("Formulario Retenci¢n",.T.,10,10)
											copias=copias("Formulario Retenci¢n",.T.,10,10)
											DO lliqir WITH COPIAS,.T.
										ENDIF
									endif
								ENDIF
							ENDIF
						ENDIF
					ENDIF
					UNLO IN rem
				else
					do cartel2 with "LA REMESA "+ALLTRIM(STR(naremes))," DEL REMITENTE "+alltrim(napro)," ",' '
				endif
			endif
			=relewin('win')
		ELSE
			do cartel2 with "NO EXISTE LA REMESA "+ALLTRIM(STR(naremes))," DEL REMITENTE "+alltrim(napro),'','CORRIJA Y REINTENTE'
		ENDIF
	ENDIF
ELSE
	=iaudi()
ENDIF
=RELEWIN('win1')
rele memo like na*
ACTI SCREE
=men_lin(BOTOM)
UNLO ALL
RETURN
