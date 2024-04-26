***************************************
*-- Programa: ltixp2.prg
*-- Fecha   : 01-22-92 11:12am
*-- Version : R. 'EL BATA'
*-- Notas   : BORRA DATOS DE % de PART.
***************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	ANTEPOP=GASPOP
	GASPOP=.T.
	=OPGAS()
	if !empty(eligas("",1,1))
		SELE TIX
		fisc='tix.gascod="'+left(mix.texto2,11)+'" .and. tix.concod="'+cns.concod+'"'
		TTU='Listado del consorcio '+alltrim(CNS.consorcio)+' gasto tipo '+alltrim(mix.texto1)
		=LTIXP0()
	ENDIF
	GASPOP=ANTEPOP
	=OPGAS()
ELSE
	=iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)
