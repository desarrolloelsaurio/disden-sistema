*:*********************************************************************
*-- Programa: BPEC.PRG
*-- Fecha   : 06/12/91 03:24pm
*-- Version : R. 'EL BATA'
*-- Notas   : BORRA NOTAS DE PEDIDO DE compra
*-- Modificaci¢b GOYO
*:**********************************************************************
SELE pec
SCAT MEMV
STORE productiva TO tipopec
STORE RECNO() TO ff
registro=STR(ff)
STORE PROGRAM() TO ulpr
IF cheqseg()
	CLEA
	sele pec
	=lock() .or. lok()
	SELE pe1
	nohayent=.T.
	ft=blo_mult(m.pedido+m.procod,"pe1.entregado>0","pe1.pedido='"+m.pedido+"' .and. pe1.procod='"+m.procod+"'")
	registro = ft
	=LOCK() .OR. LOK()
	SELE pec
	STORE 17 TO COL
	SCAT MEMVAR
	DO mpec WITH ft, 1
	IF EMPTY(pec.fechaent)
		IF nohayent
			IF confirma("Borrar la nota de Pedido",.F.,24,NUL)
				SELE pec
				DELE RECO ff
				SELE pe1
				DELE FOR pedido=m.pedido .AND. procod=m.procod
				=iaud(m.pedido+'/'+pro.procod)
			ENDIF
		ELSE
			DO mpec WITH ft, 1
			=cartel2("LA NOTA DE PEDIDO","FUE TOTALMENTE ENTREGADA","HASTA EL DIA ",DTOC(pec.fechaent))
		ENDIF
	ELSE
		=cartel2("LA NOTA DE PEDIDO","FUE TOTALMENTE ENTREGADA","HASTA EL DIA ",DTOC(pec.fechaent))
	ENDIF
	UNLO IN pe1
	UNLO IN pec
ELSE
	=IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN

