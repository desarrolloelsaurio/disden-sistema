******************************************************************************
*-- Programa: LFACI.PRG
*-- Fecha   : 07/22/91
*-- Version : G. REINER
*-- Notas   : IMPRESION DE FACTURAS, POR IMPRESORA
*-- MODIFICACION 05-07-92 05:40pm
*-- VERSION NAZA
********************************************************************************
PARAMETER COSA,conremi,NCR
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	SELE fac
	picu="99,999,999,999.99"
	W=PAIP
	=impresor()
	STOR NUL TO casos
	stor 90 TO t1
	stor ((xatalmax-xatalmin)/xatalstep)+1 TO ccol
	DIME ct(ccol)
	ANCHOR=INT(36/CCOL)
	stor (ccol*ANCHOR+ccol) TO nadatale
	c1=2
	c2=18
	c7=48
	c3=c7+nadatale+2
	c4=c3+10
	c5=c4
	c6=116
	SET DEVICE TO PRINT
	SET CONSOLE OFF
	SET PRINTER ON
	_PEJECT="NONE"
	_PLENGTH=72
	_PLINENO=NUL
	_PAGENO=1
	_PSCODE='{27}{64}{27}{67}{72}{27}{120}{0}{18}{27}{116}{1}{27}{82}{0}'
	_PLOFFSET=NUL
	_ALIGNMENT='LEFT'
	_PADVANCE="LINEFEEDS"
	wrap=.F.
	_rmargin=255
	_lmargin=NUL
	_PCOPIES=1
	PRINTJOB
	***************************************************
	?
	?
	??? chr(14)
	IF NCR
		?? 'N.CRED.' AT 28
	ELSE
		?? 'FACTURA' AT 28
	ENDIF
	?
	?
	?
	? fac.fechaem AT 60
	?
	?
	?
	?
	=XSEEK(FAC.CODCLI,'PER','CODCLI')
	? PER.cliente+" ("+alltrim(fac.codcli)+")" AT 15
	? PER.domicilio at 15
	=xseek(PER.localidad,'mix','ciucod')
	STORE mix.texto1 TO nada
	? alltrim(mix.texto1)+" ("+alltrim(str(MIX.nu2))+")" at 15
	=xseek(right(mix.texto2,2),'mix','prvtex')
	?? ' - '
	?? alltrim(mix.texto1)
	? ALLTRIM(XACIVA[PER.CONDIVA,1]) AT 15
	?? PER.NROIVA AT 50
	?
	=xseek(fac.condpago,'mix','pagcod')
	stor mix.texto1 TO nada
	NADA=TRANSF(NADA,"@R 999-999-999-999-999-999")
	NADA=ALLTRIM(STRTRAN(NADA,'-000',SPACE(4)))
	stor mix.texto1 TO nada2
	? NADA AT 17
	if conremi
		?? sucu at 65
		?? '-'
		?? zero(nurem,8)
	endif
	**/   SELE via
	*     SEEK fac.codvia
	*     ?? 'VIAJANTE           : '+ALLTRIM(via.viajante) AT T1
	SELE fac
	stor 1 TO I
	FOR A=4 TO 16 STEP 3
		stor VAL(SUBSTR(nada2,A,3)) TO nada5
		IF EMPTY(nada5)
			EXIT
		endi
		stor I+1 TO I
	NEXT
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
	NEXT
	?
	?
	?
	??? CHR(15)
	SELE fax
	=XSEEK(fac.factura,'fax','factuRa')
	stor RECNO() TO regi
	STOR NUL TO max_reg
	SCAN whil fax.factura=fac.factura
		store max_reg+1 to max_reg
	ends
	dime matriz[max_reg,ccol+4]
	store ' ' to matriz
	GOTO regi
	STOR NUL TO nadacan,nadacanu,nadareg
	stor SPACE(ANCHOR) TO ct
	stor .T. TO lnada10
	stor .F. TO lnada12
	store 1 to max_mat
	SCAN whil fax.factura=fac.factura
		store .f. to agrega
		for a=1 to max_mat
			if matriz[a,1]=left(fax.articulo,13) .and. matriz[a,2]=fax.monto1 .and. matriz[a,3]=fax.montook
				if empty(fax.curva)
					stor matriz[a,(((fax.talle-xatalmin)/xatalstep)+5)]+fax.cantidad TO matriz[a,(((fax.talle-xatalmin)/xatalstep)+5)]
				else
					SELE cur
					IF SEEK(fax.curva)
						SCAN whil cur.curva=fax.curva
							stor matriz[a,(((cur.talle-xatalmin)/xatalstep)+5)]+cur.cantidad*fax.cantidad TO matriz[a,(((cur.talle-xatalmin)/xatalstep)+5)]
						ends
					endif
				endif
				store .t. to agrega
				exit
			endif
		NEXT
		if !agrega
			store left(fax.articulo,13) to matriz[max_mat,1]
			store fax.monto1 to matriz[max_mat,2]
			store fax.montook to matriz[max_mat,3]
			store fax.dto to matriz[max_mat,4]
			for b=5 to ccol+4
				STOR NUL TO matriz[max_mat,b]
			NEXT
			if empty(fax.curva)
				stor fax.cantidad TO matriz[max_mat,(((fax.talle-xatalmin)/xatalstep)+5)]
			else
				SELE cur
				IF SEEK(fax.curva)
					SCAN whil cur.curva=fax.curva
						stor cur.cantidad*fax.cantidad TO matriz[max_mat,(((cur.talle-xatalmin)/xatalstep)+5)]
					ends
				endif
				sele fax
			endif
			store max_mat+1 to max_mat
		endif
	endscan
	sele mer
	set order to tag articulo
	STOR NUL TO nadacant
	for a=1 to max_mat-1
		if seek(left(matriz[a,1],13))
			? left(mer.articulo,13) AT 2
			?? mer.merca AT 19
			STOR NUL TO NADACAN
			?? '' AT 51
			FOR I=1 TO ccol
				if matriz[a,i+4]=NUL
					?? space(ANCHOR)
				else
					?? str(matriz[a,i+4],ANCHOR)
					NADACAN=NADACAN+matriz[a,i+4]
				endif
				IF I#CCOL
					?? PAIP
				ENDIF
			NEXT
			*           ?? STR(nadacan,9) AT 91
			*           nadacant=nadacant+nadacan
			*           ?? STR(MATRIZ[A,3],11,2) AT 100
			*           ?? str(matriz[a,2],11,2) AT 111
			nadacant=nadacant+nadacan
			?? STR(MATRIZ[A,3],11,2) AT 88
			?? STR(MATRIZ[A,4],6,2) AT 99
			?? str(matriz[a,2],11,2) AT 104
			?? STR(nadacan,6) AT 115
			?? STR(MATRIZ[A,2]*nadacan,14,2) AT 118
			?? RETMON()
		ENDIF
	NEXT
	DO WHILE _PLINENO<54
		?
	ENDDO
	IF EMPTY(FAC.DESCUENTO)
		? Fac.montobru pict PICU AT c6
		?? RETMON()
		?
		?
	ELSE
		? fac.monto pict PICU AT C6
		?? RETMON()
		IF COSA
			IF EMPTY(M.DSCN1)
				?
			ELSE
				? M.DSCN1 pict PICU AT c6
				?? RETMON()
			ENDIF
			? M.DSCN2+M.DSCN3 pict PICU AT c6
			?? RETMON()
			? fac.montobru pict PICU AT c6
			?? RETMON()
		ELSE
			?
			? fac.DESCUENTO pict PICU AT c6
			?? RETMON()
			? fac.montobru pict PICU AT c6
			?? RETMON()
		ENDIF
	ENDIF
	FOR A=1 TO 3
		IF !EMPTY(xaci[A])
			IF xaciva[PER.condiva,A*2]#0
				nnx2=alltrim(STR(XACIVA[PER.CONDIVA,A*2],6,2))
				? NNX2+"% " AT 111
				IF A=1
					?? fac.montoiva pict PICU AT c6
				ELSE
					IF A=2
						?? fac.montoot2 pict PICU AT c6
					ELSE
						?? fac.montoot3 pict PICU AT c6
					endi
				endi
				??" $ "
				stor J+1 TO J
			endi
		ELSE
			?
		endi
	NEXT
	?? fac.montonet pict PICU AT c6
	?? RETMON()
	if fac.moneda=left(xauss,1)
		tx='EQ. '+UPPER(XADOLS)
		TX=PADR(TX,11)+" : "
		?
		? TX AT 105
		?? fac.montonet/FAC.COTIZ pict PICU AT c6
		?? LEFT(xadols,3)
	endif
	_lmargin=5
	?
	? 'Cantidad de Art¡culos:'
	?? alltrim(str(nadacant))
	IF COSA
		IF EMPTY(fec[1])
			? fec[2]
			??" "+fac.moneda
			?? nad[1] pict PICU
		ELSE
			CC=1
			?
			FOR J=1 TO fec[1]
				?? "VENC. "+STR(J,1)+": " AT CC
				?? fec[J+1]
				??"  - "
				?? nad[J] pict PICU
				?? RETMON()
				if cc=75
					?
				endif
				CC=IIF(CC=1,75,1)
			NEXT
		endi
	ENDIF
	_WRAP=.F.
	_lmargin=NUL
	?
	EJECT PAGE
	?
	ENDP
	=FINIMP()
	IF NCR
		=iaud(STR(FAC.FACTURA)+' NC')
	ELSE
		=iaud(STR(FAC.FACTURA)+' FA')
	ENDIF
else
	=iaudi()
endi
RETURN MEN_LIN(BOTOM)
