****************************************
*-- Programa: Btix.prg
*-- Fecha   : 01-22-92 11:12am
*-- Version : R. 'EL BATA'
*-- Notas   : BORRA DATOS DE % de PART.
****************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	ANTEPOP=TIPPOP
	TIPPOP=.T.
	=OPTIP()
	if !empty(elitip("",1,1))
		SELE TIX
		fisc='tix.unicod="'+left(mix.texto2,2)+'" .and. tix.concod="'+cns.concod+'"'
		TTU='Listado del consorcio '+alltrim(CNS.consorcio)+' unidad tipo '+alltrim(mix.texto1)
		=LTIXP0()
	ENDIF
	TIPPOP=ANTEPOP
	=OPTIP()
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
