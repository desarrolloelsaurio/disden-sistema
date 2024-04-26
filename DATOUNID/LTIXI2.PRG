******************************************************
*-- Programa: ltixi2.prg
*-- Fecha   : 01-22-92 11:12am
*-- Version : R. 'EL BATA'
*-- Notas   : listA DATOS DE % de PART. por impresora
******************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	antepop=gaspop
	gaspop=.t.
	=OPGAS()
	if !empty(eligas("",1,1))
		sele tix
		fisc='tix.gascod="'+left(mix.texto2,11)+'" .and. tix.concod="'+cns.concod+'"'
		TTU='Listado del consorcio '+alltrim(CNS.consorcio)+' gasto tipo '+alltrim(mix.texto1)
		do ltixi0
	ENDIF
	gaspop=antepop
	=OPGAS()
ELSE
	=iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)
