********************************************************************************
*-- Programa: sinoS.fnc
*-- Fecha   : 02/23/91 01:19pm
*-- Version : g. reiner
*-- Notas   : funcion que recibe el contenido de una variable si-no y devuelve
*--			  el Picture correspondiente SINO o NOSI
********************************************************************************
function sinos
parameter ripo
return(iif(ripo="SI","@M SI,NO","@M NO,SI"))

