********************************************************************************
*-- Programa: PRO.prg
*-- Fecha   : 03-31-92 11:07am
*-- Version : R. 'EL BATA'
*-- Notas   : DERIVA A OPERACIONES DE LEGAJO DE PROVEEDORES
********************************************************************************
ulpr=hora_ulp(PROGRAM())
DO CASE
CASE BAR()=1
stor nul TO respuesta
IF elipro(" para Ingresar Legajo",-1,10)
DO iproj
ENDIF
CASE BAR()=3
stor nul TO respuesta
IF elipro(" a Borrar",-1,10)
DO bproj
ENDIF
CASE BAR()=4
IF confirma('Borrar TODOS los Legajos ',.T.,10,nul)
SELE pro
REPL ALL pro.legajo WITH ""
=iaud('BORRO TODOS LEGAJOS PROVEEDORES ')
ENDIF
CASE BAR()=6
STORE "" TO FISC,TT
IF PROGRL()
DO lprojp
ENDIF
CASE BAR()=7
DO progrl WITH 8,25,'L¡mites del Listado'
ON SELE POPU PROgrl DO lproji
ACTI POPU PROgrl
RELE POPU PROgrl
ENDCASE
ulpr=PROGRAM()
=men_lin(botom)
RETURN
