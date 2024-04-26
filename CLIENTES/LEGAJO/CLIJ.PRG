*******************************************************
*-- Programa: CLIJ.prg
*-- Fecha   : 06/06/91 02:13pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE LEGAJOS CLIENTES
******************************************************
ulpr=hora_ulp(program())
DO CASE
CASE BAR()=1
   stor nul TO respuesta
   =IIF(EMPTY(elicli("para Ingresar Legajo",-1,10)),.T.,iclij())
CASE BAR()=3
   stor nul TO respuesta
   =IIF(EMPTY(elicli("a Borrar",-1,10)),.T.,bclij())
CASE BAR()=4
   IF confirma('Borrar TODOS los Legajos ',.T.,10,nul)
		SELE PER
      REPL ALL PER.legajo WITH ""
      =iaud('BORRO TODOS LEGAJOS CLIENTES ')
   ENDIF
CASE BAR()=6
   DO cligrl WITH 8,34,'L¡mites del Listado'
   ON SELE POPU cligrl DO lclijp
   ACTI POPU cligrl
   RELE POPU cligrl
CASE BAR()=7
   DO cligrl WITH 8,34,'L¡mites del Listado'
   ON SELE POPU cligrl DO lcliji
   ACTI POPU cligrl
   RELE POPU cligrl
ENDCASE
ulpr=PROGRAM()
RETURN men_lin(botom)
