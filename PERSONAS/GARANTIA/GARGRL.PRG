********************************************************************************
*-- Programa: GARGRL.PRG
*-- Fecha   : 11-23-92 07:49pm
*-- Version : G. REINER
*-- Notas   : DEFINE EL POPUP GARGRL
********************************************************************************
PARAMETER R,C,t,u
respuesta='gargrl#'+str(R)+'#'+str(C)+'#'+t+'#3#\<Todas las Garant¡as#Por \<Localidad#Por \<Provincia#Propiedad Hori\<zontal#Rosario \<Com£n'
if m.u
	m.respuesta=m.respuesta+"#\<Un Garante"
endif
=DEFPOP()
UNLO ALL
RETURN
