********************************************************************************
*-- Programa: prpgrl.PRG
*-- Fecha   : 09/12/91 12:34pm
*-- Version : G. REINER
*-- Notas   : DEFINE EL POPUP prpgrl
********************************************************************************
PARAMETER R,C,t,u
respuesta='prpgrl#'+str(R)+'#'+str(C)+'#'+t+'#3;
#\<Todos los Propietarios;
#Por \<Localidad;
#Por \<Condici¢n de I.V.A.'
if u
respuesta=respuesta+'#\<Un Propietario'
endif
=DEFPOP()
UNLO ALL
RETURN
