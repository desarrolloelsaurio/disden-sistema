*********************************************************************************
*-- Programa: ICRE3.PRG
*-- Fecha   : 05-24-92 11:05am
*-- Versi¢n : G. REINER
*-- Notas   : DEVOLUCION PARCIAL FACTURA
*-- Modificaci¢n GOYO 05-25-92 12:49pm
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	=MEN_LIN("FACTURA A ANULAR")
	IF ELIFAC()
		DO MFAC WITH .T.
		IF CONFIRMA('Anular la Factura',.t.,10,0)
			PAANULAR=FAC.FACTURA
			=RELEWIN("WIN")
			M.PUNMAR=(JANNRO-1)*20+5
			GO M.PUNMAR IN DOC
			m.factur=doc.numero
			store date() to emis
			=movewin(10,10,15,60,'win',' Datos de la Nota de Cr‚dito ')
			@ 1,1 say 'N§ NOTA DE CREDITO' GET M.FACTUR PICT '9999999999' MESS 'N£mero de Nota de Cr‚dito'
			@ 2,1 say 'FECHA DE EMISION    ' GET EMIS
			READ
			IF LAST()#27 .AND. !EMPTY(M.FACTUR) .and. emis>=fac.fECHAEM
				SELE FAC
				SCAT MEMV
				IF !XSEEK(M.FACTUR,'FAC','FACTURA')
					=MEN_LIN("GENERANDO NOTA DE CREDITO")
					tmp=GENTMP()
					sele FAX
					=afield(ARRGL)
					largor=alen(ARRGL,1)+1
					dime ARRGL[largor,4]
					ARRGL[largor,1]='DEVOL'
					ARRGL[largor,2]='N'
					ARRGL[largor,3]=10
					ARRGL[largor,4]=2
					sele 25
					USE
					create table (TMP) from array ARRGL
					IF Q_ARDBF(TMP)
                       USE
					ENDIF
					rele arrgl
					sele 25
					USE
					use (tmp) alias tmp
					cosa=q_arc("FAX")
					appe from (PATHVEN+'\'+cosa) for FACTURA=m.paanular
					=men_lin('[ESC] para Men£')
					if recc()<20
						=movewin(0,0,recc()+3,79,'win',' Nota de Cr‚dito N§ '+alltrim(str(m.factur))+' / Sobre Factura N§ '+alltrim(str(m.paanular))+' ')
						move wind win to (24-wrows())/2,0
					else
						=win0()
					endif
					brow fiel;
					articulo:R,;
					monto1:R:P="99,999,999.99":H="Pcio. UNITARIO",;
					cantidad:R:P="99999.99":H="Cantidad",;
					devol:P="99999.99":H="a Devolver":F:V=devol<=cantidad .and. devol>=0:E="No puede devolver m s de lo que compr¢",;
					resto=cantidad-devol:R:P="99999.99":H="Resto",;
					total=devol*monto1:R:P="99,999,999.99":H="Monto N. CRED.";
					freeze devol;
					in wind win;
					NOCLEAR
					SUM DEVOL*MONTO1 TO TTL
					if !EMPTY(TTL)
						IF CONFIRMA('la Nota de Cr‚dito',.t.,20,0)
							=MEN_LIN("GRABANDO LOS DATOS")
							SCAN
								M.FACTURA=M.FACTUR
								M.ARTICULO=TMP.ARTICULO
								M.CANTIDAD=0-TMP.DEVOL
								M.MONTO=TMP.MONTO
								M.MONTO1=TMP.MONTO1
								M.UNIDADES=TMP.DEVOL*TMP.UNIDADES/TMP.CANTIDAD
								=AGRABAR("FAX")
								SELE TMP
								M.fechaop=M.EMIS
								M.articulo=TMP.ARTICULO
								M.cliente=M.CODCLI
								M.opk='0D'
								M.detalle="DEVOL. PARCIAL FACTURA"
								M.SALIDA=NUL
								M.ENTRADa=TMP.DEVOL
								M.docref="NC"
								M.nrodocref=Q_FAC(SUCU+"-"+ALLTRIM(STR(m.factur)))
								M.ENPESO=TMP.DEVOL*TMP.UNIDADES/TMP.CANTIDAD
								=AGRABAR("KAR")
								SELE TMP
								if xseek(articulo,'mer','articulo')
									sele mer
									if lock() .or. lok(str(recno("mer")),"MER")
										IF MER.DISCRIM
											REPL MER.STOCKPES WITH MER.stockPES+abs(FAX.cantidad)
											REPL MER.STOCK WITH MER.STOCK+abs(FAX.UNIDADES)
										ELSE
											REPL MER.stock WITH MER.stock+abs(FAX.cantidad)
										ENDIF
									endif
									unlo in mer
								endif
								SELE TMP
							ENDS
							UNLO IN kar
							SELE FAC
							STOR NUL TO M.MONTOIVA,M.MONTOOT2,M.MONTOOT3
							M.PRETOT=0-TTL
							stor 1 to sidis,nodis
							for a=1 to 3
								IF !EMPTY(xaci[A])
									if xaciva[PER.CONDIVA,a*2+1]="SI"
										store (1+(xaciva[PER.CONDIVA,a*2]/100))*sidis to sidis
									else
										store (1+(xaciva[PER.CONDIVA,a*2]/100))*nodis to nodis
									endif
								endif
							NEXT
							M.MONTOBRU=round(pretot/nodis,2)
							M.MONTOIVA=round(M.MONTOBRU*xaciva[PER.CONDIVA,2]/100,2)
							M.MONTOOT2=round(M.MONTOBRU*xaciva[PER.CONDIVA,4]/100,2)
							M.MONTOOT3=round(M.MONTOBRU*xaciva[PER.CONDIVA,6]/100,2)
							M.MONTONET=ROUND(M.MONTOBRU+M.MONTOIVA+M.MONTOOT2+M.MONTOOT3,2)
							if nodis#1
								if M.MONTONET#pretot
									diff=pretot-M.MONTONET
									M.MONTOIVA=M.MONTOIVA+diff
									M.MONTONET=pretot
								endif
							endif
							FACTURA=M.FACTUR
							STORE M.EMIS TO FECHAEM,FECHAVE
							TIPO='NC'
							MONTO=0-TTL
							DESCUENTO=0
							BLOQUEO=.F.
							REMITO=0
							=AGRABAR("FAC")
							STORE M.EMIS TO FECHAOP,FECHAVE
							STORE 'DEV. PARC FACTURA N§ '+alltrim(str(m.PAANULAR)) to m.detalle
							STORE "FA N§ "+IIF(TYPE("M.PAANULAR")="C",ALLTRIM(M.PAANULAR),ALLTRIM(STR(M.PAANULAR))) TO M.COMPR
							STORE 'NC' TO M.COMPRRE
							STORE M.FACTUR TO M.NUMERORE
							STORE ABS(M.MONTONET) TO M.MONTO
							STORE ABS(M.MONTONET/M.COTIZ) TO M.EQUIVALE
							STORE .T. TO M.PAGADA
							SELE CCL
							=FLOCK() .OR. FLOK("CCL")
							INSERT INTO CCL FROM MEMV
							=REPUSE()
							=RESTACCL(PER.CODCLI,M.PAANULAR,M.MONTO,.T.)
							UNLO IN CCL
							SELE DOC
							GOTO PUNMAR
							=LOCK() .OR. LOK(STR(RECNO("DOC")),"DOC")
							REPL doc.numero WITH M.FACTURA+1
							UNLO IN DOC
							=DISP_FAC(.T.,.F.,.T.)
						ENDIF
					endif
				endif
			ELSE
				DO Cartel2 WITH "EL NUMERO DE FACTURA"+STR(m.factur),"CORRESPONDE A UNA ","YA EXISTENTE",""
			ENDIF
		ENDIF
		=RELEWIN("WIN")
	ENDIF
	=CLOSDBF("TMP")
ELSE
	=iaudi()
ENDI
RETURN MEN_LIN(BOTOM)
