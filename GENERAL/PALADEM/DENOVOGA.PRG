********************************************************************************
*-- Programa: GRL2.PRG
*-- Fecha   : 06/21/91 05:00pm
*-- Version : G. REINER
*-- Notas   : DEFINE EL POPUP NADA
*-- 					1 Completo
*-- 					2 Rubro
*-- 					3 Temporada
*-- 					4 L¡nea
*-- 					5 Marca
*-- 					6 Electr¢nico
*-- 					7 No Electr¢nico
********************************************************************************
PARAMETER R,C,t
respuesta='nada#'+STR(R)+'#'+STR(C)+'#'+t+'#3#\<Completo#\<Rubro#\<Temporada#\<L¡nea#\<Marca#'
respuesta=respuesta+'\<Electr¢nico#\<No Electr¢nico'
=DEFPOP()
RETURN
*: EOF: GRL2.PRG
