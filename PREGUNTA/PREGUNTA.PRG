********************************************************************************
*-- Programa: PREGUNTA.PRG
*-- Fecha   : 07/22/91 05:32pm
*-- Version : G. REINER
*-- Notas   : FUNCION DE PREGUNTA - DEVUELVE EN RESPUESTA
********************************************************************************
function pregunta
parameter texto,v,r,c,pctr
PRIVATE TEXTO,V,R,C,PCTR
IF TYPE("PCTR")#"C"
  STORE "@M SI,NO" TO PCTR
  STORE "NO" TO RESPUESTA
ENDIF
if v
   define window fic from r,c to r+4,78 titl " "+texto+" " shad color sche 8
   acti wind fic
   @ 1,1 say texto+' ? ' get respuesta picture pctr mess texto+' ? '
else
   @ r,c say texto+' ? ' get respuesta picture pctr mess texto+' ? '
endif
read
if v
   rele wind fic
endif
return respuesta
