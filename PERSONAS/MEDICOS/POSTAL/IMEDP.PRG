********************************************************************************
*-- Programa: IMEDJ.PRG
*-- Fecha   : 06-10-92 05:58pm
*-- Version : G. REINER
*-- Notas   : INGRESA LEGAJO DE MEDICOS
*-- Modificaci¢n GOYO 06-10-92 05:55pm (men_lin/movewin/iaudi)
********************************************************************************
FF=RECNO("MED")
REGISTRO=STR(FF)
ulpr=hora_ulp(PROGRAM())
IF CHEQSEG()
stor 20 TO COL
SELE MED
=LOCK() .OR. LOK()
NADA=MMED1(5,5)
=MLEGA('[TAB] para Grabar - [ESC] para Salir',;
' Domicilio Postal de '+NADA+" ",.T.,.f.,'POSTAL')
=iaud(alltrim(MED.codMED)+'/'+NADA)
=RELEWIN('win')
UNLO IN MED
ELSE
=iaudi()
ENDIF
RETURN
