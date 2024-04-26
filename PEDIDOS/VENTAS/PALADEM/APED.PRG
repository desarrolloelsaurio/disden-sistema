********************************************************************
*-- Programa: APED.PRG
*-- Fecha   : 01-12-93 03:04pm
*-- Versi¢n : G. REINER
*-- Notas   : AGREGA LINEAS A PEDIDO EXISTENTE
**********************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	SELE PED
	SCAT MEMV
	STORE NUL TO REN,REBLA,PUNTERO,CANTOT,PRETOT,REXITO
	=MPED()
	IF CONFIRMA("MODIFICAR LA NOTA DE PEDIDO",.T.,20,20)
	NADPED=M.PEDIDO
	STOR xauss TO nada9
	STORE XACOTIZ TO NADA10
	@ REN,0 SAY "Ì"+REPL("Í",75)+"¹"
	m.clipre=PER.precio
	m.cliiva=PER.condiva
	picu="9999999999.99"
	IF !IPED1() .AND. CONFIRM1("MODIFICACIONES REALIZADAS",.T.,20,30)
	   =AGRABAR("PEX",@REXITO)
	   SELE PED
	   SCAT MEMV
	   M.VALORIZ=M.VALORIZ+M.PRETOT
	   =AGRABAR1("PED")
	   =IAUD(IIF(TYPE("M.PEDIDO")="C",M.PEDIDO,STR(M.PEDIDO)))
					IF LEFT(JANNAME,5)="ANTON"
						DO lPEDiGA WITH .T.,.f.
					ENDIF
	ENDIF
	ENDIF
	=RELEWIN("WIN")
ELSE
	=iaudi()
ENDI
UNLO ALL
=MEN_LIN(BOTOM)
ON KEY LABEL TAB
RETURN
