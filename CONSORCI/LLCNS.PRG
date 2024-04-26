********************************************************************************
*-- Programa: LLcns.PRG
*-- Fecha   : 01-18-92 08:44am
*-- Version : R. 'EL BATA'
*-- Notas   : RECUPERA CONSORCIOS BORRADOS LOGICAMENTE
*-- Modificaci¢n GOYO 05-30-92 10:30am (cambio de lugar iaud)
*-- (reemp. do lock por = lock
********************************************************************************
STORE RECNO() TO ff
registro=STR(ff)
STORE HORA_ULP(PROGRAM()) to ULPR
IF CHEQSEG()
	=movewin(mcnsr,mcnsc,mcnsr+mcnsla,mcnsc+mcnsan,'win'," Recupera consorcios ")
	SELE cns
	=lock() .or. lok("cns")
	STORE 15 TO COL
	SCAT MEMVAR
	DO mcns with .t.
	IF confirma("Recuperar el CONSORCIO",.T.,12,0)
		RECA RECO ff
		=iaud(cns.CONSORCIO)
	ENDIF
	=RELEWIN('win')
	UNLO IN cns
ELSE
	=iaudi()
ENDIF
=MEN_LIN(BOTOM)
RETURN
