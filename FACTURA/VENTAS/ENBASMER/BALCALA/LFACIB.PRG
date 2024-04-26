******************************************************************************
*-- Programa: LFACIB.PRG
*-- Fecha   : 06-22-92 12:45pm
*-- Version : G. REINER
*-- Notas   : IMPRESION DE FACTURAS, POR IMPRESORA
*-- VERSION BALCALA /EMPRESA: CLAUDIO BALCALA
********************************************************************************
PARAMETER COSA,conremi,NCRD
PRIVATE COSA,conremi,NCRD
ulpr=hora_ulp(program())
if cheqseg()
	SELE fac
	picu="99,999,999,999.99"
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
	IF NCRD
		?? 'N.CRED' AT 25
	ELSE
		?? 'FACT' AT 25
	ENDIF
	?
	?
	? fac.fechaem AT 55
	?
	?
	?
	?
	?
	?
	?
	SELE PER
	SET ORDER TO TAG CODCLI
	SEEK fac.codcli
	? PER.cliente AT 8
	?? "("+alltrim(fac.codcli)+")" AT 48
	? PER.domicilio at 8
	=XSEEK(PER.localidad,'mix','CIUCOD')
	STORE mix.texto1 TO nada
	? alltrim(mix.texto1)+" ("+alltrim(str(MIX.nu2))+")" at 8
	=XSEEK(right(MIX.TEXTO2,2),'MIX','PRVCOD')
	?? ' - '
	?? alltrim(mix.texto1)
	=xseek(fac.codvia,'via','codvia')
	?? ALLTRIM(via.viajante) AT 50
	? ALLTRIM(XACIVA[PER.CONDIVA,1]) at 8
	?? PER.NROIVA AT 48
	?
	?
	=XSEEK(fac.condpago,'MIX','PAGCOD')
	stor mix.texto1 TO nada
	NADA=TRANSF(NADA,"@R 999-999-999-999-999-999")
	NADA=ALLTRIM(STRTRAN(NADA,' ',''))
	stor mix.texto1 TO nada2
	? NADA AT 23
	if conremi
		?? sucu at 65
		?? '-'
		?? zero(REM.REMITO,8)
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
				=XSEEK(FAX.ARTICULO,'MER','ARTICULO')
				? '   '
				?? left(mer.articulo,6)
				?? '  '
				?? STR(FAX.CANTIDAD,8,2)
				?? ' '
				?? mer.merca
				?? SPACE(11)
				nadacant=nadacant+FAX.CANTIDAD
				?? STR(FAX.MONTO1,9,2)
				?? STR(FAX.MONTO1*FAX.CANTIDAD,9,2)
				?? RETMON()
			ENDS
			DO WHILE _PLINENO<55
				?
			ENDDO
			if fac.moneda=left(xauss,1)
				tx='EQ. '+UPPER(XADOLS)
				TX=PADR(TX,11)+" : "
				?
				? TX AT 5
				?? '.'
				?? fac.montonet/FAC.COTIZ pict PICU
				?? ' '
				?? LEFT(xadols,3)
			else
				?
			endif
			? 'Cantidad de Art¡culos:' AT 5
			?? alltrim(str(nadacant))
			?
			?
			?
			?
			?
			IF EMPTY(FAC.DESCUENTO)
				?? Fac.montobru pict '999999999.99'
				?? RETMON()
			ELSE
				?? fac.monto pict '999999999.99'
				?? RETMON()
			ENDIF
			FOR A=1 TO 3
				IF !EMPTY(xaci[A])
					IF xaciva[PER.condiva,A*2]#0 .AND. xaciva[PER.condiva,A*2+1]="SI"
						nnx2=alltrim(STR(XACIVA[PER.CONDIVA,A*2],6,2))
						IF A=1
							?? fac.montoiva pict PICU AT 37
						ELSE
							IF A=2
								?? fac.montoot2 pict PICU AT 51
							endi
						endi
						stor J+1 TO J
					endi
				endi
				endf
				?? FAC.MONTONET PICT PICU AT C6
				?? " $"
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
RETURN MEN_LIN(BOTOM)
