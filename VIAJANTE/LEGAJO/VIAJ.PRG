********************************************************************************
*-- Programa: VIA.prg
*-- Fecha   : 03-31-92 11:07am
*-- Version : R. 'EL BATA'
*-- Notas   : DERIVA A OPERACIONES DE LEGAJO DE VIAJANTES
********************************************************************************
ulpr=hora_ulp(PROGRAM())
DO CASE
CASE BAR()=1
stor nul TO respuesta
IF !EMPTY(eliVIA(" para Ingresar Legajo",-1,10))
DO iVIAj
ENDIF
CASE BAR()=3
stor nul TO respuesta
IF !EMPTY(eliVIA(" a Borrar",-1,10))
DO bVIAj
ENDIF
CASE BAR()=4
IF confirma('Borrar TODOS los Legajos ',.T.,10,nul)
SELE VIA
REPL ALL VIA->legajo WITH ""
=iaud('BORRO TODOS LEGAJOS VIAJANTES ')
ENDIF
CASE BAR()=6
  DO lVIAjp
CASE BAR()=7
  DO lVIAji
ENDCASE
ulpr=PROGRAM()
=men_lin(botom)
RETURN
