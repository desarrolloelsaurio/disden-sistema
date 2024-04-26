********************************************************************************
*-- Programa: Btix3.prg
*-- Fecha   : 01-22-92 11:12am
*-- Version : R. 'EL BATA'
*-- Notas   : BORRA DATOS DE % de PART. x consorcio
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	IF confirma("BORRAR Particip. en Consorcio "+alltrim(cns.consorcio),.T.,mtixr+mtixla,mtixc+10)
		SELE TIX
		DELE FOR TIX.CONCOD=CNS.CONCOD
		=IAUD(CNS.CONCOD)
	ENDIF
ELSE
	=IAUDI()
ENDIF
=RELEWIN("WIN")
RETURN MEN_LIN(BOTOM)
