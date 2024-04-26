**********************************************
*-- Programa: Lsru.PRG
*-- Fecha   : 12-10-92 11:28am
*-- Version : g. reiner
*-- Notas   : DERIVA A LISTADOS DE SUB-RUBROS
*********************************************
PARAMETER PORPAN
DO CASE
CASE BAR()=1
	stor '.T.' TO FISC
	tt='Listado de Sub-Rubros'
	=IIF(PORPAN,LSRUP,LSRUI)
CASE BAR()=2
	stor nul TO RESPUESTA
	IF !EMPTY(ELIRUB("a Listar",-1,1))
		tt='Listado de Sub-Rubros - Por Rubro '+alltrim(rub.rubro)
		XCOS=RUB.CODRUB
		fisc='codrub=xcos'
		=IIF(PORPAN,lsrup(),lsruI())
	endif
ENDCASE
RETURN
