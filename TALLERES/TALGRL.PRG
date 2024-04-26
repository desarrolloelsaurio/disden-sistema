********************************************************************************
*-- Programa: TALGRL.PRG
*-- Fecha   : 09/12/91 12:34pm
*-- Version : G. REINER
*-- Notas   : DEFINE EL POPUP TALGRL
********************************************************************************
PARAMETER R,C,t
respuesta='TALgrl#'+;
str(R)+'#'+str(C)+'#'+t+';
#3;
#\<Todos los Talleres;
#Por \<Localidad;
#Por \<Condici¢n de I.V.A.;
#Por \<Etapa;
#\<Un Taller'
RETURN defpop()
