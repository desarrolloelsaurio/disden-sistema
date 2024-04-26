*******************************************************
*-- Programa: BCLIJ.PRG
*-- Fecha   : 06/28/91
*-- Version : g. reiner
*-- Notas   : BORRA LEGAJO DE CLIENTES
*-- Modificaci¢n GOYO 06-10-92 05:44pm (movewin/audit)
*******************************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	=HORA_ULP()
	STOR 20 TO COL
	SELE PER
	=men_lin('[ESC] para Salir')
	=MOVEWIN(3,1,8,1+mclian,'WIN',' Datos del Cliente ')
	@ 1,2 SAY "Cod.Cliente" COLOR SCHE 3
	@ 1,COL GET PER.codcli PICTURE '@X10'
	@ 2,2 SAY "Cliente    " COLOR SCHE 3
	@ 2,COL GET PER.cliente PICTURE '@X30'
	CLEAR GETS
	=movewin(8,5,20,75,'win1',' Borra Legajo de '+ALLTRIM(PER.cliente)+" ")
	MODI MEMO LEGAJO WINDOW WIN1 NOWAIT
	ACTI SCRE
	IF confirma('Borrar Legajo ? ',.T.,iclir+7,nul)
		REPL PER.LEGAJO WITH ""
	ENDIF
	CLOSE MEMO PER.LEGAJO
	=IAUD(ALLTRIM(PER.CODCLI)+'-'+PER.CLIENTE)
	=RELEWIN("WIN1")
	=RELEWIN("WIN")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
