********************************************************************************
*-- Programa: CMERP.PRG
*-- Fecha   : 12/01/91
*-- Version : V.LEEGSTRA
*-- Notas   : CORRIGE MERCADERIA, SOLO PROVEEDORES
********************************************************************************
STORE hora_ulp(PROGRAM()) to ULPR
IF CHEQSEG()
	define window win from NUL,nul to 24,79 titl " Correcci¢n Mercader¡a - S¢lo Proveedores " none shad color sche 8
	sele mer
	set order to TAG ARTICULO
	stor " Correcci¢n Mercader¡a - " to me1
	stor 23 to col
	stor 15 to col1
	define window win1 from 5,col1 to 15,70 titl " Descripci¢n Completa " shad color sche 8
	stor nul to kok
	do whil .t.
		stor nul to nada
		stor space(9) to nada1,nada2
		acti wind win
		clea
		REGISTRO=STR(RECNO())
		=LOCK("MER") .OR. LOK("MER")
		scat memv
		DO MMER WITH .T.
		*** PROVEEDORES
		sele pro
		set order to 1
		seek(m.pro1)
		STORE '' TO NAPROV1,NAPROV2,NAPROV3
		naPROV1=pro.proveedor
		if !empty(m.pro2)
			seek(m.pro2)
			naPROV2=pro.proveedor
			if !empty(m.pro3)
				seek(m.pro3)
				naPROV3=pro.proveedor
			endif
		endif
		@ 10,col get naprov1
		read
		if lastkey()#27 .and. !empty(naprov1)
			if updated() .or. empty(naprov1)
				stor nul to respuesta
				m.pro1=iif(elipro( "del Producto",10,col),pro.procod,'')
				acti wind win
				if !empty(m.pro1)
					naprov1=pro.proveedor
					@ 10,col get naprov1
					clea gets
				endif
			endif
			@ 11,col get naprov2
			read
			if updated() .or. empty(naprov2)
				stor nul to respuesta
				m.pro2=iif(elipro( "del Producto",11,col),pro.procod,"")
				acti wind win
				if !empty(m.pro2)
					naprov2=pro.proveedor
					@ 11,col get naprov2
					clea gets
				endif
			endif
			@ 12,col get naprov3
			read
			if updated() .or. empty(naprov3)
				stor nul to respuesta
				m.pro3=iif(elipro( "del Producto",12,col),pro.procod,"")
				acti wind win
				if !empty(m.pro3)
					naprov3=pro.proveedor
					@ 12,col get naprov3
					clea gets
				endif
			endif
			m.pro2=iif(m.pro1#m.pro2,m.pro2,'')
			m.pro3=iif(!empty(m.pro3) .and. m.pro3#m.pro2 .and. m.pro3#m.pro1,m.pro3,'')
			if confirma(" los Datos Ingresados",.t.,18,nul)
				@ 23,nul say padc(' Grabando los datos ingresados ',80,'*') colo sche 19
				sele mer
				repl pro1 with m.pro1, pro2 with m.pro2, pro3 with m.pro3
				do repuse
				acti wind win
		=iaud(MER.ARTICULO)
			endif
			unlo in mer
			exit
		else
			exit
		endif                                        && lastkey()#27 .or. emtpy(m.pro1)
	enddo
	=relewin("win")
else
=IAUDI()
endif
return MEN_LIN(BOTOM)
