********************************************************************************
*-- Programa: ACOS.PRG
*-- Fecha   : 11-20-92 10:08am
*-- Version : G. REINER
*-- Notas   : ACTUALIZACION DE COSTOS
*-- VERSIOM TAPIPLAST
********************************************************************************
ulpr=hora_ulp(program())
IF cheqseg()
	=unwork()
	=POPCARTE("Actualizaciขn de Costos"+chr(13)+chr(10)+ttque)
	=MOVEwin(5,10,18,72,'WIN'," Actualizaciขn Costos ")
	stor SPACE(15) TO tipo
	@ 1,1 SAY "TIPO DE ACTUALIZACION" GET tipo PICT "@M Porcentaje,Suma,Reemplaza" MESS 'Tipo de Actualizaciขn'
	@ 2,1 SAY "MONTO                " COLO SCHE 3
	READ
	IF LASTKEY()#27
		STOR NUL TO tomon
		IF tipo="P"
			@ 2,1 SAY "PORCENTAJE           " GET tomon PICT '999999999.99'
		ELSE
			@ 2,1 SAY "MONTO                " GET tomon PICT '999999999.99'
		ENDIF
		READ
		IF LASTKEY()#27 .AND. !empty(tomon)
			tipo=LEFT(tipo,1)
			IF tipo='P'
				tomon=1+(tomon/100)
			ENDIF
			stor 'NO' TO m.costau,m.costdo
			@ 4,1 SAY "ษออออออออออออออออออออออออออหอออออออออออออออออออออออออออออป" COLO SCHE 3
			\ บ  CONCEPTO A ACTUALIZAR   บ  ACTUALIZA EL CONCEPTO ?    บ
			\ ฬออออออออออออออออออออออออออฮอออออออออออออออออออออออออออออน
			\ บ                          บ                             บ
			\ บ                          บ                             บ
			\ บ                          บ                             บ
			\ บ                          บ                             บ
			\ ศออออออออออออออออออออออออออสอออออออออออออออออออออออออออออผ
			@ 8,4 SAY 'COSTO EN '+UPPER(M.XAUSS) COLO SCHE 3
			@ 9,4 SAY 'COSTO EN '+UPPER(M.XADOLS) COLO SCHE 3
			stor 40 TO COL
			@ 8,COL GET m.costau PICT "@M NO,SI" ;
			MESS "ACTUALIZA COSTO EN "+UPPER(M.XAUSS) 
			@ 9,COL GET m.costdo PICT "@M NO,SI" ;
			MESS "ACTUALIZA COSTO EN "+UPPER(M.XADOLS) 
			READ
			IF LASTKEY()#27 .and. CONFIRMA('Actualizaciขn',.f.,11,1)
				IF m.costau="SI" .OR. m.costdo="SI"
					SELE MER
					SCAN
						=MEN_LIN(ALLTRIM(mer.merca))
						REGISTRO=STR(RECNO())
						=LOCK() .OR. LOK("MER")
						IF tipo='S'
							REPL MER.COSTOAU WITH IIF(m.costau='SI',MER.COSTOAU+m.tomon,MER.COSTOAU)
							REPL MER.COSTODOL WITH IIF(m.costdo='SI',MER.COSTODOL+m.tomon,MER.COSTODOL)
						ELSE
							IF tipo='R'
								REPL MER.COSTOAU WITH IIF(m.costau='SI',m.tomon,MER.COSTOAU)
								REPL MER.COSTODOL WITH IIF(m.costdo='SI',m.tomon,MER.COSTODOL)
							ELSE
								REPL MER.COSTOAU WITH IIF(m.costau='SI',MER.COSTOAU*m.tomon,MER.COSTOAU)
								REPL MER.COSTODOL WITH IIF(m.costdo='SI',MER.COSTODOL*m.tomon,MER.COSTODOL)
							ENDIF
						ENDIF
						=repuse()
						UNLO IN MER
					ENDSCAN
				ENDIF
			ENDIF
		ENDIF
		=iaud('ACTUALIZACION DE PRECIOS')
	ENDIF
	=RELEWIN("win")
	=RELEWIN("POPCARTE")	
	=REOPMER()
ELSE
	=iaudI()
ENDIF
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
RETURN

