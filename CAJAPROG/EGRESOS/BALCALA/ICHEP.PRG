*********************************************************************************
*-- Programa: ICHEP.prg
*-- Fecha   : 10-01-92 06:12pm
*-- Version : R. 'EL BATA'
*-- Notas   : Pago a proveed con cheques propios
********************************************************************************
function ichep
	PARA CONFACTURA
	=moveWIN(2,3,18,75,'winche',"Pago con Cheques Propios")
	col=20
	DO WHILE .T.
		sele caj
		scat memv blan
		store .T. to m.proveedor
		store date() to m.fechaop
		clea
		@ 1,2 SAY "Proveedor"
		@ 4,2 SAY "Tipo Comprobante"
		@ 5,2 SAY "N§ Comprobante"
		@ 6,2 SAY "Fecha Operaci¢n"
		@ 7,2 SAY "Tipo de Gasto"
		@ 8,2 SAY "Monto Operaci¢n"
		@ 9,2 SAY "Moneda utilizada"
		@10,2 SAY "Cotizaci¢n"
		@11,2 SAY "Cuenta"
		@12,2 SAY "Nro Cheque"
		@13,2 SAY "Fecha Dep¢sito"
		m.compr='FACTURA'
		m.numere=IIF(CONFACTURA,FAXT[IIF(PXA=1,1,pxA-1),1],str(m.recibo))
		m.fechaop=m.lafecha
		sele pro
		stor 0 to respuesta
		m.codcli=pro.procod
		m.naprove=pro.proveedor
		acti wind winche
		@ 1,COL say alltrim(pro.procod) + " " + alltrim(pro.proveedor)
		@ 2,COL say alltrim(pro.domicilio)
		@ 3,COL say pro.localidad  + " T.E." + alltrim(pro.telefono)
		@ 4,COL get m.compr
		@ 5,col get m.numere
		@ 6,COL get m.fechaop
		clear gets
		m.compre  = 'FA'
		m.comprre  = 'OP'
		m.numerore = m.numere
		store nul to respuesta
		if confactura
			m.gasto=iif(EMPTY(eligas("",7,COL)),'',left(mix.texto2,11))
			m.gasdesc=mix.texto1
		else
			m.gasto=m.gastter
		endif
		if !empty(m.gasto)
			@ 7,COL get m.gasdesc
			clea gets
			acti wind winche
			M.COTIZADOL=IIF(CONFACTURA,xacotiz,M.COTIZADOL)
			m.moneda=xamoneda
			@ 8,COL get m.monto pict "@Z 99,999,999,999.99"
			@ 9,COL get m.moneda pict "@M "+xadols+","+xauss
			read
			@ 10,COL get M.COTIZADOL pict "@Z 999,999,999,999.99"
			IF CONFACTURA
				read
			ELSE
				clea gets
			ENDIF
			m.equivale=-(iif(m.moneda=xauss,m.monto/M.COTIZADOL,m.monto))
			m.monto=-(iif(m.moneda=xauss,m.monto,m.monto*M.COTIZADOL))
			store nul to respuesta
			if !EMPTY(eliban("",11,COL))
				store str(mix.nu1,2) to m.caja
				store alltrim(mix.texto1)+' _ '+alltrim(mix.texto2) to m.nada
				@ 11,COL get m.nada
				clea gets
				store m.fechaop to m.fechade
				@ 12,COL get m.nroche
				@ 13,COL get m.fechade
				read
				if confirma('el cheque propio',.t.,19,10)
					=AGRABAR("TMP2")
					M.chequesmio=M.chequesmio+abs(m.monto)
				endif
			else
				exit
			endif
		else
			exit
		endif
	enddo
	=relewin('winche')
RETURN
