******************************************************************************
*-- Programa: LFACIa.PRG
*-- Fecha   : 07/22/91
*-- Version : V.LEEGSTRA
*-- Notas   : IMPRESION DE FACTURAS, POR IMPRESORA
*-- MODIFICACION GOYO
*-- MODIFICACION CHARLY
*-- Modificaci¢n GOYO 05-22-92 01:50am
*-- Modificaci¢n GOYO 06-09-92 03:22am (adaptacion a N. CRED)
********************************************************************************
PARAMETER COSA,conremi,NCRD
privaTE COSA,CONREMI,NCRD
ulpr=hora_ulp(program())
if cheqseg()
	SELE fac
	picu="99,999,999,999.99"
	picu1="999,999.99"
	W=PAIP
	DO impresor
	STOR NUL TO casos
	stor 90 TO t1
	c1=2
	c2=18
	c7=48
	c3=60
	c4=c3+10
	c5=55
	c6=60
	=CABPRI3P(1)
	PRINTJOB
	***************************************************
	?
	??? chr(14)
	?
	?
	?
	?
	? fac.fechaem AT 46
	?? FAC.FECHAEM AT 46+69
	?
	?
	?
	?
	SELE PER
	SET ORDER TO TAG CODCLI
	SEEK fac.codcli

	? PER.cliente AT 8
	?? "("+alltrim(fac.codcli)+")" AT 46
	?? PER.cliente AT 8+69
	?? "("+alltrim(fac.codcli)+")" AT 46+69


	=XSEEK(PER.localidad,'mix','CIUCOD')
	STORE mix.texto1 TO nada
	STORE MIX.NU2 TO NAD2
	=XSEEK(LEFT(MIX.TEXTO2,2),'MIX','PRVCOD')
	? PER.domicilio at 8
	?? PER.domicilio at 8+69

	? alltrim(NADA)+" ("+alltrim(str(NAD2))+")" at 8
	?? ' - '
	?? alltrim(mix.texto1)
	?? alltrim(NADA)+" ("+alltrim(str(NAD2))+")" at 8+69
	?? ' - '
	?? alltrim(mix.texto1)

	?
	?

	? ALLTRIM(XACIVA[PER.CONDIVA,1]) AT 11
	?? PER.NROIVA AT 45
	?? ALLTRIM(XACIVA[PER.CONDIVA,1]) AT 11+69
	?? PER.NROIVA AT 45+69

	?
	?
	=XSEEK(fac.condpago,'MIX','PAGCOD')
	stor mix.texto1 TO nada
	NADA=TRANSF(NADA,"@R 999-999-999-999-999-999")
	NADA=ALLTRIM(STRTRAN(NADA,' ',''))
	stor mix.texto1 TO nada2

	? NADA AT 17
	if conremi
		?? sucu at 65
		?? '-'
		?? zero(nurem,8)
	endif
	?? NADA AT 17+69
	if conremi
		?? sucu at 65+69
		?? '-'
		?? zero(nurem,8)
	endif

	SELE fac
	stor 1 TO I
	FOR A=4 TO 16 STEP 3
		stor VAL(SUBSTR(nada2,A,3)) TO nada5
		IF EMPTY(nada5)
			EXIT
		endi
		stor I+1 TO I
		endf
		DIME fec[7]
		stor 1 TO J
		stor I*3 TO I
		FOR A=1 TO I STEP 3
			stor fac.fechaem TO fnada
			stor VAL(SUBSTR(nada2,A,3)) TO nada6
			stor nada6+fnada TO fnada
			IF EMPTY(VAL(SUBSTR(nada2,A,3))) .AND. I=3
				STOR NUL TO fec[1]
				stor DTOC(fnada) TO fec[2]
				EXIT
			ELSE
				stor DTOC(fnada) TO fec[J+1]
			endi
			stor J TO fec[1]
			stor J+1 TO J
			endf
			?
			?
			?
			?
			SELE fax
			=SEEK(FAC.FACTURA)
			stor RECNO() TO regi
			STOR NUL TO max_reg
			SCAN whil fax.factura=fac.factura
				store max_reg+1 to max_reg
			ends
			GOTO regi
			STOR NUL TO nadacan,nadacanu,nadareg
			stor .T. TO lnada10
			stor .F. TO lnada12
			STOR NUL TO nadacant
			SCAN whil fax.factura=fac.factura
				** PRIMERA
				=XSEEK(FAX.ARTICULO,'MER','ARTICULO')
				? left(mer.articulo,6)
				?? STR(FAX.CANTIDAD,8,2)
				?? '   '
				?? mer.merca
				nadacant=nadacant+FAX.CANTIDAD
				?? STR(FAX.MONTO1,7,2)
				?? STR(FAX.MONTO1*FAX.CANTIDAD,9,2)
				?? RETMON()
				** SEGUNDA
				?? '   '
				?? left(mer.articulo,6)
				?? STR(FAX.CANTIDAD,8,2)
				?? '   '
				?? mer.merca
				?? STR(FAX.MONTO1,7,2)
				?? STR(FAX.MONTO1*FAX.CANTIDAD,9,2)
				?? RETMON()
			ENDS
			DO WHILE _PLINENO<40
				?
			ENDDO
			=xseek(fac.codvia,'via','codvia')
*			? 'VIAJANTE           : '+ALLTRIM(via.viajante) AT 5
*			?? 'VIAJANTE           : '+ALLTRIM(via.viajante) AT 5+69
?
			IF EMPTY(FAC.DESCUENTO)
				?? Fac.montobru pict PICU AT 47
				?? RETMON()
				?? Fac.montobru pict PICU AT 47+69
				?? RETMON()
				?
			ELSE
				?? fac.monto pict PICU AT 47
				?? RETMON()
				?? fac.monto pict PICU AT 47+69
				?? RETMON()
				IF COSA
					IF EMPTY(M.DSCN1)
						?
					ELSE
						? M.DSCN1 pict PICU AT c6
						?? RETMON()
						?? M.DSCN1 pict PICU AT c6+69
						?? RETMON()
					ENDIF
					? M.DSCN2+M.DSCN3 pict PICU AT c6
					?? RETMON()
					?? M.DSCN2+M.DSCN3 pict PICU AT c6+69
					?? RETMON()

					? fac.montobru pict PICU AT c6
					?? RETMON()
					?? fac.montobru pict PICU AT c6+69
					?? RETMON()

				ELSE
					?
					? fac.DESCUENTO pict PICU AT c6
					?? RETMON()
					?? fac.DESCUENTO pict PICU AT c6+69
					?? RETMON()

					? fac.montobru pict PICU AT c6
					?? RETMON()
					?? fac.montobru pict PICU AT c6+69
					?? RETMON()
				ENDIF
			ENDIF
			?
			FOR A=1 TO 3
				IF !EMPTY(xaci[A])
					IF xaciva[PER.condiva,A*2]#0 .AND. xaciva[PER.condiva,A*2+1]="SI"
						nnx2=alltrim(STR(XACIVA[PER.CONDIVA,A*2],6))
						IF A=1
							? NNX2 AT 39
							?? NNX2 AT 39+69
						ELSE
							IF A=2
								?? NNX2 AT 39
								?? NNX2 AT 39+69
							ELSE
								?? NNX2 AT 49
								?? NNX2 AT 49+69
							endi
						endi
					endi
				endi
				endf
				FOR A=1 TO 3
					IF !EMPTY(xaci[A])
						IF xaciva[PER.condiva,A*2]#0 .AND. xaciva[PER.condiva,A*2+1]="SI"
							IF A=1
								? fac.montoiva pict PICU1 AT 33
								?? fac.montoiva pict PICU1 AT 33+69
							ELSE
								IF A=2
									?? fac.montoot2 pict PICU1 AT 39
									?? fac.montoot2 pict PICU1 AT 39+69
								ELSE
									?? fac.montoot3 pict PICU1 AT 43
									?? fac.montoot3 pict PICU1 AT 43+69
								endi
							endi
						endi
					endi
					endf
					?? FAC.montonet pict picu at 47
					??" $ "
					?? FAC.montonet pict picu at 47+69
					??" $ "
					_WRAP=.F.
					_lmargin=NUL
					?
					EJECT PAGE
					ENDP
					=FINIMP()
					IF COSA
						=iaud(IIF(NCRD,'NOTA CREDITO ','FACTURA ')+ALLTRIM(STR(fax.FACTURA))+' por IMPRESORA')
					ELSE
						=iaud('REIMPRIME '+IIF(NCRD,'NOTA CREDITO ','FACTURA ')+ALLTRIM(STR(FAC.FACTURA)))
					ENDIF
				else
					=iaudi()
				endi
				=MEN_LIN(BOTOM)
			RETURN
