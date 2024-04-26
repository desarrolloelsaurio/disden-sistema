********************************************************************************
*-- Programa: LCLIJP.PRG
*-- Fecha   : 06/28/91
*-- Version : g. reiner
*-- Notas   : MUESTRA LEGAJO DE CLIENTES
*-- Modificaci¢n GOYO 06-10-92 05:53pm (movewin/auditor)
********************************************************************************
ulpr=HORA_ULP(PROGRAM())
IF CHEQSEG()
STORE 20 TO COL
SELE PER
ACTI SCRE
=MEN_LIN(PADC('[TAB] Pr¢ximo Legajo - [ESC] para Finalizar',80))
=movewin(3,1,8,1+mclian,'win',' Datos del Cliente ')
@ 1,2 SAY "Cod.Cliente" COLOR SCHE 3
@ 1,COL GET PER.codcli PICTURE '@X10'
@ 2,2 SAY "Cliente    " COLOR SCHE 3
@ 2,COL GET PER.cliente PICTURE '@X30'
CLEAR GETS
on key label tab keyboard chr(23)
=movewin(8,5,20,75,'win1',' Legajo de '+ALLTRIM(PER.cliente)+" ")
MODI MEMO legajo NOEDIT WINDOW win1
CLOSE MEMO legajo
on key label tab
=iaud(alltrim(PER.codcli)+'-'+PER.cliente)
=RELEWIN('win')
=RELEWIN('win1')
ELSE
=iaudI()
ENDIF
RETURN
