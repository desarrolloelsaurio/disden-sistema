********************************************************************************
*-- Programa: FACTURA.prg
*-- Fecha   : 11-03-91 02:03am
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE FACTURACION
*-- VERSION NOVOGAR
*-- Modif. GOYO 05-27-93 03:06pm (agrega factura de Remito)
********************************************************************************
PARAMETER ELTIPO
ulpr=PROGRAM()
FA_DIJO=ALLTRIM(PROMPT())
=cabpan1()
=OPCLI()
=OPVIA()
=OPCIU()
=OPRUB()
=OPMAR()
=OPPAG()

DO CASE
CASE FA_DIJO='Listados por Pantalla'
	=FACGRL(6,20)
	ON SELE POPU NADAX DO LFACI1 WITH 'FA',.T.
	ACTI POPU NADAX
	RELE POPU NADAX
case FA_DIJO='Listados por Impresora'
	=FACGRL(6,20)
	ON SELE POPU NADAX DO LFACI1 WITH 'FA',.F.
	ACTI POPU NADAX
	RELE POPU NADAX
CASE FA_DIJO='Restaura el Archivo'
	DO XFAC
ENDCASE
ulpr=PROGRAM()
UNLO ALL
RETURN MEN_LIN(BOTOM)
