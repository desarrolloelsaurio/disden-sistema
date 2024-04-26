*******************************************************************************
*-- Programa: ICOBO.PRG
*-- Fecha   : 08-25-92 11:20am
*-- Version : G. REINER
*-- Notas   : INGRESA PAGOS A CUENTA
********************************************************************************
STORE HORA_ulp(program()) to ulpr
if cheqseg()
	STORE NUL TO RESPUESTA
	DO WHILE .T.
		STORE NUL TO RESPUESTA
		IF !EMPTY(ELICLI("",-1,1))                   && OJO
			ELCLI=PER.CODCLI
			STORE NUL TO DEBE,HABER,PUNTERO,PESOS,DOLARES,CHEQUES,GTTL,PNCHE
			=MOVEWIN(nul,nul,8,50,'WIN1',' Discriminaci¢n del Pago - '+alltrim(PER.cliente),'',.f.)
			=centwin("win1")
			STORE DATE() TO LAFECHA
			@ 1,1 say 'FECHA' COLO SCHE 3
			@ 1,20 GET LAFECHA MESS 'Fecha de la Operaci¢n - [ESC] para Fin'
			@ 3,1 say upper(xauss) colo sche 3
			@ 3,30 GET PESOS PICT '99,999,999.99' MESS 'Cobrado en '+xauss+' - [ESC] para Fin'
			@ 4,1 say upper(xadols) colo sche 3
			@ 4,30 GET DOLARES PICT '99,999,999.99' MESS 'Cobrado en '+xadols+'  - [ESC] para Fin'
			@ 5,1 GET CHEQUES PICT 'CHEQUES' FUNC '*C' MESS 'Hay Cheques ?  - [ESC] para Fin'
			READ CYCLE
			IF !EMPTY(CHEQUES+PESOS+DOLARES)
				M.PUNMAR=(JANNRO-1)*20+7
				GO M.PUNMAR IN DOC
				=RLOCK() .OR. LOK(STR(M.PUNMAR),'DOC')
				m.RECIBO=iif(type("ccl.numerore")="C",q_fac(sucu+'-'+alltrim(str(doc.numero))),doc.numero)
				m.recnum=doc.numero
				TTL=PESOS+DOLARES
				GTTL=PESOS+DOLARES*XACOTIZ
				wl=wlrow()
				IF !EMPTY(CHEQUES)
					=MOVEWIN(wl-3,30,wl+8,79,'WIN2',' Descripci¢n de los Cheques ')
					STORE 0 TO CHEQUES
					DO WHILE .T.
						CLEA
						@ 1,1 SAY 'CANT. DE CHEQUES' colo sche 3
						@ 1,20 say pnche+1 colo sche 3
						@ 2,1 say 'TOTAL EN CHEQUES'
						@ 2,20 SAY CHEQUES PICT '99,999,999.99' COLO SCHE 3
						SELE CCH
						SCAT TO COSA BLAN
						@ 4,1 SAY 'MONTO' COLO SCHE 3
						@ 4,20 GET COSA[9] PICT '99,999,999.99' MESS 'Monto del Cheque'
						@ 5,1 SAY 'N§ DE CHEQUE' COLO SCHE 3
						@ 5,20 GET COSA[8] PICT '@!' MESS 'N£mero del Cheque'
						@ 6,1 say 'BANCO' colo sche 3
						@ 6,20 get cosa[7] pict '@!' MESS 'Banco de Origen del Cheque'
						@ 7,1 say 'F. DEPOSITO' colo sche 3
						@ 7,20 get cosa[11] MESS 'Fecha de Dep¢sito de Origen del Cheque'
						@ 8,1 say 'Hs. ACREDITACION' colo sche 3
						@ 8,20 get cosa[12] PICT '999' MESS 'Horas de Acreditaci¢n del Cheque'
						READ
						IF LAST()#27
							if confirm1("los Datos Ingresados",.T.,20,40)
								cosa[ 1]=PER.CODCLI
								cosa[ 2]=m.lafecha
								cosa[ 3]='CH'
								cosa[ 4]=''
								cosa[ 5]='RE'
								cosa[ 6]=RECIBO
								cosa[10]=Xauss
								cosa[13]=FECHAAC
								cosa[14]=cosa[9]/xacotiz
								COSA[16]=DATE()
								COSA[17]=usador
								CHEQUES=CHEQUES+COSA[9]
								PNCHE=PNCHE+1
								DIME CHQ[PNCHE,17]
								=ACOPY(COSA,CHQ,1,17,(PNCHE-1)*17+1)
								ttl=ttl+COSA[9]
								GTTL=GTTL+COSA[9]
							ENDIF
						ELSE
							EXIT
						ENDIF
					ENDDO
					=RELEWIN("WIN2")
				ENDIF
				IF !EMPTY(TTL)
					ACTI WIND WIN1
					ZOOM WIND WIN1 NORM FROM wl-4,0 TO wl+7,50
					@ 5,1 say space(50)
					@ 5,1 SAY 'CHEQUES' COLO SCHE 3
					@ 5,30 GET CHEQUES PICT '99,999,999.99'
					@ 6,1 SAY 'TOTAL' COLO SCHE 3
					@ 6,30 GET GTTL PICT '99,999,999.99'
					CLEA GETS
					IF CONFIRMA("el Pago",.f.,8,2)
						IF !EMPTY(PNCHE)
							=AGRABAR("CCH",@CHQ)
							=men_lin("GRABANDO EN CUENTA CORRIENTE")
							TTL=GTTL
							SELE CCL
							SET ORDER TO TAG NUMERORE
						ENDIF
						M.CODCLI=PER.CODCLI
						M.FECHAOP=M.LAFECHA
						M.FECHAVE=M.LAFECHA
						M.COMPR=""
						STORE RECIBO TO M.NUMERORE
						store recnum to M.NUMERE
						STORE "RE" TO M.COMPRRE,M.COMPRE
						M.CAJA="00"
						IF !EMPTY(PESOS)
							M.DETALLE="PAGO EN EFVO. "+UPPER(XAUSS)
							M.MONTO=PESOS
							M.MONEDA=XAUSS
							M.EQUIVALE=PESOS/XACOTIZ
							M.PAGADA=.T.
							=AGRABAR("CCL")
							=AGRABAR("CAJ")
						ENDIF
						IF !EMPTY(DOLARES)
							M.DETALLE="PAGO EN EFVO. "+UPPER(XADOLS)
							M.MONTO=DOLARES
							M.MONEDA=XADOLS
							M.EQUIVALE=DOLARES
							M.PAGADA=.T.
							=AGRABAR("CCL")
							=AGRABAR("CAJ")
						ENDIF
						IF !EMPTY(PNCHE)
							FOR A=1 TO ALEN(CHQ,1)
								M.FECHAVE=CHQ[A,11]+CHQ[A,12]
								M.DETALLE="CHEQUE "+CHQ[A,8]
								M.MONTO=CHQ[A,9]
								M.MONEDA=XAUSS
								M.EQUIVALE=PESOS/XACOTIZ
								M.PAGADA=.F.
								=AGRABAR("CCL")
							NEXT
						ENDIF
					ENDIF
				ENDIF
				UNLO IN DOC
			ENDIF
			=RELEWIN("WIN1")
		ELSE
			EXIT
		ENDIF
	ENDDO
ELSE
	=Iaudi()
ENDIF
=MEN_LIN(BOTOM)
RETURN
