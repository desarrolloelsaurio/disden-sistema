*:*********************************************************************
*-- Programa: CPE1.PRG
*-- Fecha   : 08-12-92 01:24pm
*-- Versi¢n : G. REINER
*-- Notas   : MODIFICA NOTAS DE PEDIDO
*:*********************************************************************
SELE pec
STORE RECNO() TO ff
registro=STR(ff)
SCAT MEMV
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	=working()
	m.procod=pec.procod
	=xmerp()
	=unwork()
	=lock("pec") .or. lok('PEC')
	SELE pe1
	ft2=blo_mult(M.PEDIDO+M.PROCOD)
	=lock() .or. lok()

	SELE MER
	SET ORDER TO TAG ARTICULO

	SELE PE1
	SET RELA TO ARTICULO INTO MER
	=XSEEK(M.PROCOD,'PRO','PROCOD')

	ON KEY LABEL Ctrl+H DO CPE1HELP
	ON KEY LABEL Ctrl+A DO CPE1ARTI
	ON KEY LABEL Ctrl+B DO CPE1DELE
	ON KEY LABEL Ctrl+P DO CPE1COPR
	ON KEY LABEL Ctrl+T DO CPE1TODO
	ON KEY LABEL Ctrl+X KEYBOARD CHR(23)

	=MEN_LIN("Ctrl - H para Operaciones")
	=MOVEWIN(5,0,22,79,'WIN','Nota de Pedido N§ '+m.pedido+' - '+alltrim(pro.proveedor)+'/PROMESA:'+DTOC(PEC.FECHAPROM)+' ')
	BROW FIELD ;
		PE1.ARTICULO:R:H=PADC("ARTICULO",20),;
		MER.MERCA:R:H=PADC("DESCRIPCION",30),;
		PE1.CANTIDAD:R:H="PEDI":P="9999",;
		PE1.ENTREGADO:R:H="ENTR":P="9999",;
		RESTA=PE1.CANTIDAD-PE1.ENTREGADO:R:H="REST":P="9999",;
		PE1.MONTO:R:P="99,999.99":H="MONTO" ;
		KEY M.PEDIDO+M.PROCOD ;
		WIND WIN ;
		TITL ' Pedido N§ '+m.pedido+' - '+alltrim(pro.proveedor)+'/PROMESA:'+DTOC(PEC.FECHAPROM)+' '
	=RELEWIN("WIN")

	ON KEY LABEL Ctrl+H
	ON KEY LABEL Ctrl+A
	ON KEY LABEL Ctrl+B
	ON KEY LABEL Ctrl+X
	ON KEY LABEL Ctrl+P
	ON KEY LABEL Ctrl+T

	SELE MER
	SET ORDER TO
	=closdbf("MER1")
	=REOPPEC()
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)

procedure CPE1help
	=movewin(10,NUL,19,40,'AYUDA',' AYUDA ')
	@ 1,1 SAY 'Ctrl A  Cambia Art¡culo'
	@ 2,1 SAY 'Ctrl B  Borra Art¡culo'
	@ 3,1 say 'Ctrl P  Corrige Precio'
	@ 4,1 say 'Ctrl T  Borra Todo'
	@ 5,1 SAY 'Ctrl X  Sale de Correcci¢n'
	@ 6,1 say 'ENTER  Fin Ayuda'
	=inkey(NUL,'HM')
	=relewin("ayuda")
return
PROCEDURE CPE1ARTI
	store nul to respuesta
	IF !EMPTY(ELIMER("Art¡culo Reemplazante",-1,1,.t.))
		elnuevo=mer.articulo
		lacantidad=pe1.CANTIDAD-pe1.ENTREGADO
		sele pe1
		scat memv
		m.cantidad=m.entregado
		IF M.ENTREGADO=NUL
			DELE
		ELSE
			gath memv
		ENDIF
		m.articulo=elnuevo
		m.cantidad=lacantidad
		m.entregado=nul
		unlo in pe1
		=AGRABAR("PE1")
		FT2=FT2+","+STR(RECNO())
		=lock() .or. lok()
	ENDIF
	=MEN_LIN("Ctrl - H para Operaciones")
	SELE MER
	SET FILTER TO
	SET ORDER TO TAG ARTICULO
	GO TOP
	sele pe1
	SET RELA TO ARTICULO INTO MER
	GO TOP
RETURN
PROCEDURE CPE1DELE
	IF PE1.ENTREGADO=NUL
		DELE
	ELSE
		REPL PE1.CANTIDAD WITH PE1.ENTREGADO
	ENDIF
	GO TOP
RETURN
PROCEDURE CPE1COPR
	=MOVEWIN(10,0,18,79,'WIN1','CORRIGE PRECIO')
	@ 1,1 SAY 'ARTICULO        :'
	@ 2,1 SAY 'DESCRIPCION     :'
	@ 3,1 SAY 'PRECIO DE PEDIDO:'
	@ 4,1 SAY 'COSTO PARA VENTA:'
	@ 5,1 SAY 'PRECIO CORRECTO :'
	NADA=PE1.ARTICULO
	@ 1,20 GET NADA
	NADA=MER.MERCA
	@ 2,20 GET NADA
	NADA=PE1.MONTO
	@ 3,30 GET NADA PICT '99,999,999.99'
	NADA=MER.COSTO
	@ 4,30 GET NADA PICT '99,999,999.99'
	STORE NUL TO CORRECTO
	CLEA GETS
	@ 5,30 GET CORRECTO PICT '99,999,999.99'
	READ
	IF !EMPTY(CORRECTO) .AND. LAST()#27
		REPL PE1.MONTO WITH CORRECTO
		STORE 'NO' TO RESPUESTA
		IF MER.COSTO#CORRECTO .AND. PREGUNTA("ALMACENA NUEVO PRECIO EN MERCADERIA",.T.,10,10,'@M NO,SI')="SI"
			SELE MER
			REGISTRO=STR(RECNO())
			=LOCK() .OR. LOK()
			REPL MER.COSTO WITH CORRECTO
			UNLO IN MER
		ENDIF
	ENDIF
	=RELEWIN("WIN1")
	SELE PE1
	GO TOP
RETURN
PROCEDURE CPE1TODO
	SELE PE1
	SET ORDER TO
	DELE FOR PE1.PEDIDO=M.PEDIDO .AND. PE1.PROCOD=M.PROCOD .AND. EMPTY(ENTREGADO)
	SET ORDER TO TAG PEDIDO
RETURN
