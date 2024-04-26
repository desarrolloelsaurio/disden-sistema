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
*--                     6 Proveedor 1
*--                     7 Proveedores
*-- 					8 Electr¢nico
*-- 					9 No Electr¢nico
*--           10 Rubro y Subrubro
*--           11 Marca, Rubro y Subrubro
********************************************************************************
PARAMETER R,C,t,U
respuesta='nada#'+STR(R)+'#'+STR(C)+'#'+t+'#3;
#\<Completo;
#\<Rubro;
#\<Temporada;
#\<L¡nea;
#\<Marca;
#\<1§ Proveedor;
#\<Proveedores;
#\<Electr¢nico;
#\<No Electr¢nico;
#Rubro y \<Subrubro;
#Marca, Rubro \<y Subrubro'
IF !("PRE" $ ULPR)
   RESPUESTA=RESPUESTA+"#\<Exclu¡dos de Lista de Precios"
ELSE
   RESPUESTA=RESPUESTA+"#-"   
ENDIF
IF U
   RESPUESTA=RESPUESTA+"#\<Un Producto"
ENDIF
RETURN defpop()
