********************************************************************************
*-- Programa: LCLIJP.PRG
*-- Fecha   : 09/12/91 02:46pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE LEGAJOS DE clientes
*-- Modificaci¢n GOYO 05-22-92 04:52pm
********************************************************************************
=HORA_ULP(PROGRAM())
SELE PER
SET ORDER TO TAG IIF(ORDCLI,'CODCLI','CLIENTE')
tt=''
fsc=qwcli(bar())
if fsc#'.F.'
FISC=FSC
TTU=TT
DO LCLIJP1
ENDIF
RETURN MEN_LIN(BOTOM)
