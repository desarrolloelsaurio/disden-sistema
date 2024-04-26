*******************************
*-- Programa: VARIOS.PRG
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
*******************************
ULPR=PROGRAM()
=CABPAN1()
V_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE V_DIJO='Rubros'
	=OPRUB()
	DO RUB.SPR
CASE V_DIJO='Talleres y Dep¢sitos'
	=OPCIU()
	DO OPETA
	DO OPTAL
	DO TAL.SPR
CASE V_DIJO='Grupos de Compra'
	DO OPGRU
	DO GRU
CASE V_DIJO='Control Impresoras'
	=OPCIMP()
CASE V_DIJO='Env¡a Mensaje'
	DO SEND
ENDCASE
UNLO ALL
RETURN MEN_LIN(BOTOM)
