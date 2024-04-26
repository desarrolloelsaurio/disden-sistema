********************************************************************************
*-- Programa: LMEDJP.PRG
*-- Fecha   : 09/12/91 02:46pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE LEGAJOS DE MEDICOs
*-- Modificaci¢n GOYO 05-22-92 04:52pm
********************************************************************************
=HORA_ULP(PROGRAM())
SELE MED
SET ORDER TO TAG IIF(ORDMED,'CODMED','MEDICOS')
tt=''
fsc=qwMED(bar())
if fsc#'.F.'
IF PROMPT()='Un M‚dico'
	DO mMEDP
ELSE
	FISC=FSC
	TTU=TT
	DO LMEDPP1
ENDIF	
ENDIF
=MEN_LIN(BOTOM)
RETURN
