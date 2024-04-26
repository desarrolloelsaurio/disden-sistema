*********************************************************************************
*-- Programa: ECAJ2.prg
*-- Fecha   : 11/14/91
*-- Version : R. 'EL BATA'
*-- Notas   : EGRESO DE CAJA EN cheques propios
********************************************************************************
STORE HORA_ulp(program()) to ulpr
if cheqseg()
	=moveWIN(2,8,18,70,'win',"Salida de Cheques Propios")
	DO WHILE .T.
		sele caj
		scat memv blan
		store .T. to m.proveedor
		store date() to m.fechaop
		clea
		@ 1,5 SAY "Proveedor        :"
		@ 4,5 SAY "Tipo Comprobante :"
		@ 5,5 SAY "N§ Comprobante   :"
		@ 6,5 SAY "Fecha Operaci¢n  :"
		@ 7,5 SAY "Tipo de Gasto    :"
		@ 8,5 SAY "Monto Operaci¢n  :"
		@ 9,5 SAY "Moneda utilizada :"
		@10,5 SAY "Cotizaci¢n       :"
		@11,5 SAY "Cuenta           :"
		@12,5 SAY "Nro Cheque       :"
		@13,5 SAY "Fecha Dep¢sito   :"
		sele pro
		stor 0 to respuesta
		if !EMPTY(elipro("",1,25))
			m.codcli=pro.procod
			m.naprove=pro.proveedor
			acti wind win
			@ 1,25 say alltrim(pro.procod) + " " + alltrim(pro.proveedor)
			@ 2,25 say alltrim(pro.domicilio) + " T.E." + alltrim(pro.telefono)
			@ 3,25 say pro.localidad
			@ 4,25 get m.compr picture "@M RECIBO,FACTURA"
			@ 5,25 get m.numere picture "9999999999" ;
			valid !EMPTY(m.numere);
			error 'Debe tener un nro de comprobante'
			@ 6,25 get m.fechaop
			read
			m.compre  = left(m.compr,1)+substr(m.compr,3,1)
			store nul to respuesta
			m.gasto=eligas("",7,25)
			acti wind win
			if !EMPTY(m.gasto)
				m.gasto=left(mix.texto2,11)
				@ 7,25 get m.gasto
				clea gets
				m.cotiz=xacotiz
				m.moneda=xamoneda
				@ 8,25 get m.monto pict "@Z 99,999,999,999.99"
				@ 9,25 get m.moneda pict "@M "+xadols+","+xauss
				@ 10,25 get m.cotiz pict "@Z 999,999,999,999.99"
				read
				m.equivale=iif(m.moneda=xauss,m.monto/m.cotiz,m.monto)
				m.monto=iif(m.moneda=xauss,m.monto,m.monto*m.cotiz)
				store nul to respuesta
				if !EMPTY(eliban("",11,25))
					store mix.nu1 to m.caja
					store alltrim(mix.texto1)+' _ '+alltrim(mix.texto2) to m.nada
					@ 11,25 get m.nada
					clea gets
					store m.fechaop to m.fechade
					@ 12,25 get m.nroche
					@ 13,25 get m.fechaop
					read
					if confirma("Grabar la salida de caja",.t.,18,10)
						=AGRABAR("CAJ")
					endif
				else
					exit
				endif
			else
				exit
			endif
		else
			exit
		endif
	enddo
	=relewin('win')
else
	=iaudi()
endi
RETURN
