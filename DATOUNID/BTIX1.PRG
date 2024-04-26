********************************************************************************
*-- Programa: Btix.prg
*-- Fecha   : 01-22-92 11:12am
*-- Version : R. 'EL BATA'
*-- Notas   : BORRA DATOS DE % de PART.
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	ANTEPOP=TIPPOP
	TIPPOP=.T.
	=OPTIP()
	IF !EMPTY(ELITIP("",1,1))
		IF confirma("BORRAR la Particip. del tipo "+alltrim(mix.texto1)+" en el consorcio "+alltrim(cns.consorcio),.T.,mtixr+mtixla,mtixc+10)
			SELE TIX
			DELE FOR TIX.UNICOD=LEFT(MIX.TEXTO2,2) .AND. TIX.CONCOD=CNS.CONCOD
			=IAUD(CNS.CONCOD+"-"+LEFT(MIX.TEXTO2,2))
		ENDIF
	ENDIF
	TIPPOP=ANTEPOP
	=OPTIP()
ELSE
	=IAUDI()
ENDIF
=RELEWIN("WIN")
RETURN MEN_LIN(BOTOM)
