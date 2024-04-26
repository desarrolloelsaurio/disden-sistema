********************************************************************************
*-- Programa: cligrl.PRG
*-- Fecha   : 09/12/91 12:34pm
*-- Version : G. REINER
*-- Notas   : DEFINE EL POPUP cligrl
********************************************************************************
PARAMETER R,C,t,U
respuesta='cligrl#'+str(R)+'#'+str(C)+'#'+t+'#3#\<Todos los Clientes#Por \<Localidad#Por \<Zona#Por \<Condici¢n de I.V.A.#Por \<Monto de Cr‚dito#Por Lista de \<Precios#\<Bloqueados'
IF U
RESPUESTA=RESPUESTA+'#\<Un Cliente'
endif
=DEFPOP()
UNLO ALL
RETURN
*: EOF: CLIGRL.PRG
