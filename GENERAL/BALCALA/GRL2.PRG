********************************************************************************
*-- Programa: GRL2.PRG
*-- Fecha   : 06/21/91 05:00pm
*-- Version : G. REINER
*-- Notas   : DEFINE EL POPUP NADA
*-- Completo
*-- Rubro
*-- Temporada
*-- Marca
*-- Discrimina Peso/Unidad
*-- No Discrimina Peso/Unidad
********************************************************************************
PARAMETER R,C,t,UN
respuesta='nada#'+STR(R)+'#'+STR(C)+'#'+t+'#3#\<Completo#\<Rubro#\<Temporada#\<Empresa#\<Marca#\<Proveedor'
respuesta=respuesta+'#Venta por P\<eso#Venta por \<Unidad'
RESPUESTA=RESPUESTA+IIF(UN,'#\<Un Producto','')
=DEFPOP()
RETURN
*: EOF: GRL2.PRG
