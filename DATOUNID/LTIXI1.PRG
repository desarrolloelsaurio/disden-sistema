******************************************************
*-- Programa: ltixi1.prg
*-- Fecha   : 01-22-92 11:12am
*-- Version : R. 'EL BATA'
*-- Notas   : lista DATOS DE % de PART. (impresora)
******************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	antepop=tippop
	tippop=.t.
	do optip
	if !empty(elitip("",1,1))
		sele tix
		fsc='tix.unicod="'+left(mix.texto2,2)+'" .and. tix.concod="'+cns.concod+'"'
		TTU='Listado del consorcio '+alltrim(CNS.consorcio)+' unidad tipo '+alltrim(mix.texto1)
		do ltixi0
	ENDIF
	tippop=antepop
	do optip
ELSE
	=iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)
