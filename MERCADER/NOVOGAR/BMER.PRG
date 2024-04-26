********************************************************************************
*-- Programa: bmer.prg
*-- Fecha   : 06-17-93 03:48pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE borrado de mercader¡as
*-- Modificaci¢n GOYO 07-23-92 01:11am marca . empresa
*-- Modificaci¢n GOYO vuelo todo y reemplazo por qwmer
*-- VERSION NOVOGAR
********************************************************************************
DIJO=BAR()
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	STORE "" TO TT
	FISC=QWMER(DIJO)
	IF FISC#".F."
		IF alltrim(prompt())='Un Art¡culo'
			DO BMER1
		ELSE
			IF CONFIRMA("BORRAR "+ALLTRIM(TT),.T.,10,0)
				SELE MER
				=FLOCK("MER") .OR. FLOK("MER")
				=DOTALK()
				SET ORDER TO
				DELE FOR &FISC
				=UNTALK()
				=IAUD(ALLTRIM(TT))
				SET ORDER TO TAG ARTICULO
			ENDIF
		ENDIF
	ENDIF
	UNLO ALL
ELSE
	=IAUDI()
ENDIF
