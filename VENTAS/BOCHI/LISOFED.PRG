***********************************
*-- Programa: lisofed.prg
*-- Fecha   : 02-05-92 11:09pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE OFERTA
******************************************
=OPMIX()
M.PORLISMIN=GETNU1("PORLISMIN","FOXGRL")
M.PORLISMAY=GETNU1("PORLISMAY","FOXGRL")
M.PORFLETE=GETNU1("FLETE","FOXGRL")
DO CASE
CASE BAR()=1
	DO LISOFE
CASE BAR()=2
	DO LISPROPA
ENDC
RETU
