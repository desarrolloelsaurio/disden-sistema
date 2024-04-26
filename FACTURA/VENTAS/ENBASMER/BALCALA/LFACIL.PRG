******************************************************************************
*-- Programa: LFACIL.PRG
*-- Fecha   : 07/22/91
*-- Version : G. REINER
*-- Notas   : IMPRESION DE FACTURAS, POR IMPRESORA
*-- MODIFICACION GOYO / LA MARTONA / CLAUDIO BALCALA
*-- Modificaci¢n GOYO 05-22-92 01:50am
*-- Modificaci¢n GOYO 06-09-92 03:22am (adaptacion a N. CRED)
********************************************************************************
PARAMETER COSA,conremi,NCRD
PRIVATE COSA,conremi,NCRD
ulpr=hora_ulp(program())
if cheqseg()
	SELE fac
	picu="9,999,999.99"
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
		?? 'N.CRED' AT 23
	ELSE
		?? 'FACT' AT 23
	ENDIF
	?
	? fac.fechaem AT 60
	?
	?
	?
	?
	?
	SELE PER
	SET ORDER TO TAG CODCLI
	SEEK fac.codcli
	? PER.cliente AT 8
	?? "("+alltrim(fac.codcli)+")" AT 55
	? PER.domicilio at 8
	=XSEEK(PER.localidad,'mix','CIUCOD')
	STORE mix.texto1 TO nada
	? alltrim(mix.texto1)+" ("+alltrim(str(MIX.nu2))+")" at 8
	=XSEEK(LEFT(MIX.TEXTO2,2),'MIX','PRVCOD')
	?? ' - '
	?? alltrim(mix.texto1)
	?
	? ALLTRIM(XACIVA[PER.CONDIVA,1]) AT 15
	?? PER.NROIVA AT 55
	?
	?
	=XSEEK(fac.condpago,'MIX','PAGCOD')
	stor mix.texto1 TO nada
	NADA=TRANSF(NADA,"@R 999-999-999-999-999-999")
	NADA=ALLTRIM(STRTRAN(NADA,' ',''))
	stor mix.texto1 TO nada2
	? NADA AT 17
	if conremi
		?? '|' AT 40
		FOR ALX=1 TO ALEN(REMITOS,1)
			IF REMITOS[ALX,3]
				?? ALLTRIM(STR(REMITOS[ALX,1]))
				?? '/'
			ENDI
			ENDF
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
				STOR NUL TO nadacan,nadacanu,nadareg
				stor .T. TO lnada10
				stor .F. TO lnada12
				STOR NUL TO nadacant
				SCAN whil fax.factura=fac.factura
					=XSEEK(FAX.ARTICULO,'MER','ARTICULO')
					? ' '
					?? STR(FAX.CANTIDAD,8,2)
					?? '   '
					?? mer.merca
					?? SPACE(10)
					?? left(mer.articulo,6)
					nadacant=nadacant+FAX.CANTIDAD
					?? STR(FAX.MONTO1,9,2)
					?? STR(FAX.MONTO1*FAX.CANTIDAD,9,2)
					?? ' '
					?? RETMON()
				ENDS
				DO WHILE _PLINENO<38
					?
				ENDDO
				=xseek(fac.codvia,'via','codvia')
				? 'VIAJANTE           : '+ALLTRIM(via.viajante) AT 5
				? 'Cantidad de Art¡culos:' AT 5
				?? alltrim(str(nadacant))
				?
				?
				?
				? FAC.MONTO PICT PICU
				?? FAC.DESCUENTO PICT PICU AT 13
				?? FAC.MONTOBRU PICT PICU AT 26
				?? FAC.MONTOIVA PICT PICU AT 39
				?? FAC.MONTOOT2 PICT PICU AT 52
				?? FAC.MONTONET PICT PICU AT 66
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
