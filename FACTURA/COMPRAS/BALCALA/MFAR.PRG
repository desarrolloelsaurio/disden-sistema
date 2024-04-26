********************************************************************
*-- Programa: MFAR.PRG
*-- Fecha   : 07-15-92 11:48am
*-- Versi¢n : R. 'EL BATA'
*-- Notas   : MUESTRA FACTURAS DE COMPRA
*-- Modificaci¢n GOYO
*:*********************************************************************
PARAMETER BORRA
STORE HORA_ULP(PROGRAM()) to ULPR
IF CHEQSEG()
	RELE fechas, montocuot
	DECL fechas[6], montocuot[6]
	=hora_ulp()
	picu="@Z 99,999,999,999.99999"
	=MOVEWIN(10,0,20,79,'WIN2'," Ingreso de "+tit_sin+" de Proveedores ")
	DO fcdmask
	IF XSEEK(FAR.PROCOD,'PRO','PROCOD')
		@ 1,2 SAY ALLTRIM(pro.procod) + " " + ALLTRIM(pro.proveedor)
		@ 2,0 SAY ALLTRIM(pro.domicilio) + " T.E." + ALLTRIM(pro.telefono)
		@ 3,0 SAY pro.localidad
		@ 1,59 GET m.factura PICT "@!"
		nada=JANNAME
		@ 2,53 GET nada
		@ 3,53 GET m.fechaem
		=XSEEK(FAR.CONDPAGO,'MIX','PAGCOD')
		m.nada=TRAN(mix.texto1, "@R 999-999-999-999-999-999")
		m.nadacuo=STRTRAN(TRAN(mix.texto1, "@R 999-999-999-999-999-999"),"-000")
		m.nrocuotas=(LEN(m.nadacuo)+1)/4
		@ 4,25 GET m.nada
		@ 5,25 GET m.cotiz PICT "@Z 999,999,999,999.99"
		M.NADA=IIF(M.MONEDA=XAUSS,XAUSS,XADOLS)
		@ 6,25 GET m.NADA
		m.coefi=IIF(m.moneda=xaus,1,m.cotiz)
		=XSEEK(M.GASTO,'MIX','GASCOD')
		m.nada=mix.texto2+'/'+MIX.TEXTO1
		@ 7,25 GET m.nada
		MOVE WIND WIN2 TO 0,0
		=MOVEWIN(10,0,23,45,'WIN10',' *** TOTAL '+tit_sin+' *** ')
		@ 1,1 SAY "MONTO TOTAL "+padr(abr,7)+":"
		@ 2,1 SAY "MONTO DESCUENTO    :"
		@ 3,1 SAY "MONTO NETO GRAVADO :"
		@ 4,1 SAY "MONTO I.V.A.       :"
		@ 5,1 SAY "MONTO IMPUESTO 1)  :"
		@ 6,1 SAY "MONTO IMPUESTO 2)  :"
		@ 7,1 SAY "MONTO EXENTO       :"
		@ 8,1 SAY "RECARGO FINANCIERO :"
		@ 9,1 SAY "PERCEPCION         :"
		@10,1 SAY "MONTO TOTAL "+padr(abr,7)+":"
		@ 1,21 GET m.monto     PICT picu
		@ 2,21 GET m.descuento PICT picu
		@ 3,21 GET m.montobru  PICT PICU
		@ 4,21 GET m.montoiva  PICT picu
		@ 5,21 GET m.montoot2  PICT picu
		@ 6,21 GET m.montoot3  PICT picu
		@ 7,21 GET m.montoexe  PICT picu
		@ 8,21 GET m.montoref  PICT picu
		@ 9,21 GET m.montoper  PICT picu
		@10,21 GET m.montonet  PICT picu
		=MOVEWIN(12,46,23,79,'WIN11',' *** CUOTAS PAGO *** ')
		SELE CCP
		SET ORDER TO TAG NUMERORE
		=SEEK(M.FACTURA)
		I=1
		SCAN WHILE NUMERORE=M.FACTURA
			IF CCP.PROCOD=M.PROCOD
				N=FECHAVE
				@ I, 1 GET N PICT "@D"
				N=MONTO
				@ I,10 GET N PICT picu
				I=I+1
			ENDIF
		ENDSCAN
		CLEA GETS
	ENDI
	IF BORRA
	=INKEY(NUL,'HM')
		=RELEWIN("win10")
		=RELEWIN("win11")
		=RELEWIN("win2")
	ENDIF
ELSE
	=iaudi()
ENDI
=men_lin(botom)
RETURN
