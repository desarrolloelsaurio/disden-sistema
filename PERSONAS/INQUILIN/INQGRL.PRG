********************************************************************************
*-- Programa: INQgrl.PRG
*-- Fecha   : 09/12/91 12:34pm
*-- Version : G. REINER
*-- Notas   : DEFINE EL POPUP INQgrl
********************************************************************************
PARAMETER R,C,t,U
respuesta='INQgrl#'+str(R)+'#'+str(C)+'#'+t+'#3#\<Todos los Inquilinos#Por \<Localidad#Por \<Provincia#Por \<Condici¢n de I.V.A.'
IF m.u
	m.respuesta=m.respuesta+"#\<Un Inquilino"
ENDIF
=DEFPOP()
UNLO ALL
RETURN
