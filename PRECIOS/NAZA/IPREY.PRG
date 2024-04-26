********************************************************************************
*-- Programa: IPREY.PRG
*-- Fecha   : 04-05-92 05:03pm
*-- Version : G. REINER
*-- Notas   : AJUSTA PRECIOS TOMANDO COMO VALIDO EL ULTIMO INGRESADO
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=CARTEL("ESTE PROGRAMA ACTUALIZA TODOS LOS PRECIOS EXISTENTES",;
	"TOMANDO COMO VALIDOS",;
	"LOS ULTIMOS PRECIOS INGRESADOS PARA CADA PRODUCTO",;
	"EN CASO DE CONFIRMAR EL PROCESO NO PODRA INTERRUMPIRSE")
	IF CONFIRMA("Ajustar Precios a los Ultimos Ingresados",.t.,10,10)
		do oppre
		=men_lin("Ordenando el Archivo")
		a=GENTMP()
		INDE ON left(articulo,10)+dtoc(fecha) to (a) comp desc
		go top
		m.rtcl=left(pre.articulo,10)
		m.costorea=pre.costoreal
		m.costo=pre.cost
		m.preci1=pre.precio1
		m.preci2=pre.precio2
		m.preci3=pre.precio3
		m.preci4=pre.precio4
		scan
			if rtcl#left(pre.articulo,10)
				m.rtcl=left(pre.articulo,10)
				m.costorea=pre.costoreal
				m.costo=pre.cost
				m.preci1=pre.precio1
				m.preci2=pre.precio2
				m.preci3=pre.precio3
				m.preci4=pre.precio4
			endif
			if rlock() .or. lok(str(recno()),'PRE')
				=men_lin(alltrim(pre.articulo))
				repl pre.costoreal with m.costorea
				repl pre.costo with m.cost
				repl pre.precio1 with m.preci1
				repl pre.precio2 with m.preci2
				repl pre.precio3 with m.preci3
				repl pre.precio4 with m.preci4
			endif
			unlo in PRE
		endscan
		=iaud("Ajuste de Precios")
		sele pre
		use
	ENDIF
ELSE
	=iaudi()
ENDIF
=MEN_LIN(BOTOM)
RETURN
