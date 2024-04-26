********************************************************************************
*-- Programa: MMEDP.PRG
*-- Fecha   : 06/28/91
*-- Version : g. reiner
*-- Notas   : MUESTRA LEGAJO DE MEDICOS
*-- Modificaci¢n GOYO 06-10-92 05:53pm (movewin/auditor)
********************************************************************************
ulpr=HORA_ULP(PROGRAM())
IF CHEQSEG()
STORE 20 TO COL
SELE MED
SHIT=MMED1(5,5)
=MLEGA('[TECLA] Pr¢ximo Domicilio - [ESC] para Finalizar',' Domicilio Postal de '+SHIT+" ",.F.,.T.,'postal')
=iaud(SHIT)
=INKEY(NUL,'HM')
=RELEWIN('LEGAJO')
=RELEWIN('win')
ELSE
=iaudI()
ENDIF
RETURN
