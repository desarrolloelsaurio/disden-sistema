********************************************************************************
*-- Programa: ICLIJ.PRG
*-- Fecha   : 06-10-92 05:58pm
*-- Version : G. REINER
*-- Notas   : INGRESA LEGAJO DE CLIENTES
*-- Modificaci¢n GOYO 06-10-92 05:55pm (men_lin/movewin/iaudi)
********************************************************************************
FF=RECNO('PER')
REGISTRO=STR(FF)
ulpr=hora_ulp(PROGRAM())
IF CHEQSEG()
   stor 20 TO COL
	SELE PER
   =LOCK() .OR. LOK()
   =movewin(3,1,8,1+mclian,'win',' Datos del Cliente ')
   @ 1,2 SAY "Cod.Cliente" COLOR SCHE 3
   @ 1,COL GET PER.codcli PICTURE '@X10'
   @ 2,2 SAY "Cliente    " COLOR SCHE 3
@ 2,COL GET PER.cliente PICTURE '@X30'
CLEAR GETS
=MLEGA('[TAB] para Grabar - [ESC] para Salir',;
' Legajo de '+ALLTRIM(PER.cliente)+" ",.T.)
=iaud(alltrim(PER.codcli)+'-'+PER.cliente)
=RELEWIN('win')
UNLO IN PER
ELSE
=iaudi()
ENDIF
RETURN
